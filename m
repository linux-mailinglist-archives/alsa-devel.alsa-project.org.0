Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E17B3F2D
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B8EEE3;
	Sat, 30 Sep 2023 10:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B8EEE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061977;
	bh=/GwX/IkN80mi4PpljxKW5l9Dof5tKihlq6EzA1EAC6k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Io4XynjNDnfFVBrvTn95LMdS8cBFKcbKGZofXa8GBS1ZP7k79gDAXnQ+4JZ75tzew
	 ei4UuwPAe6wk5A1rZejbHfS674U5xH7AfgyZVUF+HWgo4/6yGHLhsE2VkXmMlNirUA
	 oooQgcMsP5u4OXuaY4W4Yqxi9QgbsKJ9Kp1GKWDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD6E9F8069D; Sat, 30 Sep 2023 10:13:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1029F8069A;
	Sat, 30 Sep 2023 10:13:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C94F801D5; Fri, 29 Sep 2023 17:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 228FFF800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 17:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 228FFF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YM5GkEUy
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-406618d0991so3638205e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696000095; x=1696604895;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bR9UWtC1p3mwpIBD1ghImSIQPLTYUb8nPcgzl1u2x8Q=;
        b=YM5GkEUyAav8TWCDVN8d5q1XGW9cj0frItqnKufcf2w4d+gjJ08Q7jgvwjGMxSFkaT
         6FtVEseiEVt76S80P2tfyN27tWK47afPRHtlt1gdNbQiV9hydczxXmvdqRuQG8SdiyTt
         P0hVeVV5ye/jnREnaUgsdVilp9ycpCCMuUqYfQTOJUbPjwYdci6D2uObm3cuPMjUi51b
         SKQuFe/4zetIzgV9k3thmq7uvCM/75EyZJ2cpZNXHrP8QolQ19sFzoScll6XpHmkidBQ
         Jkb6l+LfsExNZ/qj4L65F+UEmAvAsxn8Ug4EaeJ9WsCx3AJZ8OvJbUUkEKkUJZVqSo/y
         9zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696000095; x=1696604895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR9UWtC1p3mwpIBD1ghImSIQPLTYUb8nPcgzl1u2x8Q=;
        b=mW3YYXcJJyTjW5zYdwAL3ZgNITua2DGuFBnTfL2q/+NS1+rhJ7OonkGdIgYTEkLU9y
         M0cevz3w7AANwUsxcuFuSGAYteF7BIsiJgy4xVYjt6U0NV7c7RPYY2vKEj7K0V9yytYr
         OJILqgomPFQdDk6KWWkY2ooZ+USclmRHU5ri039gpT8NcMpVy+jcdVd13PS2LCOKMfjA
         ZHS7Z4+gzoYxgjKUs/5c3mMwikEMtgQGEEewcqZW/9CJElKl2KHxEyeXAHrQcDbQNwuM
         PRYmcI9KEglRIxM4pEoeEUXYFOdcwS9He19EBhkAk8Sy1NSTW7p06jDKf+k+yD0TUsWw
         KbGg==
X-Gm-Message-State: AOJu0YxsxXw1lP6lJgE7XL3wYX4gQODRibWeANWaK2xbPG4tuTNPol/M
	IUrXEyByFpHh2bdxPSl8DDU=
X-Google-Smtp-Source: 
 AGHT+IGHK+tbzpz8K/qw9KIsSxKt/JNBH2C6H1p5LbfKX/BA3YkbegQF5r7zhKiQCMdMtufOfJ1HxQ==
X-Received: by 2002:a05:600c:220d:b0:405:3455:567e with SMTP id
 z13-20020a05600c220d00b004053455567emr3898215wml.5.1696000094652;
        Fri, 29 Sep 2023 08:08:14 -0700 (PDT)
Received: from localhost ([2a02:810d:1640:10d8:9259:8ee2:26ea:3669])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c298100b0040586360a36sm1618613wmd.17.2023.09.29.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 08:08:14 -0700 (PDT)
From: Joerg Schambacher <joerg.hifiberry@gmail.com>
To: 
Cc: a-krasser@ti.com,
	joerg@hifiberry.com,
	Joerg Schambacher <joerg.hifiberry@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: Adds support for TAS575x to the pcm512x driver
Date: Fri, 29 Sep 2023 17:07:20 +0200
Message-Id: <20230929150722.405415-1-joerg.hifiberry@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LTE7WLILRWSVQK4KDFT3WKULPEVJSJNA
X-Message-ID-Hash: LTE7WLILRWSVQK4KDFT3WKULPEVJSJNA
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:12:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enables the existing pcm512x driver to control the almost
compatible TAS5754 and -76 amplifers. Both amplifiers support
only an I2C interface and the internal PLL must be always
on to provide necessary clocks to the amplifier section.
Tested on TAS5756 with support from Andreas Arbesser-Krasser
from Texas Instruments <a-krasser@ti.com>

Signed-off-by: Joerg Schambacher <joerg.hifiberry@gmail.com>
---
 sound/soc/codecs/pcm512x-i2c.c |  4 ++++
 sound/soc/codecs/pcm512x.c     | 36 +++++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm512x-i2c.c b/sound/soc/codecs/pcm512x-i2c.c
index 5cd2b64b9337..4be476a280e1 100644
--- a/sound/soc/codecs/pcm512x-i2c.c
+++ b/sound/soc/codecs/pcm512x-i2c.c
@@ -39,6 +39,8 @@ static const struct i2c_device_id pcm512x_i2c_id[] = {
 	{ "pcm5122", },
 	{ "pcm5141", },
 	{ "pcm5142", },
+	{ "tas5754", },
+	{ "tas5756", },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm512x_i2c_id);
@@ -49,6 +51,8 @@ static const struct of_device_id pcm512x_of_match[] = {
 	{ .compatible = "ti,pcm5122", },
 	{ .compatible = "ti,pcm5141", },
 	{ .compatible = "ti,pcm5142", },
+	{ .compatible = "ti,tas5754", },
+	{ .compatible = "ti,tas5756", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm512x_of_match);
diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 89059a673cf0..aa8edf87b743 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -48,6 +48,7 @@ struct pcm512x_priv {
 	int mute;
 	struct mutex mutex;
 	unsigned int bclk_ratio;
+	int force_pll_on;
 };
 
 /*
@@ -1258,10 +1259,34 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 
-		ret = regmap_update_bits(pcm512x->regmap, PCM512x_PLL_EN,
-					 PCM512x_PLLE, 0);
+		if (!pcm512x->force_pll_on) {
+			ret = regmap_update_bits(pcm512x->regmap,
+						 PCM512x_PLL_EN, PCM512x_PLLE, 0);
+		} else {
+			/* provide minimum PLL config for TAS575x clocking
+			 * and leave PLL enabled
+			 */
+			ret = regmap_write(pcm512x->regmap,
+					   PCM512x_PLL_COEFF_0, 0x01);
+			if (ret != 0) {
+				dev_err(component->dev,
+					"Failed to set pll coefficient: %d\n", ret);
+				return ret;
+			}
+			ret = regmap_write(pcm512x->regmap,
+					   PCM512x_PLL_COEFF_1, 0x04);
+			if (ret != 0) {
+				dev_err(component->dev,
+					"Failed to set pll coefficient: %d\n", ret);
+				return ret;
+			}
+			ret = regmap_write(pcm512x->regmap,
+					   PCM512x_PLL_EN, 0x01);
+			dev_dbg(component->dev, "Enabling PLL for TAS575x\n");
+		}
+
 		if (ret != 0) {
-			dev_err(component->dev, "Failed to disable pll: %d\n", ret);
+			dev_err(component->dev, "Failed to set pll mode: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1659,6 +1684,11 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 			ret = -EINVAL;
 			goto err_pm;
 		}
+
+		if (!strcmp(np->name, "tas5756") ||
+		    !strcmp(np->name, "tas5754"))
+			pcm512x->force_pll_on = 1;
+		dev_dbg(dev, "Device ID: %s\n", np->name);
 	}
 #endif
 
-- 
2.34.1

