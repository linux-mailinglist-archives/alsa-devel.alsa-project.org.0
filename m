Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E749B22883E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 20:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550941615;
	Tue, 21 Jul 2020 20:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550941615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595356252;
	bh=yxZVPgpOalDfldR6zJyyKCsrUr6S4UO8iQgxlOjmbIQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UJFdMJpcKOj+QWvyw7K/vblmy4xtZ4xEt9Lv/6fV5YPdT4WubQ/+m7PXh1uWQIcPu
	 IvlcN2b+hQHhE5GygdZj7l4Uu+tdDKDSEO4GJWiRL3hQT0MXIvL5csI4iVR9LKaCLc
	 xpShVtluEiDnZUKkrhZ6st4pGsGmOrJPnUVONCLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 506ADF80268;
	Tue, 21 Jul 2020 20:29:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56443F8024A; Tue, 21 Jul 2020 20:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFA5F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 20:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFA5F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ph86JCwg"
Received: by mail-ej1-x643.google.com with SMTP id f12so22576306eja.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jBpCAfHmvrXMsleahVys7l2Kbtf/JTxu6AXTIkM0eQ=;
 b=ph86JCwgAqK1FafyGhguYtYD9m1MR+zqcBbTXsg8IP83H4jR+1Msy9ofw8JwBHPkBH
 ryf1PDwI/2ck3LAn4CYZ0jSaBhoePx1DxNUmO5leaJ6oichh5CjPdWJbFpZn8nSQ1mP6
 6FQ3HutBUXBCSfAseimn6jrVVkEt4TsA2fysQRViTliWKVuA0tVxqN6yxHra5zMM6Z/2
 u0DKVHBff+qBD72/RB5fnv06htnRbIlmW4Ebk5kQNqyZ+peu2f4/dUJrwDFX0OSPu02P
 EnhYv13WCFw4l82yHLWeV1x5LOWZII9u0MXBFgkyo1uIjj01lDL4T6fcx3O1kZwYXd3Q
 CHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4jBpCAfHmvrXMsleahVys7l2Kbtf/JTxu6AXTIkM0eQ=;
 b=S1gxgjWLdcBmo0xBuLNcApXU0Vhn0pwivZL1G32cjNFpgtQOBeIrOZt7iZP536gf8d
 rfi+ySaZ8jDnUVpZWPHBcD4zi34e8pW84Pwjm6qdFzlQoRprDWkyMmnYefyRxCNpJK54
 SrAu73g+UDFJmti7dopmHYCVE8YIDNmwFI7e155wtOc+YxV79k3pAD0p7K7BVODP2fbV
 Oz/N9+UPgiTbxwO9v/bAYCxVQj7Tna0XC908aUx2FVRKcRIXoY1SwI94WyPlr8dtTjm8
 vMzoe3hEbTOpTmb+uCawbf2eA9Hd7WvzIgtPVzzQBdK1Ezf3QqlQN0dysbXUwMYw55JG
 YAmQ==
X-Gm-Message-State: AOAM533fi9I9WEub6rnEiuqpLDBROXHp6O5J1C92jqSUkNlZRne0OOyC
 klTJwPse84Whc/RZiMO0LyQ=
X-Google-Smtp-Source: ABdhPJyEgjQbISmhm3byo3MXCSUHt+hp1xt7nWYRb4nRip5I+01vDGLbcwHA7g6DLRR1xMIebM/Eig==
X-Received: by 2002:a17:906:a84d:: with SMTP id
 dx13mr25279915ejb.246.1595356141506; 
 Tue, 21 Jul 2020 11:29:01 -0700 (PDT)
Received: from localhost.localdomain ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id q6sm16959454ejn.30.2020.07.21.11.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 11:29:00 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: rk3399_gru_sound: Add DAPM pins,
 kcontrols for jack detection
Date: Tue, 21 Jul 2020 21:27:10 +0300
Message-Id: <20200721182709.6895-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

PulseAudio (and perhaps other userspace utilities) can not detect any
jack for rk3399_gru_sound as the driver doesn't expose related Jack
kcontrols.

This patch adds two DAPM pins to the headset jack, where the
snd_soc_card_jack_new() call automatically creates "Headphones Jack" and
"Headset Mic Jack" kcontrols from them.

With an appropriate ALSA UCM config specifying JackControl fields for
the "Headphones" and "Headset" (mic) devices, PulseAudio can detect
plug/unplug events for both of them after this patch.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 sound/soc/rockchip/rk3399_gru_sound.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index f45e5aaa4b30..c17d146717a8 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -32,6 +32,19 @@ static unsigned int dmic_wakeup_delay;
 
 static struct snd_soc_jack rockchip_sound_jack;
 
+/* Headset jack detection DAPM pins */
+static struct snd_soc_jack_pin rockchip_sound_jack_pins[] = {
+	{
+		.pin = "Headphones",
+		.mask = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin = "Headset Mic",
+		.mask = SND_JACK_MICROPHONE,
+	},
+
+};
+
 static const struct snd_soc_dapm_widget rockchip_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
@@ -176,7 +189,9 @@ static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &rockchip_sound_jack, NULL, 0);
+				    &rockchip_sound_jack,
+				    rockchip_sound_jack_pins,
+				    ARRAY_SIZE(rockchip_sound_jack_pins));
 
 	if (ret) {
 		dev_err(rtd->card->dev, "New Headset Jack failed! (%d)\n", ret);
-- 
2.28.0.rc1

