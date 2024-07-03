Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77F92BEC8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C22614E9;
	Tue,  9 Jul 2024 17:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C22614E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540273;
	bh=j5sPCwhhCviCU7Vu2ABzpjqggf1PnHdW58kdo9eadZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h3ZJLDujlGhNGmTB8y0xIFF1AsIDwWkIaM/5rPVFyFu2yODQa839ABH61/nO05GeJ
	 ZaPyGk1+2KsD9BXwTSM/KH+jb1Knu56iOkue3JtJN4JSuYPiTWYV54AkUxbdu14HqI
	 c6ZNuaYF5oyWWIF0+ha76ZLffAwB7Iv1yni9ARmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06015F806CC; Tue,  9 Jul 2024 17:48:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BACF8060A;
	Tue,  9 Jul 2024 17:48:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4725DF80272; Wed,  3 Jul 2024 18:21:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C5BAF8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C5BAF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=URAEfCMi
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so54051621fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023677; x=1720628477;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIxz4BhRdDbBTxy1ZxI+3NgFm2AiBBocYllJB6osFnM=;
        b=URAEfCMiEN0eYr2I2EYcjlgIv1mLfFsWkqGFkaokGxHTCZEwsX2t4snVCdYwC94xvb
         EU0rFJIpqlaRPhIkLnjnk2a4BYUf4uFSDRONnhMllX6vK9USof6X8qZsz9L8J5pkaRfb
         0V7uIxfcr0SmWFd15R0iy5LGfrk2n9Cfht7qwf1WF8NX2t7Oeq9bSyIiiN+RTbFPQCDa
         oOmQHqNH219aKwNnvZ21B+nu1Db5wDMtI+JgpSM3a5wOgXt/ka8o0vEqMkVRXPMtTq/y
         U0TdeJUYhECF4ve/H1+j1NY4H9IVOgl45y1BfR08qR2fez2xr3LONYk0IhaxxgZvWeAQ
         gIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023677; x=1720628477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIxz4BhRdDbBTxy1ZxI+3NgFm2AiBBocYllJB6osFnM=;
        b=qrnxep5jS4I3Eo1rS8U9UM4MUbcE3g5vKlcm31I0R7S1PijW371bIFaAUTizuBWbQX
         ftcwfjo3Iob93Jv53QTu2LGDG/pib8rrTEBKHedBJlZyaPwPPRjZyxfmGWavTFLweE+W
         LiLFu9l0ze9j91T5UIkVUhNT62m5E/wn+/e9Puw3yHhw1Cd6+jV9FEs4/LSnrz7EDUuJ
         L0P5bKjGtHIVf/jFMu3z8+XVHnqdegyRnWJ18dNuUYeQIlrYK71iT9i3RM1FHdICk/ia
         cHdnStITa4/In/zMUrke4+N/O3Xvxh1aBTXSaNLUgll2TpBIuiGjNurtTxJsetpJI5Es
         ssfA==
X-Gm-Message-State: AOJu0YxjTXt07SUq+rOX3BOVdJpupF+hWthVTNRwbac7x1cwPxDwwcJQ
	Dj9lhItUKwMrcorjwlYWGLYFm2rIV5YSd7/fx7I7dlWbRzANUZTS
X-Google-Smtp-Source: 
 AGHT+IEg38LI8zSwhtv7gZ81fD0e7zGHYVVoUZhtCGgWIfi7hIcLtYqbuRUPAnd5RKorZBpjTgxyFw==
X-Received: by 2002:a05:6512:3c9f:b0:52c:99c9:bef6 with SMTP id
 2adb3069b0e04-52e8264bbdfmr9515258e87.7.1720023676559;
        Wed, 03 Jul 2024 09:21:16 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:20:59 +0200
Subject: [PATCH 3/9] ASoC: cs35l36: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-3-2e379b0446a7@gmail.com>
References: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
In-Reply-To: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=746;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=j5sPCwhhCviCU7Vu2ABzpjqggf1PnHdW58kdo9eadZQ=;
 b=QhTXFi/FH7gHSBuHri6xDFWv6J6P0NWZ2YOSlyT0AmUqU/Z0xGHKFPmtNFjpBdCtWYKRpbo5r
 cL6Q5y3doOwD/GzsZgie0nUxIEKD1C41ZTRNLi2UQdUALi3LTT6arMg
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HTVVTULWHJCMZSSLMF4GVPCUWLIDB7UR
X-Message-ID-Hash: HTVVTULWHJCMZSSLMF4GVPCUWLIDB7UR
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HTVVTULWHJCMZSSLMF4GVPCUWLIDB7UR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`cs35l36_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs35l36.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index bc79990615e8..cbea79bd8980 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1300,7 +1300,7 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l36 = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs35l36_regmap = {
+static const struct regmap_config cs35l36_regmap = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.40.1

