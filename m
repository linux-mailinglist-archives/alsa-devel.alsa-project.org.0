Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46C44A6D0
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 07:25:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7B8166F;
	Tue,  9 Nov 2021 07:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7B8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636439128;
	bh=6noqq2v2FB/tbdQfZQF/W33lsYOImTvwhChIAD7g8cc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OzbtIExIO2u8utNomsnR8J87iky8l9Id5jXTrz2XHJtlMt8/EvsU84761Rw5dj5sN
	 f+oqQpeDtPbrzzJxFb8ZFFQcBM2pIm2Ybj4H7Vm8I+q4idhltz0AKWrI07eneasU06
	 2FgbcCFiLeWFXinPcDrTzeSM4Rs2bEOpeszm1bK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DD1F804E0;
	Tue,  9 Nov 2021 07:24:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7E89F804DA; Tue,  9 Nov 2021 07:24:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 454F5F800C1
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 07:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 454F5F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p+p0uxg9"
Received: by mail-pl1-x62b.google.com with SMTP id n8so19086254plf.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 22:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AUTPhAtZa6U0xaRNrom5ttukLaD6yyy5owHS5UhsYZs=;
 b=p+p0uxg9oKbjknvm1SbGEz007oMpEKL1EWMu+0UNLudwTT0+JOdaEXMQTopKL7HN4J
 7J5HuTzqjDHaUPM1eopjtsHdNapvfeAxVEpfVt5ePl+SKVcep8f4pYLHrzHPxFCWrHm2
 sGgtGBgRJ3xWkLJ+j/iGtA8z6V17AJvdMfXjPljSuykwdjp5q+HjlGLKxlIzzv3cBrU9
 RpzeGm50H/hBvldbewpbRG3nVjgzDhhKgoAjLq0NBfG+ROr3mWY3XyFYna40eJFgFsMK
 S8WN6Ol6MIS3g868m6i8ddh4EXNiudCxGXANviGJojHRVu9ZmodDKxLAnsrn+hnUAOVP
 GzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AUTPhAtZa6U0xaRNrom5ttukLaD6yyy5owHS5UhsYZs=;
 b=ssSqXVbN2tJ7UBrJEb4IeRrr0meEazZBYh2+9DVwmsVstHLvOTQJ4+lLyLppSfmS0O
 nej31GmsSN27OXDqdyJGbNJ48UhyOH8fsCKFH9Zc813cch/HjXTMXSifD8199u/IWMye
 Ue/ahuwMP8QNxkm9jZpikB8eVej8//8ymdp+zS1qaUljeLMpO+IgZ4KiktmMkycmeyfv
 8qo+ftXDZyjLVA+d3sVPIJg4jRCeQKBtHR6Ae3eblLNks48n+IHd81I0fReJGLxxhmc0
 k9n5RLgjIlptV1uHwlVo6Ev2E8f6flaJayQWxP+WNt3HbcTAN7tEG7EqBGmSWu43Dmz+
 WgRQ==
X-Gm-Message-State: AOAM531WChvVVq9PrEpK1hm/gyZeqfik4qGgKdi1bSd5mWRxVw7lmGhk
 U9BG/uso3obqbAaziaF5Fs4=
X-Google-Smtp-Source: ABdhPJy7RZnVXtKga+QtYWFI+8dLt7Ta7ipOXSIdBF8wqFJVFF2L1jSD3KDm2Dpo2IO8kRO4ehD59Q==
X-Received: by 2002:a17:902:780f:b0:13a:3919:e365 with SMTP id
 p15-20020a170902780f00b0013a3919e365mr4692458pll.63.1636439036880; 
 Mon, 08 Nov 2021 22:23:56 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:578:468f:d592:ff78:ffa9:3df7])
 by smtp.gmail.com with ESMTPSA id x33sm6856718pfh.133.2021.11.08.22.23.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 22:23:56 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 1/2] ASoC: rt9120: Update internal setting and fix auto sync
 problem
Date: Tue,  9 Nov 2021 14:23:43 +0800
Message-Id: <1636439024-15877-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
References: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

- Update internal setting to fix issue.
- Disable auto sync if fs is divided by 48.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9120.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index f957498..d007d00 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -26,6 +26,7 @@
 #define RT9120_REG_INTERNAL0	0x65
 #define RT9120_REG_INTERNAL1	0x69
 #define RT9120_REG_UVPOPT	0x6C
+#define RT9120_REG_DIGCFG	0xF8
 
 #define RT9120_VID_MASK		GENMASK(15, 8)
 #define RT9120_SWRST_MASK	BIT(7)
@@ -46,6 +47,7 @@
 #define RT9120_CFG_WORDLEN_24	24
 #define RT9120_CFG_WORDLEN_32	32
 #define RT9120_DVDD_UVSEL_MASK	GENMASK(5, 4)
+#define RT9120_AUTOSYNC_MASK	BIT(6)
 
 #define RT9120_VENDOR_ID	0x4200
 #define RT9120_RESET_WAITMS	20
@@ -149,8 +151,7 @@ static int rt9120_codec_probe(struct snd_soc_component *comp)
 	snd_soc_component_init_regmap(comp, data->regmap);
 
 	/* Internal setting */
-	snd_soc_component_write(comp, RT9120_REG_INTERNAL1, 0x03);
-	snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x69);
+	snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x04);
 	return 0;
 }
 
@@ -201,8 +202,8 @@ static int rt9120_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *comp = dai->component;
-	unsigned int param_width, param_slot_width;
-	int width;
+	unsigned int param_width, param_slot_width, auto_sync;
+	int width, fs;
 
 	switch (width = params_width(param)) {
 	case 16:
@@ -240,6 +241,17 @@ static int rt9120_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_component_update_bits(comp, RT9120_REG_I2SWL,
 				      RT9120_AUDWL_MASK, param_slot_width);
+
+	fs = width * params_channels(param);
+	/* If fs is divided by 48, disable auto sync */
+	if (fs % 48 == 0)
+		auto_sync = 0;
+	else
+		auto_sync = RT9120_AUTOSYNC_MASK;
+
+	snd_soc_component_update_bits(comp, RT9120_REG_DIGCFG,
+				      RT9120_AUTOSYNC_MASK, auto_sync);
+
 	return 0;
 }
 
@@ -281,7 +293,8 @@ static const struct regmap_range rt9120_rd_yes_ranges[] = {
 	regmap_reg_range(0x3A, 0x40),
 	regmap_reg_range(0x65, 0x65),
 	regmap_reg_range(0x69, 0x69),
-	regmap_reg_range(0x6C, 0x6C)
+	regmap_reg_range(0x6C, 0x6C),
+	regmap_reg_range(0xF8, 0xF8)
 };
 
 static const struct regmap_access_table rt9120_rd_table = {
@@ -299,7 +312,8 @@ static const struct regmap_range rt9120_wr_yes_ranges[] = {
 	regmap_reg_range(0x40, 0x40),
 	regmap_reg_range(0x65, 0x65),
 	regmap_reg_range(0x69, 0x69),
-	regmap_reg_range(0x6C, 0x6C)
+	regmap_reg_range(0x6C, 0x6C),
+	regmap_reg_range(0xF8, 0xF8)
 };
 
 static const struct regmap_access_table rt9120_wr_table = {
@@ -370,7 +384,7 @@ static int rt9120_reg_write(void *context, unsigned int reg, unsigned int val)
 static const struct regmap_config rt9120_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 32,
-	.max_register = RT9120_REG_UVPOPT,
+	.max_register = RT9120_REG_DIGCFG,
 
 	.reg_read = rt9120_reg_read,
 	.reg_write = rt9120_reg_write,
-- 
2.7.4

