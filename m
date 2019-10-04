Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D141CBF92
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 17:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1726C1674;
	Fri,  4 Oct 2019 17:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1726C1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570203851;
	bh=0iUdhSkS1r1ZdU+22CCU3mq04E8syOg1J16eshloO3M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNkJfaxULVWWmzYbkmdzJ5Nv8Etq/0Ynd+rbjGq8BH17XXJNy+UQhVlZx2HxeXU0w
	 Z+WAEPXk3x9OsMwZ/6071W+2F5L67pQE2BgK1rgKxLjH4qiVDCsBebIdJrX91H2Idm
	 +mBjaYu7ZRzlIfRVDXqAGLcw8nlMJConBG9pFuJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47273F805FA;
	Fri,  4 Oct 2019 17:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D288F80391; Fri,  4 Oct 2019 17:41:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EF56F800C2
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 17:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EF56F800C2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 08:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="192463295"
Received: from rmadapoo-mobl.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.255.92.146])
 by fmsmga007.fm.intel.com with ESMTP; 04 Oct 2019 08:41:29 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  4 Oct 2019 08:41:26 -0700
Message-Id: <20191004154127.28459-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004154127.28459-1-ranjani.sridharan@linux.intel.com>
References: <20191004154127.28459-1-ranjani.sridharan@linux.intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [RFC PATCH 1/2] ASoC: pcm: update FE/BE trigger order
	based on the command
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

Currently, the trigger orders SND_SOC_DPCM_TRIGGER_PRE/POST
determine the order in which FE DAI and BE DAI are triggered.
In the case of SND_SOC_DPCM_TRIGGER_PRE, the FE DAI is
triggered before the BE DAI and in the case of
SND_SOC_DPCM_TRIGGER_POST, the BE DAI is triggered before
the FE DAI. And this order remains the same irrespective of the
trigger command.

In the case of the SOF driver, during playback, the FW
expects the BE DAI to be triggered before the FE DAI during
the START trigger. The BE DAI trigger handles the starting of
Link DMA and so it must be started before the FE DAI is started
to prevent xruns during pause/release. This can be addressed
by setting the trigger order for the FE dai link to
SND_SOC_DPCM_TRIGGER_POST. But during the STOP trigger,
the FW expects the FE DAI to be triggered before the BE DAI.
Retaining the same order during the START and STOP commands,
results in FW error as the DAI component in the FW is still
active.

The issue can be fixed by mirroring the trigger order of
FE and BE DAI's during the START and STOP trigger. So, with the
trigger order set to SND_SOC_DPCM_TRIGGER_PRE, the FE DAI will be
trigger first during SNDRV_PCM_TRIGGER_START/STOP/RESUME
and the BE DAI will be triggered first during the
STOP/SUSPEND/PAUSE commands. Conversely, with the trigger order
set to SND_SOC_DPCM_TRIGGER_POST, the BE DAI will be triggered
first during the SNDRV_PCM_TRIGGER_START/STOP/RESUME commands
and the FE DAI will be triggered first during the
SNDRV_PCM_TRIGGER_STOP/SUSPEND/PAUSE commands.

Github Issue: https://github.com/thesofproject/linux/issues/1160
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-pcm.c | 99 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 27 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 66910500e3b6..8e5097eead27 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2340,42 +2340,85 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 }
 EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
 
+static int dpcm_dai_trigger_fe_first(struct snd_pcm_substream *substream,
+				     int cmd, bool fe_first)
+{
+	struct snd_soc_pcm_runtime *fe = substream->private_data;
+	int ret;
+
+	/* call trigger on the frontend before the backend. */
+	if (fe_first) {
+		dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
+			fe->dai_link->name, cmd);
+
+		ret = soc_pcm_trigger(substream, cmd);
+		if (ret < 0)
+			return ret;
+
+		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
+		return ret;
+	}
+
+	/* call trigger on the frontend after the backend. */
+	ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
+		fe->dai_link->name, cmd);
+
+	ret = soc_pcm_trigger(substream, cmd);
+
+	return ret;
+}
+
 static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *fe = substream->private_data;
-	int stream = substream->stream, ret;
+	int stream = substream->stream;
+	int ret = 0;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
 	switch (trigger) {
 	case SND_SOC_DPCM_TRIGGER_PRE:
-		/* call trigger on the frontend before the backend. */
-
-		dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
-				fe->dai_link->name, cmd);
-
-		ret = soc_pcm_trigger(substream, cmd);
-		if (ret < 0) {
-			dev_err(fe->dev,"ASoC: trigger FE failed %d\n", ret);
-			goto out;
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+		case SNDRV_PCM_TRIGGER_RESUME:
+		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+			ret = dpcm_dai_trigger_fe_first(substream, cmd, true);
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+			ret = dpcm_dai_trigger_fe_first(substream, cmd, false);
+			break;
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			ret = dpcm_dai_trigger_fe_first(substream, cmd, false);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
 		}
-
-		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
 		break;
 	case SND_SOC_DPCM_TRIGGER_POST:
-		/* call trigger on the frontend after the backend. */
-
-		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
-		if (ret < 0) {
-			dev_err(fe->dev,"ASoC: trigger FE failed %d\n", ret);
-			goto out;
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+		case SNDRV_PCM_TRIGGER_RESUME:
+		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+			ret = dpcm_dai_trigger_fe_first(substream, cmd, false);
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+			ret = dpcm_dai_trigger_fe_first(substream, cmd, true);
+			break;
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			ret = dpcm_dai_trigger_fe_first(substream, cmd, true);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
 		}
-
-		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
-				fe->dai_link->name, cmd);
-
-		ret = soc_pcm_trigger(substream, cmd);
 		break;
 	case SND_SOC_DPCM_TRIGGER_BESPOKE:
 		/* bespoke trigger() - handles both FE and BEs */
@@ -2384,10 +2427,6 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 				fe->dai_link->name, cmd);
 
 		ret = soc_pcm_bespoke_trigger(substream, cmd);
-		if (ret < 0) {
-			dev_err(fe->dev,"ASoC: trigger FE failed %d\n", ret);
-			goto out;
-		}
 		break;
 	default:
 		dev_err(fe->dev, "ASoC: invalid trigger cmd %d for %s\n", cmd,
@@ -2396,6 +2435,12 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		goto out;
 	}
 
+	if (ret < 0) {
+		dev_err(fe->dev, "ASoC: trigger FE cmd: %d failed: %d\n",
+			cmd, ret);
+		goto out;
+	}
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
