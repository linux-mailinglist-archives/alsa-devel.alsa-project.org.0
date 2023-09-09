Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3827997D4
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 14:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC491E2;
	Sat,  9 Sep 2023 14:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC491E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694261087;
	bh=Jj3IsyooumPuqHC0KqUZLtsQSeRLdLgzl/NMKjI8kbE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rl/LT6s01gha+srfy/IvjaYnc7r+u/e4038BzXompg+rweiBYxUnKjB7YCMmBHuoe
	 RZLDVJMIjlt7RkvRkeU7BJJW773sQWAZUAzkSJmSmCzePfChiLVINDGuoMzJtYE8JX
	 P2DNnCxZER4jovLgDThQm5mLbcUZtkErjqxZD7j8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE6A2F80549; Sat,  9 Sep 2023 14:03:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F780F8047D;
	Sat,  9 Sep 2023 14:03:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AAFAF80494; Sat,  9 Sep 2023 14:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D74ACF800F5
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 14:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D74ACF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=NgVEepDf
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68bec3a9bdbso2259667b3a.3
        for <alsa-devel@alsa-project.org>;
 Sat, 09 Sep 2023 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694260961; x=1694865761;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NNvJwlKaaEpene3hYwihaclJlQcxiYMKhd0xVHXQVBw=;
        b=NgVEepDf2l7aoLj+8Yl4fSdm14erfs3hXeXUYVr4ZjEhbgpsgitA1zcaj82QoqQoow
         t4rA3gChAVdbj5nhI0iE6VF6ZT6Kw0qhH00uxfaHeMlCepfh8s7/fP0wIxypHFbNrx/O
         w/700l2ByFqHibLZASglaAJspABuO6MkFwOnw8x4Vz7jIGlZJAILTMl+rsIjw/fA/sc+
         6SbgMfZihEdCBWLqOvAghDiK156HcxEces8yrDSHlHFf1mdLsEazQW10jMHok9dldfbf
         kJrzIjuQj5QwIofFqA2OUv2jNB9Yq1azkkxeRNDx0o4nBuV6cjjjk1se4Ovbx10SyHek
         YVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694260961; x=1694865761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNvJwlKaaEpene3hYwihaclJlQcxiYMKhd0xVHXQVBw=;
        b=TKQ1mPGOa4Ncp1TNAiTQ0bqIsJI8QUkGsM09T3bXTCMPFAt7j6YB4bwfAGg028ySxU
         TBF/6lAcbyjkd0ooXKqyg1hGwqvfuElaJJmYPSrI28bQWyE0+c7U4wbZTJDQ9Rlb0lPN
         O+MwAhtJOu6p2oso8CvAdCYS5SMpfZY5uOg2jDTYu8SKru0afhUlUcMLTFALw6wz50xf
         tluI36S2epjJpeFYhrvR8ihaCUh+Im6KOqeWxM+bq1XZlfvMbsuKeq5yz393NYDg6TmK
         GwYeDzfoSa7IDUkmw6iH9xq+1bNF6Knw+KUn6pl85DnDEJi9zXuFyk7hXsGtpBqUwI57
         /a7A==
X-Gm-Message-State: AOJu0YyeyiZDTR4bepddwb2tkGYy63wC6ciant6lrP2MkVhlUKn4xYoB
	dU7vWUDbmvPog7ft3Mdd9js=
X-Google-Smtp-Source: 
 AGHT+IGV7wsSQZ8gM7uM2NiGxc6j/PbI14YYzMboVpAXGs4115SPsQ1Lllx9LIRYLsg46MDkbWVtnA==
X-Received: by 2002:a05:6a00:851:b0:68e:2da7:6b0d with SMTP id
 q17-20020a056a00085100b0068e2da76b0dmr4870688pfk.1.1694260961156;
        Sat, 09 Sep 2023 05:02:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a63b801000000b0056368adf5e2sm2576176pge.87.2023.09.09.05.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 05:02:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Fabio Estevam <festevam@denx.de>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm8960: Fix error handling in probe
Date: Sat,  9 Sep 2023 05:02:37 -0700
Message-Id: <20230909120237.2646275-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XPXYDJKO7HF6LN5S5WRZMHOJTNSIEARD
X-Message-ID-Hash: XPXYDJKO7HF6LN5S5WRZMHOJTNSIEARD
X-MailFrom: groeck7@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPXYDJKO7HF6LN5S5WRZMHOJTNSIEARD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 422f10adc3eb ("ASoC: wm8960: Add support for the power supplies")
added regulator support to the wm8960 driver, but neglected to update
error handling in the probe function. This results in warning backtraces
if the probe function fails.

WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2396 _regulator_put.part.0+0x1b4/0x1d8
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.5.0-11075-g92901222f83d #1
Hardware name: Freescale i.MX6 Ultralite (Device Tree)
 unwind_backtrace from show_stack+0x10/0x14
 show_stack from dump_stack_lvl+0x68/0x90
 dump_stack_lvl from __warn+0x70/0x1a4
 __warn from warn_slowpath_fmt+0xac/0x220
 warn_slowpath_fmt from _regulator_put.part.0+0x1b4/0x1d8
 _regulator_put.part.0 from regulator_bulk_free+0x44/0x64
 regulator_bulk_free from release_nodes+0x50/0x7c
 release_nodes from devres_release_group+0xbc/0x138
 devres_release_group from i2c_device_probe+0x180/0x268
 i2c_device_probe from really_probe+0xc4/0x2e0
 really_probe from __driver_probe_device+0x84/0x1a0
 __driver_probe_device from driver_probe_device+0x2c/0xc4
 driver_probe_device from __driver_attach+0x94/0x144
 __driver_attach from bus_for_each_dev+0x70/0xc4
 bus_for_each_dev from bus_add_driver+0xc4/0x1cc
 bus_add_driver from driver_register+0x7c/0x114
 driver_register from i2c_register_driver+0x3c/0xac
 i2c_register_driver from do_one_initcall+0x68/0x3b0
 do_one_initcall from kernel_init_freeable+0x18c/0x240
 kernel_init_freeable from kernel_init+0x14/0x144
 kernel_init from ret_from_fork+0x14/0x24

Add the missing calls to regulator_bulk_disable().

Cc: Fabio Estevam <festevam@denx.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Fixes: 422f10adc3eb ("ASoC: wm8960: Add support for the power supplies")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 sound/soc/codecs/wm8960.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 0a50180750e8..7689fe3cc86d 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1468,8 +1468,10 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 	}
 
 	wm8960->regmap = devm_regmap_init_i2c(i2c, &wm8960_regmap);
-	if (IS_ERR(wm8960->regmap))
-		return PTR_ERR(wm8960->regmap);
+	if (IS_ERR(wm8960->regmap)) {
+		ret = PTR_ERR(wm8960->regmap);
+		goto bulk_disable;
+	}
 
 	if (pdata)
 		memcpy(&wm8960->pdata, pdata, sizeof(struct wm8960_data));
@@ -1479,13 +1481,14 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 	ret = i2c_master_recv(i2c, &val, sizeof(val));
 	if (ret >= 0) {
 		dev_err(&i2c->dev, "Not wm8960, wm8960 reg can not read by i2c\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto bulk_disable;
 	}
 
 	ret = wm8960_reset(wm8960->regmap);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to issue reset\n");
-		return ret;
+		goto bulk_disable;
 	}
 
 	if (wm8960->pdata.shared_lrclk) {
@@ -1494,7 +1497,7 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 		if (ret != 0) {
 			dev_err(&i2c->dev, "Failed to enable LRCM: %d\n",
 				ret);
-			return ret;
+			goto bulk_disable;
 		}
 	}
 
@@ -1528,7 +1531,13 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_wm8960, &wm8960_dai, 1);
+	if (ret)
+		goto bulk_disable;
 
+	return 0;
+
+bulk_disable:
+	regulator_bulk_disable(ARRAY_SIZE(wm8960->supplies), wm8960->supplies);
 	return ret;
 }
 
-- 
2.39.2

