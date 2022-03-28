Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AF4E8BF6
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 04:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C675384B;
	Mon, 28 Mar 2022 04:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C675384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648433596;
	bh=BPo9/ymVuPa63xevNJUmqSfqUdXLcNgDTIaawN58o34=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JwsakdyxPZzWEXuHSQ7o5JN/QnLTd08ErtxfDPa1/V8luIME6dWkXQlrt/xlZ3dnN
	 N0pAqVx5/S7uzcACC1AVKIaxeh0DHzoofmUl1NNCCgNBM1m5lu8tQOX1OilPK2ORXs
	 vn5GvikSIkthXvklNKUGFBoTlBTLr/LpWYazxs9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3554DF800CB;
	Mon, 28 Mar 2022 04:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27719F8024C; Mon, 28 Mar 2022 04:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87189F800CB
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 04:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87189F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ByyC85NI"
Received: by mail-pj1-x1043.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so17327420pjb.4
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 19:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=rUHIWinBLG6g3Xi9+MUcsHpYsUZn1UkahgGOhqUSwAo=;
 b=ByyC85NIdi1Ve9pqan/WfzM2XYMfuKn3CCtZANGGya2Ss2oL4SZYsyVnf0OEXVxqM+
 NlWfBOfMsvpFMBHl8ERRxXmXQtuzccHXUlYyM9m/uRKOMCz6QzS5xAaSboA5lDQTSx2s
 yt2c+lBVhmyV/cfJpPpmzbZ+WnXCRFdcJbXGrmGyKdiEyIlle0UKaNumtHMKD09ZyvRo
 ER4DmEYTfjFQdFg2653XMB3h3c9hvLkq1PQhnPmvKj9+lAr9lO/Ptwejnqm9oYLDjgvI
 H34KW+QREWOLw0hNIHLsV5CUhGPPFHIdlB8xooOeY1/e4UyH39Zh23M1Hn6d9sJWL8np
 7Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rUHIWinBLG6g3Xi9+MUcsHpYsUZn1UkahgGOhqUSwAo=;
 b=Gdu6+jO16cJFmjTLr1g95SSgRgAMGG/4DSbPrWN/zeSdz57Icvl7fGNFNamvZKWKke
 w5yZ0+oWGyfYZz8fvjqYrY4SRQzUK3ds9Q72JFsNfDiHst8RlByt74QiDYTeET4/FThx
 nZ6OyXkIgWfJmsE4UTOr4+jVUkSrKyLrdK6xL0ZYIA4LydscS8CMDXgM3gFqRHfz7IAo
 cJhqI0PmPxHodTFdLIc59+6tqParmxC1gzR/JAzkdqlnQcqYhQv4Uihs2lGXtV2rGNLQ
 nyu0oH4EBsFWXtxf1X1aqns6KbnOpiqTwtnMSfwxodsoxaRVtQZnqMgoDcssYuQoPJop
 DNAQ==
X-Gm-Message-State: AOAM531oSU3Bspe88vnorgKPDy3E2TYgPTjUJnUEL5cXrb7TwgeHyCpY
 cI/bDL1Vn7CvpIHOKATl2qc=
X-Google-Smtp-Source: ABdhPJw/rhtmPMAo55tnqm5NaD1eJHN71Eb8+RgZ283zFRwrUZKw9etqglyxTYSO75pWg2fPCGMGdg==
X-Received: by 2002:a17:902:9a8d:b0:155:ff17:c9fc with SMTP id
 w13-20020a1709029a8d00b00155ff17c9fcmr7396091plp.28.1648433525098; 
 Sun, 27 Mar 2022 19:12:05 -0700 (PDT)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 c63-20020a624e42000000b004fa9ee41b7bsm13322058pfb.217.2022.03.27.19.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 19:12:04 -0700 (PDT)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ryans.lee@maximintegrated.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [V3 1/2] ASoC: max98390: Add reset gpio control
Date: Mon, 28 Mar 2022 11:11:38 +0900
Message-Id: <20220328021139.8700-1-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Steve Lee <steve.lee.analog@gmail.com>, krzk@kernel.org, nuno.sa@analog.com
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
index 40fd6f363f35..05df9b85d9b0 100644
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
+					     "reset", GPIOD_OUT_LOW);
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

