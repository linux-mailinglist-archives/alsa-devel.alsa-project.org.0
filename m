Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4372B44D1
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 14:36:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19CA1755;
	Mon, 16 Nov 2020 14:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19CA1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605533789;
	bh=cblcir49GWl/8JVLU02k3CWSHLS+uBUqfbSgA60pZkM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocg6aw1dmpcxShwG+LCqhA0X+AX2ARZrxkFTblF6I0LZUuNwv4XUkhlk6klyh9Lps
	 X6zaNqpsnPBJcoRMKBUGwWjaEYWpG8hllqCGlcOMTTTBa+UNPeZOP3ZVhg60hew5/C
	 vZ/qo8AxqLuvW+mevvtFH5W9WidZoIuSWF1eIzpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12EF7F8014A;
	Mon, 16 Nov 2020 14:34:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8699F804BD; Mon, 16 Nov 2020 14:34:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35828F80168
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 14:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35828F80168
IronPort-SDR: ER+8cBojc4yH0dUmnS78Mw0tfhcJqIlCcuRE/rHpB/+YqBZk4M5WJRhk5Qzdmnys7q4u1sjoIn
 LBU0voafVETg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158520546"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="158520546"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 05:33:53 -0800
IronPort-SDR: SCdsqWBBqEfiShr/CZfEPGbQm/sk7imrDEuKWYG0F1VIN76p5l2My1c14lscCv3RC97J/7lVTm
 YFy2ND7MDoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; d="scan'208";a="475525036"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 16 Nov 2020 05:33:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: Intel: catpt: Optimize applying user settings
Date: Mon, 16 Nov 2020 14:33:30 +0100
Message-Id: <20201116133332.8530-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116133332.8530-1-cezary.rojewski@intel.com>
References: <20201116133332.8530-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, broonie@kernel.org
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

Initial user settings such as volume control need to be applied only
once after stream is allocated. As prepare() operation can be invoked
multiple times during the stream's lifetime, relocate
catpt_dai_apply_usettings() and call it directly within
catpt_dai_hw_params() rather than on every catpt_dai_prepare().

catpt_dai_apply_usettings() remains unchanged.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 104 ++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 408e64e3b5fb..10b483695ade 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -324,6 +324,54 @@ static void catpt_dai_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol);
+
+static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
+				     struct catpt_stream_runtime *stream)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct snd_soc_component *component = dai->component;
+	struct snd_kcontrol *pos, *kctl = NULL;
+	const char *name;
+	int ret;
+	u32 id = stream->info.stream_hw_id;
+
+	/* only selected streams have individual controls */
+	switch (id) {
+	case CATPT_PIN_ID_OFFLOAD1:
+		name = "Media0 Playback Volume";
+		break;
+	case CATPT_PIN_ID_OFFLOAD2:
+		name = "Media1 Playback Volume";
+		break;
+	case CATPT_PIN_ID_CAPTURE1:
+		name = "Mic Capture Volume";
+		break;
+	case CATPT_PIN_ID_REFERENCE:
+		name = "Loopback Mute";
+		break;
+	default:
+		return 0;
+	};
+
+	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
+		if (pos->private_data == component &&
+		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
+			kctl = pos;
+			break;
+		}
+	}
+	if (!kctl)
+		return -ENOENT;
+
+	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
+		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
+	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+	return 0;
+}
+
 static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -370,6 +418,10 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
 
+	ret = catpt_dai_apply_usettings(dai, stream);
+	if (ret)
+		return ret;
+
 	stream->allocated = true;
 	return 0;
 }
@@ -391,54 +443,6 @@ static int catpt_dai_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol);
-
-static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
-				     struct catpt_stream_runtime *stream)
-{
-	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
-	struct snd_soc_component *component = dai->component;
-	struct snd_kcontrol *pos, *kctl = NULL;
-	const char *name;
-	int ret;
-	u32 id = stream->info.stream_hw_id;
-
-	/* only selected streams have individual controls */
-	switch (id) {
-	case CATPT_PIN_ID_OFFLOAD1:
-		name = "Media0 Playback Volume";
-		break;
-	case CATPT_PIN_ID_OFFLOAD2:
-		name = "Media1 Playback Volume";
-		break;
-	case CATPT_PIN_ID_CAPTURE1:
-		name = "Mic Capture Volume";
-		break;
-	case CATPT_PIN_ID_REFERENCE:
-		name = "Loopback Mute";
-		break;
-	default:
-		return 0;
-	};
-
-	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
-		if (pos->private_data == component &&
-		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
-			kctl = pos;
-			break;
-		}
-	}
-	if (!kctl)
-		return -ENOENT;
-
-	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
-		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
-	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value);
-	if (ret)
-		return CATPT_IPC_ERROR(ret);
-	return 0;
-}
-
 static int catpt_dai_prepare(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
@@ -458,10 +462,6 @@ static int catpt_dai_prepare(struct snd_pcm_substream *substream,
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
 
-	ret = catpt_dai_apply_usettings(dai, stream);
-	if (ret)
-		return ret;
-
 	stream->prepared = true;
 	return 0;
 }
-- 
2.17.1

