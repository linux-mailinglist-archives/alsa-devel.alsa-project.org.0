Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E8B28AA57
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:24:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3671F1663;
	Sun, 11 Oct 2020 22:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3671F1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602447890;
	bh=VZ0HtrDd0Nj+SWN/E0RIFOpZI6YIDwonjFIswMyRjMY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMFwHtusg//nj+mdj7dBjE6FGcKPaJ+14W6krR+TFJUz/FYYNPr5v8kZM4e6dQYgC
	 74qoehW51zFOjr8CV5Ct8KZ9MYQdtN7Z4nbeIh3nTjpjIXAcq1WZVW2s+V+OCGbBEB
	 5MG3HwximGPOSpSLQrUqOCxFHt3jB7yhe+Z5x9aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C03F80247;
	Sun, 11 Oct 2020 22:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47728F80247; Sun, 11 Oct 2020 22:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34D9DF80148
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D9DF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U4O5kX9f"
Received: by mail-qk1-x743.google.com with SMTP id 140so14323960qko.2
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PAK5kacH2+ECsZKBJRcAW2rWTDohVNDq66jg71dHghQ=;
 b=U4O5kX9f3gpRV0fc4KOkBhcF9I7pqXyR6K58/wgl8VCUs93mzrs9lgBy6Ibx160kbr
 ACqBpPToCs/k7E1Cue9fXd4uAZ7XB/dhhom8hKkoBoNhSxJTm12p0+V9519NEOpc3M3R
 6aV/prgYt1M4w7Xmxq0PPjyvbvhO0o1YbMkLqTL3co4z22piCyCUhwftUcK93+NWldGG
 UnJNQzC+IT9IdjJ9+xg/QUGwHH1pAx8ucxswGPCS7n8PnccOgqTIAP/eLWIVOJnJtjiA
 2HDQjDb9GkdnBQUJB8pISuZUFgJtbii1XyOwax9SSirfhC+le71D28ypynK6qwz7dBwx
 dtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PAK5kacH2+ECsZKBJRcAW2rWTDohVNDq66jg71dHghQ=;
 b=hTxB0aYACXabV+mbOAAKWKsSH9UTQFcse1z2jDP0HQ8Kw8vacvXepcdWv7bPJMXMED
 JFKH4XmqOVUn9gg0v31mazWX9vtc0OEhMhIieTpXdlkP/9hSy6ciASF/24SA6guToLiw
 3j7COrN8Huq2IFF+i4h2sAW/vJQVFfxRzTzNOZ2EXG1rDIjYW5/4MynG4qdBqwHjMy/L
 pn6g/m9vNEU19f6dspwLtC/+qDa4EwdeZcO1yP9pDlsbefuTOtAy0AMjXV2O17JRgrPB
 5Q8JGLYyk4jwgzjngVkFy/udM7K6zs+kq+1UuiHfj2AkylvKHTW7UlOa3huP46P9hS4T
 7MAw==
X-Gm-Message-State: AOAM530Lng+hBkUmhwKw7JAwSCfotd7gp6gdXNmZFRZSWgKDWFweA56n
 8z0DfbodLgVqfr3CW7dyxss=
X-Google-Smtp-Source: ABdhPJwt37SzU2kQdUwfsStrr9yOz3XAywRLMUklGfBEmjQOy0HBbeVdHGOyC5cLOn0Ngt5pXbe0WQ==
X-Received: by 2002:a37:5941:: with SMTP id n62mr6789479qkb.402.1602447755176; 
 Sun, 11 Oct 2020 13:22:35 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:22:34 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 01/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Date: Sun, 11 Oct 2020 22:22:11 +0200
Message-Id: <20201011202224.47544-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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

As slots and slot_width can be set manually using set_tdm().
These values are then kept in sun4i_i2s struct.
So we need to check if these values are set or not.

This is not done actually and will trigger a bug.
For example, if we set to the simple soundcard in the device-tree
dai-tdm-slot-width = <32> and then start a stream using S16_LE,
currently we would calculate BCLK for 32-bit slots, but program
lrck_period for 16-bit slots, making the sample rate double what we
expected.

To fix this, we need to check if these values are set or not but as
this logic is already done by the caller. Avoid duplicating this
logic and just pass the required values as params to set_chan_cfg().

Suggested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f23ff29e7c1d..bfbd4207d075 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -162,8 +162,9 @@ struct sun4i_i2s_quirks {
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
 
@@ -399,10 +400,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
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
@@ -419,15 +419,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
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
@@ -452,11 +448,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
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
@@ -492,7 +488,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->slot_width)
 		slot_width = i2s->slot_width;
 
-	ret = i2s->variant->set_chan_cfg(i2s, params);
+	ret = i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
 	if (ret < 0) {
 		dev_err(dai->dev, "Invalid channel configuration\n");
 		return ret;
-- 
2.25.1

