Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE5510725
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 073611752;
	Tue, 26 Apr 2022 20:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 073611752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998120;
	bh=66AUjFfOYOINHgJZ0XxksJPSJ2sDpeMdRDRemZLSKCA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PK554bDr/KLM4Ro0By3HF/yBiu4oEO+y8z5xDvAfZH6F0gzvQnM96ClCjAHdmoIUj
	 ImOeeWVqoRif3Gzc5xOhvTJcxyjU09miUZ2qpRjAU26q2ERtkvimC9h9tCV3cLeM+O
	 jT0Yp8+9TBhcSysD2ayOUdtDldkhWeZkjwGV6P4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7734FF80171;
	Tue, 26 Apr 2022 20:34:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46D49F800FA; Tue, 26 Apr 2022 20:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B901AF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B901AF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aCOPqf9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998054; x=1682534054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=66AUjFfOYOINHgJZ0XxksJPSJ2sDpeMdRDRemZLSKCA=;
 b=aCOPqf9uqDLIN9rlnVhFx014eYvAff/ubJVZ48I0hwvBlny0LCbZDjME
 uhbpXuPnhUS8BiuND+D2sakUUvUJCmmBK/BFOii5id7qx6Wu09b6BvY+t
 +6kNQ8iyBAdJ+rZthmKMwt6T76O5UHAUW2dBadNgx008DMZE1ZkK26IkV
 HW8pGy5Ntm2aRB2n8sTe9yhjIMHMDxBKj8/i+h1ZaoHFJJwcPa88MLjY6
 inssYB+6dSgY+vinfA1ZpE/7lgn7si7rz0l8/WAXkaWwsY7E2kE5N5UFD
 M6EDFO0TaWZEkxpEtvg+Sj02Wxx7rFkqkpvPLr/2tUmMNDjwR9ZQmeC0G Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="246249372"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="246249372"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:34:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="628656575"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:34:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Fix NULL pointer exception in sof_pci_probe
 callback
Date: Tue, 26 Apr 2022 13:33:57 -0500
Message-Id: <20220426183357.102155-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

We are accessing "desc->ops" in sof_pci_probe without checking "desc"
pointer. This results in NULL pointer exception if pci_id->driver_data
i.e desc pointer isn't defined in sof device probe:

BUG: kernel NULL pointer dereference, address: 0000000000000060
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
RIP: 0010:sof_pci_probe+0x1e/0x17f [snd_sof_pci]
Code: Unable to access opcode bytes at RIP 0xffffffffc043dff4.
RSP: 0018:ffffac4b03b9b8d8 EFLAGS: 00010246

Add NULL pointer check for sof_dev_desc pointer to avoid such exception.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index cd90da7c92c24..8fe8f75446787 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -187,6 +187,11 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
+	if (!desc) {
+		dev_err(dev, "error: no matching PCI descriptor\n");
+		return -ENODEV;
+	}
+
 	if (!desc->ops) {
 		dev_err(dev, "error: no matching PCI descriptor ops\n");
 		return -ENODEV;
-- 
2.30.2

