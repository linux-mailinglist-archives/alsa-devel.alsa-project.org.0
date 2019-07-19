Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922826EA4C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 19:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282FB16C8;
	Fri, 19 Jul 2019 19:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282FB16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563558088;
	bh=hh5GoNtqr5tDd3EXmHKEtidurpsqF3GPdfSyDRhpO1U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ky6isouAuDOPzXO9+eV6VqWpfHrx5vDk7hxLEcDwGb4F3ldgxfQZqJrSbVTYoKJCe
	 YoLlBuBshEuu9BR6hltMuAgTdd5DGE2/vMZIRYRs7EH1Zf/hKY9rN/grTSmJDDc2oi
	 HHxdeEu+lYMrWxzCg3Ojj6isFZ4eJ2D+iv6lvUjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A671F800C4;
	Fri, 19 Jul 2019 19:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A0E0F80228; Fri, 19 Jul 2019 19:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59C46F800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 19:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59C46F800B2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 73B8E28C74F
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jul 2019 19:39:29 +0200
Message-Id: <20190719173929.24065-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 dianders@chromium.org, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH] SoC: rockchip: rockchip_max98090: Enable
	MICBIAS for headset keypress detection
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

The TS3A227E says that the headset keypress detection needs the MICBIAS
power in order to report the key events to ensure proper operation
The headset keypress detection needs the MICBIAS power in order to report
the key events all the time as long as MIC is present. So MICBIAS pin
is forced on when a MICROPHONE is detected.

On Veyron Minnie I observed that if the MICBIAS power is not present and
the key press detection is activated (just because it is enabled when you
insert a headset), it randomly reports a keypress on insert.
E.g. (KEY_PLAYPAUSE)

 Event: (SW_HEADPHONE_INSERT), value 1
 Event: (SW_MICROPHONE_INSERT), value 1
 Event: -------------- SYN_REPORT ------------
 Event: (KEY_PLAYPAUSE), value 1

Userspace thinks that KEY_PLAYPAUSE is pressed and produces the annoying
effect that the media player starts a play/pause loop.

Note that, although most of the time the key reported is the one
associated with BTN_0, not always this is true. On my tests I also saw
different keys reported

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Some notes about the patch

Steps to test (userspace GNOME3):
1. Play audio using a media player
2. Make sure the Internal MIC is selected as audio input device and
doesn't switches when you insert the headset.
3. Insert a headset (with buttons)

Audio switches to headphones and you can hear that enters on a loop
play/pause if the KEY_PLAYPAUSE was reported. Also you can check that
press to any headset button doesn't work.

The part where the datasheet says that power must be supplied in order
to have keypress detection work is in page 44 of [1]

"
The TS3A227E can monitor the microphone line of a 4-pole headset to
detect up to 4 key presses/releases and report the key press events
back to the host. The key press detection must be activated manually
by setting the KP Enable bit of the Device Settings 2 register. To
ensure proper operation the MICBIAS voltage must be applied to MICP
before enabling key press detection.
"

[1]  http://www.ti.com/lit/ds/symlink/ts3a227e.pdf

 sound/soc/rockchip/rockchip_max98090.c | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index c5fc24675a33..782e534d4c0d 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -61,6 +61,37 @@ static const struct snd_kcontrol_new rk_mc_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
+static int rk_jack_event(struct notifier_block *nb, unsigned long event,
+			 void *data)
+{
+	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
+	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+
+	if (event & SND_JACK_MICROPHONE)
+		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS");
+	else
+		snd_soc_dapm_disable_pin(dapm, "MICBIAS");
+
+	snd_soc_dapm_sync(dapm);
+
+	return 0;
+}
+
+static struct notifier_block rk_jack_nb = {
+	.notifier_call = rk_jack_event,
+};
+
+static int rk_init(struct snd_soc_pcm_runtime *runtime)
+{
+	/*
+	 * The jack has already been created in the rk_98090_headset_init()
+	 * function.
+	 */
+	snd_soc_jack_notifier_register(&headset_jack, &rk_jack_nb);
+
+	return 0;
+}
+
 static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -119,6 +150,7 @@ SND_SOC_DAILINK_DEFS(hifi,
 static struct snd_soc_dai_link rk_dailink = {
 	.name = "max98090",
 	.stream_name = "Audio",
+	.init = rk_init,
 	.ops = &rk_aif1_ops,
 	/* set max98090 as slave */
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
