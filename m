Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AAD2720EF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E81C16E4;
	Mon, 21 Sep 2020 12:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E81C16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684155;
	bh=VemwqnFTh/c3rN/LsDGxRkpL06jv2milXSnuuOvPrw8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dqN66U5ei9EtgGpfR09MyNneGxabOBnEvr1oen6FDjiCwZrUTsxBWJoZNiTqTseow
	 xQkXz1qw13/v8PvefbGIZvXCOiyaADjMVUipHq+naIjpI1/S6uzqQ4sAnFCtvW4enS
	 SaczYtKE5oG1Jipfshsf8IyxRZW8R2UlqQ2r2PbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF0A0F802DC;
	Mon, 21 Sep 2020 12:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA97CF802C3; Mon, 21 Sep 2020 12:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C14D8F80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C14D8F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fmW/8c7E"
Received: by mail-wm1-x341.google.com with SMTP id l9so12046780wme.3
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9ky65YbsZC3CedpwwIal2HmJikYG0o0zSGAmShyp9M=;
 b=fmW/8c7EA0BKO4rC8y+/NIKl9FUO4rC+CEaKG+BWT+d5ZAFB6OKb7htadnZXJd33aY
 uZer4yI/mkG+9whINtJqlZxB5HPzGC6+a4jZdvs7aBMHbpl0aLtDvwaeS0voreBbd3Rv
 UixGYTnvEEiWKfMsnDmekB15LLLiErK82ZK6T+5D55KekZq5XK+VlDDhAQU/CxauNtXL
 27Iof80Bl/lT77qT2SZh+Un3TeTs8ekHSSPrkcsAf83frtDuBPvsJVE7rsjBxIZ0i1Jn
 NOvl9o8DHIgQ43gFhJ+RgcF1srDM3uT2aLoy+XoFRVmVL1LpB3fS5j98JzYl9xkZU+HZ
 r+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9ky65YbsZC3CedpwwIal2HmJikYG0o0zSGAmShyp9M=;
 b=TQFc6e0e4+GA23SJkXgo8+WIrUwEW8D/laFsv2BrePPzZ6MYfExLmZ/k+YyjfhQJQ0
 rX7Wmut9xhrMS8DwxDBaIM1RvYPQ8PmEOn8a607Q8QOzvIj8HTaNvTjGHp4TwZWuDjit
 3GM03HflLcvo9lmk5VXPmmwk8/Kh7oGbKbkmgYAPwdpBwW+mJk92O44vqEzU4zlfsswE
 UB2QkWH7r/0FUQVv1BIqYfsykxOnZvelRJJ7SOC/gzhCw1p33UaNp5Lka5HJKT/isD3G
 k96z5m7h/LEmGiqWMIvcB5GyT2M6YtS7uxyKuymx/qsgHUxXqvELira+j5EfWUt0z27r
 //ag==
X-Gm-Message-State: AOAM532iavEY9229+qTgjKePeC1NjwTDB92bvJWbb6rvBNo3yD85aa46
 ZdFqymlP+N76nQiD8M8wSoM=
X-Google-Smtp-Source: ABdhPJyJpWX3SvhO3jjQajHcXmcM5E9OneBjww4Kfs0EdzYd+ep7YsGgtqawhr7hDP/UO0Hzypf2CA==
X-Received: by 2002:a1c:e484:: with SMTP id b126mr28632272wmh.44.1600684057701; 
 Mon, 21 Sep 2020 03:27:37 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 02/22] ASoC: sun4i-i2s: Change set_chan_cfg() params
Date: Mon, 21 Sep 2020 12:27:11 +0200
Message-Id: <20200921102731.747736-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

As slots and slot_width can be overwritter in case set_tdm() is
called. Avoid to have this logic in set_chan_cfg().

Instead pass the required values as params to set_chan_cfg().

This also fix a bug when i2s->slot_width is set for TDM but not
properly used in set_chan_cfg().

Suggested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 2baf6c276280..0633b9fba3d7 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
 	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
 	s8	(*get_sr)(const struct sun4i_i2s *, int);
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
-	int	(*set_chan_cfg)(const struct sun4i_i2s *,
-				const struct snd_pcm_hw_params *);
+	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
+				unsigned int channels,	unsigned int slots,
+				unsigned int slot_width);
 	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
 };
 
@@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
 }
 
 static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
-				  const struct snd_pcm_hw_params *params)
+				  unsigned int channels, unsigned int slots,
+				  unsigned int slot_width)
 {
-	unsigned int channels = params_channels(params);
-
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
 	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
@@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 }
 
 static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
-				  const struct snd_pcm_hw_params *params)
+				  unsigned int channels, unsigned int slots,
+				  unsigned int slot_width)
 {
-	unsigned int channels = params_channels(params);
-	unsigned int slots = channels;
 	unsigned int lrck_period;
 
-	if (i2s->slots)
-		slots = i2s->slots;
-
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
 	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
@@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
-		lrck_period = params_physical_width(params) * slots;
+		lrck_period = slot_width * slots;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
-		lrck_period = params_physical_width(params);
+		lrck_period = slot_width;
 		break;
 
 	default:
@@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 }
 
 static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
-				      const struct snd_pcm_hw_params *params)
+				      unsigned int channels, unsigned int slots,
+				      unsigned int slot_width)
 {
-	unsigned int channels = params_channels(params);
-	unsigned int slots = channels;
 	unsigned int lrck_period;
 
-	if (i2s->slots)
-		slots = i2s->slots;
-
 	/* Map the channels for playback and capture */
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210);
 	regmap_write(i2s->regmap, SUN50I_H6_I2S_RX_CHAN_MAP1_REG, 0x76543210);
@@ -523,11 +515,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
-		lrck_period = params_physical_width(params) * slots;
+		lrck_period = slot_width * slots;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
-		lrck_period = params_physical_width(params);
+		lrck_period = slot_width;
 		break;
 
 	default:
@@ -563,7 +555,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->slot_width)
 		slot_width = i2s->slot_width;
 
-	ret = i2s->variant->set_chan_cfg(i2s, params);
+	ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
 	if (ret < 0) {
 		dev_err(dai->dev, "Invalid channel configuration\n");
 		return ret;
-- 
2.25.1

