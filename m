Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C004913428
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 15:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FC31868;
	Sat, 22 Jun 2024 15:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FC31868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719062045;
	bh=NOkj/f8lAc7kTz5X7jDGaKXy+Z6EDvf0UOG45AeiUzs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IcQwm2W+E/MphqBIJ9U3J3cccFZRlAFwTMXIdea75aeOICo5bgAKELvp3Ciw08QcD
	 YocrydByAzC6O0RitMXrUX7oeusfJYYvMK2wFWkJU8ZjO1auGTaMhfFigO5sfDDUxQ
	 mdIoU42BSFOJNre0S+4LNX9ck5O70hMjQIKdpU4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F181FF805F3; Sat, 22 Jun 2024 15:13:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DDBCF805E9;
	Sat, 22 Jun 2024 15:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D673DF805C4; Sat, 22 Jun 2024 15:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94328F80154
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 15:12:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94328F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=c+mo7wKW
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f09b457fdso294453566b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719061976; x=1719666776;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KIghhhap73u1S2Fgyv5RhQSmZlNkggPnJ4NqRaVR4E=;
        b=c+mo7wKWssOFJJZT96vshAULioRTo7L/wcFsqSohiCyLr7d9xb3XgFTOTOmHqyJu8v
         HkDVivp9Pm2gXvTesdEeN2ErKBk5rbt4SXO4FsOVk7mTWr+1chZTyQScwKuhmfYz9bTd
         DTg9kDbOFTozCu5w7DMyqxzrJ5ZyLUqRgle18p9G2CKkwqIR5y0UvI2YjIOqLDpHHPfR
         G0ydiNKZrGcGz1gRO4kcH21nPYRmlZifiqbSLIpAozZen3VycAgM29JbgSEVywpLUYBl
         B3xmFLjR7KjSx4Ay3hyrlo+PFTFK5q7gCMmphkPqjMy4amP6dQ16iYRTpfJM60lUb2XK
         AJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719061976; x=1719666776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KIghhhap73u1S2Fgyv5RhQSmZlNkggPnJ4NqRaVR4E=;
        b=tsJdPFyIHwtVIJhfRRFVKcIy3kw7kWDia8mBJT/4HVV2emA5/pNAIhO3+dwNBMwZxB
         yuvuie2elXO0l0937X25VPHxMWPVA3axNTzdcOIZ5KLXGzw68l7iy3rI8nqvT7qdsbZN
         6fXGXSWtBX7if79YqyNxQ77823kLONNShXos9SrzTpOBf1/Wfh903lrQnUVmeqRQqIQV
         qEYAdnBYKDO52OxZQunwfOBoy+QgUJ7PoZVqXSD93fcXxYX+SCL54p4pOHCLFcnmjxc/
         17pfA5FE4AXevN8scYjLa87SSqr0RN50aErPg0vvmveT3nzMqvw0KCSguNPUxj1EhCPs
         Dj7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRgBb83EOAk3xlR4qF6+b5XyqbSNEd/oztZ0Aqv7im44fWM1HzYKDofyRboSaCbUlgFDsK0TTZzga3QQMlzUEdGbiCTmOloWN0AkA=
X-Gm-Message-State: AOJu0Yyu2WodeUBdQsZHGeO7KLPNDF32gyH84UGYcItTqHOBITU0UzwK
	0F/u/yA8SXdpzVw24Zw5PMLAeDVcA1xk17FtCpsu4TVRm6IRm7a/
X-Google-Smtp-Source: 
 AGHT+IH5qt1PObEvU6yvifso7ZxFmIBxYQ215NYI9UltdYVsYxH03ugtpQPpYu3t5Veq/1dFONMdDA==
X-Received: by 2002:a17:906:7f05:b0:a6e:4693:1f6e with SMTP id
 a640c23a62f3a-a7242c39be2mr24427066b.29.1719061976155;
        Sat, 22 Jun 2024 06:12:56 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf42a724sm197708166b.16.2024.06.22.06.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 06:12:55 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: Add support for ti,pcm5242 to the pcm512x driver
Date: Sat, 22 Jun 2024 13:12:45 +0000
Message-Id: <20240622131245.2607533-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622131245.2607533-1-christianshewitt@gmail.com>
References: <20240622131245.2607533-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SCDJEBZOUBNKIJW4CLWABQ6FAE3HGXQA
X-Message-ID-Hash: SCDJEBZOUBNKIJW4CLWABQ6FAE3HGXQA
X-MailFrom: christianshewitt@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCDJEBZOUBNKIJW4CLWABQ6FAE3HGXQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a compatible string to enable support for the ti,pcm5242 DAC chip
in the pcm512x driver.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes since v1:
- add pcm5242 to SPI too as suggested by Mark Brown

 sound/soc/codecs/pcm512x-i2c.c | 2 ++
 sound/soc/codecs/pcm512x-spi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/pcm512x-i2c.c b/sound/soc/codecs/pcm512x-i2c.c
index 4be476a280e1..92bcf5179779 100644
--- a/sound/soc/codecs/pcm512x-i2c.c
+++ b/sound/soc/codecs/pcm512x-i2c.c
@@ -39,6 +39,7 @@ static const struct i2c_device_id pcm512x_i2c_id[] = {
 	{ "pcm5122", },
 	{ "pcm5141", },
 	{ "pcm5142", },
+	{ "pcm5242", },
 	{ "tas5754", },
 	{ "tas5756", },
 	{ }
@@ -51,6 +52,7 @@ static const struct of_device_id pcm512x_of_match[] = {
 	{ .compatible = "ti,pcm5122", },
 	{ .compatible = "ti,pcm5141", },
 	{ .compatible = "ti,pcm5142", },
+	{ .compatible = "ti,pcm5242", },
 	{ .compatible = "ti,tas5754", },
 	{ .compatible = "ti,tas5756", },
 	{ }
diff --git a/sound/soc/codecs/pcm512x-spi.c b/sound/soc/codecs/pcm512x-spi.c
index 4d29e7196380..6629b862f47d 100644
--- a/sound/soc/codecs/pcm512x-spi.c
+++ b/sound/soc/codecs/pcm512x-spi.c
@@ -36,6 +36,7 @@ static const struct spi_device_id pcm512x_spi_id[] = {
 	{ "pcm5122", },
 	{ "pcm5141", },
 	{ "pcm5142", },
+	{ "pcm5242", },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, pcm512x_spi_id);
@@ -45,6 +46,7 @@ static const struct of_device_id pcm512x_of_match[] = {
 	{ .compatible = "ti,pcm5122", },
 	{ .compatible = "ti,pcm5141", },
 	{ .compatible = "ti,pcm5142", },
+	{ .compatible = "ti,pcm5242", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm512x_of_match);
-- 
2.34.1

