Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEA4ED8B4
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 13:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB8518F6;
	Thu, 31 Mar 2022 13:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB8518F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648727462;
	bh=PcUp9/GA/suy7e6UGQ4YiJWJpLdLEo0je0oK8yH+LkM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L7YOI6D+tGgZdBXqmlLF/1osF1go+XaDHwjsWj7A2N874cIIs7sWkEHtlOFbRumSh
	 3EI51hku+UcBos/nlZn2L5Blxpad7e/aPj6oo+BonmRAZKWNDIrdzHTub8eqDowJTU
	 Hhcpd5YXarHCqS91ooeHN6+K3oXDPa965XLlwQII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E7BF802D2;
	Thu, 31 Mar 2022 13:49:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 025A9F80238; Thu, 31 Mar 2022 13:49:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C6DFF800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 13:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6DFF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bAipSByR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648727388; x=1680263388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PcUp9/GA/suy7e6UGQ4YiJWJpLdLEo0je0oK8yH+LkM=;
 b=bAipSByROfyXmaVVyYLnWjxuoycby0x+UYRnaOEaE+FRmoZH4Vamy/jF
 +p6RVbw7U9NfRLVw4XKvS7CPARe9DhoH4ogSSnvTAy9gythUmKH3bgPOu
 lQrv7HMkEdq7efwGP2tZIvOo4jqL9qh6R6l69i4+amvcIRC/R7aDWvEAh
 DhdIytxtntYVJZnGjIphWmx8YjzayP2wGg/UM6Gkiu7uD6i/P/AZrE7Qk
 JTCLHd/K8gqcOGeB4BYQhvEdKs7Jsv0rGGzc5bpkACLf49xDg1AbB7b86
 dHeVKo6XnWdER2piWmrDm5eKh9Zpu4IHJzMKRQ9VjN2IuA60HF8Lv2WTT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="240400747"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="240400747"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 04:49:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547294867"
Received: from dmmatarr-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.22])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 04:49:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, jaska.uimonen@linux.intel.com
Subject: [PATCH] ASoC: topology: Correct error handling in
 soc_tplg_dapm_widget_create()
Date: Thu, 31 Mar 2022 14:49:57 +0300
Message-Id: <20220331114957.519-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com
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

Academic correction of error handling:
In case the allocation of kc or kcontrol_type fails the correct label to
jump is hdr_err since the template.sname has been also allocated at this
point.

Fixes: d29d41e28eea6 ("ASoC: topology: Add support for multiple kcontrol types to a widget")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 72e50df7052c..3bb90a819650 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1436,12 +1436,12 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 	template.num_kcontrols = le32_to_cpu(w->num_kcontrols);
 	kc = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(*kc), GFP_KERNEL);
 	if (!kc)
-		goto err;
+		goto hdr_err;
 
 	kcontrol_type = devm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(unsigned int),
 				     GFP_KERNEL);
 	if (!kcontrol_type)
-		goto err;
+		goto hdr_err;
 
 	for (i = 0; i < le32_to_cpu(w->num_kcontrols); i++) {
 		control_hdr = (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
-- 
2.35.1

