Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A46093FD
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 16:36:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC51E9D23;
	Sun, 23 Oct 2022 16:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC51E9D23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666535776;
	bh=Q5HGia1k2/8x46WqA/3JsAFiBIvRKo7Yzxit0zNFBcA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bMdW2beUXyRMljEalSP6caJXDX1l2QexTW67+M8dIWMs9yVeOeIdWkEJjHaX7C9Wb
	 aL9xXWSvZ1sJVJav01t8bJD8T55Ub3tafxgY+tQk+U2mWBzlX9fwHz2MNodWJEII74
	 Y6NmGtFE1z/Z2HOTQdWu9GSrlmUJctcC9IiQgCLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36529F8056F;
	Sun, 23 Oct 2022 16:33:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55D8BF80552; Sun, 23 Oct 2022 16:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3F3EF804EB
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 16:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F3EF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d5znD320"
Received: by mail-wr1-x432.google.com with SMTP id bv10so11904374wrb.4
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xgkOKKf/r2OGCWExBVS97xfrlAiQor24qr6UWM7ySCA=;
 b=d5znD320WrBQPpNajiAV1FbaEXpWVRYEuHhL6yMAAcFsweM463/MFJk4or+SFApB8W
 R3ixebCz8X1OHntpr3Vm7QMSPfrmEnggUU9JJfYAQg5YugGPKFrcnKh0YE9roeMppJhr
 lRzOBdqBraKyILIm1OebYLb8G6Cqj7U32oXA+lkgB1R9IubrISzsnxT9heUFKhbYkzNf
 NqcgAxvuzmz1HIDabVBEZt25X8JKO8D1fj5ZK5lO3OrzD/9TPu7bDHskcy68HL8Lj5ev
 +kZliRjd2mxF5GOuKgmU70wn0aLY1kRFcYfA6Vuxbcq8jVXhKcbuv5GmEDCh3U5Urpkn
 ElvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgkOKKf/r2OGCWExBVS97xfrlAiQor24qr6UWM7ySCA=;
 b=kdcfcotVSJZvVt/bpRLgi+zTMlaA+YFEvC5QnsyJ4IjHr/esULfuCkZGv2Y0yAqBit
 AsYlTk6a9UPj7TRB+cj9nVvb5BxI5xI+NRXKJCxqjdM+At42726aIHXJTkSqJbJlm/FY
 7CV5gCQTRPY/EPQkx+uLLfYtsMAwvm4FLIxKC8Lyypl8ZXY/rJ6MchNDjiDyiBB0Pbab
 66TdXjcmv+1weXFvdzXsWL2v3mCn0hNI+468XBRskfn+9lzCMccJ4G/JfTUfirlGTT1G
 A7MCZhKKyi4FZqO3ZGfNU5NP9hvm9a10CnPYWKs6U/E+MsAVOjSRxbr8MOBDLUzNfkfk
 N86g==
X-Gm-Message-State: ACrzQf2zvS/IzkquLy9hYM5O4WFuh5EqUywZFN0/ZR6ifKKabGblcNtp
 1w9CVtu8rHf8+j8wyq+7F24=
X-Google-Smtp-Source: AMsMyM5bcQM2MKqwoGS/BPzoGUyPJkJL/qm7XXjx4Drf1ovMAqYQs6V6EvnEXdbxs2i99jVt/6FWqg==
X-Received: by 2002:a5d:4bcd:0:b0:236:6b67:a5be with SMTP id
 l13-20020a5d4bcd000000b002366b67a5bemr1858078wrt.81.1666535619095; 
 Sun, 23 Oct 2022 07:33:39 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff452000000b0022584c82c80sm23726047wrp.19.2022.10.23.07.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:33:38 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v6 6/9] ASoC: jz4740-i2s: Support S20_LE and S24_LE sample
 formats
Date: Sun, 23 Oct 2022 15:33:25 +0100
Message-Id: <20221023143328.160866-7-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
References: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
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

