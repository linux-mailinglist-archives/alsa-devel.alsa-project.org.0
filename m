Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775121AEB8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990F01654;
	Fri, 10 Jul 2020 07:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990F01654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594359001;
	bh=2CVI5YUDzKnJkPYnyAt/ktXPsZQAdZwbKSJZ01bEL74=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSL3PfDBuWcCBE2wVHB12N5zUMuldrm4yP36m+2MRMOrTzD4lVdHYcEuZvdx5fb4l
	 HRbTiEovCHujD+Bt29lIn9K/Hza5BPHmxq4fAmYkUgTqbCowrMg1UAUrUWBF9Fxflq
	 ilm0HoxPMIcTMWAGAS1YFcTCr37D9hQbs7TW/rR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ACDCF802E3;
	Fri, 10 Jul 2020 07:25:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5425DF802BC; Fri, 10 Jul 2020 07:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16A21F8015D
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A21F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ock+IgY9"
Received: by mail-yb1-xb4a.google.com with SMTP id s9so5748677ybj.18
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=rvt07E/G4Y3HgzjtCgi9q4wlTsU980JvgAHfFfxfTkk=;
 b=Ock+IgY9qdX4YDm3IA6N1vBTSz6q6HQ3LMZJu3aWh7PUhb/fSa7/e/vFX7G/ZnASle
 YhC3Y16TeMnAe8u4GcoRTXeyLI2uFB6O+aohMVj2BvyBrMg9Kgxz8U0P4aeoSJEZE+DU
 ykz7XAifBqYDXsh2WmTbwt2nYlW2YNDAqkDbkkPUJXEr+bQxh2ax34gFS60X5zP/C8sB
 0UewzbA0s3JcwlET+ATFS5hUUZmgiSMosrGudMnSP1PUHSKQZFdbnhGwOWLQ3AXKJmzj
 DV1FD135KWEosQLnY63INaDy4x9uVvJyFALB3S/Zdw1b5SKNuVAKVZygFOX/fYGPhmD7
 l63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=rvt07E/G4Y3HgzjtCgi9q4wlTsU980JvgAHfFfxfTkk=;
 b=CUMtg011X3xN1A1P/6cwq6w7vYBBPLV+sv5XvUZ+SsdFDr6yDT49gT6e92zxoTjDN7
 6DykFxd5ui7KGIq3HCs8NR0LzpzmEjdCSx1FXlqSP3QKzvggYnM2KRvzn96VFJfr/hSq
 jRmeIryhMoAlH88PrmWfr3GRShUM8WP4mub++ydAyAhae5z/IgAjEI+wWMZg+ZvP3Lts
 phFG5mEzWn6DDw3X+8r9vEAtX/fsy3j2QheYXA/zaG00rdLKZOkASSDu8PkmCdTmmutJ
 UOPEEk1RsZbD/MaQ4+Y4LXGmswtOrd/v+ZnZqOR7JfzcND+na1X6Q5VoILrGsCa909qH
 j+NQ==
X-Gm-Message-State: AOAM531FwaQvbbeQpoSbB8VeZg3Ixuy/ULuPKjUYJcbQNwyzlp5lt9o+
 iCzhAzCnqPFzDTwHZLrAARqpqLOoQAWr
X-Google-Smtp-Source: ABdhPJywn1lcKRT98+mACJg5K/qX5eN7ZPxXtFLfkUv1EO1uiB+3ueV8J3p6VYMYWvGCYE74XQheqyTaFl71
X-Received: by 2002:a25:be02:: with SMTP id h2mr110770934ybk.315.1594358736784; 
 Thu, 09 Jul 2020 22:25:36 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:25:05 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-7-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 6/6] ASoC: mediatek: mt8183-da7219: support HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Supports HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index ba120e9441d0..f7bc007bbdec 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -142,6 +142,7 @@ config SND_SOC_MT8183_DA7219_MAX98357A
 	select SND_SOC_RT1015
 	select SND_SOC_DA7219
 	select SND_SOC_BT_SCO
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
 	  with the DA7219 MAX98357A RT1015 audio codec.
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index cbef4a538224..edfbf34a2f45 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -26,7 +27,7 @@
 #define RT1015_DEV1_NAME "rt1015.6-0029"
 
 struct mt8183_da7219_max98357_priv {
-	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -357,6 +358,21 @@ SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8183_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
+					  &priv->hdmi_jack);
+}
+
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	/* FE */
 	{
@@ -511,6 +527,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
+		.init = mt8183_da7219_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
-- 
2.27.0.383.g050319c2ae-goog

