Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E189EE6D2F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8197C1AE9;
	Mon, 28 Oct 2019 08:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8197C1AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572247446;
	bh=x63o6KSTLwBEwpxrSo5/kMTitMMNrBtfwbynfY0Wf/M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I2EB1EiG3NtrHPJNN456hJamR7xUOZE3SjxEcIuy6qgQr0Fpqo6ravyY0IFModqHk
	 ciTz8id2uKGI/apUB7tiHR4OuTa6aTw3xsC42lOk/3enlWhtMRCCZZt01rPS/WAn9h
	 0l/zA2sUxkuYbCDzM5PwvMHZ9XERn61lhMSJ8ahY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14275F8063B;
	Mon, 28 Oct 2019 08:21:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57384F80639; Mon, 28 Oct 2019 08:21:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9527AF80637
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 08:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9527AF80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Yo43dKTs"
Received: by mail-pg1-x541.google.com with SMTP id l24so6278802pgh.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZUhk5jTAsWRL5Pgp1XZmlvQGKoI7BAgOCvrW+D56pp8=;
 b=Yo43dKTsLFI2tpCk/GgsHgDLpV+n2oMVkqjTgO+WYW98xLPnu23m035x0k0FFAwWD/
 gczA73kwm3uhx7jLU5FLzQZw/Ubg0uP8yeTUVnnyhEvFgMAEQNKsSnuElq/670f6y+Ku
 z3qyMCqSVAu4461D9BPtH/1Axex3l9sm48Zgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZUhk5jTAsWRL5Pgp1XZmlvQGKoI7BAgOCvrW+D56pp8=;
 b=G2q0cqWeWkEaS9d/N+7VcNGrAUaLOiWTayskFmwcjlgu8OE/uij5fAmjoPbvaXfY5U
 G6z3FizR8Z3oqARr9QarrwUPEdV3AD3c+YAaz7JVpMkC4hYZDcoW+attjXCQazLFwI+e
 UbrEJEicCi8uXjd74uoE440r3BSufMQxOOv1Xpw3wFDsWR35i0fES+hTEgu6Cg+TmwW9
 XehOSMvZPXAepZ1FG4/318FWzkzejIupDDhit9UHEwD8W2RH0Icl98an/mZlHPLvPZCG
 7V0oebu2IacekswCRZo3ZcjKJOm3T1MlcoxF4g+hUm0teTkzGP0m4uR2NOtdgaI/fA+X
 aiJA==
X-Gm-Message-State: APjAAAX0SKvvAQ4vCphW0KhOKxfKlTEmUu2EF7RyMAPRdYOHqg6lENar
 UpFhsl7DxmMV26yKts0pzi6aiQ==
X-Google-Smtp-Source: APXvYqy6ZYQwqRKjHWv8HOFkIQORoUhla1Awdt24VrWxKo9d5Y3WupcjPEJUg0uuNFjLJP2Twq29Cw==
X-Received: by 2002:a63:734e:: with SMTP id d14mr12627496pgn.357.1572247275466; 
 Mon, 28 Oct 2019 00:21:15 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id r28sm9256164pfl.37.2019.10.28.00.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2019 00:21:14 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2019 15:19:28 +0800
Message-Id: <20191028071930.145899-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 dianders@chromium.org, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH v9 4/6] ASoC: rockchip_max98090: Add HDMI jack
	support
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

In machine driver, create a jack and let hdmi-codec report jack status.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 sound/soc/rockchip/Kconfig             |  3 ++-
 sound/soc/rockchip/rockchip_max98090.c | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index b43657e6e655..d610b553ea3b 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -40,9 +40,10 @@ config SND_SOC_ROCKCHIP_MAX98090
 	select SND_SOC_ROCKCHIP_I2S
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
+	select SND_SOC_HDMI_CODEC
 	help
 	  Say Y or M here if you want to add support for SoC audio on Rockchip
-	  boards using the MAX98090 codec, such as Veyron.
+	  boards using the MAX98090 codec and HDMI codec, such as Veyron.
 
 config SND_SOC_ROCKCHIP_RT5645
 	tristate "ASoC support for Rockchip boards using a RT5645/RT5650 codec"
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 50ef9b8e7ce4..5c2504a465f4 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -12,6 +12,7 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 #include <sound/core.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -218,6 +219,25 @@ enum {
 	DAILINK_HDMI,
 };
 
+static struct snd_soc_jack rk_hdmi_jack;
+
+static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
+{
+	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_component *component = runtime->codec_dai->component;
+	int ret;
+
+	/* enable jack detection */
+	ret = snd_soc_card_jack_new(card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &rk_hdmi_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "Can't new HDMI Jack %d\n", ret);
+		return ret;
+	}
+
+	return hdmi_codec_set_jack_detect(component, &rk_hdmi_jack);
+}
+
 /* max98090 dai_link */
 static struct snd_soc_dai_link rk_max98090_dailinks[] = {
 	{
@@ -237,6 +257,7 @@ static struct snd_soc_dai_link rk_hdmi_dailinks[] = {
 	{
 		.name = "HDMI",
 		.stream_name = "HDMI",
+		.init = rk_hdmi_init,
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
@@ -259,6 +280,7 @@ static struct snd_soc_dai_link rk_max98090_hdmi_dailinks[] = {
 	[DAILINK_HDMI] = {
 		.name = "HDMI",
 		.stream_name = "HDMI",
+		.init = rk_hdmi_init,
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-- 
2.24.0.rc0.303.g954a862665-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
