Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D27A759F3C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 22:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF044E;
	Wed, 19 Jul 2023 22:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF044E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689797082;
	bh=YhWcwADv1PmexVyGSD+wzZo5vH7wl1ARcGUgEcfxtZE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VxGu4sdloH7y1Aw/l+15wEXubHM1uMrrFzdsqRwYlMbK0y9SApr1WEmXwdMUZ4oYG
	 35ORjIB2zfd9dLN4DW//mLg581LArCHmpcgrnnFVEF5G5jvMfJOxus/CfpVQoaE5wT
	 kVy0eaTJ7enoOsnY7dQ+EevWD9PWblUgJ9OzLp6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C35BF804DA; Wed, 19 Jul 2023 22:03:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52CACF8032D;
	Wed, 19 Jul 2023 22:03:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B0CAF8047D; Wed, 19 Jul 2023 22:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73A28F80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 22:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A28F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Wjxt1zwN
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1ba2e911c24so70042fac.0
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jul 2023 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689797020; x=1692389020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qWSsNFba9oUv/FScx3zdSbWldRujPp4lpJvUZYeuiSU=;
        b=Wjxt1zwNO5cM+fN0gsoUnLeecCGrjqeRSyY2c7z0gRycqeSv3jSSKvVlyjU/98wiTk
         JyMAUd/rM0kh+Rklnlu6b7NE3fD/NWk95f0E1uQ/Hujs/HNnvGi19p73ycgiYadwcym3
         Vlzdrceion6WI/4k9LGb54YCMQy1Nbt/AnhHeEwsQWikLe5cCo6ge/nSVT23STI7pzze
         L/bO1aJkBnFbdWQAPZRj/f4CZkgXIiF41FeJVtygl4/XZDA7LGj+RgaxCTinJpKvUX6B
         hI37VlghRURpiGPCE2CPzOBlBS9UOoHJihTInm8LDjm9aAAUN91bdqsfsWD61gfAybT7
         RLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689797020; x=1692389020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWSsNFba9oUv/FScx3zdSbWldRujPp4lpJvUZYeuiSU=;
        b=IA2e+mj8WdcCu4UHoDPpd/F/oHv5VJDiRqNcSijQOwILKj4gjm/PN/9vmtC+pq2DOZ
         z98nA50sXJCh/VR2QCIj99DznST9YOmswf9VdEY+4y7V+Rm8gnTIIhjtTlW9dRU5TyJ4
         BZp2hrUEqgMdDfo8PXBC2FScDabUp9b84SA/mQci1WvQfim7n5OeBw97UN+9Rj1Ui/c6
         okxEmiM0XwFCPJ3ZOYeSclyKAs16iS6gY/yW+lZNE8ldntmIOgpGoe6O6pqp2II9Miyx
         own9PQVbzgnECruruHj6P7ITrFyEDPxw4ajpQa9NBIX4b0Z1QOLUN23hmIKcFBShkeAa
         zTqg==
X-Gm-Message-State: ABy/qLb+fq9CD+IGPYyh8r5PiCYiQ2N8KB/zjv167KZGUDGu3xf2S1Z7
	MIgNJByygE1Z//ab4Z/MtXo=
X-Google-Smtp-Source: 
 APBJJlHVHGWOAVllrZYZzwR6gn4Ncl+JjHNugXsy56HPiv8isZ/45/aboLGsJABGZtS4EM7dsVSpBw==
X-Received: by 2002:a05:6870:e391:b0:1b0:1225:ffb5 with SMTP id
 x17-20020a056870e39100b001b01225ffb5mr2461352oad.16.1689797019957;
        Wed, 19 Jul 2023 13:03:39 -0700 (PDT)
Received: from policorp.cardumecowork.local ([177.91.232.53])
        by smtp.gmail.com with ESMTPSA id
 y4-20020a056870388400b001b3538afd01sm2238749oan.51.2023.07.19.13.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 13:03:39 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wtli@nuvoton.com,
	u.kleine-koenig@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ASoC: nau8821: Add DMI quirk mechanism for active-high
 jack-detect
Date: Wed, 19 Jul 2023 17:02:41 -0300
Message-Id: <20230719200241.4865-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5BXZSSNHGUH43ZPCDPLFCFE2UPQWLCZY
X-Message-ID-Hash: 5BXZSSNHGUH43ZPCDPLFCFE2UPQWLCZY
X-MailFrom: edson.drosdeck@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BXZSSNHGUH43ZPCDPLFCFE2UPQWLCZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a quirk mechanism to allow specifying that active-high jack-detection
should be used on platforms where this info is not available in devicetree.

And add an entry for the Positivo CW14Q01P-V2 to the DMI table, so that
jack-detection will work properly on this laptop.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/soc/codecs/nau8821.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 96d75882b33a..ca6beb2d2649 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -25,6 +26,13 @@
 #include <sound/tlv.h>
 #include "nau8821.h"
 
+#define NAU8821_JD_ACTIVE_HIGH			BIT(0)
+
+static int nau8821_quirk;
+static int quirk_override = -1;
+module_param_named(quirk, quirk_override, uint, 0444);
+MODULE_PARM_DESC(quirk, "Board-specific quirk override");
+
 #define NAU_FREF_MAX 13500000
 #define NAU_FVCO_MAX 100000000
 #define NAU_FVCO_MIN 90000000
@@ -1792,6 +1800,33 @@ static int nau8821_setup_irq(struct nau8821 *nau8821)
 	return 0;
 }
 
+/* Please keep this list alphabetically sorted */
+static const struct dmi_system_id nau8821_quirk_table[] = {
+	{
+		/* Positivo CW14Q01P-V2 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "CW14Q01P-V2"),
+		},
+		.driver_data = (void *)(NAU8821_JD_ACTIVE_HIGH),
+	},
+	{}
+};
+
+static void nau8821_check_quirks(void)
+{
+	const struct dmi_system_id *dmi_id;
+
+	if (quirk_override != -1) {
+		nau8821_quirk = quirk_override;
+		return;
+	}
+
+	dmi_id = dmi_first_match(nau8821_quirk_table);
+	if (dmi_id)
+		nau8821_quirk = (unsigned long)dmi_id->driver_data;
+}
+
 static int nau8821_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -1812,6 +1847,12 @@ static int nau8821_i2c_probe(struct i2c_client *i2c)
 
 	nau8821->dev = dev;
 	nau8821->irq = i2c->irq;
+
+	nau8821_check_quirks();
+
+	if (nau8821_quirk & NAU8821_JD_ACTIVE_HIGH)
+		nau8821->jkdet_polarity = 0;
+
 	nau8821_print_device_properties(nau8821);
 
 	nau8821_reset_chip(nau8821->regmap);
-- 
2.39.2

