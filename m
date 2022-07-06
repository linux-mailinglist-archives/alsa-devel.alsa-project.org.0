Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEAD569415
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 23:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CA2168B;
	Wed,  6 Jul 2022 23:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CA2168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657142204;
	bh=NtFcTxrtAvxsIew2A488JKVyR8N17fNy9whmuNe3S5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUXHZkKEQ5SbXz55Uh9gDr67fOYOsSkqEiXEFcPUIsBtwkWSvKZTctGrRTykZH2N0
	 oUzwbwfXUKVqH4zNtdbHjtkR7dLfYMogAODo7GZmMRGA8pmNV2Y/Nd+glajFgu7OuJ
	 G5e/vleRHwep5kUg7I9wJnAv+4PyQOTrcDRXTCuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90806F805A0;
	Wed,  6 Jul 2022 23:13:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5195AF80570; Wed,  6 Jul 2022 23:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C969F80564
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 23:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C969F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pXn/zgG3"
Received: by mail-ej1-x635.google.com with SMTP id q6so29112504eji.13
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ot4wRXZEFrjMcEpIgIGqrJ2+/NIs1mmDnW8eBaCbRmg=;
 b=pXn/zgG37fA4vrVG8yBFSuhqnS8A9mtgnUfIhO7sQCN27/+C5FRqmP1JXHoaw7/3MD
 JBAZc1gc+y3Z+iT/ncrT44XgUf5Wu/JQPXiJcfSXCNF/oFoPRoB8UIJGm76qBJXU3YE5
 reX0MIzAlUadWZ0zhZ6ZyHO4CT3/PwRC8z56JDzf8ajmRqj0XNcn7XkpeU1JxUTwIeoS
 2QmOck0y4fAdLnfssHFVMAhpaBbuYXU9xv0aQ64w/drDdI8eehj20PHtw00uAYfmep4W
 +56Z4+6uF8B3KZ1VPBf7lf7KffOuu5dJLDj4G3O5UUEs6U0Kuc362jDCw8aXpx+z5Zot
 mPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ot4wRXZEFrjMcEpIgIGqrJ2+/NIs1mmDnW8eBaCbRmg=;
 b=02XSFBK7f5xjYj2++Il/kTTUznSKhRtYZ92kK8dOj45e65eDPv9VDagyPvKT9L+tlz
 c51hMsxmOPwR3CaH7/Qzf6jIZco0gX7dev7t0VE8nWAgxj4JUG0zLxgWfl67SWg/w0kp
 RQWeTLhkMc8Wzspj70RKXcKLEeGo3ERIvusPZd5t5M2ClIWKsSYv6FOoefgawHITAeqq
 sErmZR6F4rajAU/u5aPMvG1+8D8rVd6N6NC/8O594kBEOKWyhMeKqFING6DQwN5T74Gv
 ww5XAsQatDecKZYAkWYA3szLeK7YG9aKYBxqBKoeib5P4yZ9uGWdS65sJ7RWaLg0cm1h
 VDpQ==
X-Gm-Message-State: AJIora9XoAzTBJtx83z6LnA7M99zxWNEVCTZKMIC+3SdbM3skfBpjwb9
 zP9HlMunBRANG2GGj75rjm0=
X-Google-Smtp-Source: AGRyM1sM8kddgZ5/eeHLd9YPd0vlZfNr18WKSi0CW2svJW92/WrLnqZLNuH36I3tsUFoumDX58peAw==
X-Received: by 2002:a17:906:2c12:b0:726:94a0:2708 with SMTP id
 e18-20020a1709062c1200b0072694a02708mr41313645ejh.179.1657141973676; 
 Wed, 06 Jul 2022 14:12:53 -0700 (PDT)
Received: from localhost (92.40.202.8.threembb.co.uk. [92.40.202.8])
 by smtp.gmail.com with ESMTPSA id
 l23-20020aa7cad7000000b004356afc7009sm26534782edt.59.2022.07.06.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 14:12:53 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 10/11] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
Date: Wed,  6 Jul 2022 22:13:29 +0100
Message-Id: <20220706211330.120198-11-aidanmacdonald.0x0@gmail.com>
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

The audio controller on JZ47xx SoCs supports 20- and 24-bit
samples coming from memory. Allow those formats to be used
with the I2S driver.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 80b355d715ce..ee99c5e781ec 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -222,9 +222,15 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_FORMAT_S8:
 		sample_size = 0;
 		break;
-	case SNDRV_PCM_FORMAT_S16:
+	case SNDRV_PCM_FORMAT_S16_LE:
 		sample_size = 1;
 		break;
+	case SNDRV_PCM_FORMAT_S20_LE:
+		sample_size = 3;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		sample_size = 4;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -362,7 +368,9 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 };
 
 #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
-		SNDRV_PCM_FMTBIT_S16_LE)
+			 SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-- 
2.35.1

