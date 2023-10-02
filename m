Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82C7B9B83
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE2AE81;
	Thu,  5 Oct 2023 09:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE2AE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492211;
	bh=Lggg5nbr+SKWGNTpzIAEW1LdB4HogGldXRsskFy9K3k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OwFd9yzL1SZvEgNrS0RHQZf62vvESgCnbw1MRyZpXdeKfhdzk7LCaRWJ07UxHHOLo
	 EQa2orxWX9pBS9TlshboRAKDR7hXAHOkfs/LOTGIxFG2ERuBAFeiqo4JiboUClO9g+
	 U4bcUUEGdrIxJbRMYOoq8VMuVCLA+TIjiMW9ToYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42CCBF805C8; Thu,  5 Oct 2023 09:47:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32148F805C8;
	Thu,  5 Oct 2023 09:47:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 673F8F8047D; Mon,  2 Oct 2023 16:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 699F9F802E8
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 16:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 699F9F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=4moJ2ROU
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-503065c4b25so25296366e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696255216; x=1696860016;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2/riLchQZtPTs/BC596zGkjlTIrNRPztVzIEa24L10=;
        b=4moJ2ROUTfR5M5PSorcosgfzoakqYBeelYE62EBBnNFWnuM9QIgJdDocpk4uGHKuxE
         Y5gIlsKs6vrxfsIVD5MGThcT6fgk6O+s/J+FyXHdLRnfBJmsmyvtSKIVlX+BzCCSR/el
         yCpon8NkOu8ON3swuKOjdbms8owR7VqKbVHw792uKfpTD05GfO1miUz/qcUOaUE1EFIh
         0zV626P4/D8U4tbQ+7Sc3EjAmqR1k/BE6lRDrx8/4eSnI+Ct9J4Y6+/CdcYqTUS5dPwX
         wp1wrqFDwYeHk4FN9QuNVv9EO1f0iMkR5UQ1scwvPII3PITvDjyhMki0FEqNnky+wBOE
         kNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255216; x=1696860016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2/riLchQZtPTs/BC596zGkjlTIrNRPztVzIEa24L10=;
        b=FCyPvDS/pWWQW/SIwqEV4XyVsxHUjQrVHa+WpYaV8hIF8sjNcbzCsKbq6E8TWZYNMu
         dYITKp3UWTRU/KRZk4WOrkTEmGgQwaV+tzX/NYDsPttAG+uXDHM/hWLU26vqgTJhafRA
         1CxcZ+B/j2W/a3mr3Y5wm8aoHUZ+S4wpfsVwx8aL3ITGLPrE9LGcSmuSoSDBk4nI8UNz
         zpPZYHfyU672EGO1nWaE4q9q5uIaCX4RlQCNMIdPZUW3KZI665yF3fh84z5GeS1yX1Q4
         V07IwUO5DDCxHhe+J+Y3/at1Fq+4gcYO/aI8sDGpG6m123VqbmuJJViI8tJnZPn8225k
         nyQQ==
X-Gm-Message-State: AOJu0YwpEMVBScRNGk66cVCOY0R8jdzW00Hl1PSLBtUc5AMpn9a0ZKIT
	d/6I1yhvz9Gt2dy4yGuLuzn73w==
X-Google-Smtp-Source: 
 AGHT+IFYahe9QM9GSXykZIjClH00JSYu2bdXsSeQxdK1Yb2R7fBZkn9KvfTGct/URjQfs9lMQOMdJQ==
X-Received: by 2002:a05:6512:617:b0:503:19d9:4b6f with SMTP id
 b23-20020a056512061700b0050319d94b6fmr8505095lfe.0.1696255216212;
        Mon, 02 Oct 2023 07:00:16 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a056402518d00b005346925a474sm9350377edd.43.2023.10.02.07.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:00:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 02 Oct 2023 16:00:12 +0200
Subject: [PATCH v2 2/2] ASoC: codecs: aw88261: Remove non-existing reset
 gpio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-aw88261-reset-v2-2-837cb1e7b95c@fairphone.com>
References: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
In-Reply-To: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
To: Weidong Wang <wangweidong.a@awinic.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7Q65WOZTK4YBJM7YS43P32JVFZZUXOXW
X-Message-ID-Hash: 7Q65WOZTK4YBJM7YS43P32JVFZZUXOXW
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Q65WOZTK4YBJM7YS43P32JVFZZUXOXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to the AW88261 datasheet (V1.1) and device schematics I have
access to, there is no reset gpio present on the AW88261. Remove it.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 45eaf931a69c..e7683f70c2ef 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -10,7 +10,6 @@
 
 #include <linux/i2c.h>
 #include <linux/firmware.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88261.h"
@@ -1175,14 +1174,6 @@ static const struct snd_soc_component_driver soc_codec_dev_aw88261 = {
 	.remove = aw88261_codec_remove,
 };
 
-static void aw88261_hw_reset(struct aw88261 *aw88261)
-{
-	gpiod_set_value_cansleep(aw88261->reset_gpio, 0);
-	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
-	gpiod_set_value_cansleep(aw88261->reset_gpio, 1);
-	usleep_range(AW88261_1000_US, AW88261_1000_US + 10);
-}
-
 static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
@@ -1254,12 +1245,6 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, aw88261);
 
-	aw88261->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(aw88261->reset_gpio))
-		dev_info(&i2c->dev, "reset gpio not defined\n");
-	else
-		aw88261_hw_reset(aw88261);
-
 	aw88261->regmap = devm_regmap_init_i2c(i2c, &aw88261_remap_config);
 	if (IS_ERR(aw88261->regmap)) {
 		ret = PTR_ERR(aw88261->regmap);

-- 
2.42.0

