Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1266157CC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DD441920;
	Tue,  7 May 2019 04:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DD441920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557197142;
	bh=Z32rxizI2eJLjmq8h+WTr9GGU7ge2PHKt8Zb+lTnyAM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uPYd1SBJ3uwu5R/iFab1A8RliIpH2JHj4aSW+IR7gzvL40uwu1ZD5bJ/qabuWq0B/
	 /jvxwyyWT5KW5/CaONjs3w2Ehu2PxRPESqeFnLKOt6dsTH2EuUdxayImiK9xpkBMlr
	 rrUV+sMYzeERevW896cpkubgQ/YE/BteTz5Q/928=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DF8EF8978E;
	Tue,  7 May 2019 04:33:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E6C2F89788; Tue,  7 May 2019 04:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0217BF8972A
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0217BF8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kMpdRKEY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=69gNOrR5hr+ggTeaDHkcfb4lQWwrwVarl5WzF4L72IU=; b=kMpdRKEYobro
 ftDpaDv9t3UxhohfdauE+HDS2XOQMevrUW0fpUETMolcg4tLsFXlPM54hpK26vuUddV7+3Sz1FwM7
 5cc4t+wWicpWcah3zJgZfYfhbQyKNggxIg+TdkbxqDlvKYFcFwUsDDU+9PSaByUrd5ztcqzaItHTA
 8r/k8=;
Received: from kd111239185057.au-net.ne.jp ([111.239.185.57]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNpub-0003UK-IN; Tue, 07 May 2019 02:32:58 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id D3690440034; Tue,  7 May 2019 03:32:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mac Chiang <mac.chiang@intel.com>
In-Reply-To: <1556851697-301-1-git-send-email-mac.chiang@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190507023247.D3690440034@finisterre.sirena.org.uk>
Date: Tue,  7 May 2019 03:32:47 +0100 (BST)
Cc: alsa-devel@alsa-project.org, "Harshapriya.n" <harshapriya.n@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 mac.chiang@intel.com, Mark Brown <broonie@kernel.org>,
 chintan.m.patel@intel.com, Jenny TC <jenny.tc@intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: boards: kbl_da7219_max98927: add
	dai_trigger function" to the asoc tree
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

   ASoC: Intel: boards: kbl_da7219_max98927: add dai_trigger function

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 53fdea9604fa1560bdbf418bbca564dbbebef211 Mon Sep 17 00:00:00 2001
From: Mac Chiang <mac.chiang@intel.com>
Date: Fri, 3 May 2019 10:48:17 +0800
Subject: [PATCH] ASoC: Intel: boards: kbl_da7219_max98927: add dai_trigger
 function

amplifier feedback is not modeled as being dependent on any active
output. Even when there is no playback happening, parts of the graph,
specifically the IV sense->speaker protection->output remains active
and this prevents the DSP from entering low-power states.

This patch suggest a machine driver level approach where the speaker
pins are enabled/disabled dynamically depending on stream start/stop
events. DPAM graph representations show the feedback loop is indeed
disabled and low-power states can be reached.

Signed-off-by: Jenny TC <jenny.tc@intel.com>
Signed-off-by: Harshapriya.n <harshapriya.n@intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/kbl_da7219_max98927.c | 73 +++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index f72a7bf028d7..1efe7fdad2cb 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -219,8 +219,60 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int kabylake_ssp0_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	int j, ret;
+
+	for (j = 0; j < rtd->num_codecs; j++) {
+		struct snd_soc_dai *codec_dai = rtd->codec_dais[j];
+		const char *name = codec_dai->component->name;
+		struct snd_soc_component *component = codec_dai->component;
+		struct snd_soc_dapm_context *dapm =
+				snd_soc_component_get_dapm(component);
+		char pin_name[20];
+
+		if (strcmp(name, MAX98927_DEV0_NAME) &&
+			strcmp(name, MAX98927_DEV1_NAME) &&
+			strcmp(name, MAX98373_DEV0_NAME) &&
+			strcmp(name, MAX98373_DEV1_NAME))
+			continue;
+
+		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
+			codec_dai->component->name_prefix);
+
+		switch (cmd) {
+		case SNDRV_PCM_TRIGGER_START:
+		case SNDRV_PCM_TRIGGER_RESUME:
+		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+			ret = snd_soc_dapm_enable_pin(dapm, pin_name);
+			if (ret) {
+				dev_err(rtd->dev, "failed to enable %s: %d\n",
+				pin_name, ret);
+				return ret;
+			}
+			snd_soc_dapm_sync(dapm);
+			break;
+		case SNDRV_PCM_TRIGGER_STOP:
+		case SNDRV_PCM_TRIGGER_SUSPEND:
+		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
+			if (ret) {
+				dev_err(rtd->dev, "failed to disable %s: %d\n",
+				pin_name, ret);
+				return ret;
+			}
+			snd_soc_dapm_sync(dapm);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static struct snd_soc_ops kabylake_ssp0_ops = {
 	.hw_params = kabylake_ssp0_hw_params,
+	.trigger = kabylake_ssp0_trigger,
 };
 
 static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -950,6 +1002,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
 	struct kbl_hdmi_pcm *pcm;
+	struct snd_soc_dapm_context *dapm = &card->dapm;
 	struct snd_soc_component *component = NULL;
 	int err, i = 0;
 	char jack_name[NAME_SIZE];
@@ -976,9 +1029,25 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
 	if (!component)
 		return -EINVAL;
 
-	return hdac_hdmi_jack_port_init(component, &card->dapm);
 
-	return 0;
+	err = hdac_hdmi_jack_port_init(component, &card->dapm);
+
+	if (err < 0)
+		return err;
+
+	err = snd_soc_dapm_disable_pin(dapm, "Left Spk");
+	if (err) {
+		dev_err(card->dev, "failed to disable Left Spk: %d\n", err);
+		return err;
+	}
+
+	err = snd_soc_dapm_disable_pin(dapm, "Right Spk");
+	if (err) {
+		dev_err(card->dev, "failed to disable Right Spk: %d\n", err);
+		return err;
+	}
+
+	return snd_soc_dapm_sync(dapm);
 }
 
 /* kabylake audio machine driver for SPT + DA7219 */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
