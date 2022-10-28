Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251E6130AE
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:48:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035A91661;
	Mon, 31 Oct 2022 07:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035A91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198915;
	bh=z/VdrABl0kCxE7w0XsOVtXZCCrsTiTTn598YS2Fh7eA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KEOE7kVHjco0i2rM9OvsV3FoJknz8eaAiFMMLyJhZlwiTumbNvFZbORQz2TxrsSJY
	 PdOK7ScyQJ6F6bBYkoTvR2v7ur4CWBX6b4YmO7odKNMTZsQh9aTkDfJHENe6/Aorfv
	 VlM1Cbbn3SSKpSHZzlHZabB4kDfZMrMUVv6V4ZTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2759F8057C;
	Mon, 31 Oct 2022 07:45:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F99DF80095; Fri, 28 Oct 2022 17:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E02CF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E02CF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="EuqLHIac"
Received: by mail-ej1-x633.google.com with SMTP id t25so13733485ejb.8
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 08:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLsw+iN8jpJl9FHuzYsNNqJNfmeMGSrcPtNG/wbe8TE=;
 b=EuqLHIacnhZIvU2B46I6TgVFg7XuOAx4Nvgd4xed1aECAOsYi8YmKNhhzxZzDwE0zP
 zHcoIa7ttY6R0Hae+7JQ59m21JEFYFNadu7wUJSW2S6qAbe8qFlHan6TYxl+KiHTeC7l
 z/yIQjFKeSn38ut/Kvd1aM8redbgqqGnYscyt8fDc8XvQUZ2fRNO30AjWAH78blaeiuL
 ck3u9aDzCZd9jBoct8NexLa0AbYyXX+oHjMNtx70tQD+70XE/VagDl92yY2DFXTgW+O1
 pkq2CviPYMfm9yf2Rp65/uVHMI6BGKYtMCQDAQ17bAk5LngNeQeVP8ZJ5gvD70qBrEVB
 an2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLsw+iN8jpJl9FHuzYsNNqJNfmeMGSrcPtNG/wbe8TE=;
 b=aIy1GWcSLrhXWS41FxRXfDQCf3hH2rcJBRdYnfLrv45CbHJFRlJhYlSAcSSfWt+Oop
 6Qo1B4K1w+VbUAVbhoDLeggXbALuR/pt2k0oypX8l/Wbes9OigYT2zagKF+Q+j4ACTSv
 flQWKBZC55paXnT7LG0wc+ElrsZ+ZXT/Fa9GWxoXC6nGdIgPxa5U+vi+zSXVUeFpf8NZ
 BJ0DBPHh7ZvOz5z0PZUKQ5yGRE6IUxF+gYtPrOWWRa7BiCuFuyGWcjKccLr5qSO46P8X
 ZMxdy0E8HkCCB1vTlz4Odd9Ji4pY1VxkKg5KQMBSuv0IChJ6ZjmlhFTtJQJbuU0oZDiv
 Tx5w==
X-Gm-Message-State: ACrzQf1mgTpLmuFZCrDu0amRrFn5Wc066lIZCSdPNhjgZhzsRyrMGsWu
 mGojilk4xj8vcrg3PJP9hlKKrA==
X-Google-Smtp-Source: AMsMyM5YKp142ssImrqyoaxRTpa8mAxOIIlTKUWb2Y2mcX9lTDP2Y/CP2TRhAuarq2nTy03foaT+/A==
X-Received: by 2002:a17:907:2cd9:b0:78d:9f4c:9cff with SMTP id
 hg25-20020a1709072cd900b0078d9f4c9cffmr47298639ejc.345.1666970814476; 
 Fri, 28 Oct 2022 08:26:54 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906319100b00730df07629fsm2349839ejy.174.2022.10.28.08.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:26:54 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/3] ASoC: adau1372: correct PGA enable & mute bit
Date: Fri, 28 Oct 2022 17:26:25 +0200
Message-Id: <20221028152626.109603-4-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028152626.109603-1-maarten.zanders@mind.be>
References: <20221028152626.109603-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>,
 linux-kernel@vger.kernel.org
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

The DAPM control for PGAx uses the PGA mute bit for
power management. This bit is active high but is set to
non-inverted (ie when powering, it will mute).
The ALSA control "PGA x Capture Switch" uses the active
high PGA_ENx bit, but is set to inverted. So when
enabling this switch, the PGA gets disabled.

To correct the behaviour, invert both these bits.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/codecs/adau1372.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index 6b35981c8777..c5e0f10e6982 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -206,10 +206,10 @@ static const struct snd_kcontrol_new adau1372_controls[] = {
 		       2, 1, 0, adau1372_pga_boost_tlv),
 	SOC_SINGLE_TLV("PGA 3 Boost Capture Volume", ADAU1372_REG_PGA_BOOST,
 		       3, 1, 0, adau1372_pga_boost_tlv),
-	SOC_SINGLE("PGA 0 Capture Switch", ADAU1372_REG_PGA_CTRL(0), 7, 1, 1),
-	SOC_SINGLE("PGA 1 Capture Switch", ADAU1372_REG_PGA_CTRL(1), 7, 1, 1),
-	SOC_SINGLE("PGA 2 Capture Switch", ADAU1372_REG_PGA_CTRL(2), 7, 1, 1),
-	SOC_SINGLE("PGA 3 Capture Switch", ADAU1372_REG_PGA_CTRL(3), 7, 1, 1),
+	SOC_SINGLE("PGA 0 Capture Switch", ADAU1372_REG_PGA_CTRL(0), 7, 1, 0),
+	SOC_SINGLE("PGA 1 Capture Switch", ADAU1372_REG_PGA_CTRL(1), 7, 1, 0),
+	SOC_SINGLE("PGA 2 Capture Switch", ADAU1372_REG_PGA_CTRL(2), 7, 1, 0),
+	SOC_SINGLE("PGA 3 Capture Switch", ADAU1372_REG_PGA_CTRL(3), 7, 1, 0),
 
 	SOC_SINGLE_TLV("DAC 0 Playback Volume", ADAU1372_REG_DAC_VOL(0),
 		       0, 0xff, 1, adau1372_digital_tlv),
@@ -369,10 +369,10 @@ static const struct snd_soc_dapm_widget adau1372_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("MICBIAS0", ADAU1372_REG_MICBIAS, 4, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("MICBIAS1", ADAU1372_REG_MICBIAS, 5, 0, NULL, 0),
 
-	SND_SOC_DAPM_PGA("PGA0", ADAU1372_REG_PGA_CTRL(0), 6, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("PGA1", ADAU1372_REG_PGA_CTRL(1), 6, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("PGA2", ADAU1372_REG_PGA_CTRL(2), 6, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("PGA3", ADAU1372_REG_PGA_CTRL(3), 6, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA0", ADAU1372_REG_PGA_CTRL(0), 6, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA1", ADAU1372_REG_PGA_CTRL(1), 6, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA2", ADAU1372_REG_PGA_CTRL(2), 6, 1, NULL, 0),
+	SND_SOC_DAPM_PGA("PGA3", ADAU1372_REG_PGA_CTRL(3), 6, 1, NULL, 0),
 	SND_SOC_DAPM_ADC("ADC0", NULL, ADAU1372_REG_ADC_CTRL2, 0, 0),
 	SND_SOC_DAPM_ADC("ADC1", NULL, ADAU1372_REG_ADC_CTRL2, 1, 0),
 	SND_SOC_DAPM_ADC("ADC2", NULL, ADAU1372_REG_ADC_CTRL3, 0, 0),
-- 
2.37.3

