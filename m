Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7523C0C72
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 417A11672;
	Fri, 27 Sep 2019 22:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 417A11672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615184;
	bh=LlaXYxfmCwbcSg+Ng1E8OrnOtIdErGnEjTBfQRSS3mI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q4oN+A0WoZc757JhVkuxlJ02uzGmZTE9vKf3Zb4vPMMnVPykNRKN1TGY5jTRrJGZz
	 NggtD5aCqiPvAdMZN1eLH1OYb/ulaa4SeB3wBOdHEIZmyS2jfP9qqF+th9bw8jQw2R
	 1XW3rcRI0hHgwXXCRKELV6TjnHw+wNu2lKvGoIb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50F28F80672;
	Fri, 27 Sep 2019 22:06:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1327DF80611; Fri, 27 Sep 2019 22:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90EBEF805F7
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EBEF805F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444266"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:32 -0500
Message-Id: <20190927200538.660-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
References: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 07/13] ASoC: SOF: core: check for mandatory
	fw_ready op during SOF probe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

fw_ready should be a mandatory op. Make sure fw_ready ops is set
during probe.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c     | 3 ++-
 sound/soc/sof/ipc.c      | 6 ------
 sound/soc/sof/sof-priv.h | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 15167b8220ed..5998861a9002 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -466,7 +466,8 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	if (!sof_ops(sdev) || !sof_ops(sdev)->probe || !sof_ops(sdev)->run ||
 	    !sof_ops(sdev)->block_read || !sof_ops(sdev)->block_write ||
 	    !sof_ops(sdev)->send_msg || !sof_ops(sdev)->load_firmware ||
-	    !sof_ops(sdev)->ipc_msg_data || !sof_ops(sdev)->ipc_pcm_params)
+	    !sof_ops(sdev)->ipc_msg_data || !sof_ops(sdev)->ipc_pcm_params ||
+	    !sof_ops(sdev)->fw_ready)
 		return -EINVAL;
 
 	INIT_LIST_HEAD(&sdev->pcm_list);
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b946c81197a1..26675dfe0240 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -792,12 +792,6 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 	struct snd_sof_ipc *ipc;
 	struct snd_sof_ipc_msg *msg;
 
-	/* check if mandatory ops required for ipc are defined */
-	if (!sof_ops(sdev)->fw_ready) {
-		dev_err(sdev->dev, "error: ipc mandatory ops not defined\n");
-		return NULL;
-	}
-
 	ipc = devm_kzalloc(sdev->dev, sizeof(*ipc), GFP_KERNEL);
 	if (!ipc)
 		return NULL;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 348759035dd0..44f789bf7fb0 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -133,7 +133,7 @@ struct snd_sof_dsp_ops {
 	 * FW ready checks for ABI compatibility and creates
 	 * memory windows at first boot
 	 */
-	int (*fw_ready)(struct snd_sof_dev *sdev, u32 msg_id); /* optional */
+	int (*fw_ready)(struct snd_sof_dev *sdev, u32 msg_id); /* mandatory */
 
 	/* connect pcm substream to a host stream */
 	int (*pcm_open)(struct snd_sof_dev *sdev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
