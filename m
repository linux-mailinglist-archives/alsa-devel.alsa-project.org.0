Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB7A755A22
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 05:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9469DF5;
	Mon, 17 Jul 2023 05:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9469DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689565007;
	bh=KCAnswSABYr2ITXy8z4k/eFmHYY+VeqKD+NeQuMer60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ubvhnlLd8VrMIrCihqfYP/vUZi3zvSkIR7IBufm2PcglxnpW8l/t3n2gN+uXtxZG9
	 gJK47Ez7fpDr2Rj0LakPN1GVjkX+Mt3AQ5SYie1PWVxR73fy5RzRtEft6J+6VLfvzN
	 7HLtiWzXUxnvD4ihEZSsztmU1wZpT2jmdJ7k/y2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03523F8056F; Mon, 17 Jul 2023 05:34:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E11F8055C;
	Mon, 17 Jul 2023 05:34:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E74F804DA; Mon, 17 Jul 2023 05:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3571F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 05:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3571F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=llYatUmB
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a36b30aa7bso3002335b6e.3
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jul 2023 20:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689564751; x=1692156751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvI0P+9cSyZtkmqCZIS8QCJlA+e7eXnlLRhnl2WbHKY=;
        b=llYatUmBkNw2Zh+iPmtnUZwca/Y2fmO8hm1PmpcbID/cgpc3HXN2KLRjsVofnN1mU5
         orM6Kr9pTHQHnR9AjZbvp8siVl17mQt+Zhd/hrwRN02bWF/QA8bCL2uM8BvtoWaOVpr9
         eciuQwMGEfDZFJUCuY4UOt4xtlK12/nG6AZPAChqWxTm7xkGwYl35MimhKFgXPVGaase
         r26wfTSehVvzE2QLz8X4AZ7ms/QtSE/+2wZWkPoLGN80+PvKN870JW8oyXh4u/Vb4IrA
         1VatLeBy1dnZMWf8cNIjJq7RhEL5BNoM5e0SaXUUT+jSwh2JTDLPrei2qKs0dZvP6JOW
         s8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564751; x=1692156751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvI0P+9cSyZtkmqCZIS8QCJlA+e7eXnlLRhnl2WbHKY=;
        b=CQL/cEoRySWKNaqMKEmqPCzE6Vbm1W4mWWapSk2oOZEOTnb/zIFq8z4G/KF4XyHUoX
         cGii4ngBLUODhZtlbMv38JwZ5B4fuyyBwguDTao1u8yvhixg3X3uZf2g7S3zkQO37uFd
         qLaYERfNictk3WcYjD7AVETYp/JgP/A22wdwI6VSbwm7r6yPAK/dmseDFgcLXAsXsMA1
         LWpH2U1cBBckyftb5I9Dksqztdo+DEOKEZRp4jfBxjAftrH4NhmyNcHa2hUbCUePuDbe
         vM/vot+38VNh3swJYECykyzRwXlsjR15/aMfk1C/1rrLC3H4lonXWDBW2jAU7FesPJ4p
         4gJw==
X-Gm-Message-State: ABy/qLYkYs/1th1wSMMbpxKEfbGVjQUj6uHyJHIsvWGGdIg0S6cvJUtC
	Skc+fKMYkZVijEw+fYuvPyxedZaB4WkmEGOm
X-Google-Smtp-Source: 
 APBJJlE364QYoS3zNEs1g16WFN6Bf0gfUSUbnfVkniNh035K/c03wk8RBm5/TNXiqfrc8cGF9bCBKg==
X-Received: by 2002:a05:6808:1283:b0:3a4:31ee:da6a with SMTP id
 a3-20020a056808128300b003a431eeda6amr12654821oiw.55.1689564751040;
        Sun, 16 Jul 2023 20:32:31 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 a28-20020a63705c000000b00528513c6bbcsm11647509pgn.28.2023.07.16.20.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 20:32:30 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v2 2/5] ASoC: codecs: ES8326: Change Volatile Reg function
Date: Mon, 17 Jul 2023 11:32:20 +0800
Message-Id: <20230717033223.42506-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717033223.42506-1-zhuning0077@gmail.com>
References: <20230717033223.42506-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3M423Y3RFZYHX6LAKTN6RLEAQT2LVCH7
X-Message-ID-Hash: 3M423Y3RFZYHX6LAKTN6RLEAQT2LVCH7
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3M423Y3RFZYHX6LAKTN6RLEAQT2LVCH7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The new calibration and headphone detection function
require reading new volatile registers. Add them in
the volatile register function.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index e953c0157ba0..7cfe535e0b6d 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -158,20 +158,25 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"HPOR", NULL, "RHPMIX"},
 };
 
-static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HPDET_STA, ES8326_HPDET_STA),
-};
-
-static const struct regmap_access_table es8326_volatile_table = {
-	.yes_ranges = es8326_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(es8326_volatile_ranges),
-};
+static bool es8326_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES8326_HPL_OFFSET_INI:
+	case ES8326_HPR_OFFSET_INI:
+	case ES8326_HPDET_STA:
+	case ES8326_CTIA_OMTP_STA:
+	case ES8326_CSM_MUTE_STA:
+		return true;
+	default:
+		return false;
+	}
+}
 
 static const struct regmap_config es8326_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,
-	.volatile_table = &es8326_volatile_table,
+	.volatile_reg = es8326_volatile_register,
 	.cache_type = REGCACHE_RBTREE,
 };
 
-- 
2.34.1

