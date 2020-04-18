Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324B1AF59F
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 00:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D91F2166F;
	Sun, 19 Apr 2020 00:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D91F2166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587250052;
	bh=IUgancft0SADpgZSaUIF5wfQaDfThpDAV5DRYanoE2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HNVA1TVJ4CJe3M7jsNUbJL9LR3wF3E05ipn7HEEMkFe0WITq79MfvjEU99FkK5kqv
	 Vk9DLm9yXXIBS6cjZmzF2I9heHep2GO3Qk23HQb4Yh9k7b6REfT19qO51i4pbS01De
	 LfhpQ+QzrTlRSEpWfDeL/9OaRIQ0QEMC7vVFEK70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E877AF8029A;
	Sun, 19 Apr 2020 00:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11A08F8028F; Sun, 19 Apr 2020 00:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94A34F80240
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A34F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mBpMCKqH"
Received: by mail-wr1-x442.google.com with SMTP id k1so7427940wrx.4
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxlFylBEMHP1jAoGZfSxBsIHY2H4BZ1sTMv7tdFsx0k=;
 b=mBpMCKqHG2SfOXcnCap8iR0f/B7HGFhKZdMy5ig7HK/OlFABYDm0hIll3vV+Fs3/E2
 MemLzcDWcEG1eZMGEt11QJROvMFeBiyeNFxbsdzZFsz30iRkOKq0KNsC499z52Y3PnIb
 rgUcOHM5l+Klk14ppPMaXuELw7kaIsqP5bFwyhXI8JiWWSzYx7mBW7XeuKjtZv3mcw8+
 BMy3XFU/sneRsFANUoXTvZdJ3YS99DW3zLWFR4nLpdboc51AHWkDqIchI+7NfrUzPUvQ
 GQZIK46c81MLKZ1cEHupP2QrODrt6n98Ko2z2YpzgmRUaiTYbsPSD79+KEkgy7cxRn44
 mOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxlFylBEMHP1jAoGZfSxBsIHY2H4BZ1sTMv7tdFsx0k=;
 b=ZBB7mMe8j70Gi+YiCyoADnUAjmClGIUqkMQoZqmC/5eJyalUkqjB12S2Da2JT7Kr7T
 6xbU5lfObOR3N8+173MrOJ/xV5ydJso3HCXIL2ixWB1d9EK3zx3ZX11nBHJDuDWZO4jf
 TJ+YL0KwO+308mnmDKBvnYXjbNY2MV7m7/c27XP2nFbdpnz/BpwMk4Q8ZswEJ9+L5uWG
 kyK/MVhKTluAVXb9EVoO3ewspdIvRGsxcDe2M/JZmZvVwoBycQw1ca2aKitXRbV/eGfw
 t/NVkq4I57au0qTy4b6JA47NkoAutzQUbxEThI529cXYOOUR7iIyqnVAHkwXaRTdUODr
 YifQ==
X-Gm-Message-State: AGi0PuYcDG6937aMaX3dIzhPsIcFgIy85E0PboDGZiqYYgbSZ0CxBttH
 AVyQ+bcXC6uy7VQJRbye9wY=
X-Google-Smtp-Source: APiQypKTnGAMc2x527csx6OG/t51sbyg6UU1kp5+g0xKPogZNyMX2T0dDmdRAiavu+QJY/l+rzDfcQ==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr10700285wrp.130.1587249885925; 
 Sat, 18 Apr 2020 15:44:45 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id t16sm13371559wmi.27.2020.04.18.15.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 15:44:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 5/7] ASoc: sun4i-i2s: Add 20 and 24 bit support
Date: Sun, 19 Apr 2020 00:44:33 +0200
Message-Id: <20200418224435.23672-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418224435.23672-1-peron.clem@gmail.com>
References: <20200418224435.23672-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
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

From: Marcus Cooper <codekipper@gmail.com>

Extend the functionality of the driver to include support of 20 and
24 bits per sample.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 618bbc5156f1..9778af37fbca 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -577,6 +577,9 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
+	case 32:
+		width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
 	default:
 		dev_err(dai->dev, "Unsupported physical sample width: %d\n",
 			params_physical_width(params));
@@ -1063,6 +1066,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
+
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
 	.probe = sun4i_i2s_dai_probe,
 	.capture = {
@@ -1070,14 +1077,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai = {
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 8,
 		.rates = SNDRV_PCM_RATE_8000_192000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.formats = SUN4I_FORMATS,
 	},
 	.ops = &sun4i_i2s_dai_ops,
 	.symmetric_rates = 1,
-- 
2.20.1

