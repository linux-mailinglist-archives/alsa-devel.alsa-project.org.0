Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90113B93B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 06:53:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2AFB17A5;
	Wed, 15 Jan 2020 06:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2AFB17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579067589;
	bh=yJoGZylZTrf6gHSRm0P5fqSYDzy+7Apj0FnKFTyJ9FI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3elvhtDd5Rs+rZj9l8cIixzq0bXLrejFlXxDi7PSIgdh4GL54umJOAPz29q1CYU7
	 00lx/UE9UL5JcBbwf4q42UpdCTAa7LnUnUrA5459dpXlGvjacHtaa21rc1foONh5ds
	 hZ8gQgvcSdh6UDgPiM9kgwwI/k1ikXpElAPjGX3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E824BF802A0;
	Wed, 15 Jan 2020 06:48:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9588AF80271; Wed, 15 Jan 2020 06:48:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB975F800B9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 06:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB975F800B9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 21:48:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="225452765"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga003.jf.intel.com with ESMTP; 14 Jan 2020 21:48:12 -0800
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Wed, 15 Jan 2020 01:51:52 +0800
Message-Id: <20200114175152.3291-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
References: <20200114175152.3291-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH RFC v2 4/4] ASoC: add warning if the function
	is not support multi cpu yet.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Multi cpu is not supported by all functions yet. Add a warning message
to warn it.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/soc-compress.c              |  7 ++++---
 sound/soc/soc-generic-dmaengine-pcm.c | 12 ++++++++++++
 sound/soc/soc-pcm.c                   | 12 ++++++++++++
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 223cd045719e..bf9d6a21bcd9 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -810,10 +810,11 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	int playback = 0, capture = 0;
 	int i;
 
-	if (rtd->num_codecs > 1) {
+	if (rtd->num_cpus > 1 ||
+	    rtd->num_codecs) {
 		dev_err(rtd->card->dev,
-			"Compress ASoC: Multicodec not supported\n");
-		return -EINVAL;
+			"Compress ASoC: Multi CPU/Codec not supported\n");
+		return -ENOTSUPP;
 	}
 
 	/* check client and interface hw capabilities */
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index df57ec47ad60..a6c8623d03be 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -62,6 +62,10 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
+	if (rtd->num_cpus > 1)
+		dev_warn(rtd->dev,
+			 "%s doesn't support Multi CPU yet\n", __func__);
+
 	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
@@ -119,6 +123,10 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 	struct snd_pcm_hardware hw;
 	int ret;
 
+	if (rtd->num_cpus > 1)
+		dev_warn(rtd->dev,
+			 "%s doesn't support Multi CPU yet\n", __func__);
+
 	if (pcm->config && pcm->config->pcm_hardware)
 		return snd_soc_set_runtime_hwparams(substream,
 				pcm->config->pcm_hardware);
@@ -183,6 +191,10 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	dma_filter_fn fn = NULL;
 
+	if (rtd->num_cpus > 1)
+		dev_warn(rtd->dev,
+			 "%s doesn't support Multi CPU yet\n", __func__);
+
 	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
 
 	if ((pcm->flags & SND_DMAENGINE_PCM_FLAG_HALF_DUPLEX) && pcm->chan[0])
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 52c6f3c3ab63..e16af8effffa 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1469,6 +1469,10 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dai *cpu_dai = fe->cpu_dai;
 	int paths;
 
+	if (fe->num_cpus > 1)
+		dev_warn(fe->dev,
+			 "%s doesn't support Multi CPU yet\n", __func__);
+
 	/* get number of valid DAI paths and their widgets */
 	paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
 			dpcm_end_walk_at_be);
@@ -2812,6 +2816,10 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	struct snd_soc_dapm_widget_list *list;
 	int count, paths;
 
+	if (fe->num_cpus > 1)
+		dev_warn(fe->dev,
+			 "%s doesn't support Multi CPU yet\n", __func__);
+
 	if (!fe->dai_link->dynamic)
 		return 0;
 
@@ -3368,6 +3376,10 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 	ssize_t out_count = PAGE_SIZE, offset = 0, ret = 0;
 	char *buf;
 
+	if (fe->num_cpus > 1)
+		dev_warn(fe->dev,
+			 "%s doesn't support Multi CPU yet\n", __func__);
+
 	buf = kmalloc(out_count, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
