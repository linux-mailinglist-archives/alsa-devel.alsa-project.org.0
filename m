Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE4331FAB
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 08:05:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBA41725;
	Tue,  9 Mar 2021 08:05:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBA41725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615273554;
	bh=Gehff9iHWGvx7ATHbSnmG8ZBKt+j59/AVy/KMFfBIis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELVznJyEOmfxcmIHsLAp3FVQLDf0T2WPGTMepmGbsitT4HfuK6bgrSsPupzTGWqby
	 1/GlqERo1h1leHOf7lDNXyRCJTz5l4oM41TtGWD+VjXVxSsx3Q6Uzv8k6tUxCeIDhA
	 gVqQMSeYMmN59UDC3i5WzEJO6Z48ViRdNeV/lTa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1C7F804AD;
	Tue,  9 Mar 2021 08:02:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA378F80217; Mon,  8 Mar 2021 23:20:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF0F8F80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0F8F80139
Received: by mail-qt1-f179.google.com with SMTP id j3so8785201qtj.12
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 14:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kh63xNP2rFUorHbRt/iOikDoSbwbtGsuwnseqg/5ouI=;
 b=iuP1XuurEN9bOWe4CgQgu6Bxho+xGpAmrs32uKnF4ew1f9FvJ5QAYmSl6HRcuaQzph
 +1RuAkOYTB9IS59VQpHA3mpTU4byu1Ve9KqJOZAhYDGUoFrk94ftbuDD0zrI18XtLCx5
 rr59R+p7IVtG5gBY24D0WnYcAAE8UzhXl3heZ2cbhjaTrIYQNF475txfZNPIdSpHzh3H
 nONNzf242iIVACPkG4sqXqkXEvHIDPOlr5+HELzlQq24IwpbqFJzVuMRBX5Q638DsD8e
 WLK2Dmb/zwS5vUpCxzU7Kthd4kj6iU3Yi6K4m8JjnM+DYI+/8+3wS67ZYKEfxpOrZXP8
 AhBg==
X-Gm-Message-State: AOAM533Trxp0dISOECu48qn6SN2LDWjnFI9WSTAi5vrGTHlVoDn+s/Ch
 EQvhzAunkTDbuzyhkouRhM4=
X-Google-Smtp-Source: ABdhPJx5YE0IQ7xt/j2XQquGI//n6VXdEE1/FcFbXFJqfvw2u+1ZHql1sXfwR5W9kigXGw0coinv1Q==
X-Received: by 2002:ac8:6695:: with SMTP id d21mr3134038qtp.269.1615242019475; 
 Mon, 08 Mar 2021 14:20:19 -0800 (PST)
Received: from dpward-laptop.. ([2601:184:417f:5914::53e7:ddc3])
 by smtp.gmail.com with ESMTPSA id y1sm8676722qki.9.2021.03.08.14.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:20:19 -0800 (PST)
From: David Ward <david.ward@gatech.edu>
To: Oder Chiou <oder_chiou@realtek.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: rt286: Handle all devices with ALC3263 codec
Date: Mon,  8 Mar 2021 17:18:16 -0500
Message-Id: <20210308221817.12908-3-david.ward@gatech.edu>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308221817.12908-1-david.ward@gatech.edu>
References: <20210308221817.12908-1-david.ward@gatech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Mar 2021 08:01:59 +0100
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 David Ward <david.ward@gatech.edu>
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

The ALC3263 codec on the Dell XPS 13 9343 is also on the Dell Latitude 7350
and the Dell Venue 11 Pro 7140. These require the same handling: GPIO pin 6
needs to be set for a headset or microphone to work in the combo jack.

This is implemented for the HDA driver, which always sets GPIO pin 6 on the
ALC3263. It is detected using the codec vendor/device ID 0x10ec0288 and the
PCI subsystem vendor ID 0x1028 (Dell). Because the I2S codec driver doesn't
use PCI, adapt this by using DMI to check if Dell is the system vendor.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=150601
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205961
Signed-off-by: David Ward <david.ward@gatech.edu>
---
 sound/soc/codecs/rt286.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index e16e7237156f..c0129edf5993 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1120,12 +1120,11 @@ static const struct dmi_system_id force_combo_jack_table[] = {
 	{ }
 };
 
-static const struct dmi_system_id dmi_dell_dino[] = {
+static const struct dmi_system_id dmi_dell[] = {
 	{
-		.ident = "Dell Dino",
+		.ident = "Dell",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9343")
 		}
 	},
 	{ }
@@ -1136,7 +1135,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 {
 	struct rt286_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct rt286_priv *rt286;
-	int i, ret, val;
+	int i, ret, vendor_id;
 
 	rt286 = devm_kzalloc(&i2c->dev,	sizeof(*rt286),
 				GFP_KERNEL);
@@ -1152,14 +1151,15 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	}
 
 	ret = regmap_read(rt286->regmap,
-		RT286_GET_PARAM(AC_NODE_ROOT, AC_PAR_VENDOR_ID), &val);
+		RT286_GET_PARAM(AC_NODE_ROOT, AC_PAR_VENDOR_ID), &vendor_id);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "I2C error %d\n", ret);
 		return ret;
 	}
-	if (val != RT286_VENDOR_ID && val != RT288_VENDOR_ID) {
+	if (vendor_id != RT286_VENDOR_ID && vendor_id != RT288_VENDOR_ID) {
 		dev_err(&i2c->dev,
-			"Device with ID register %#x is not rt286\n", val);
+			"Device with ID register %#x is not rt286\n",
+			vendor_id);
 		return -ENODEV;
 	}
 
@@ -1183,8 +1183,8 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	if (pdata)
 		rt286->pdata = *pdata;
 
-	if (dmi_check_system(force_combo_jack_table) ||
-		dmi_check_system(dmi_dell_dino))
+	if ((vendor_id == RT288_VENDOR_ID && dmi_check_system(dmi_dell)) ||
+		dmi_check_system(force_combo_jack_table))
 		rt286->pdata.cbj_en = true;
 
 	regmap_write(rt286->regmap, RT286_SET_AUDIO_POWER, AC_PWRST_D3);
@@ -1223,7 +1223,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL3, 0xf777, 0x4737);
 	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL4, 0x00ff, 0x003f);
 
-	if (dmi_check_system(dmi_dell_dino)) {
+	if (vendor_id == RT288_VENDOR_ID && dmi_check_system(dmi_dell)) {
 		regmap_update_bits(rt286->regmap,
 			RT286_SET_GPIO_MASK, 0x40, 0x40);
 		regmap_update_bits(rt286->regmap,
-- 
2.30.1

