Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F5C5763EB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BC9194A;
	Fri, 15 Jul 2022 16:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BC9194A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896989;
	bh=2ETtmZNVkwF2WKuaATfNYri4K/JNy7E0Dqrn0SdpwB4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dtJDslYNWlVbTTimhXUCSTTu8GzOB9QWTqfAZ2tNdSAV9dSLCjOz7jX9Lt9in+pjN
	 41GE64MwJuFrOJYQg9WeEQnagqI7r0HqSOheGX2TfVm8VIPd9T9C+0YNZIyZzEn6rw
	 QGxv1hIRbV2RVH9JHc2ilHUT5WNjV8tyRyn70+DQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C10EF805A1;
	Fri, 15 Jul 2022 16:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 224F4F80566; Fri, 15 Jul 2022 16:53:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A655DF80551
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A655DF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gBqjOEOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896781; x=1689432781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ETtmZNVkwF2WKuaATfNYri4K/JNy7E0Dqrn0SdpwB4=;
 b=gBqjOEOLydpPOjzIbLXTk1FaZbBvSepJ9sRSpCOLIi2HdzoXGrTTaDLZ
 h/6TNU9hwXoYI9IJBJtOURVRWdwHvU37S+7TAXZTvYycMxMvexPoTsOln
 c9NnxozU5fXwwiiwULPubZwUsxO0nRBv8Pq1E7FmCLUnZ5g6My6qi0R/q
 OYYgw1RZlW+APqLxliQpf+FXxcEClbHflUMC2wDb1sNN+nx+h3LwWdtx8
 RBEmmf5iVkEmZRG1huvu6OtFxtOT3qBG0SJcUnl4B6vZUK19/Yb1ALueG
 1NZOqHCUg/0G1qzFyhC0svafsNNqWD5qQYsYUq6VVgKgMNiEgOVSuolYx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476920"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476920"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533130"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/11] ASoC: SOF: probes: rename assign/free callbacks as
 startup/shutdown
Date: Fri, 15 Jul 2022 09:52:15 -0500
Message-Id: <20220715145216.277003-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
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

assign/free are not well aligned to usual conventions and specifically
not to the compressed ops that make use of the probe callbacks.

Use the more common startup/shutdown. No functional change beyond
renaming.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-probes.c  | 16 ++++++++--------
 sound/soc/sof/sof-client-probes.c |  8 ++++----
 sound/soc/sof/sof-client-probes.h |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sof/intel/hda-probes.c b/sound/soc/sof/intel/hda-probes.c
index 31e85d4aae8c..56a533c63cb0 100644
--- a/sound/soc/sof/intel/hda-probes.c
+++ b/sound/soc/sof/intel/hda-probes.c
@@ -25,9 +25,9 @@ hda_compr_get_stream(struct snd_compr_stream *cstream)
 	return cstream->runtime->private_data;
 }
 
-static int hda_probes_compr_assign(struct sof_client_dev *cdev,
-				   struct snd_compr_stream *cstream,
-				   struct snd_soc_dai *dai, u32 *stream_id)
+static int hda_probes_compr_startup(struct sof_client_dev *cdev,
+				    struct snd_compr_stream *cstream,
+				    struct snd_soc_dai *dai, u32 *stream_id)
 {
 	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
 	struct hdac_ext_stream *hext_stream;
@@ -45,9 +45,9 @@ static int hda_probes_compr_assign(struct sof_client_dev *cdev,
 	return 0;
 }
 
-static int hda_probes_compr_free(struct sof_client_dev *cdev,
-				 struct snd_compr_stream *cstream,
-				 struct snd_soc_dai *dai)
+static int hda_probes_compr_shutdown(struct sof_client_dev *cdev,
+				     struct snd_compr_stream *cstream,
+				     struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream = hda_compr_get_stream(cstream);
 	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
@@ -127,8 +127,8 @@ static int hda_probes_compr_pointer(struct sof_client_dev *cdev,
 
 /* SOF client implementation */
 static const struct sof_probes_host_ops hda_probes_ops = {
-	.assign = hda_probes_compr_assign,
-	.free = hda_probes_compr_free,
+	.startup = hda_probes_compr_startup,
+	.shutdown = hda_probes_compr_shutdown,
 	.set_params = hda_probes_compr_set_params,
 	.trigger = hda_probes_compr_trigger,
 	.pointer = hda_probes_compr_pointer,
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index e7e78d1a8ec3..eb246b823461 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -270,9 +270,9 @@ static int sof_probes_compr_startup(struct snd_compr_stream *cstream,
 	if (ret)
 		return ret;
 
-	ret = ops->assign(cdev, cstream, dai, &priv->extractor_stream_tag);
+	ret = ops->startup(cdev, cstream, dai, &priv->extractor_stream_tag);
 	if (ret) {
-		dev_err(dai->dev, "Failed to assign probe stream: %d\n", ret);
+		dev_err(dai->dev, "Failed to startup probe stream: %d\n", ret);
 		priv->extractor_stream_tag = SOF_PROBES_INVALID_NODE_ID;
 		sof_client_core_module_put(cdev);
 	}
@@ -310,7 +310,7 @@ static int sof_probes_compr_shutdown(struct snd_compr_stream *cstream,
 	priv->extractor_stream_tag = SOF_PROBES_INVALID_NODE_ID;
 	snd_compr_free_pages(cstream);
 
-	ret = ops->free(cdev, cstream, dai);
+	ret = ops->shutdown(cdev, cstream, dai);
 
 	sof_client_core_module_put(cdev);
 
@@ -709,7 +709,7 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 
 	ops = dev->platform_data;
 
-	if (!ops->assign || !ops->free || !ops->set_params || !ops->trigger ||
+	if (!ops->startup || !ops->shutdown || !ops->set_params || !ops->trigger ||
 	    !ops->pointer) {
 		dev_err(dev, "missing platform callback(s)\n");
 		return -ENODEV;
diff --git a/sound/soc/sof/sof-client-probes.h b/sound/soc/sof/sof-client-probes.h
index 0f9ed4569fd3..9e43f3c444f8 100644
--- a/sound/soc/sof/sof-client-probes.h
+++ b/sound/soc/sof/sof-client-probes.h
@@ -14,10 +14,10 @@ struct snd_soc_dai;
  * DSP and host, like HDA.
  */
 struct sof_probes_host_ops {
-	int (*assign)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
-		      struct snd_soc_dai *dai, u32 *stream_id);
-	int (*free)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
-		    struct snd_soc_dai *dai);
+	int (*startup)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
+		       struct snd_soc_dai *dai, u32 *stream_id);
+	int (*shutdown)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
+			struct snd_soc_dai *dai);
 	int (*set_params)(struct sof_client_dev *cdev, struct snd_compr_stream *cstream,
 			  struct snd_compr_params *params,
 			  struct snd_soc_dai *dai);
-- 
2.34.1

