Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FB797327
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 16:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82F3684B;
	Thu,  7 Sep 2023 16:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82F3684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694098074;
	bh=9Zx7zIB3NC7A7DJJ71yax4wSukRrrdP6dqPNKKLTXb0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q4kBDoGNSXAongIdaZCndG3OoPVuueitzUGnl2zg0h8KIU1Q6TgK0fi8O02jHqi//
	 wrrWmUck4+fsUQaST1V6KZulK3GxIGyjJWDBaRNKf4wLkWAr231h5QL/Hhw8DsB+kB
	 iYhOlZcoh7gugK1rOtccGi9QpXbdmk8CkITXi6CM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87043F8055C; Thu,  7 Sep 2023 16:47:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14729F80558;
	Thu,  7 Sep 2023 16:47:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF46BF80494; Thu,  7 Sep 2023 16:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C36CF800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 16:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C36CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FB73sLsz
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so134009966b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Sep 2023 07:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694097666; x=1694702466;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jYT9kLob9nPIyNfblhvoxqGynMI2Une8KMJHJA8vZY=;
        b=FB73sLszcUF/4KYecWc0cbM2BjXivDiPMPOB9cuDBaQBZrymyFG88xS4r5ZMd6OFmr
         4oRLE6k90L2PBsg2YIRUswnpOyc+W+klYcTAQ+zHA8qIyn3exJWqs83qEUJ6RohwrRo2
         by4bfFDMTbqyqXr/ng5mvXhNJAJtHsRRFrOV0UXtjvBOkvOGoeByAafX1c+vEQX9A5o8
         njKX0K1Mr/gRZXYw3SnEdg4W3Yq52ND1Ts8N2E3CwWk9HdIEXZZnEh2s0uWtGNjUdcqM
         8px26N0HekMbxXo3MSsPaAs4c/7kxo6hzikY8/QcqTCC4c7Icf0L8NmpjPtFWFTgtSZF
         P88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694097666; x=1694702466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jYT9kLob9nPIyNfblhvoxqGynMI2Une8KMJHJA8vZY=;
        b=IAfOI5QdBpbRMph0ZZ0wW0udMgodkeuweQN9QV6fgGR5ON7FjlHJ8Rny0nY1DMJjmj
         McoVRMPx6ZJn7TqgVj3Ax13AFw90UF54Di78E1ZCpicImDmFvA74nkabI2FBpTeUxWbX
         LhPm2gk0RixmHRWKF7E+5HTK1IGXh6YjTuM6EhS/RDrXytcqmZl6aBMOkNmKOZ7zJZ/w
         yunYC3BToCEf8m+SrioQhzmW35TuAiMg17x7Gq1kVEplenFwad2d0sskqieHh/rp7ygD
         neQdgKtQS8iGuVPiVz4iE2u4s+o7T0k7TAn+YSyjb4rvnfxjVIZTS75CYsfNgEpfzBLP
         QaGQ==
X-Gm-Message-State: AOJu0Yya8A73bbHoptb14uBIM0w2ZhqDVtCN9Vi52KDBUgzj1sxtvtvm
	tpu7znTg1K6pY9V3FkFoMOyDzbhuj+mG9g==
X-Google-Smtp-Source: 
 AGHT+IHXkIuf9N5nGW89maqgby2dHVDbA33YMaEwj4MhkYrRiH8QkzU9VivmJGE2z/24H72fIGHDbw==
X-Received: by 2002:a05:600c:2611:b0:3fb:c9f4:150e with SMTP id
 h17-20020a05600c261100b003fbc9f4150emr4910559wma.14.1694095934657;
        Thu, 07 Sep 2023 07:12:14 -0700 (PDT)
Received: from localhost ([2a02:810d:1640:10d8:bdda:474a:9786:1e73])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a7bc4c1000000b003fe1a092925sm2612137wmk.19.2023.09.07.07.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 07:12:14 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: Adds support for TAS575x to the pcm512x driver
Date: Thu,  7 Sep 2023 18:12:05 +0200
Message-Id: <20230907161207.14426-1-joerg.hifiberry@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DCSHHWTHJAQLSEI3TA4WZ3ALRQCGXG6G
X-Message-ID-Hash: DCSHHWTHJAQLSEI3TA4WZ3ALRQCGXG6G
X-Mailman-Approved-At: Thu, 07 Sep 2023 14:46:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCSHHWTHJAQLSEI3TA4WZ3ALRQCGXG6G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/soc/codecs/pcm512x.c     | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 35 insertions(+), 3 deletions(-)

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
index 89059a673cf0..9aa9be2dbdb2 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -48,6 +48,7 @@ struct pcm512x_priv {
 	int mute;
 	struct mutex mutex;
 	unsigned int bclk_ratio;
+	int tas_device;
 };
 
 /*
@@ -927,6 +928,20 @@ static int pcm512x_set_dividers(struct snd_soc_dai *dai,
 		bclk_div = DIV_ROUND_CLOSEST(sck_rate, bclk_rate);
 
 		mck_rate = sck_rate;
+		if (pcm512x->tas_device) {
+			/* set necessary PLL coeffs for amp
+			 * according to spec only 2x and 4x MCLKs
+			 * possible
+			 */
+			ret = regmap_write(pcm512x->regmap,
+					   PCM512x_PLL_COEFF_0, 0x01);
+			if (mck_rate > 25000000UL)
+				ret = regmap_write(pcm512x->regmap,
+						   PCM512x_PLL_COEFF_1, 0x02);
+			else
+				ret = regmap_write(pcm512x->regmap,
+						   PCM512x_PLL_COEFF_1, 0x04);
+		}
 	} else {
 		ret = snd_soc_params_to_bclk(params);
 		if (ret < 0) {
@@ -1258,10 +1273,18 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 
-		ret = regmap_update_bits(pcm512x->regmap, PCM512x_PLL_EN,
-					 PCM512x_PLLE, 0);
+		if (!pcm512x->tas_device) {
+			ret = regmap_update_bits(pcm512x->regmap,
+						 PCM512x_PLL_EN, PCM512x_PLLE, 0);
+		} else {
+			/* leave PLL enabled for amp clocking */
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
@@ -1659,6 +1682,11 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 			ret = -EINVAL;
 			goto err_pm;
 		}
+
+		if (!strcmp(np->name, "tas5756") ||
+		    !strcmp(np->name, "tas5754"))
+			pcm512x->tas_device = 1;
+		dev_dbg(dev, "Device ID: %s\n", np->name);
 	}
 #endif
 
-- 
2.34.1

