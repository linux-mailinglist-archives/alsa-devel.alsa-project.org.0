Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D686F2ECC55
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:10:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B1051684;
	Thu,  7 Jan 2021 10:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B1051684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010603;
	bh=uyOSuIEcHd3QXQsK2S7IfLp6TlUUY8lkCnDYeSWxePM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZSFzzaQ9c/ceMVuvyOwBgDmu32DEHOVGKkesgxl4N56vtLfEJ7V8HQJ6/uU0nMqop
	 /qWXNgIu3RcSQHQXLW25nRz6m6lQmOXctJ8olvssOF4LWs1b/lKIuz4vg5AOT5Xi8/
	 YaLmDFsa1n8Pzo7XgVxUy6pPyrvi8l4wOWAMTH7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87034F804E0;
	Thu,  7 Jan 2021 10:07:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B60DF804C3; Thu,  7 Jan 2021 10:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5826F801F5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 10:06:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5826F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="tdQiJclZ"
Received: by mail-pg1-x535.google.com with SMTP id v19so4384902pgj.12
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 01:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGDP77wj0SBSqj0K7AcIhTlzIQ1EOZW+OCgfJtSnnj0=;
 b=tdQiJclZl5WYttq+YANmngxav4yaUb4TOFtHKzx6l8boS5QkElEvoN9cGpRuCVh8+U
 be5bFqEt0u5npj6bmQdFi0utLrfuV1J2Mv+BREsB3riHS82GOO5vzzw6q/eV/WAmw09r
 BhJzYLGj8r7avNP/9l3zfyBM0NyTbxFwRFbAaxDff61uHYSeWCBBaR+I/Kt/DgZG0HBX
 Ki+lTwmBS7qDMTZWDwcS4ihuI205E6JOA8fmb1BECz7XpjtJqLLVlwYKMiQbzDiBmidZ
 uhROoAkw59GghHKroEDzu2D0c9pIc67nehO3WYKZZ8NEWjG2CKMZVC3tuELtpUwJqxX7
 oQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGDP77wj0SBSqj0K7AcIhTlzIQ1EOZW+OCgfJtSnnj0=;
 b=Bn6zPGv1/Faru/jF9L3I6Zfu+6JySvIvRBoBEldYCpAuckArkWoc6zu4VCt0phL0lF
 Q4fh4xobtAJ/SI5pS+5UHayhBFZpjdoCgf9HSqUoVMXf5dgBaHrlyb0UC79Y2nzDoFHt
 l2Fa2Q40vFwkm5+iX7EAiX0o9scxdFaKPARQ32MezbftWcZmhWdk2hg1a3oO65w6zBq2
 7isQsFqMWdappzqSdeP1LHFiOmRQOlypehuSsptNtoD9aucqFe98qIDdAES92crpQMck
 akujE094s+aGWBQRZCJSSm6geXnQb8qNF0bBVsraJF4pOkIwuKXGbBneRqWKqn/9ZLSr
 0zDw==
X-Gm-Message-State: AOAM5302ezwZBuWOaqtBJm/A8z3788qMd0Jn/pC0j0mG+i1YynjWY2Hk
 YOrfkTYWGhwU8zUuvNFm5mGDPg==
X-Google-Smtp-Source: ABdhPJw/8oBCbWbG0rUFRC4/JHq/k8qLYU3KPf/U/tgCSiPOwlDExBMcmfq4NheFwmH1P+SovtDBDg==
X-Received: by 2002:aa7:8506:0:b029:19e:95:f75f with SMTP id
 v6-20020aa785060000b029019e0095f75fmr7711545pfn.7.1610010407586; 
 Thu, 07 Jan 2021 01:06:47 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id b2sm5006394pfo.164.2021.01.07.01.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:06:47 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 3/4] ASoC: rt5645: add inv_hp_det flag
Date: Thu,  7 Jan 2021 17:06:24 +0800
Message-Id: <20210107090625.107078-4-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107090625.107078-1-chiu@endlessos.org>
References: <20210107090625.107078-1-chiu@endlessos.org>
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
index 24a6acb3c12f..530145cf8c5b 100644
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
@@ -3871,6 +3874,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 		rt5645->pdata.in2_diff = QUIRK_IN2_DIFF(quirk);
 		rt5645->pdata.level_trigger_irq = QUIRK_LEVEL_IRQ(quirk);
 		rt5645->pdata.inv_jd1_1 = QUIRK_INV_JD1_1(quirk);
+		rt5645->pdata.inv_hp_pol = QUIRK_INV_HP_POL(quirk);
 		rt5645->pdata.jd_mode = QUIRK_JD_MODE(quirk);
 		rt5645->pdata.dmic1_data_pin = QUIRK_DMIC1_DATA_PIN(quirk);
 		rt5645->pdata.dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
-- 
2.20.1

