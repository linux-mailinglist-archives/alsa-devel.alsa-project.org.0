Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B775FFFA5
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 15:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69E1B61DA;
	Sun, 16 Oct 2022 15:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69E1B61DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665926976;
	bh=Emg3BuV38LiQAQFzFNf88vHHf1Z8YGOQ2YMEASX1DCg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=prWRNOnt8+Gd7pQKkFJ1osYSk8V1yklBpW1eE3DhkzeMXKpZ3InpS++KtJgnF6epj
	 +5zoWGNrPjN76nFtmHTfTmcYnQw6OLrJdJu6AXkX6owgs2WzQNh3ImihWd9R6dOjav
	 VQlCr3gwJrwfwgxHsc1KV5hiseNzvsiKPjf6Fo30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CA8F80548;
	Sun, 16 Oct 2022 15:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA44F8053D; Sun, 16 Oct 2022 15:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13C0FF8016A
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13C0FF8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UbYHy/nX"
Received: by mail-ej1-x630.google.com with SMTP id k2so19618166ejr.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L39wW3Ty3Fj+0JLtrs7YSIDPOeSCl+TCC41j4zAWphE=;
 b=UbYHy/nX1Hbr3bCvUqAAtrbIHZ3vBejD2D7anTDSYRhHg8ljKzyf5t1oyeRScnEwYx
 5U/lzKQ7sZdR4ZF1fWMWL1iraSVU5nUKfyEiGYP7dCXc6ywqFWFzhJxwjuzSvqVLY4Kn
 3choB2XDXwSuWZthpBlk6N8xkz+iRqkS1PkKyNT6niCYPUF7kCuGKX9QFMfKCymlwm6f
 vM8e6NowPsXsujD1xhH3avFQQwzIQftlgKkYQg3MTz1uw80N7Ux0WDgm89aKuY0mJcpD
 PgkbAvm1ClCUUxX9NZrrkX5cZiPmNOQJkkzTdA9bRIl1xDw8wBkzZgAHiSx6A/qkxUmS
 WdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L39wW3Ty3Fj+0JLtrs7YSIDPOeSCl+TCC41j4zAWphE=;
 b=yWVRWS2YjKWNIQ6f72+qdGI/dwKJ6KC107a1R5Hbawrg6WmhlKk+FYXiyV+m5fwR/4
 bbFZx+tnzadZdJpXYJXkO1AuIhs4yhOr1xdQSeN9AC/+wIVfqUnlKdy/HhIphbzWrZTi
 HfWFWa0OrQNphBLeO6jL795AX5R3O9PTjXuCZaOsRanVrZwnkruHsoybD/6W6soq623t
 2NNs2OI075PeqMwS4+zu5P7gz62t0MryPogIr74NVSP3UolShbs+/TPohT0xN4y1eU8s
 PjJbd0alDynHU9Md9Frv+AUOQ7acjJzwAy+IMp68uaIpBSeTxjqCuMOnsy4BtbBXNtw5
 +WXA==
X-Gm-Message-State: ACrzQf3cnKUOt9rYIpDpOgIZhryFQySqQY8Jjpw6c7M4r1uXv5+fSEVY
 +d9YpiwdthpHfyd2fY2gtGA=
X-Google-Smtp-Source: AMsMyM55uI+TT2fahU0qyT+j83wICSjPO032S1YhR3CTKQ8pF0af2fSqEafbJgV6z99v5Q//2kDhbQ==
X-Received: by 2002:a17:907:845:b0:731:2f6c:6dbd with SMTP id
 ww5-20020a170907084500b007312f6c6dbdmr5069253ejb.551.1665926868234; 
 Sun, 16 Oct 2022 06:27:48 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-39-7-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.7.39])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa7ce85000000b0045c72bba0bfsm5572057edv.4.2022.10.16.06.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 06:27:47 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v3 3/7] ASoC: codecs: jz4725b: use right control for Capture
 Volume
Date: Sun, 16 Oct 2022 16:26:44 +0300
Message-Id: <20221016132648.3011729-4-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221016132648.3011729-1-lis8215@gmail.com>
References: <20221016132648.3011729-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

Line In Bypass control is used as Master Capture at the moment
this is completely incorrect.

Current control routed to Mixer instead of ADC, thus can't affect
Capture path. ADC control shall be used instead.

ADC volume control parameters are different, so the patch fixes that
as well. Manual says (16.6.3.2 Programmable input attenuation amplifier:
PGATM) that gain varies in range 0dB..22.5dB with 1.5dB step.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 72549ee2e..4363d898a 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -136,13 +136,16 @@ enum {
 #define REG_CGR3_GO1L_OFFSET		0
 #define REG_CGR3_GO1L_MASK		(0x1f << REG_CGR3_GO1L_OFFSET)
 
+#define REG_CGR10_GIL_OFFSET		0
+#define REG_CGR10_GIR_OFFSET		4
+
 struct jz_icdc {
 	struct regmap *regmap;
 	void __iomem *base;
 	struct clk *clk;
 };
 
-static const SNDRV_CTL_TLVD_DECLARE_DB_LINEAR(jz4725b_line_tlv, -1500, 600);
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
@@ -151,11 +154,11 @@ static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 		       REG_CGR1_GODL_OFFSET,
 		       REG_CGR1_GODR_OFFSET,
 		       0xf, 1, jz4725b_dac_tlv),
-	SOC_DOUBLE_R_TLV("Master Capture Volume",
-			 JZ4725B_CODEC_REG_CGR3,
-			 JZ4725B_CODEC_REG_CGR2,
-			 REG_CGR2_GO1R_OFFSET,
-			 0x1f, 1, jz4725b_line_tlv),
+	SOC_DOUBLE_TLV("Master Capture Volume",
+		       JZ4725B_CODEC_REG_CGR10,
+		       REG_CGR10_GIL_OFFSET,
+		       REG_CGR10_GIR_OFFSET,
+		       0xf, 0, jz4725b_adc_tlv),
 
 	SOC_SINGLE("Master Playback Switch", JZ4725B_CODEC_REG_CR1,
 		   REG_CR1_DAC_MUTE_OFFSET, 1, 1),
-- 
2.36.1

