Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9425A50804F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 06:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230811877;
	Wed, 20 Apr 2022 06:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230811877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650430225;
	bh=y0F1fLzeSJ9EcKU267noV2/Ykxt51nRAovHA5aiyRQ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K0p75+Vvs/6ASoWyri5sQCOW9na+5VtCh5JvU721HroFOKJH5/+5OhlQ5cli5AEc/
	 V96vltPjwJieXLx78D4UoV0nTjp4hZi1L/ON6ydMAEC5G9S/0h3xpgf7MIH2Vi7Eei
	 YCDwoQRrWhrjUiJZE5P80eg//Pc2kOf/OGyEqFj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79BABF800F8;
	Wed, 20 Apr 2022 06:49:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FFFDF80125; Wed, 20 Apr 2022 06:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF53F8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 06:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF53F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c4KMrt+f"
Received: by mail-pg1-x52e.google.com with SMTP id g9so514692pgc.10
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 21:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=F+SNI6ZhHsirUO9usNliSeUPedFWMdKyf9VNSlCdVbY=;
 b=c4KMrt+fwRje0c7WzOZQubm2Gpc13Z+BKkK+K6SoqWf7LTdw68mI7t6Z6Cfkf0TiNY
 E7i0SuiB9EPgX5yUoFfspleKuNib8po0ItT5myeK3+qa8+42qE+H8nU2kJGn/83rn0RO
 U6470hFqvwycQn3JUTjwSRiZRi23veobH195i9RNCtKheEiP9swwicPa98xfYFQr9Odm
 M6Gpa8ooYnX16610o0STT8AZonBO+AIN9hv/vT9CAA+tqI0alSbfsECfuAaarafNQdla
 /ZNBd+z7RkgpVxQpEBzFvQ7GB5cU5d7yq41zo9KwurtZVN6u15jPDaPk4Epms02+jbFr
 XyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=F+SNI6ZhHsirUO9usNliSeUPedFWMdKyf9VNSlCdVbY=;
 b=s6ws2y5CQop3hUu0qxzvglELUY5GtVkIVI/C8HGAWV2C4LW2pdoum3LcTnjkOI5+ML
 RPtcBem/vyuWxqw3H4DEWa0bBRJY4/cVO5uM+sQC1tzOACIdBBmySDyM7N03KYIA4nIL
 FqdkpbTCTjHP76WvW0lh591/CLRhTNCloQpOlh4ZJL5qfTE2YwoYR9r1mpJCZ4HZL/5J
 WK9isifAfkevAyGsiaR4H3QTNpEcDrfekmL4Io3VsVg4qryUavQTMFaw6rZBwAfFbqY+
 EsPUSV3ASLn6EApDiav5TM7SeDiaMFiFsesSrFzbJ5YLB8vpkm4UZyULfamZQIMMueva
 nEWw==
X-Gm-Message-State: AOAM532PmgyPLnkdrYcNj8WYxMIQD1SuyDU1rVxfTD1+W/vPinpcohZQ
 shBFUDlFbh6l1PxdjeZb6SM=
X-Google-Smtp-Source: ABdhPJyRBK4IecUu8kA+XNAbcJU+Yc1QJ5QFkvvT2Vi+gKVJH9tNsi1WUtHoYam7N5VPv83WMhxMag==
X-Received: by 2002:a05:6a00:2442:b0:4fd:8b00:d2f with SMTP id
 d2-20020a056a00244200b004fd8b000d2fmr21364305pfj.39.1650430155675; 
 Tue, 19 Apr 2022 21:49:15 -0700 (PDT)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056a001bc300b0050a7b7257b2sm7957225pfw.25.2022.04.19.21.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 21:49:15 -0700 (PDT)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [V4 1/2] ASoC: max98390: Add reset gpio control
Date: Wed, 20 Apr 2022 13:48:59 +0900
Message-Id: <20220420044900.2989-1-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Steve Lee <steve.lee.analog@gmail.com>, ryans.lee@analog.com,
 krzk@kernel.org, nuno.sa@analog.com
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
V3 -> V4: change reset gpio control as GPIO_ACTIVE_LOW in DT

 sound/soc/codecs/max98390.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 40fd6f363f35..bdfd6cccc3d2 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 
 	struct max98390_priv *max98390 = NULL;
 	struct i2c_adapter *adapter = i2c->adapter;
+	struct gpio_desc *reset_gpio;
 
 	ret = i2c_check_functionality(adapter,
 		I2C_FUNC_SMBUS_BYTE
@@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	reset_gpio = devm_gpiod_get_optional(&i2c->dev,
+					     "reset", GPIOD_OUT_HIGH);
+
+	/* Power on device */
+	if (reset_gpio) {
+		usleep_range(1000, 2000);
+		/* bring out of reset */
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		usleep_range(1000, 2000);
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98390->regmap,
 		MAX98390_R24FF_REV_ID, &reg);
-- 
2.17.1

