Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC2B7B61
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 15:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC20E168A;
	Thu, 19 Sep 2019 15:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC20E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568901571;
	bh=37v8KWnk7IRAn+/PVJvDncD9aqKLCY4A3QH3FK5k9a8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXwAtPsSgdgb0/zO5TFCWPk5YMoIalYGFHYOnd/1e+6x6ZTvumhAZqt6bz7+IuY4O
	 SlPErB5NeiyA1VQYq7DM19i+Krm372SXSxPJb1439ovW7hq+F0abzrPs0nAg3jXXWX
	 qsLVs1iwCqzMEbutIGjEK5ylWjDxJ7aPlzZZ+PsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CB2F80637;
	Thu, 19 Sep 2019 15:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66922F80639; Thu, 19 Sep 2019 15:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4448F80637
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 15:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4448F80637
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VvascM4p"
Received: by mail-pf1-x444.google.com with SMTP id y72so2374916pfb.12
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvltAwcazfPUXLVaME+JgA9zHiL2aoA68dvUhBxJ+k0=;
 b=VvascM4pkKU4F95ti9Bl2ciow4VSlKqVRkoSZam4Zy8pNf/KevJdJe7PbSc5A8Vbei
 5rjN7aU8GqL4jAo2r4eOUtchAoARXaF/M/SDOimb4RwY4uw62x+wPKDT3kX7ps/g8kyT
 nKD1WRtYLJOSDO6M0MwbYowZ0jXZKtt1qrzFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvltAwcazfPUXLVaME+JgA9zHiL2aoA68dvUhBxJ+k0=;
 b=NN2+UGPVYIuitVAuy3ec5RDTs5stDQCtkwL4PLHbZS4eEBwoEvDc6cJXB/FFDDBpnR
 ROBA134H2nVBTlXrEZDWOniA0ZwEDPsUAkrgzOyosNcpZQUWFQ9y28wx/9V/F2184QNH
 O1yEqCyss5GJBXxkTxRJfNb/YQl3jsXgjNcmB89Bn8ywtO2UTXTBinXFVHo/5YT5AirU
 eJMwgD/H5Y8J1WRs8A4G6N6Ji49G5QN3MH35jz9hnjpugLLhQZu6OLaFobjfPQnLbnR5
 QuiGut5wJPVjtbFy2zMIMlm3wh7nAM265dOaclSwXd1M/8/tir1N4v/J1Jn1WTgD1KkC
 G/QQ==
X-Gm-Message-State: APjAAAW4zZHErtGNLOtli08zMD7mXOTCc5yszp7hTKQ9+GmoAgb+rXxE
 rHarAblzQTSxdEPbVvw1Wk+TCg==
X-Google-Smtp-Source: APXvYqxuqnv1/cDU4+3U+mf3SnkxxpRBvj/VkJDXLtzVeqncPGK5Xr2EZWZwOmm3tU9s2WzYUgipeQ==
X-Received: by 2002:a65:4189:: with SMTP id a9mr8987692pgq.399.1568901343986; 
 Thu, 19 Sep 2019 06:55:43 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id j16sm7633402pje.6.2019.09.19.06.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2019 06:55:43 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 19 Sep 2019 21:54:50 +0800
Message-Id: <20190919135450.62309-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190919135450.62309-1-cychiang@chromium.org>
References: <20190919135450.62309-1-cychiang@chromium.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Cheng-Yi Chiang <cychiang@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [alsa-devel] [PATCH v7 4/4] ASoC: rockchip_max98090: Add HDMI jack
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
 sound/soc/rockchip/rockchip_max98090.c | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

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
index 6c217492bb30..11cf252e8391 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -134,6 +134,25 @@ enum {
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
 /* max98090 and HDMI codec dai_link */
 static struct snd_soc_dai_link rk_dailinks[] = {
 	[DAILINK_MAX98090] = {
@@ -151,6 +170,7 @@ static struct snd_soc_dai_link rk_dailinks[] = {
 		.ops = &rk_aif1_ops,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
+		.init = rk_hdmi_init,
 		SND_SOC_DAILINK_REG(hdmi),
 	}
 };
-- 
2.23.0.237.gc6a4ce50a0-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
