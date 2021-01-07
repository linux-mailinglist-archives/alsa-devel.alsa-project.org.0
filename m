Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E4F2ECE4A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 11:56:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE8616AA;
	Thu,  7 Jan 2021 11:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE8616AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610016999;
	bh=bbf8nnSJesZ2zKuuRUgJIeOoTODjD7TfSKzJLMWGoaM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hy7JSja5E4sHeZEXZxuzVNfUuGDwpEt7FBip+kfuhQiLLanPYJ4psuzYSr09Qwpbt
	 UCliVH9hlTtNXHJUI/kzPLa784nS3UOFo6KSCAGmg+Pdcd+A5cR6AqosJNoXUqESdk
	 2HwaLPGnkHJ3dZKcLYeEkJSR3cWNETGU1NoxiHyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1430F804CB;
	Thu,  7 Jan 2021 11:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49061F802C4; Thu,  7 Jan 2021 11:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D3B1F80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 11:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D3B1F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="qkU4ooKT"
Received: by mail-pg1-x534.google.com with SMTP id n25so4602547pgb.0
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLS4gP2Eh8NLeiNLmHSAPr2HGbTg/Br5dE7CxZfSO3A=;
 b=qkU4ooKThum8yYHmTG/VT/ykGywcrQBi5WdFfz4IY5ZhOPlCGWnI330uyaZ1h9rzTe
 3/d77vF0KiVsTQzlwIFTv9boBxcSkVmWMku3E86d/lZC5qwt3tUXfmocCVqVlYqcklCN
 Zn0HUaNLc9kKQghj0hlLPdK+f1h977z4ygSgw11k+g7ump/hucJW4sutwtijjeKTPUqE
 AW8Z5+zL6Stghw11fC22KXtC+ZtOBbzoo6itCAfvZNOVmyZkMoaFOl9rsTVtszkSJT8C
 cg7qdY0SNW8yB0ud65j0FdFFdz9Py07Z2ep7IwROxQYCrCoCXmDN6/bXaK0Tx2A8Q08X
 rojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GLS4gP2Eh8NLeiNLmHSAPr2HGbTg/Br5dE7CxZfSO3A=;
 b=L0IP8KA334nR/tbwoM1IHNwBBI8QTfh+QCCswZfmsD/S7BKqCT6rbAlzQERaqBfDlg
 L9eQeyrTlDzOaH/T092Ms/X3SiKOUoZxUfzhfIFfRzU/uZphqlGbpaZSbNaKcxuBgRoV
 11t8thkHVcICYPy5XbksArI5BHgsQcTnr350lsAxpghFUiaZsMK4q9nQcjR0WE4xyec4
 xdsZZQJ6UP0FgbW3cQCPF8Zp9Z1nDRmUuusEQKbVQ263y8BPHAFiUrWktcdrSW1Qq6Lw
 btLKvJCqvE53GNRvyQIcYxNWfU6HFkgsQTwzHBZu+p8AjO7hbfsfFALNhfOioBwNoJhN
 baTQ==
X-Gm-Message-State: AOAM530zCGyKTJ2hYEv/bU2PN2i7CmcNScbQbLL09x1O9QOiayx3IxzZ
 +mOacy8rSnbDEIiok9FihK2ihQ==
X-Google-Smtp-Source: ABdhPJx6WDiTbySCDVkfYV5+Su1psU9JnwXmV5YgsXYqYUNjupzlxH9hbNfkDRY8i3+v2wS/BeWUUw==
X-Received: by 2002:a65:68da:: with SMTP id k26mr1266349pgt.397.1610016842972; 
 Thu, 07 Jan 2021 02:54:02 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p187sm5426042pfp.60.2021.01.07.02.54.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:54:02 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 3/4] ASoC: rt5645: add inv_hp_det flag
Date: Thu,  7 Jan 2021 18:53:28 +0800
Message-Id: <20210107105329.146988-4-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107105329.146988-1-chiu@endlessos.org>
References: <20210107105329.146988-1-chiu@endlessos.org>
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
index 94faa0a9561f..ca1bdb67ecc5 100644
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
@@ -3873,6 +3876,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 		rt5645->pdata.in2_diff = QUIRK_IN2_DIFF(quirk);
 		rt5645->pdata.level_trigger_irq = QUIRK_LEVEL_IRQ(quirk);
 		rt5645->pdata.inv_jd1_1 = QUIRK_INV_JD1_1(quirk);
+		rt5645->pdata.inv_hp_pol = QUIRK_INV_HP_POL(quirk);
 		rt5645->pdata.jd_mode = QUIRK_JD_MODE(quirk);
 		rt5645->pdata.dmic1_data_pin = QUIRK_DMIC1_DATA_PIN(quirk);
 		rt5645->pdata.dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
-- 
2.20.1

