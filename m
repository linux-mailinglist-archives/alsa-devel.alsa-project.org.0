Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73A34D7B15
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:00:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D8B716FE;
	Mon, 14 Mar 2022 07:59:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D8B716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241201;
	bh=2IRaH/n8k7QrZ1lJeEoUzQCSsZ7NJCpArTCQdx1lCRg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uaNfq9zlwTypeVpvHDCBGY8phwhWd2Eh3Tl33zC6aXnvawhJVM6X5KkxxXDqb8hYc
	 0IsNOSfFU2BepE4vozQFfwoWbf4pnKnMY61AmcdwXdBCFOX/MSibzHqqE61OCl9Sei
	 o5mKwfJB5qKyCyeSTq2LLME9JnBq1mHPEiH8przA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5469F80139;
	Mon, 14 Mar 2022 07:58:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E27F9F80137; Thu, 10 Mar 2022 09:16:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5CFAF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 09:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5CFAF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FSykQPtD"
Received: by mail-pj1-x1043.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so4546620pjl.4
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 00:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=UqlG/qlH51JzZZsCgyFBRJweMGZD26FahP+uwp4r9BQ=;
 b=FSykQPtDCQ1wMMLVzooyDgNeZvg0vebosc8YpUWUKsz0xMGoHdez5Xrx+9YJDKnn+i
 rD3Xmudvj5gGZ3vlviX0TbDh/pwPZSic27LxDN1LUg7XX5NneYzM4QgwtA7ncuVzSU/w
 6uJ/5RDzmnKepU4FdBxQw3ZKXBZbM19S1BVWvAHXx8e9Kv/faT43TvyHEaozwqwUb78b
 jjxirwC/D84rrn03DOKiYMjYmjsyFIDm6Fm+KBaFHWogt3sph4RL+FJHK9DMQT7adsZs
 N0/Fz1JPrd30+TkezrquUviXm3ls1n2RDbOvZNXcg+0RnQy96wxXfqE1RHYZUF/Um+s4
 vocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UqlG/qlH51JzZZsCgyFBRJweMGZD26FahP+uwp4r9BQ=;
 b=6moP20xAmdIFQGTpgIPI9eCY7rfjDKKzYgwBD4pm8YXtLg65wutCXVN0HKE2TncWM4
 be+PJVfVwL5aev4zJp8sAYdFYbNM/+EsBwuLDsL2DYLyZNp6xqVrAaG1c+PgPoyjD/Yi
 Xd3CRgEFkoUahSnhsp7UDHsk1KBgMh4IPvW723DMBKDxMI1qWQgVS+p4jtEf5XMmDGjk
 C8lpft5ERSm958AP/qjDUy57UahRBAJA7t3gL2C7wErPctkBnExTgqkdIF8wpCKn1D/o
 6C/9YrQeI7VHKqyC0YeUNdQycOHEpOtC/PT/gZYS+DSAzRbDvnEzASuDREBktyWBlAe3
 fqbA==
X-Gm-Message-State: AOAM533dgu4nNCV4rz/2pmBlJKafTKR10x80y2TdKnFXrdHVPgFQEJQl
 /KS7U91FZYKTB7/ufqInIP8=
X-Google-Smtp-Source: ABdhPJy00iGjkiSnCAWiH3WRRptw5KPM3DJ86R40tXtln3/EFo+qhm9Ikg+kT6B002zR9EzRfyoDlw==
X-Received: by 2002:a17:902:d4c9:b0:151:d074:cbe8 with SMTP id
 o9-20020a170902d4c900b00151d074cbe8mr3840413plg.102.1646900163675; 
 Thu, 10 Mar 2022 00:16:03 -0800 (PST)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a056a00084b00b004f73e6c26b8sm5976727pfk.25.2022.03.10.00.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 00:16:03 -0800 (PST)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, geert@linux-m68k.org,
 rf@opensource.wolfsonmicro.com, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, krzk@kernel.org, dmurphy@ti.com,
 jack.yu@realtek.com, nuno.sa@analog.com, steves.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: max98390: Add reset gpio control
Date: Thu, 10 Mar 2022 17:15:48 +0900
Message-Id: <20220310081548.31846-1-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: Steve Lee <steve.lee.analog@gmail.com>
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
 sound/soc/codecs/max98390.c | 18 ++++++++++++++++++
 sound/soc/codecs/max98390.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index b392567c2b3e..574d8d5f1119 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1073,6 +1073,24 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	max98390->reset_gpio = of_get_named_gpio(i2c->dev.of_node,
+						"maxim,reset-gpios", 0);
+
+	/* Power on device */
+	if (gpio_is_valid(max98390->reset_gpio)) {
+		ret = devm_gpio_request(&i2c->dev, max98390->reset_gpio,
+					"MAX98390_RESET");
+		if (ret) {
+			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
+				__func__, max98390->reset_gpio);
+			return -EINVAL;
+		}
+		gpio_direction_output(max98390->reset_gpio, 0);
+		usleep_range(1000, 2000);
+		gpio_direction_output(max98390->reset_gpio, 1);
+		usleep_range(1000, 2000);
+	}
+
 	/* Check Revision ID */
 	ret = regmap_read(max98390->regmap,
 		MAX98390_R24FF_REV_ID, &reg);
diff --git a/sound/soc/codecs/max98390.h b/sound/soc/codecs/max98390.h
index c250740f73a2..5518f2340247 100644
--- a/sound/soc/codecs/max98390.h
+++ b/sound/soc/codecs/max98390.h
@@ -655,6 +655,7 @@
 
 struct max98390_priv {
 	struct regmap *regmap;
+	int reset_gpio;
 	unsigned int sysclk;
 	unsigned int master;
 	unsigned int tdm_mode;
-- 
2.17.1

