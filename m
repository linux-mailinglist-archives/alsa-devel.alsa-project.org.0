Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4725A92BECA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDAD7FAA;
	Tue,  9 Jul 2024 17:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDAD7FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540307;
	bh=3/rp8Ajf3GnxZH4fnipCM3HJyXPmN1fR0rMic23+28w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ROtgAj36AzfsZsQsckM/CaxLaARwZtXcX0GTyh4ReZ1KrXbvVuHkaP42izjQxPRIg
	 PKHpS3xjMi0pIzMumwJfVtef9wfQwHzprHMmLpF0Qtw22A/cPdF4sE28UsE93xu+73
	 vcMaebQeKB3iqGvgBWjqUQ5p6q0KAhOz1CXzCc4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F24B9F80727; Tue,  9 Jul 2024 17:48:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C47AF80632;
	Tue,  9 Jul 2024 17:48:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88D0FF80301; Wed,  3 Jul 2024 18:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BF78F80272
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF78F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZWkpyrp/
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7241b2fe79so621436166b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023680; x=1720628480;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB3QG4cHw/5grgnujfHSGr77q98eD/K2cHI9+6joPLM=;
        b=ZWkpyrp/GPIAaN51Pbax5YoEoEDsBT74wY9I6910RK49UN685wjTu2ws8d45+4zypK
         sxKsR1suw8nBB4t50iiO++V2h9QjNe8/lO4Ow0/RIX5xTgpJryhWQP/dwLB1FOyLl62B
         ayv0XgXRKiEkBNzbKj/WCSIlDLdDWDrZI5pZwmov6PWfiTE6yKYX2a//tQ7U1nEdf6fW
         mqoYWg8qYtLqirzorhJw3XI2iEXdjFhwedHIbbcA/nKPzueMbjWybsuygI9JxBIp1rOb
         6nhVqVG0szG+4vSR41A1c/oXFOK/JLeyNJS17e9elBuuh39NshyZzkXaOwMZLuTk2T8K
         ve6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023680; x=1720628480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB3QG4cHw/5grgnujfHSGr77q98eD/K2cHI9+6joPLM=;
        b=AQFg3Fv7Jljd96skHsUQr+MhTaZW0YOE27Pke5quM8fNsd7TV73nTgU+tvWNuNzt+J
         KoxU+6KB5Im9TJq6R48dtth4Y/UYzohlFR4ZdcKxPhA8S5lKHdXJdqUwdltklpnIyh2R
         krp1WgqIwVsNZLuY+TcpgAWcjFSPRPSceDPaXlILLdnPqcOtMDFxaqhzI82QUomFpGkc
         iC7Ph3gtkEnwc3/KBrP1IQ4lrjn2WDu27S6FS+5ZZZbwB31eaJfN0Z9wq7ddkIQTksY2
         FnE8hYOTlOY6TalO0WN58zSNW+SK7Ryh9Cld58xgOFpAlE2bFnaxd2kowa7Fa+1WQwOa
         pdLg==
X-Gm-Message-State: AOJu0YwO/H60KB2fXuLBDgJVv2O4+MY2S/++WoXsrF0jfpc4aWuHl0wI
	LWdWlZxHJQjVcfJvwlALi4ds7lwA4Q7Zhyy1oafGlh6qwrAlXNFH
X-Google-Smtp-Source: 
 AGHT+IGSnZkI96Px48DnU6YgZSAgJEUPfAYKZr3K91kLUEZFHxbqXo/tEx6JqtbSu7eIYxOTaFILbA==
X-Received: by 2002:a17:907:7f15:b0:a6e:fb9b:6769 with SMTP id
 a640c23a62f3a-a75144de327mr1006641366b.75.1720023680277;
        Wed, 03 Jul 2024 09:21:20 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:02 +0200
Subject: [PATCH 6/9] ASoC: jz4770: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-6-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=734;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=3/rp8Ajf3GnxZH4fnipCM3HJyXPmN1fR0rMic23+28w=;
 b=FU/CH/vTUtYVYUffYi2PxJcnZTTW44Ijs/SIepa+gP5hZAlXnRj3HPDI22mYSG+jXyEOHhgrB
 ogFaxj8a/cnAdOyNdEFTrO9uhxwGaFKv9YvVZNU3/PDwGzRmd8YqU7V
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ATU2TPA6C22DI5LEFLO5OUHB3V5PHIS7
X-Message-ID-Hash: ATU2TPA6C22DI5LEFLO5OUHB3V5PHIS7
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATU2TPA6C22DI5LEFLO5OUHB3V5PHIS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`jz4760_codec_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/jz4770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 1d0c467ab57b..acb9eaa7ea1c 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -872,7 +872,7 @@ static const u8 jz4770_codec_reg_defaults[] = {
 	0x07, 0x44, 0x1F, 0x00
 };
 
-static struct regmap_config jz4770_codec_regmap_config = {
+static const struct regmap_config jz4770_codec_regmap_config = {
 	.reg_bits = 7,
 	.val_bits = 8,
 

-- 
2.40.1

