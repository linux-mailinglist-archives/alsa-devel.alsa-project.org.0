Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE350EB7C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173051896;
	Tue, 26 Apr 2022 00:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173051896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650924830;
	bh=AMRW5eziPeO4ski4QQbDsenTkp3kwPEgBjvxBfvtOIY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZ/4uo5odgSjD/Go0BpYgSQPpawNaFO+Lz2UpfYWIgVB9wQT4INK1HyUA3C/IiEs9
	 TLFbXfLJUHUVlOeAOoIZQWrpVO4DUTfmtw80PtenUUlI9uuLBEKbhbe1kE0igeveb7
	 qgBa9Mymsa6JRUi5gZc4CXDiu/MFrY61mV97tQ64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE73F80526;
	Tue, 26 Apr 2022 00:11:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D918F8016B; Tue, 26 Apr 2022 00:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03793F8016B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03793F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SKTLmCmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650924709; x=1682460709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AMRW5eziPeO4ski4QQbDsenTkp3kwPEgBjvxBfvtOIY=;
 b=SKTLmCmTNgPIC6f8MmVJyosYpjsWZqazwRQhkluWKIsS/2wUDMy5Tmza
 ZPpQ0sY4oQ56uW8yMQefp+S6oZpcFa02DbiHi3qPn1EqF5/M2EsAYMzxs
 KtoWkKr5O6O1WLyO1MH+SE7eexjjmeHk7Q6qKKTxTxFcM9IvV52kI62t+
 y/RVTn+VM51lUNXSGKv9SYMbetL5cGSBkVVmRIbAJr9KSUzQ7Vtf+F5pq
 QiD9KmgfwP75GBFxk34yRcxAjGwrUbF2uTWasJY5dRXDl5JGr19p5OGEA
 2D/sVnpKJWS40BUy6fzIeCzl3Ik+DUquayVU1j3PDQA4tKmwp1oY5tnMh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264897782"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="264897782"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729939964"
Received: from shivakax-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.59.189])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 15:11:39 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: SOF: loader: Call optional query_fw_configuration
 on first boot
Date: Mon, 25 Apr 2022 15:11:29 -0700
Message-Id: <20220425221129.124615-11-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, tiwai@suse.com,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Execute the firmware information query on the first boot if it is
available.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/loader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 8672dcc9cc1e..5f51d936b306 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -175,6 +175,9 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "firmware boot complete\n");
 	sof_set_fw_state(sdev, SOF_FW_BOOT_COMPLETE);
 
+	if (sdev->first_boot && sdev->ipc->ops->fw_loader->query_fw_configuration)
+		return sdev->ipc->ops->fw_loader->query_fw_configuration(sdev);
+
 	return 0;
 }
 EXPORT_SYMBOL(snd_sof_run_firmware);
-- 
2.25.1

