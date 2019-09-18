Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E503B5F38
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 10:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD6C11685;
	Wed, 18 Sep 2019 10:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD6C11685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568795383;
	bh=sX3mIf+O2oM7wEHaO6jl2pNvvaLo4LFdEol9nEtsbHs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHuhfEjIIVCPMGBZxV9AQ8cKHaGUVMpR0Ic7aiMlDWBLxvbyk7f3J1xu/flbrRtyF
	 IM1cTXEX6ajtt+Y8I6LHVTQSifjODSGRjRFYL++kGqv1uhsuYKW4nnW8/cxfo9CEUh
	 EyzozWHrvUdU7HInB129eGOwnTrJNxpYH2y0eP/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD363F80638;
	Wed, 18 Sep 2019 10:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D580F80639; Wed, 18 Sep 2019 10:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4044F80635
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4044F80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QTaH6GH5"
Received: by mail-pg1-x543.google.com with SMTP id z12so3571327pgp.9
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 01:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58QuMxmjHlqsWVtyFBQnvBpwo6+B1q1GdfYt1s4m2qE=;
 b=QTaH6GH5UguvXVEDbNSlyuomPAH87bYVOWqCH6McKhsGTYK/xYVHQgKnh5a5Tw0WNQ
 e1ZPFnuD/Y0yn4S2mKnoxDRgTiB9Z50mHQ31aQMtM2MYHFdO9az/vg2dsYmvd6pDZ634
 kY66oETu+TYVAH5TtMe6QmFRkiCAUAqTvr8BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58QuMxmjHlqsWVtyFBQnvBpwo6+B1q1GdfYt1s4m2qE=;
 b=LXTni/a430zFnuxeh0po++LzJ9ssDv5e/asb69Z4R82590LikPwPaU+EnxcpxcHjJr
 4MYtmV6H0A3T2oLRtofaWkzTGxJKDYwDR6SyFWyEgFAsYxU6ZGfpcPfu7qmMuawy80th
 vJGjFGqCv8/k9Gj/U+Wtd4KhiD4+tCUQQJIHaTNCj4g6ZaTY7WoQ0F6Pa+22+XOqQDYE
 YxglaWHU+jZOGiqgP02vJf56uuOW1hdL4cl+/5sXh+Qz18Edp7sl9FtxHX73bdr+FYgQ
 TA9UupUup17Bv8j0iSlA3kpJ/J8u9tEUz+Quk751lLBq/nKFpNSV2Jy0hsbvABJ1G/YF
 INHA==
X-Gm-Message-State: APjAAAXmWwp/3yddyktSr+DwVMBXJYrzUpMdWdZPE12tCZ3s3kde9l3t
 UQEKTqxGWfq816J4qZQTdIXmaQ==
X-Google-Smtp-Source: APXvYqxHmdR5xUtBiMVc0Mnxrw8HNJTIpU4I57BZIUZlNw5Ee/93dqanNwaTMuLFn6EQAArQLOrQxQ==
X-Received: by 2002:a63:1a5a:: with SMTP id a26mr2870744pgm.178.1568795151570; 
 Wed, 18 Sep 2019 01:25:51 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
 by smtp.gmail.com with ESMTPSA id v44sm13357519pgn.17.2019.09.18.01.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Sep 2019 01:25:50 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 18 Sep 2019 16:25:00 +0800
Message-Id: <20190918082500.209281-5-cychiang@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190918082500.209281-1-cychiang@chromium.org>
References: <20190918082500.209281-1-cychiang@chromium.org>
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
Subject: [alsa-devel] [PATCH v6 4/4] ASoC: rockchip_max98090: Add HDMI jack
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
index c82948e383da..c81c4acda917 100644
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
