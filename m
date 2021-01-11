Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D92F0C99
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 06:46:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8DF16E2;
	Mon, 11 Jan 2021 06:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8DF16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610343964;
	bh=oK6p84HgXciQhiheBe3wdjlHfjFMNxr84zV5ScyYXp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oatHotYEasfsPJdV5cn+pnl8iyeU9DO/WKaGEJGWNDzKgZLB/R4pEA9J6yRYfNp+5
	 zzYGmBTCie8GhGu7AUB3V3py+EtljipQT03/CcOpRevRAFEmNsbiH6FbbfcDlY08En
	 9UUOHHbWw4u3NnndO3a2FOFAc69gLW+rlncbK06Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C6FF804CC;
	Mon, 11 Jan 2021 06:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 527F1F804C3; Mon, 11 Jan 2021 06:43:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36603F8013D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 06:43:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36603F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="bMYkSxqT"
Received: by mail-pl1-x62d.google.com with SMTP id s15so8905711plr.9
 for <alsa-devel@alsa-project.org>; Sun, 10 Jan 2021 21:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMbpkW+eDXvGxzeNZGTUiKWxTza0cLDoP13Yb/fIyl0=;
 b=bMYkSxqTeyYPFRk6Pfhz8CMPrfkdIVqEnaZkjx1A4NiD1G+SHQEprLWePzbTtRwymi
 fMaIewmflTMKlejsp93dOcWFtmUsjPgOrwVK8V6Yjozj97JaJ+fqxKzMOSXquPQdI6Ug
 kTDL5H0AcoGMeJdiiutVJZfR7YcSyhbWh9UkSvEagAITkBE9zU9jeMG9kS0krud9XtoJ
 CKRFE3EtENUvtI5URUlxcL7hWZnGhzLMuKU58qs09hdOipghLraS/CvfZNkbPxDTf41h
 KEAie9QCB1noHHWvOsJn5rOz687whaEmKaClr0jgvcS3g5YlSDcNcCWvle7E3hPKOiHz
 EFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMbpkW+eDXvGxzeNZGTUiKWxTza0cLDoP13Yb/fIyl0=;
 b=KhvmBPMrBj3JSMz789bk0j6IriVzJ3rkklNqDdMDgaL1wW12WRAQNGSzBNKqnag2vn
 FngjcXxQUT8vSyiYh1ibCHvPHBQDvX56sOhZPi+yIUxeD4CA5PqM/Fvx+QwAYlvCAJOG
 dFAiunHMgdb0dU/CTROwSfTXUsPeFsYBdWqheyBR351EyNxDi9/5VO+vEAHGP+aDJ4v8
 6TMpKBh8thTJl8sBesQMl/0upccS5AHFs/r0TTw7S/RgaIJ8XvjWrrI+xhdqrH4QfQD4
 0EfThvEFQ0hOzjXkt48z23E+Bi8adt6IM2dIs/SyMuxI5I1hhtebhgOguQCQ8KtMTwSK
 qdIA==
X-Gm-Message-State: AOAM530TU/4Teo2IdXhG/X8Xltn+ZlbtA1nClBxa8KBTEKyA4XSYjTgI
 SqfJyX5+hFmcCXb0Lq0/M4vRFA==
X-Google-Smtp-Source: ABdhPJyOXPSUd+ytQ62J99cOfI/+EggmHpRzgNFnwcWowc5UfgcsUgcIp/rGvomiHlSSMlGmKtb/Zw==
X-Received: by 2002:a17:90b:ec2:: with SMTP id
 gz2mr16289398pjb.143.1610343801948; 
 Sun, 10 Jan 2021 21:43:21 -0800 (PST)
Received: from localhost.localdomain (61-231-198-38.dynamic-ip.hinet.net.
 [61.231.198.38]) by smtp.googlemail.com with ESMTPSA id
 x15sm16726267pfn.118.2021.01.10.21.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:43:21 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 3/4] ASoC: rt5645: add inv_hp_det flag
Date: Mon, 11 Jan 2021 13:41:40 +0800
Message-Id: <20210111054141.4668-4-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210111054141.4668-1-chiu@endlessos.org>
References: <20210111054141.4668-1-chiu@endlessos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
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

The ECS EF20EA laptop use gpio for jack detection instead of rt5645
rt5645 JD. However, the GPIO polarity is inverse for hp-detect based
on the _DSD property of the RTK2 device.

Name (_DSD, Package () {
    ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
    Package () {
        Package () {"hp-detect-gpio", Package() {^RTK2, 0, 0, 1 }},
    }
})

This flag will invert the hp-detect gpio polarity.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
  v2 -> v3:
        - none
  v1 -> v2:
        - none

 include/sound/rt5645.h    | 2 ++
 sound/soc/codecs/rt5645.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/sound/rt5645.h b/include/sound/rt5645.h
index 39a77c7cea36..710c95be5509 100644
--- a/include/sound/rt5645.h
+++ b/include/sound/rt5645.h
@@ -22,6 +22,8 @@ struct rt5645_platform_data {
 	bool level_trigger_irq;
 	/* Invert JD1_1 status polarity */
 	bool inv_jd1_1;
+	/* Invert HP detect status polarity */
+	bool inv_hp_pol;
 
 	/* Value to asign to snd_soc_card.long_name */
 	const char *long_name;
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 770801de42a6..4fd91ee3cfaa 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -34,6 +34,7 @@
 #define QUIRK_INV_JD1_1(q)	((q) & 1)
 #define QUIRK_LEVEL_IRQ(q)	(((q) >> 1) & 1)
 #define QUIRK_IN2_DIFF(q)	(((q) >> 2) & 1)
+#define QUIRK_INV_HP_POL(q)	(((q) >> 3) & 1)
 #define QUIRK_JD_MODE(q)	(((q) >> 4) & 7)
 #define QUIRK_DMIC1_DATA_PIN(q)	(((q) >> 8) & 3)
 #define QUIRK_DMIC2_DATA_PIN(q)	(((q) >> 12) & 3)
@@ -3263,6 +3264,8 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 	case 0: /* Not using rt5645 JD */
 		if (rt5645->gpiod_hp_det) {
 			gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
+			if (rt5645->pdata.inv_hp_pol)
+				gpio_state ^= 1;
 			dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
 				gpio_state);
 			report = rt5645_jack_detect(rt5645->component, gpio_state);
@@ -3872,6 +3875,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 		rt5645->pdata.in2_diff = QUIRK_IN2_DIFF(quirk);
 		rt5645->pdata.level_trigger_irq = QUIRK_LEVEL_IRQ(quirk);
 		rt5645->pdata.inv_jd1_1 = QUIRK_INV_JD1_1(quirk);
+		rt5645->pdata.inv_hp_pol = QUIRK_INV_HP_POL(quirk);
 		rt5645->pdata.jd_mode = QUIRK_JD_MODE(quirk);
 		rt5645->pdata.dmic1_data_pin = QUIRK_DMIC1_DATA_PIN(quirk);
 		rt5645->pdata.dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
-- 
2.20.1

