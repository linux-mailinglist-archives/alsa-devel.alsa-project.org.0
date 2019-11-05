Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8B7F0585
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 19:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2371170E;
	Tue,  5 Nov 2019 19:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2371170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572980332;
	bh=jf4CdG9fg9P32fk5A2zOoYa5DAAzB0m7s5pKBZyXX+I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TnFs3v7pS9wELJX6RjLfq6kQx1QAdRPxsPKbiwe5Uhf2MHivgTdLGF+wicAE+9QVt
	 kOP3Jt2bDJxEeXPcSXoM98NVVlZXyGqjVZ/hRs1IGd7Y58butVItwJG7N9LQbuosvp
	 xc8Ix7/Otaq54Bdo6ZXyxwG7ejM6fGWfnoEpxIkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF07F80612;
	Tue,  5 Nov 2019 19:55:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E44DF8049B; Tue,  5 Nov 2019 19:55:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82099F80446
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 19:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82099F80446
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="s4yoo7Tf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8mwjvRwdxeN6lDGbw+BEDPz5W580DfsU3T5sIQ3WcWg=; b=s4yoo7Tf0HaC
 +W5haYYgDA5ZVt0Io8rU7uJcgpv5B3SeRpVxuoRjyGUSNr4JLtnm5l4nYcpau9AU0eGwXop3pVUPL
 7Rop/EgI6UgloJ58iilSTIgen2S+9X1eTAfC0plGwrGFdLuK+EJV7xYGhclD5Nd/f19dNyOzxz/SY
 l3p9I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS3z0-0007Ph-Kk; Tue, 05 Nov 2019 18:55:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 11C2E27431C3; Tue,  5 Nov 2019 18:55:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191104224812.3393-2-ranjani.sridharan@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105185512.11C2E27431C3@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 18:55:12 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: pcm: update FE/BE trigger order based
	on the command" to the asoc tree
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

The patch

   ASoC: pcm: update FE/BE trigger order based on the command

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From acbf27746ecfa96b290b54cc7f05273482ea128a Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Mon, 4 Nov 2019 14:48:11 -0800
Subject: [PATCH] ASoC: pcm: update FE/BE trigger order based on the command

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

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191104224812.3393-2-ranjani.sridharan@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 95 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 68 insertions(+), 27 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8655df6a6089..1c00119b72e3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2322,42 +2322,81 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 }
 EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
 
+static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
+				  int cmd, bool fe_first)
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
+			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
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
+			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
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
@@ -2366,10 +2405,6 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 				fe->dai_link->name, cmd);
 
 		ret = soc_pcm_bespoke_trigger(substream, cmd);
-		if (ret < 0) {
-			dev_err(fe->dev,"ASoC: trigger FE failed %d\n", ret);
-			goto out;
-		}
 		break;
 	default:
 		dev_err(fe->dev, "ASoC: invalid trigger cmd %d for %s\n", cmd,
@@ -2378,6 +2413,12 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
