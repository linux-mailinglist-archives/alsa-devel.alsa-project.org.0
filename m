Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4C387C60
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 17:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E3B01735;
	Tue, 18 May 2021 17:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E3B01735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621351431;
	bh=LJ2g3eDevVHIg0lfS7fpCgMipPxpRoSiDhRn5xL9a7E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fXHVpdG6MnrGLyILFZW0lWuGVeMXVGglgebfJaQXImQgqDCk5vl1awkEYn32WO8Xt
	 2zs2EIPNSB2LlC6fJKZ7rMNgksK8g/UhFdZPPpXtGFfNU6lYpEEqR7IAeTxxsEPA1+
	 MnkGPNP2N/RA8PDXOl15yELykEgdzYB4On8p+02E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CB3F802C8;
	Tue, 18 May 2021 17:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFD0EF80229; Tue, 18 May 2021 17:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5B83F80217
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 17:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B83F80217
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6595FB14B
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 15:21:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Refactoring UAC2/3 clock setup code
Date: Tue, 18 May 2021 17:21:11 +0200
Message-Id: <20210518152112.8016-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210518152112.8016-1-tiwai@suse.de>
References: <20210518152112.8016-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch just does refactoring of the UAC2/3 clock setup code.
There should be no functional changes.  The major changes are:

* Provide union objects for pointing both UAC2 and UAC3 objects
* Unify clock source, selector and multiplier helper functions
* Unify __uac_clock_find_source() to deal with both UAC2 and UAC3
  equally

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 285 ++++++++++++++--------------------------------
 1 file changed, 85 insertions(+), 200 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 17bbde73d4d1..48a79f1b6233 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -21,82 +21,77 @@
 #include "clock.h"
 #include "quirks.h"
 
+union uac23_clock_source_desc {
+	struct uac_clock_source_descriptor v2;
+	struct uac3_clock_source_descriptor v3;
+};
+
+union uac23_clock_selector_desc {
+	struct uac_clock_selector_descriptor v2;
+	struct uac3_clock_selector_descriptor v3;
+};
+
+union uac23_clock_multiplier_desc {
+	struct uac_clock_multiplier_descriptor v2;
+	struct uac_clock_multiplier_descriptor v3;
+};
+
+#define GET_VAL(p, proto, field) \
+	((proto) == UAC_VERSION_3 ? (p)->v3.field : (p)->v2.field)
+
 static void *find_uac_clock_desc(struct usb_host_interface *iface, int id,
-				 bool (*validator)(void *, int), u8 type)
+				 bool (*validator)(void *, int, int),
+				 u8 type, int proto)
 {
 	void *cs = NULL;
 
 	while ((cs = snd_usb_find_csint_desc(iface->extra, iface->extralen,
 					     cs, type))) {
-		if (validator(cs, id))
+		if (validator(cs, id, proto))
 			return cs;
 	}
 
 	return NULL;
 }
 
-static bool validate_clock_source_v2(void *p, int id)
+static bool validate_clock_source(void *p, int id, int proto)
 {
-	struct uac_clock_source_descriptor *cs = p;
-	return cs->bClockID == id;
-}
+	union uac23_clock_source_desc *cs = p;
 
-static bool validate_clock_source_v3(void *p, int id)
-{
-	struct uac3_clock_source_descriptor *cs = p;
-	return cs->bClockID == id;
+	return GET_VAL(cs, proto, bClockID) == id;
 }
 
-static bool validate_clock_selector_v2(void *p, int id)
+static bool validate_clock_selector(void *p, int id, int proto)
 {
-	struct uac_clock_selector_descriptor *cs = p;
-	return cs->bClockID == id;
-}
+	union uac23_clock_selector_desc *cs = p;
 
-static bool validate_clock_selector_v3(void *p, int id)
-{
-	struct uac3_clock_selector_descriptor *cs = p;
-	return cs->bClockID == id;
+	return GET_VAL(cs, proto, bClockID) == id;
 }
 
-static bool validate_clock_multiplier_v2(void *p, int id)
+static bool validate_clock_multiplier(void *p, int id, int proto)
 {
-	struct uac_clock_multiplier_descriptor *cs = p;
-	return cs->bClockID == id;
-}
+	union uac23_clock_multiplier_desc *cs = p;
 
-static bool validate_clock_multiplier_v3(void *p, int id)
-{
-	struct uac3_clock_multiplier_descriptor *cs = p;
-	return cs->bClockID == id;
+	return GET_VAL(cs, proto, bClockID) == id;
 }
 
-#define DEFINE_FIND_HELPER(name, obj, validator, type)		\
-static obj *name(struct usb_host_interface *iface, int id)	\
-{								\
-	return find_uac_clock_desc(iface, id, validator, type);	\
+#define DEFINE_FIND_HELPER(name, obj, validator, type2, type3)		\
+static obj *name(struct snd_usb_audio *chip, int id, int proto)	\
+{									\
+	return find_uac_clock_desc(chip->ctrl_intf, id, validator,	\
+				   proto == UAC_VERSION_3 ? (type3) : (type2), \
+				   proto);				\
 }
 
 DEFINE_FIND_HELPER(snd_usb_find_clock_source,
-		   struct uac_clock_source_descriptor,
-		   validate_clock_source_v2, UAC2_CLOCK_SOURCE);
-DEFINE_FIND_HELPER(snd_usb_find_clock_source_v3,
-		   struct uac3_clock_source_descriptor,
-		   validate_clock_source_v3, UAC3_CLOCK_SOURCE);
-
+		   union uac23_clock_source_desc, validate_clock_source,
+		   UAC2_CLOCK_SOURCE, UAC3_CLOCK_SOURCE);
 DEFINE_FIND_HELPER(snd_usb_find_clock_selector,
-		   struct uac_clock_selector_descriptor,
-		   validate_clock_selector_v2, UAC2_CLOCK_SELECTOR);
-DEFINE_FIND_HELPER(snd_usb_find_clock_selector_v3,
-		   struct uac3_clock_selector_descriptor,
-		   validate_clock_selector_v3, UAC3_CLOCK_SELECTOR);
-
+		   union uac23_clock_selector_desc, validate_clock_selector,
+		   UAC2_CLOCK_SELECTOR, UAC3_CLOCK_SELECTOR);
 DEFINE_FIND_HELPER(snd_usb_find_clock_multiplier,
-		   struct uac_clock_multiplier_descriptor,
-		   validate_clock_multiplier_v2, UAC2_CLOCK_MULTIPLIER);
-DEFINE_FIND_HELPER(snd_usb_find_clock_multiplier_v3,
-		   struct uac3_clock_multiplier_descriptor,
-		   validate_clock_multiplier_v3, UAC3_CLOCK_MULTIPLIER);
+		   union uac23_clock_multiplier_desc, validate_clock_multiplier,
+		   UAC2_CLOCK_MULTIPLIER, UAC3_CLOCK_MULTIPLIER);
 
 static int uac_clock_selector_get_val(struct snd_usb_audio *chip, int selector_id)
 {
@@ -159,14 +154,13 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 	int count;
 	unsigned char data;
 	struct usb_device *dev = chip->dev;
+	union uac23_clock_source_desc *cs_desc;
 
-	if (fmt->protocol == UAC_VERSION_2) {
-		struct uac_clock_source_descriptor *cs_desc =
-			snd_usb_find_clock_source(chip->ctrl_intf, source_id);
-
-		if (!cs_desc)
-			return false;
+	cs_desc = snd_usb_find_clock_source(chip, source_id, fmt->protocol);
+	if (!cs_desc)
+		return false;
 
+	if (fmt->protocol == UAC_VERSION_2) {
 		/*
 		 * Assume the clock is valid if clock source supports only one
 		 * single sample rate, the terminal is connected directly to it
@@ -175,8 +169,8 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 		 * reports that clock is invalid.
 		 */
 		if (fmt->nr_rates == 1 &&
-		    (fmt->clock & 0xff) == cs_desc->bClockID &&
-		    (cs_desc->bmAttributes & 0x3) !=
+		    (fmt->clock & 0xff) == cs_desc->v2.bClockID &&
+		    (cs_desc->v2.bmAttributes & 0x3) !=
 				UAC_CLOCK_SOURCE_TYPE_EXT)
 			return true;
 	}
@@ -222,22 +216,16 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 	unsigned char data;
 	struct usb_device *dev = chip->dev;
 	u32 bmControls;
+	union uac23_clock_source_desc *cs_desc;
 
-	if (fmt->protocol == UAC_VERSION_3) {
-		struct uac3_clock_source_descriptor *cs_desc =
-			snd_usb_find_clock_source_v3(chip->ctrl_intf, source_id);
-
-		if (!cs_desc)
-			return false;
-		bmControls = le32_to_cpu(cs_desc->bmControls);
-	} else { /* UAC_VERSION_1/2 */
-		struct uac_clock_source_descriptor *cs_desc =
-			snd_usb_find_clock_source(chip->ctrl_intf, source_id);
+	cs_desc = snd_usb_find_clock_source(chip, source_id, fmt->protocol);
+	if (!cs_desc)
+		return false;
 
-		if (!cs_desc)
-			return false;
-		bmControls = cs_desc->bmControls;
-	}
+	if (fmt->protocol == UAC_VERSION_3)
+		bmControls = le32_to_cpu(cs_desc->v3.bmControls);
+	else
+		bmControls = cs_desc->v2.bmControls;
 
 	/* If a clock source can't tell us whether it's valid, we assume it is */
 	if (!uac_v2v3_control_is_readable(bmControls,
@@ -267,9 +255,12 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 				   const struct audioformat *fmt, int entity_id,
 				   unsigned long *visited, bool validate)
 {
-	struct uac_clock_source_descriptor *source;
-	struct uac_clock_selector_descriptor *selector;
-	struct uac_clock_multiplier_descriptor *multiplier;
+	union uac23_clock_source_desc *source;
+	union uac23_clock_selector_desc *selector;
+	union uac23_clock_multiplier_desc *multiplier;
+	int ret, i, cur, err, pins, clock_id;
+	const u8 *sources;
+	int proto = fmt->protocol;
 
 	entity_id &= 0xff;
 
@@ -281,9 +272,9 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	}
 
 	/* first, see if the ID we're looking for is a clock source already */
-	source = snd_usb_find_clock_source(chip->ctrl_intf, entity_id);
+	source = snd_usb_find_clock_source(chip, entity_id, proto);
 	if (source) {
-		entity_id = source->bClockID;
+		entity_id = GET_VAL(source, proto, bClockID);
 		if (validate && !uac_clock_source_is_valid(chip, fmt,
 								entity_id)) {
 			usb_audio_err(chip,
@@ -294,27 +285,29 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 		return entity_id;
 	}
 
-	selector = snd_usb_find_clock_selector(chip->ctrl_intf, entity_id);
+	selector = snd_usb_find_clock_selector(chip, entity_id, proto);
 	if (selector) {
-		int ret, i, cur, err;
+		pins = GET_VAL(selector, proto, bNrInPins);
+		clock_id = GET_VAL(selector, proto, bClockID);
+		sources = GET_VAL(selector, proto, baCSourceID);
 
-		if (selector->bNrInPins == 1) {
+		if (pins == 1) {
 			ret = 1;
 			goto find_source;
 		}
 
 		/* the entity ID we are looking for is a selector.
 		 * find out what it currently selects */
-		ret = uac_clock_selector_get_val(chip, selector->bClockID);
+		ret = uac_clock_selector_get_val(chip, clock_id);
 		if (ret < 0)
 			return ret;
 
 		/* Selector values are one-based */
 
-		if (ret > selector->bNrInPins || ret < 1) {
+		if (ret > pins || ret < 1) {
 			usb_audio_err(chip,
 				"%s(): selector reported illegal value, id %d, ret %d\n",
-				__func__, selector->bClockID, ret);
+				__func__, clock_id, ret);
 
 			return -EINVAL;
 		}
@@ -322,7 +315,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	find_source:
 		cur = ret;
 		ret = __uac_clock_find_source(chip, fmt,
-					      selector->baCSourceID[ret - 1],
+					      sources[ret - 1],
 					      visited, validate);
 		if (ret > 0) {
 			err = uac_clock_selector_set_val(chip, entity_id, cur);
@@ -334,12 +327,12 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 			return ret;
 
 		/* The current clock source is invalid, try others. */
-		for (i = 1; i <= selector->bNrInPins; i++) {
+		for (i = 1; i <= pins; i++) {
 			if (i == cur)
 				continue;
 
 			ret = __uac_clock_find_source(chip, fmt,
-						      selector->baCSourceID[i - 1],
+						      sources[i - 1],
 						      visited, true);
 			if (ret < 0)
 				continue;
@@ -358,112 +351,11 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
 	}
 
 	/* FIXME: multipliers only act as pass-thru element for now */
-	multiplier = snd_usb_find_clock_multiplier(chip->ctrl_intf, entity_id);
+	multiplier = snd_usb_find_clock_multiplier(chip, entity_id, proto);
 	if (multiplier)
 		return __uac_clock_find_source(chip, fmt,
-					       multiplier->bCSourceID,
-					       visited, validate);
-
-	return -EINVAL;
-}
-
-static int __uac3_clock_find_source(struct snd_usb_audio *chip,
-				    const struct audioformat *fmt, int entity_id,
-				    unsigned long *visited, bool validate)
-{
-	struct uac3_clock_source_descriptor *source;
-	struct uac3_clock_selector_descriptor *selector;
-	struct uac3_clock_multiplier_descriptor *multiplier;
-
-	entity_id &= 0xff;
-
-	if (test_and_set_bit(entity_id, visited)) {
-		usb_audio_warn(chip,
-			 "%s(): recursive clock topology detected, id %d.\n",
-			 __func__, entity_id);
-		return -EINVAL;
-	}
-
-	/* first, see if the ID we're looking for is a clock source already */
-	source = snd_usb_find_clock_source_v3(chip->ctrl_intf, entity_id);
-	if (source) {
-		entity_id = source->bClockID;
-		if (validate && !uac_clock_source_is_valid(chip, fmt,
-								entity_id)) {
-			usb_audio_err(chip,
-				"clock source %d is not valid, cannot use\n",
-				entity_id);
-			return -ENXIO;
-		}
-		return entity_id;
-	}
-
-	selector = snd_usb_find_clock_selector_v3(chip->ctrl_intf, entity_id);
-	if (selector) {
-		int ret, i, cur, err;
-
-		/* the entity ID we are looking for is a selector.
-		 * find out what it currently selects */
-		ret = uac_clock_selector_get_val(chip, selector->bClockID);
-		if (ret < 0)
-			return ret;
-
-		/* Selector values are one-based */
-
-		if (ret > selector->bNrInPins || ret < 1) {
-			usb_audio_err(chip,
-				"%s(): selector reported illegal value, id %d, ret %d\n",
-				__func__, selector->bClockID, ret);
-
-			return -EINVAL;
-		}
-
-		cur = ret;
-		ret = __uac3_clock_find_source(chip, fmt,
-					       selector->baCSourceID[ret - 1],
+					       GET_VAL(multiplier, proto, bCSourceID),
 					       visited, validate);
-		if (ret > 0) {
-			err = uac_clock_selector_set_val(chip, entity_id, cur);
-			if (err < 0)
-				return err;
-		}
-
-		if (!validate || ret > 0 || !chip->autoclock)
-			return ret;
-
-		/* The current clock source is invalid, try others. */
-		for (i = 1; i <= selector->bNrInPins; i++) {
-			int err;
-
-			if (i == cur)
-				continue;
-
-			ret = __uac3_clock_find_source(chip, fmt,
-						       selector->baCSourceID[i - 1],
-						       visited, true);
-			if (ret < 0)
-				continue;
-
-			err = uac_clock_selector_set_val(chip, entity_id, i);
-			if (err < 0)
-				continue;
-
-			usb_audio_info(chip,
-				 "found and selected valid clock source %d\n",
-				 ret);
-			return ret;
-		}
-
-		return -ENXIO;
-	}
-
-	/* FIXME: multipliers only act as pass-thru element for now */
-	multiplier = snd_usb_find_clock_multiplier_v3(chip->ctrl_intf,
-						      entity_id);
-	if (multiplier)
-		return __uac3_clock_find_source(chip, fmt,
-						multiplier->bCSourceID,
-						visited, validate);
 
 	return -EINVAL;
 }
@@ -487,10 +379,8 @@ int snd_usb_clock_find_source(struct snd_usb_audio *chip,
 
 	switch (fmt->protocol) {
 	case UAC_VERSION_2:
-		return __uac_clock_find_source(chip, fmt, fmt->clock, visited,
-					       validate);
 	case UAC_VERSION_3:
-		return __uac3_clock_find_source(chip, fmt, fmt->clock, visited,
+		return __uac_clock_find_source(chip, fmt, fmt->clock, visited,
 					       validate);
 	default:
 		return -EINVAL;
@@ -593,18 +483,13 @@ int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
 	u32 bmControls;
 	__le32 data;
 	int err;
+	union uac23_clock_source_desc *cs_desc;
 
-	if (fmt->protocol == UAC_VERSION_3) {
-		struct uac3_clock_source_descriptor *cs_desc;
-
-		cs_desc = snd_usb_find_clock_source_v3(chip->ctrl_intf, clock);
-		bmControls = le32_to_cpu(cs_desc->bmControls);
-	} else {
-		struct uac_clock_source_descriptor *cs_desc;
-
-		cs_desc = snd_usb_find_clock_source(chip->ctrl_intf, clock);
-		bmControls = cs_desc->bmControls;
-	}
+	cs_desc = snd_usb_find_clock_source(chip, clock, fmt->protocol);
+	if (fmt->protocol == UAC_VERSION_3)
+		bmControls = le32_to_cpu(cs_desc->v3.bmControls);
+	else
+		bmControls = cs_desc->v2.bmControls;
 
 	writeable = uac_v2v3_control_is_writeable(bmControls,
 						  UAC2_CS_CONTROL_SAM_FREQ);
-- 
2.26.2

