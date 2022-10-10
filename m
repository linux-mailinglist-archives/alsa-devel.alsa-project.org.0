Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337685FAC1E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C424A36B5;
	Tue, 11 Oct 2022 08:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C424A36B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468375;
	bh=Emg3BuV38LiQAQFzFNf88vHHf1Z8YGOQ2YMEASX1DCg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Or5g+dsb5ajfNt2uWupM1BT12YgqoeZP1NuI3Y2hmcmkGgqvSZTj6sisW9BdrlsJ7
	 ZPwIMp3vV/s9sVb5Zv4PaU87hQig1m5c5O8LdYf15q92hocek/pIl0Qc+p8isVrKk9
	 oQDumGjZRz6wNL/oh0pfjPZTRoiyB+FjZ8k+FEhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5731F8058C;
	Tue, 11 Oct 2022 08:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21ED2F8032B; Mon, 10 Oct 2022 20:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91F76F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 20:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F76F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="C7MpUAIQ"
Received: by mail-wm1-x32e.google.com with SMTP id
 l16-20020a05600c4f1000b003c6c0d2a445so870376wmq.4
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L39wW3Ty3Fj+0JLtrs7YSIDPOeSCl+TCC41j4zAWphE=;
 b=C7MpUAIQctHk+ifGp0VzsVKX9t/MFfnULTgkEAuStRRakWYK8Mw1BVeuL7cqSfmaB6
 QhyOsa3zziXnR6IClSM2oJkLcKpZxa9236I/u3+ZKUj1ydS8QmJEYFrfBsEClD7pazBq
 73JjufZlIqQ1gY17ITztN/8b23ZWoIzJ24qUyi0FHef7vb/1GPh2PFObQfDuu2XXu0UF
 bJSDs+YIbONzJ29E/mboAu2amkTRdH17o+6bcKyx47oNpKoZ0YfhHwG4HEr/VCz08EeZ
 TMLrrJzHhGb+XROQl1NLDHGNnlRKjcJ0UCNBTvKZhLzSYShpoZo2NLxZwVaLEBQxk9xG
 mmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L39wW3Ty3Fj+0JLtrs7YSIDPOeSCl+TCC41j4zAWphE=;
 b=hyLklj9AMRH2jOnfdHGuoF3YCn60Xkcotwfghj3U5OQKpLvtlsaEvoeiU1z3O6qfRC
 1vMpdVN0hUbHYjpDLmFlB8TvXEm4rIXHggzUlDTxeN8C5JxrV2Z6hI9aQML7XF1R4oYk
 nCMdtYJTBqb+k1/o23642A9Iy/T1FK6rRtiCh+WvCj6yz1e4I8aaLEbTbPYNl7PVrDnj
 gabXCecfa5fdExWGdZGmturS3isbtUMhHwJcBpXF6bMjh35IWdjvbV+1TaqzLMNmZGLz
 LmOGCfElFZ0Vb5pTOso8sULC7WKnrUJSMQdu9uEQfdXCX5e4bem2F6745pWMBw7q+aBL
 dVvA==
X-Gm-Message-State: ACrzQf1hDVXvLHwYOkAbZEKFqPuuntfuYLN7YHOpKPJW8tqM58B23y7Q
 gzBn4JiyEps1ylH0dbmOUrQ=
X-Google-Smtp-Source: AMsMyM5B6Kt13iU+echB0LPxg4MSMh3BueR2p/vnvZZ3+hx+pr/e4iXGHwklRKON1cMMW5NVrprGfg==
X-Received: by 2002:a05:600c:474c:b0:3bd:e9d7:f793 with SMTP id
 w12-20020a05600c474c00b003bde9d7f793mr13790967wmo.30.1665428094129; 
 Mon, 10 Oct 2022 11:54:54 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-126-34-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.34.126])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm2082272wrt.53.2022.10.10.11.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:54:53 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v2 3/6] ASoC: codecs: jz4725b: use right control for Capture
 Volume
Date: Mon, 10 Oct 2022 21:54:20 +0300
Message-Id: <20221010185423.3167208-4-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221010185423.3167208-1-lis8215@gmail.com>
References: <Y0P/u4pJT8rup8Za@sirena.org.uk>
 <20221010185423.3167208-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
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

