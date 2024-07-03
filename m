Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFA92BEC6
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:50:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B531D15FA;
	Tue,  9 Jul 2024 17:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B531D15FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540258;
	bh=4sjnkaXwLNp7p5DTjkC6jZAwMMW/qwiVCY05YVLu0yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cz9U2cLpYIIpxY4NJ9y2M5JYWN03EffyfN2xLW8UaSfDKyY65U1aZ2kj7ZgWna78C
	 F2/61scbq5vPSjuRxc2gmztq6/TT3MBo2iYPBA4QNUANfG4Sy8sSOz/GWckH+3zO1q
	 M428npQZ4eq4qsXRQTZGyo0liWXy9u9SeoAOPVno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C79B9F806DF; Tue,  9 Jul 2024 17:48:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D88EF805F7;
	Tue,  9 Jul 2024 17:48:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33AF6F804FC; Wed,  3 Jul 2024 18:21:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A25DAF8014C
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25DAF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cXg++YIA
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6fe617966fso504877566b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023678; x=1720628478;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSyNvDm6zVDNskeAuatJPuva+eHFR+zlE1Zqp5rhiEk=;
        b=cXg++YIAP0JEgPgCpmO2E5QRmGfI6kHNLo/Uoiep9kmdrimlDdpagTuWIw11IFoif3
         UU+FmAHbfP3wVhFWbhxJxvLwpaNw2xAnIazS2OMI2KpsZxYzHW8XGpTNXeEQdf5budgn
         sXYzESDMj/Crp9QGB0EbJjOlBfRCnhu8MJMRPdsSLh6Sn83mkrrysXoAVCGjjle3xXtK
         Ro5D31KH7k9pKtL2Tf/iHk/Y7MtFE/EtngmYmisqd+UgNw5B5bsn6ZThQjYv5ABcpU8Y
         IBcHkwf5ZE+hT+C/LjLbYvDttp1kGyRNA+66xKBaAGYjHXZslEihVN2KsUqUlC6v3BZB
         QTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023678; x=1720628478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSyNvDm6zVDNskeAuatJPuva+eHFR+zlE1Zqp5rhiEk=;
        b=PhrM33/oXvGcKxHQShZfiv5V9MxntLkTk8jJIOP6IM2BbjBWKbOamwgDGRJCSXvxtb
         tv+FgYWOJMhE7SZ36xJBJsrfHETPh/ESXhLhuL7ioUNMZIxT6SzSKhC3lvhUjXLwbgBH
         PE1h1+nxQ7bX6rJqP+8lOW3r5efwWKhd61R/8wQF2dGZrH9Ayj4+9XmzPiv0poAO7YtG
         vZl+HODv1opRMt2VzD/xvFTi/BmZBh7/lIEh6CPmRic4kLStONVUSV8f0/9Limr8EIN5
         S5klSbFR61P1hhdpF/dbOUfgcTt17PY+hoOgg36o/iGQDIE352OmR+LtHXEr/A/htI6j
         iqjw==
X-Gm-Message-State: AOJu0YxIySogvUtmPbtC05F4sYG6RCswwr6adww+rLg3TPR0GIFJ1QUV
	Pkb9OUAJ4b6YO21NwXcQQ9l6+FlqENY3cwCjc6L2JOMF8DDHE7lU
X-Google-Smtp-Source: 
 AGHT+IHpV6OONoKSXjg7fmv0v4P9t/xb/YGq3hRdnf4TgeAqAi3cLe0CsUSlt5CpfgVGn9qzjXc4Sw==
X-Received: by 2002:a17:907:724c:b0:a6c:8b01:3f78 with SMTP id
 a640c23a62f3a-a75144630ddmr1006920266b.9.1720023677891;
        Wed, 03 Jul 2024 09:21:17 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:17 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 18:21:00 +0200
Subject: [PATCH 4/9] ASoC: cs53l30: Constify struct regmap_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-sound-const-regmap_config-v1-4-2e379b0446a7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=714;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4sjnkaXwLNp7p5DTjkC6jZAwMMW/qwiVCY05YVLu0yc=;
 b=JQkgJLw1miJzjpf5mCChsQHJZ0BOe0MkRMyozKA01N2dFbb36jeC4afQ69b/KKR93UYuvPuKy
 MKMLpuKq21kC/iZQM1qW5tCvHq16FYDlHoRrDIXYg66TIxHVE7eZiDl
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JETUXSOTE2RJSYRXDOZAU7U5QYTQL4PW
X-Message-ID-Hash: JETUXSOTE2RJSYRXDOZAU7U5QYTQL4PW
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:48:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JETUXSOTE2RJSYRXDOZAU7U5QYTQL4PW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

`cs53l30_regmap` is not modified and can be declared as const to move
its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 sound/soc/codecs/cs53l30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 2ee13d885fdc..bcbaf28a0b2d 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -900,7 +900,7 @@ static const struct snd_soc_component_driver cs53l30_driver = {
 	.endianness		= 1,
 };
 
-static struct regmap_config cs53l30_regmap = {
+static const struct regmap_config cs53l30_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 

-- 
2.40.1

