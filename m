Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAC74D7B1A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:01:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E461719;
	Mon, 14 Mar 2022 08:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E461719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241261;
	bh=dc403R4uadsYJ63QhpR1U+pgr79miaY5qCDVcUZ62MY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KS7xKe/4ANP1YXY2NvnrybMkZiyZ1z5TExyAkaUR0cwYWg8QDaf4O5Qbzz4Vy+t8D
	 H/Dv53h51bKiGd6Oinx6MoIzUXdfhVrDjanBQHT8Bc7vqu6OMa4jpttS9q2pgNf/l3
	 FDQ7x8cNBqe9n7O3HksK7U/2ENuoZAp7SE5W8pHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EEE3F8051B;
	Mon, 14 Mar 2022 07:58:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F797F80227; Fri, 11 Mar 2022 14:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 728B0F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 14:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728B0F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CI2lfgcC"
Received: by mail-pj1-x1042.google.com with SMTP id v4so8175764pjh.2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 05:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=lWnNWcx+SboqtPq9WI7B/BLf7BDyEwBuicgeSMUjIxY=;
 b=CI2lfgcC0JOTIFvd4yDLT3+LWmWjTs5HWYaKKWWWBU97Q9NR/plDDe0BG3emS2zFKB
 +PJDSRQC719268FrWzd6QkLdlmk0gVmCBDJok4gCU8MnZ/0SRRUhP0gGlKoebPC+zHzO
 zOQRl9LlHG6abAWeq3UVrxPIE/ip2pXQRjjjb9O5VwHcZG1FCNZTU/DuAxpPk9S7v2J8
 PvnhwSHFwfCvh6aX1eBI5E6w+9QtXlEam++fKNpT6NmS/HpMMKfCg3QngORtBnRb/f2M
 YLQXFYXmISlNn/Few8+6us2FBav5lVbBA9/3HjYoS9YLk/IVlPUywlRlU9ayBI30Ih/s
 Yn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lWnNWcx+SboqtPq9WI7B/BLf7BDyEwBuicgeSMUjIxY=;
 b=TUp/GYCGxFSdtjsJ1MfdcTd9BgKbGOeeUKDxkxrfiFNCouw1R9DYfV/73YLbH2tG9Q
 777RqCdj96gH0WJDL6UnV1v7KiJ/Zyt9t296lSgyB1pve7ygW3Y0ijzpXYDJfXFh956C
 AlS7/4omvhb7Peshhdxc2ssQg9a3dUG5iATLq895iAO+N+JWN8pxRA/DVYMV1gpHOw9g
 6gU7RNDYAm3mjuTNtjqOAsU1zz2RQLluoIXvMur4pi+cRhKZhrOJovA8TDucS9qS2p+U
 9P/zjsdDzwoSooreNg759Ovo1q8otYf7nDCQh+Ry3JK7RX+7o+YxQqup+c0aaDW07FUs
 lnVA==
X-Gm-Message-State: AOAM531QuQqtOd+3nrfMRyJG/sIj08BrfDuGB5CY5tfmIJe3zRdhSKGG
 me0lPV1GztssSwhKRAFKD6U=
X-Google-Smtp-Source: ABdhPJwNo2sTsZyi47iCLuC+XNJ4MMfgBohTLUQ/Ge/2csyWYtjNvf7ShW0r3I+OCg63OmoQHP2JUw==
X-Received: by 2002:a17:902:b490:b0:14c:da4a:deca with SMTP id
 y16-20020a170902b49000b0014cda4adecamr10745394plr.134.1647005392946; 
 Fri, 11 Mar 2022 05:29:52 -0800 (PST)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056a0016d100b004c34686e322sm11319934pfc.182.2022.03.11.05.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 05:29:52 -0800 (PST)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [V2 1/2] ASoC: max98390: Add reset gpio control
Date: Fri, 11 Mar 2022 22:29:05 +0900
Message-Id: <20220311132906.32292-1-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: Steve Lee <steve.lee.analog@gmail.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ryans.lee@maximintegrated.com
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

 Add reset gpio control to support RESET PIN connected to gpio.

Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
---
 sound/soc/codecs/max98390.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index b392567c2b3e..5c6162701667 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 
 	struct max98390_priv *max98390 = NULL;
 	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
+	struct gpio_desc *reset_gpio;
 
 	ret = i2c_check_functionality(adapter,
 		I2C_FUNC_SMBUS_BYTE
@@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	reset_gpio = devm_gpiod_get_optional(&i2c->dev,
+						"maxim,reset-gpios", GPIOD_OUT_LOW);
+
+	/* Power on device */
+	if (reset_gpio) {
+		usleep_range(1000, 2000);
+		/* bring out of reset */
+		gpiod_set_value_cansleep(reset_gpio, 1);
+		usleep_range(1000, 2000);
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98390->regmap,
 		MAX98390_R24FF_REV_ID, &reg);
-- 
2.17.1

