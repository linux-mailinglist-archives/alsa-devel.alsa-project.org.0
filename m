Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3F693341
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Feb 2023 20:14:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44157F8;
	Sat, 11 Feb 2023 20:13:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44157F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676142878;
	bh=xuHOqL+WXXf0/MJCX0nlTAtiXaOgCfgRVbtvXbAa+94=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Js/oyokSMKXYz9XzQgsFP1W6ZYwKDgCJ0LygWW8pTYq6ya8W89Dy3zD2WhuK9Dn2G
	 QWXT6leOmMcjSZ0kPTIAGOn5q1TymwG852yZx/M02ErnMFVut5j/vsx/HKczgrR5eK
	 bFLlyGnWrFlGe18npmvL6YQ+CBJJ8FeWVMOkf3Fk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1076EF800B8;
	Sat, 11 Feb 2023 20:13:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EBCAF800E4; Sat, 11 Feb 2023 20:13:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C148F80094
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 20:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C148F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=shruggie-ro.20210112.gappssmtp.com
 header.i=@shruggie-ro.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=oFDa/o2j
Received: by mail-wr1-x429.google.com with SMTP id j23so8420505wra.0
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Feb 2023 11:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shruggie-ro.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V8bny6wru+I6AK3uWbXkDav+4h6cDdHFeoJVAL16cIg=;
        b=oFDa/o2jZtC8s6SgTv4Wy7btJdsfWLs23HVTAyKPQy1XMkKJsdtlAidl1hMdghZurz
         UBFGr2TS83DhR3y5yGsnYXu/RL0FVOqnHHW+0tVAKvn3/NVHHXsOBM6Z0a4PfMgdgc8f
         Y7r+MJb0khzmDM6uWV4ldYJylkKmq0PsFX2m18sMNe/8Wx6uiu6tmvwuI6KrNIrgs931
         tUu/hTN1AYO98H7SJCRdXzsLAiBGfu2qNWPokSKyScH9t8osBQR/4Qimcl6ruUyHTz56
         CbBPSQLoKpP7OgNZ8cYVdeMfqbY1nzAhdIGXrUsExsw0dPdVT5Y35bUxFc1Et5kNHMQ6
         pbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8bny6wru+I6AK3uWbXkDav+4h6cDdHFeoJVAL16cIg=;
        b=UUCgRpCYW72XT5D6bOWNhX8zTJIH0Zys+ZJjcsHbBP93hDezTYtJLtJZk+JqbG0ZlL
         oT02bHRcjKn98w00/qBcvnHlAqOTHkFEm+8e51lV8i/G3IkmtseNlshkAbOsuIlabNja
         6SFfmKD4rmdREzyX84IiLws0nOOxviqbW7+5ZAqK6UNGW9cQyi+QY0XlKmZCfzewm66O
         e6/a4TiL6IMjgR52ccRJLQKQhfzn5QkmoLdj6XY/gY+4Do3HlnDihASlKdISuub5sKq/
         GMwWiT9Zj9vRiPVG/hAwAva5xa/6Gg1xrn3JRvzMXliFtrlmFtTOUEDC5jpCy7ZU0glM
         SZkQ==
X-Gm-Message-State: AO0yUKXibeCuFQ/4lgEZk1R4e3y6Fm7ag4fRHv6fuCUzUemZdn1FLDMJ
	Xuieb8XiCalCx4V1TWMYbX6V1+CxJjrGxuX1+4Jzmg==
X-Google-Smtp-Source: 
 AK7set+kzOVSpWPhhHKCeW7YAAmjEmHEhDXJaZ1A2TfuVCNnBj8wW/W9yUqUWEEF1BGkX1fLEiJI+w==
X-Received: by 2002:a05:6000:1091:b0:2c3:e5e6:f0d8 with SMTP id
 y17-20020a056000109100b002c3e5e6f0d8mr17306675wrw.11.1676142811154;
        Sat, 11 Feb 2023 11:13:31 -0800 (PST)
Received: from neptune.. ([188.27.130.91])
        by smtp.gmail.com with ESMTPSA id
 y9-20020adfee09000000b002c550eb062fsm1648506wrn.14.2023.02.11.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 11:13:30 -0800 (PST)
From: Alexandru Ardelean <alex@shruggie.ro>
To: alsa-devel@alsa-project.org
Subject: [PATCH] sound: soc: codec: tlv320adcx140: fix 'ti,gpio-config' DT
 property init
Date: Sat, 11 Feb 2023 21:13:15 +0200
Message-Id: <20230211191315.24554-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ZNWLNK4PZZG5CAO7QFIH5GORPHHSY7B
X-Message-ID-Hash: 3ZNWLNK4PZZG5CAO7QFIH5GORPHHSY7B
X-MailFrom: alex@shruggie.ro
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 steffen.aschbacher@stihl.de, patrick.frick@stihl.de,
 Alexandru Ardelean <alex@shruggie.ro>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZNWLNK4PZZG5CAO7QFIH5GORPHHSY7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Steffen Aschbacher <steffen.aschbacher@stihl.de>

When the 'ti,gpio-config' property is not defined, the
device_property_count_u32() will return an error, rather than zero.

The current check, only handles a return value of zero, which assumes that
the property is defined and has no elements.

This change extends the check to also handle for an error case (most likely
to be hit by the case that the 'ti,gpio-config' is not defined).
Semantically, this would be the same as 'device_property_count_u32()'
returning zero.

In case that 'ti,gpio-config' is defined, and returns a 'gpio_count' value
that is incorrect, there is an 'if (gpio_count != ADCX140_NUM_GPIO_CFGS)'
check, a few lines lower that will return -EINVAL.
This means that someone tried to define 'ti,gpio-config', but with the
wrong number of GPIOs.

Signed-off-by: Steffen Aschbacher <steffen.aschbacher@stihl.de>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 sound/soc/codecs/tlv320adcx140.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 91a22d927915..530f321d08e9 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -925,7 +925,7 @@ static int adcx140_configure_gpio(struct adcx140_priv *adcx140)
 
 	gpio_count = device_property_count_u32(adcx140->dev,
 			"ti,gpio-config");
-	if (gpio_count == 0)
+	if (gpio_count <= 0)
 		return 0;
 
 	if (gpio_count != ADCX140_NUM_GPIO_CFGS)
-- 
2.34.1

