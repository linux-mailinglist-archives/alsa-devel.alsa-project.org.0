Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987F56941D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:16:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F7D616A4;
	Wed,  6 Jul 2022 23:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F7D616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142217;
	bh=Q5JvJNVdtX5LkOPSA8yniqMvUXmFaC5AsgRkFT93Ls8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RmydSoiXo8DBtKAcoW6mUzPBk+9PAKvr6HrywqratMdw4VAALFUVo7/kcIZOga+IN
	 45RboouA6Rsz8xZYyEmWr4YeTSn9EttWffkDEzW2ZGLnaT7LYutm7VWv6fmJ2z9B1D
	 /EjK0G6DzQR1gsS0Vw3OciBSEX3/guj3W/LnAvX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D65F805AF;
	Wed,  6 Jul 2022 23:13:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7239BF80579; Wed,  6 Jul 2022 23:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA0AEF80579
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA0AEF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gXXFVnar"
Received: by mail-ej1-x636.google.com with SMTP id u15so4735830ejx.9
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XAfqs/8JoYVOURGYaByruwTWNVivg3YFx+gXMAB1ZgI=;
 b=gXXFVnarcaND4v/W/V/r074iFLqKVhZouMi1RM0jKkZAF33Yun+1aZyrmyr8+IIe8T
 Hl51zZjY6U8FEfDVYyqbdQIngwdN/gYZOZ7lrU3gOu1IZbDtqVLS/OSKa8Jqvo2xtefr
 BFezmvdV4IpWVBX1DQu4bzCUCLZU7uE7CN4Xv5xEjTzSvXLiLbH66aqc88zSemZadc+M
 /rgMcE16ynRMCcDIMe9riP6YEA5Na56H+TsKo0py4d986VDivaAIxnDrF1XWwK1tRVJf
 5qaw1MhY9th6PAX3yivXpfq5pQcenI5Hl5LWR2vck7PkhmdYY4FogzFkEgqJB3/DNC0N
 VOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XAfqs/8JoYVOURGYaByruwTWNVivg3YFx+gXMAB1ZgI=;
 b=yQeReK5HPL0HvquUoAfUsMZulGxyTcK21gAekqfKfVSJvuiYEbnEUTA+yHb9mLSJFh
 8clyA+Z/o4vNaJ42T+vhb2nDXzKswOh8fB+1jFgAqj07Hv+HFFCrStKNRRTr35uqIz79
 5XDx8O/e2biIN6o7D39HwUWjc+GGm4anXweP9uZ8tAZbj8JhTj7HbHVtfCzpGxSY+ocq
 3h2gH5bi6upNi0RLhhoc3ATSH4GGj84B6iDJ9+qszVMo+sYj3kO6gUi4rAfF7ZfeZQej
 l+T7KHaEL9NtSJJPTQB30wDyzyKtVJIh3idRp3hbu26KHTq/wsDs8gEpqUKAOMmag3gx
 BKQg==
X-Gm-Message-State: AJIora8vYbSkULPgKiPtsuYQD8xL6U9tdIhSMYuEKmYKa+CeqxutlQIZ
 L+xriyJI3n3QSBRTdRqihgY=
X-Google-Smtp-Source: AGRyM1tvfi9p6iVcY5U+EZv4ogz4yhivruSEX08JC0QJ+OKOY6pfg1JD+ubvgDueYiSZ5amHUfCy7g==
X-Received: by 2002:a17:907:3f0a:b0:726:324c:5bc2 with SMTP id
 hq10-20020a1709073f0a00b00726324c5bc2mr43645247ejc.32.1657141975370; 
 Wed, 06 Jul 2022 14:12:55 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a17090639d500b006fe98fb9523sm17980408eje.129.2022.07.06.14.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:54 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 11/11] ASoC: jz4740-i2s: Support continuous sample rate
Date: Wed,  6 Jul 2022 22:13:30 +0100
Message-Id: <20220706211330.120198-12-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
References: <20220706211330.120198-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
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

The I2S controller on JZ47xx SoCs doesn't impose restrictions on
sample rate and the driver doesn't make any assumptions about it,
so the DAI should advertise a continuous sample rate range.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index ee99c5e781ec..053697c7f19e 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -378,13 +378,13 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.symmetric_rate = 1,
@@ -415,13 +415,13 @@ static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.ops = &jz4740_i2s_dai_ops,
-- 
2.35.1

