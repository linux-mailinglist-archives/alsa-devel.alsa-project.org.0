Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BC5FAC1F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:06:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2949236C0;
	Tue, 11 Oct 2022 08:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2949236C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468395;
	bh=LbbkAGbzGwbg60h2drK5ZywC2KEjQ5OtWmAC2bjMnws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCkHnA3IaIQxC+IdOUn8fX7XH9BLqUQIit/cHRASia3rOfsZOAnS6Z657fS3fYug/
	 UaaO0tncj95pvPWefWmLSgRZASg5tdDX43u4cDV9PnUVaanBXfxkkfgKrViWEkvTzv
	 LaJ0UzZYeSuSdGc5EvhID3WBZ66/O/jjdvbpb1E8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69621F805A8;
	Tue, 11 Oct 2022 08:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E096AF804D8; Mon, 10 Oct 2022 20:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57EB4F80256
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 20:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57EB4F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="onG0G8qP"
Received: by mail-wr1-x429.google.com with SMTP id a10so18274454wrm.12
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5KOQIYlbblLHHRIPNNVIX9zOac26R/P9cPlWZ+KbLOU=;
 b=onG0G8qPaIbhvuYeakoEpmZHsfPvkKuL9BZEMMFTdcP43O1NME8Fsb3POluz3fZAhy
 Lwbs300R2iesaLWumkxsJL5uE8kBY4xjuHhl0V3S2yq7Nr1b2moiF+asMXIv+hS04InD
 F3a9I8ivWJfHcsXqo3J6HupLIFSYlylCcyMRFSKBDtOwSIPJLwNPOMYPz6ugQawWaQWh
 uVZmOXHlLlh6itxn33mXSbIRkKosG9Ntei/KKh3JsTi2u4vV1wF3BdkwWGCL8jfiLn1u
 NRGJ2HPMKGAKLaQwOt9T015Ea71JKf5GGsoHF5K3sAetsg8Z44agAM/OFdD1qeXrSrqF
 AAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5KOQIYlbblLHHRIPNNVIX9zOac26R/P9cPlWZ+KbLOU=;
 b=lmDBePUWSYmKiI1yUVibaxfraoULKQW15ppo0e0srPxrcY7i2MT40GQbRgHpPy7Vjf
 Xqi5nLxz9PVLcFIvTl5McBDxInpfgaGA9vfG0jqJH/GOjUiLYC4r2lZAmo9a2lwpTy/e
 tf8sB9FLobCjhTkHAUea8BeXLWSCJGCON9WpB3oqzq8pHXJ7YP8Dq7N+3PCRAJP6F22P
 SA8ryLRsiGGow6IinK48zwpOOxFbAlTMEdK+qS+RR8I7F5RX4QsWzYe6XpuxSz+r7zXa
 sRRgt0aka0V8gSh8/V2v0GNk4cUUgT8/TuGmaFqk/7tCPqWT2E0Xst5zoFP/y01Pa8V0
 SFTQ==
X-Gm-Message-State: ACrzQf1GO/x/TxzWWe3pVFqv2BHqtjUv9PKCIjQFLxXsEX6uKDtto4g+
 pSaXRAIte+OI+0Yc7kXXdbE=
X-Google-Smtp-Source: AMsMyM5//7B1JOa0HJE0sfOI/B5b30P3bn4Cwu1SQ317PoD6E8TMN+PaK3ZV1wOCrhSvOLjVjRmz+Q==
X-Received: by 2002:adf:f883:0:b0:22e:5610:79fe with SMTP id
 u3-20020adff883000000b0022e561079femr12637080wrp.351.1665428096495; 
 Mon, 10 Oct 2022 11:54:56 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-126-34-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.34.126])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm2082272wrt.53.2022.10.10.11.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:54:55 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v2 4/6] ASoC: codecs: jz4725b: fix capture selector naming
Date: Mon, 10 Oct 2022 21:54:21 +0300
Message-Id: <20221010185423.3167208-5-lis8215@gmail.com>
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

At the moment Capture source selector appears on Playback
tab in the alsamixer and has a senseless name.

Let's fix that.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 4363d898a..3f9bbd79d 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -183,7 +183,7 @@ static SOC_VALUE_ENUM_SINGLE_DECL(jz4725b_codec_adc_src_enum,
 				  jz4725b_codec_adc_src_texts,
 				  jz4725b_codec_adc_src_values);
 static const struct snd_kcontrol_new jz4725b_codec_adc_src_ctrl =
-			SOC_DAPM_ENUM("Route", jz4725b_codec_adc_src_enum);
+	SOC_DAPM_ENUM("ADC Source Capture Route", jz4725b_codec_adc_src_enum);
 
 static const struct snd_kcontrol_new jz4725b_codec_mixer_controls[] = {
 	SOC_DAPM_SINGLE("Line In Bypass", JZ4725B_CODEC_REG_CR1,
-- 
2.36.1

