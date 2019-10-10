Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5EDD2C90
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D8B1674;
	Thu, 10 Oct 2019 16:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D8B1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717830;
	bh=eB5hf6zv1JhzKnJS4cCBTlY37QKs3Ut9IrGw9skHjwY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ivwY/MzGPbbN+niK5iJQi3hkgQLErnywNLh5yh/dbD/3dJ+OTmjSSso1Pg9Ux3+UD
	 4hxkqU3alXfrTPj4c3Awsufj0p9UiBliQ7xZ2jcfX+zAzWhFKCwZZJDFmTNnEcQaYm
	 +EnFuRJ8X/JvB/PijUpB1wvD6PXAyZwHpH92LBtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF34DF806ED;
	Thu, 10 Oct 2019 16:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1E36F805FE; Thu, 10 Oct 2019 16:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3A0BF80447
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A0BF80447
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YSuJ7fv9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=sSC+TOEENmzFtxQt2/QRp0i+727uBH7hpKd9cl38sd0=; b=YSuJ7fv9Etdo
 qVJVGgi1uRvcM6/KeAgN36qtF6py3lqJmss4KfeMP3TDwvlB+KyoMmF6AUKmP/3QbcXvU/g2UnHzi
 Xp1duXemKVAR0gWq4cqT1wBma1v03niyQ64JuZs7UNy0OmOr9itA43qMnPrTBqJ6GvtBXobbIJPh9
 C4/3I=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKp-0001ZW-Ga; Thu, 10 Oct 2019 14:22:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 2B252D0003C; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jaska Uimonen <jaska.uimonen@linux.intel.com>
In-Reply-To: <20191008164443.1358-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.2B252D0003C@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: acpi led support for switch
	controls" to the asoc tree
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

   ASoC: SOF: acpi led support for switch controls

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

From 5d43001ae43606dc525f55c482c545afba01bb55 Mon Sep 17 00:00:00 2001
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Date: Tue, 8 Oct 2019 11:44:43 -0500
Subject: [PATCH] ASoC: SOF: acpi led support for switch controls

Currently sof doesn't support acpi leds with mute switches. So implement
acpi leds following quite shamelessly existing HDA implementation by
Takashi Iwai.

Mute leds can be enabled in topology by adding led and direction token
in switch control private data.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/control.c         | 32 ++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h        |  9 +++++++++
 sound/soc/sof/topology.c        | 13 +++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index da18c9de1056..d65406f34361 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -113,4 +113,8 @@
 /* ESAI */
 #define SOF_TKN_IMX_ESAI_MCLK_ID		1100
 
+/* Led control for mute switches */
+#define SOF_TKN_MUTE_LED_USE			1300
+#define SOF_TKN_MUTE_LED_DIRECTION		1301
+
 #endif
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a4983f90ff5b..41551e8f6ac3 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -11,8 +11,37 @@
 /* Mixer Controls */
 
 #include <linux/pm_runtime.h>
+#include <linux/leds.h>
 #include "sof-priv.h"
 
+static void update_mute_led(struct snd_sof_control *scontrol,
+			    struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int temp = 0;
+	unsigned int mask;
+	int i;
+
+	mask = 1U << snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
+
+	for (i = 0; i < scontrol->num_channels; i++) {
+		if (ucontrol->value.integer.value[i]) {
+			temp |= mask;
+			break;
+		}
+	}
+
+	if (temp == scontrol->led_ctl.led_value)
+		return;
+
+	scontrol->led_ctl.led_value = temp;
+
+	if (!scontrol->led_ctl.direction)
+		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
+	else
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
+}
+
 static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
 {
 	if (value >= size)
@@ -112,6 +141,9 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 		cdata->chanv[i].channel = i;
 	}
 
+	if (scontrol->led_ctl.use_led)
+		update_mute_led(scontrol, kcontrol, ucontrol);
+
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(sdev->dev))
 		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 44f789bf7fb0..5a11a8517fa5 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -15,6 +15,7 @@
 
 #include <sound/hdaudio.h>
 #include <sound/soc.h>
+#include <sound/control.h>
 
 #include <sound/sof.h>
 #include <sound/sof/stream.h> /* needs to be included before control.h */
@@ -310,6 +311,12 @@ struct snd_sof_pcm {
 	bool prepared[2]; /* PCM_PARAMS set successfully */
 };
 
+struct snd_sof_led_control {
+	unsigned int use_led;
+	unsigned int direction;
+	unsigned int led_value;
+};
+
 /* ALSA SOF Kcontrol device */
 struct snd_sof_control {
 	struct snd_sof_dev *sdev;
@@ -324,6 +331,8 @@ struct snd_sof_control {
 	u32 *volume_table; /* volume table computed from tlv data*/
 
 	struct list_head list;	/* list in sdev control list */
+
+	struct snd_sof_led_control led_ctl;
 };
 
 /* ASoC SOF DAPM widget */
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 3918301c573b..2e5fab1cfbb4 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -682,6 +682,14 @@ static const struct sof_topology_token dmic_pdm_tokens[] = {
 static const struct sof_topology_token hda_tokens[] = {
 };
 
+/* Leds */
+static const struct sof_topology_token led_tokens[] = {
+	{SOF_TKN_MUTE_LED_USE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+	 offsetof(struct snd_sof_led_control, use_led), 0},
+	{SOF_TKN_MUTE_LED_DIRECTION, SND_SOC_TPLG_TUPLE_TYPE_WORD,
+	 get_token_u32, offsetof(struct snd_sof_led_control, direction), 0},
+};
+
 static void sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 				  void *object,
 				  const struct sof_topology_token *tokens,
@@ -944,6 +952,11 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	}
 
 out:
+	/* set up possible led control from mixer private data */
+	ret = sof_parse_tokens(scomp, &scontrol->led_ctl, led_tokens,
+			       ARRAY_SIZE(led_tokens), mc->priv.array,
+			       le32_to_cpu(mc->priv.size));
+
 	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
