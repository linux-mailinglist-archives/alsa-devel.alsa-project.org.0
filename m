Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBCD608F32
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 21:16:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99BCA488;
	Sat, 22 Oct 2022 21:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99BCA488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666466186;
	bh=Q5HGia1k2/8x46WqA/3JsAFiBIvRKo7Yzxit0zNFBcA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpRoFJwXUO7W9XTaul4RAEPDiJ04f5lshd6KPIuhKAI7hUIOdAsMalRMvGWEF5nY3
	 XcA/6K0xhMaw94P4gdyNn+I0OFQvxR34M4bH3hIYbq6VzTB3bdLkUojY0/CQbn4xQ6
	 pzn4uNdZhvKCBvQoZDtnP9had7ohvtw8cirHtk8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EC6F8057D;
	Sat, 22 Oct 2022 21:13:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6041CF8056F; Sat, 22 Oct 2022 21:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D0AF80548
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 21:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D0AF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WOfoZi83"
Received: by mail-wm1-x333.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so4147452wmb.2
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xgkOKKf/r2OGCWExBVS97xfrlAiQor24qr6UWM7ySCA=;
 b=WOfoZi833xSQNoqbUva8zSvumFMNi4oN/hbLXs/rAC+Tt/M1dd0nB6yPDmVTXG+Wzk
 gOA9JlvWrvlbRBJ+inkmeR+iwuHv/m67bq2nYDGpx6PLPRQ8Fz7URRI4HUxZc+SbW/Ev
 4KJyAqDcYk7uqraz98JZHkF2ItMGF8TPVs3fnKAT0qkxPCBQz0j9MY2uWBPmvkYbPx4p
 TVjTwc2jaz5xW7OU8B/7viHC8T7BYDpsyEupy1DBfkjzjdkYlr3siyx3YiDvsnq1XibV
 sQpvfXmlGeTMmnh1WqnFIGsuuvQJ0mZXJfK1bB18uZeGTpvvKjgmFBS90xpVtjr3Kmeu
 ZvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgkOKKf/r2OGCWExBVS97xfrlAiQor24qr6UWM7ySCA=;
 b=lHX/6CeUdxkSpzVzErGwNehDxt0KnfIq6LyxlEftMpvJmfy4deIyNgqh6s0AGfxWoq
 GKcFAL97lgC0KlpoAnHIz6KN3gM1hyfZBeElYh4m12Aie0ScvNeHAkK9OGrBqEKEwxVX
 q788Ve3iDPvnfsn8UbRnxPsWshaS4LOA4oikQCoOrYWiRn1yJnZmgFqcwKljzpEj76SV
 WJ23oGNwDA1y0NcBg32ssRAsPmhvpTYggf6ADCn+DRFEaO/d48XIFmLEG1v4WRizwpFM
 e3YmjN39YN6PjFPkBU7ffAdRlDQvVuoWRCED5Y8oMjlTEWRAwzYJOnlvK6YE6FssnRLE
 fTQw==
X-Gm-Message-State: ACrzQf0ogYcyzGNJR09J0x2POGCpbZxohVLeZwQRNNQfJTHOEzG2rpTj
 Jt/H4iZ4bmT0z2R+24sPFek=
X-Google-Smtp-Source: AMsMyM4Q3zLGnh37Z3bU3hmYSQozdNyFVL+JzyKDjLFE6v+O3DutgjJmzDp/B3LrouF8xSDpiJU5Hg==
X-Received: by 2002:a05:600c:4187:b0:3c6:fe18:b2a with SMTP id
 p7-20020a05600c418700b003c6fe180b2amr17601965wmh.41.1666466008979; 
 Sat, 22 Oct 2022 12:13:28 -0700 (PDT)
Received: from localhost (94.197.1.68.threembb.co.uk. [94.197.1.68])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b003c7087f6c9asm3590947wmq.32.2022.10.22.12.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 12:13:28 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v5 6/9] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
Date: Sat, 22 Oct 2022 20:13:05 +0100
Message-Id: <20221022191308.82348-7-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
References: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

The audio controller on JZ47xx SoCs can transfer 20- and 24-bit
samples in the FIFO, so allow those formats to be used with the
I2S driver. Although the FIFO doesn't care about the in-memory
sample format, we only support 4-byte format variants because the
DMA controller on these SoCs cannot transfer in 3-byte multiples.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index c3235e993ffb..fd35a8a51f60 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -237,9 +237,15 @@ static int jz4740_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -374,7 +380,9 @@ static const struct snd_soc_dai_ops jz4740_i2s_dai_ops = {
 };
 
 #define JZ4740_I2S_FMTS (SNDRV_PCM_FMTBIT_S8 | \
-		SNDRV_PCM_FMTBIT_S16_LE)
+			 SNDRV_PCM_FMTBIT_S16_LE | \
+			 SNDRV_PCM_FMTBIT_S20_LE | \
+			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.probe = jz4740_i2s_dai_probe,
-- 
2.38.1

