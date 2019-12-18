Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D821252BF
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2ADA165E;
	Wed, 18 Dec 2019 21:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2ADA165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576699751;
	bh=vE4Yw7hoHmXcl3CANO1XXPeHfAuk44DqEh9IAK1mKXI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=VCavZy+Uh3PoHsQ+48Yq0KG/gMT1d3CRUNIp+xe1dL7ZM/O4+iR434FjSif7Lqu3A
	 q0WHpYSirYQTPjr7DISColEUdi3g9DLd6gB2lkYY5ejRNf0r19iOE/1YPqYD4iC+Vo
	 c5K/CJ67KCJ1XwaLbKHTNiEW0XAg1mUWQtXFOIow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23EC2F8027D;
	Wed, 18 Dec 2019 21:05:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8300DF80273; Wed, 18 Dec 2019 21:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A01A6F80266
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A01A6F80266
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE7331B;
 Wed, 18 Dec 2019 12:05:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3248B3F67D;
 Wed, 18 Dec 2019 12:05:35 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191217202231.18259-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191217202231.18259-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: add namespace for
	hda-codec functionality" to the asoc tree
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

   ASoC: SOF: Intel: hda: add namespace for hda-codec functionality

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 5bd216c6a6b48d8ed0b3283bf7ba84fc3a566b25 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 17 Dec 2019 14:22:29 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda: add namespace for hda-codec
 functionality

Define namespaces (one generic and one dedicated for i915) and include
them in HDaudio top-level module.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191217202231.18259-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-codec.c | 14 +++++++-------
 sound/soc/sof/intel/hda.c       |  2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index d7855b1f8e2e..5514e6191ba4 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -76,8 +76,8 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev) {}
 void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
-EXPORT_SYMBOL(hda_codec_jack_wake_enable);
-EXPORT_SYMBOL(hda_codec_jack_check);
+EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 /* probe individual codec */
 static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
@@ -160,7 +160,7 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev,
 		}
 	}
 }
-EXPORT_SYMBOL(hda_codec_probe_bus);
+EXPORT_SYMBOL_NS(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 #if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
 	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
@@ -172,7 +172,7 @@ void hda_codec_i915_get(struct snd_sof_dev *sdev)
 	dev_dbg(bus->dev, "Turning i915 HDAC power on\n");
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 }
-EXPORT_SYMBOL(hda_codec_i915_get);
+EXPORT_SYMBOL_NS(hda_codec_i915_get, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 void hda_codec_i915_put(struct snd_sof_dev *sdev)
 {
@@ -181,7 +181,7 @@ void hda_codec_i915_put(struct snd_sof_dev *sdev)
 	dev_dbg(bus->dev, "Turning i915 HDAC power off\n");
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 }
-EXPORT_SYMBOL(hda_codec_i915_put);
+EXPORT_SYMBOL_NS(hda_codec_i915_put, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_init(struct snd_sof_dev *sdev)
 {
@@ -197,7 +197,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL(hda_codec_i915_init);
+EXPORT_SYMBOL_NS(hda_codec_i915_init, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 {
@@ -210,7 +210,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL(hda_codec_i915_exit);
+EXPORT_SYMBOL_NS(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 #endif
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 3335e0076180..adb842ed6b26 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -795,3 +795,5 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 }
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
