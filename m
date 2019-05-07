Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED8916DDE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 01:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29094181D;
	Wed,  8 May 2019 01:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29094181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557272104;
	bh=qlXx5FLmp+XR7szuaKi6H9d78vQ8zEmuQrK5WEFtEs0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M9NGm7BlsxO3fw2reJf7frnq76WlQQkGkgE8RsLe65VihSRp3ICtDvWtDd4AX3Wqg
	 ddvjDNedm2xkYfrN+iAs1pX0RPqZBnGHxz1oL4sTqOfFHn8M9YbvnCTHX7NI8khmRy
	 2quchXoHQ+3ZNnl1Cqx1CCAabPNHkSzkSoZvpo7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D1C9F89674;
	Wed,  8 May 2019 01:33:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47006F89674; Wed,  8 May 2019 01:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6DECF80726
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 01:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DECF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RTr7FOtR"
Received: by mail-pg1-x542.google.com with SMTP id h17so3101911pgv.0
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 16:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7u56jrg2cdEoBFyHiTTGn+Kv1AaPp22fLV9Ae8EXJw=;
 b=RTr7FOtR13Qy9Vp+Kc/RpoGSgbChjfXumziGOddtD32Z779+8hIInTpOSL+QZtMVSf
 KE54Yygy6ud/2kAmWl+Vj6v/KPzhqdVba4Ut+/fDholt7Xd54IHFD0HW7GVPmJY32Wh+
 YQSB5RgYmgqdfynPpsPHwjbQPi/NZGWKoot7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7u56jrg2cdEoBFyHiTTGn+Kv1AaPp22fLV9Ae8EXJw=;
 b=Jl1uM6cN4DpksyAxYqZMKDnJNMfiwjyRwRbz+o1em9VrKaMn72/p641/omAppUZ3AA
 2a1H+nmjfx5MbZuWgjhIWlU3dJyRBiGWlsBl1YlC7Y+4rhNLDFCvBD5wYbsrkXB4Gaik
 OF9pBGFQmaM/RDVbRnuSokZbDSMv4mI6FH6AE/MIxU1B5enYfm3Y5WovQgAbAAWJRWuA
 8C0hXs/CRbQhymKdjd7p3MKLMpp9ZTKRyx4oKd4JTL41xc/gJayX6AlS7XbtDq+lm7IJ
 UiUCzo/W1XiDvZFPeKHy8SAeFAHoq33tqs2Hzzu9zyfMVaZQ6iq90hk78qtHiY4Ymbxq
 n8MQ==
X-Gm-Message-State: APjAAAUq9pLvHi3NCP7JdEHOJWbX9DMzYBJljDwwTc+LIxJZIJ+yfHD9
 QG/disQXvOe1Yyihi0lkXUTJQgikZg==
X-Google-Smtp-Source: APXvYqyI+bhcFn9EpwvIMmsM3tDGUsjJEcmuRR39yVRbmFmfLgfZkgVwwNom8rdkEGW6zlEUTEDnlA==
X-Received: by 2002:a62:2e46:: with SMTP id u67mr4401163pfu.206.1557271988345; 
 Tue, 07 May 2019 16:33:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id q14sm7017873pgg.10.2019.05.07.16.33.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 16:33:07 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  7 May 2019 16:32:13 -0700
Message-Id: <20190507233213.53036-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: Add component driver name
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add name to component driver so it is possible to lookup the component
when needed.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 7 ++++---
 sound/soc/codecs/rt5677.h | 2 ++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 6fc70e441458..44071c7a4670 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4650,7 +4650,7 @@ static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
 }
 
 static const struct gpio_chip rt5677_template_chip = {
-	.label			= "rt5677",
+	.label			= RT5677_DRV_NAME,
 	.owner			= THIS_MODULE,
 	.direction_output	= rt5677_gpio_direction_out,
 	.set			= rt5677_gpio_set,
@@ -4958,6 +4958,7 @@ static struct snd_soc_dai_driver rt5677_dai[] = {
 };
 
 static const struct snd_soc_component_driver soc_component_dev_rt5677 = {
+	.name			= RT5677_DRV_NAME,
 	.probe			= rt5677_probe,
 	.remove			= rt5677_remove,
 	.suspend		= rt5677_suspend,
@@ -5079,7 +5080,7 @@ static struct regmap_irq rt5677_irqs[] = {
 };
 
 static struct regmap_irq_chip rt5677_irq_chip = {
-	.name = "rt5677",
+	.name = RT5677_DRV_NAME,
 	.irqs = rt5677_irqs,
 	.num_irqs = ARRAY_SIZE(rt5677_irqs),
 
@@ -5267,7 +5268,7 @@ static int rt5677_i2c_remove(struct i2c_client *i2c)
 
 static struct i2c_driver rt5677_i2c_driver = {
 	.driver = {
-		.name = "rt5677",
+		.name = RT5677_DRV_NAME,
 		.of_match_table = rt5677_of_match,
 		.acpi_match_table = ACPI_PTR(rt5677_acpi_match),
 	},
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 183d92b03045..11a2ffceec3b 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1674,6 +1674,8 @@
 #define RT5677_FIRMWARE1	"rt5677_dsp_fw1.bin"
 #define RT5677_FIRMWARE2	"rt5677_dsp_fw2.bin"
 
+#define RT5677_DRV_NAME		"rt5677"
+
 /* System Clock Source */
 enum {
 	RT5677_SCLK_S_MCLK,
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
