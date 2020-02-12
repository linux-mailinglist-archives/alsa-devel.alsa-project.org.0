Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4FB15B57E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 00:56:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441A31673;
	Thu, 13 Feb 2020 00:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441A31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581551800;
	bh=gQaA/9md+5KcIA7pdTnzLxVIhdJP0GRSVB4CwhWcd4w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NRx/OmHuAZuOlJV5P9E4Rj4kxW1Bhh74I/D9yup611l6T+c1xFtip59HXdftu9OZr
	 vH45cCV6rvduPZHtBxp1k6SIYRb9tmdFtPI2Rt/wlj9mvhncZ2DLYrqfSzxkpB8I48
	 QC187+1yXvDA5c6MqMfUHhh8xxlN3Wp29rU13X3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5930BF80158;
	Thu, 13 Feb 2020 00:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E238EF80157; Thu, 13 Feb 2020 00:54:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E59CFF800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E59CFF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="BWtrAR09"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UwFKAYrNKmxQMzNjqqmu0HFqmQML5YLPyiv/W+Rk5tI=; b=BWtrAR09f1QbiW89uuAR8rXnBn
 qmSLqoN6uGQEYixeqHpVGfQK0XwBdCd4fsNP+PkPn196XWhYH9R1HNGv6Ii0PdB04Y9cfITPQqxLu
 lMDgNFauV8K6fEKteYCAr45po2+aw6pa5tLiNHDD6FKrOqIeRb4RwgBQImPCRjYxxn1U=;
Received: from [2a00:1370:8125:a23e:55c9:2d3a:3db9:4bca]
 (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1j21qF-000EBF-SD; Thu, 13 Feb 2020 02:54:51 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Date: Thu, 13 Feb 2020 02:54:50 +0300
Message-Id: <20200212235450.697348-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Tobias Oszlanyi <toszlanyi@yahoo.de>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Add clock validity quirk for
	Denon MC7000/MCX8000
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

It should be safe to ignore clock validity check result if the following
conditions are met:
 - only one single sample rate is supported;
 - the terminal is directly connected to the clock source;
 - the clock type is internal.

This is to deal with some Denon DJ controllers that always reports that
clock is invalid.

Tested-by: Tobias Oszlanyi <toszlanyi@yahoo.de>
Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/clock.c  | 91 ++++++++++++++++++++++++++++++++--------------
 sound/usb/clock.h  |  4 +-
 sound/usb/format.c |  3 +-
 3 files changed, 66 insertions(+), 32 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 018b1ecb5404..a48313dfa967 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -151,8 +151,34 @@ static int uac_clock_selector_set_val(struct snd_usb_audio *chip, int selector_i
 	return ret;
 }
 
+/*
+ * Assume the clock is valid if clock source supports only one single sample
+ * rate, the terminal is connected directly to it (there is no clock selector)
+ * and clock type is internal. This is to deal with some Denon DJ controllers
+ * that always reports that clock is invalid.
+ */
+static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
+					    struct audioformat *fmt,
+					    int source_id)
+{
+	if (fmt->protocol == UAC_VERSION_2) {
+		struct uac_clock_source_descriptor *cs_desc =
+			snd_usb_find_clock_source(chip->ctrl_intf, source_id);
+
+		if (!cs_desc)
+			return false;
+
+		return (fmt->nr_rates == 1 &&
+			(fmt->clock & 0xff) == cs_desc->bClockID &&
+			(cs_desc->bmAttributes & 0x3) !=
+				UAC_CLOCK_SOURCE_TYPE_EXT);
+	}
+
+	return false;
+}
+
 static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
-				      int protocol,
+				      struct audioformat *fmt,
 				      int source_id)
 {
 	int err;
@@ -160,7 +186,7 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 	struct usb_device *dev = chip->dev;
 	u32 bmControls;
 
-	if (protocol == UAC_VERSION_3) {
+	if (fmt->protocol == UAC_VERSION_3) {
 		struct uac3_clock_source_descriptor *cs_desc =
 			snd_usb_find_clock_source_v3(chip->ctrl_intf, source_id);
 
@@ -194,10 +220,14 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 		return false;
 	}
 
-	return data ? true :  false;
+	if (data)
+		return true;
+	else
+		return uac_clock_source_is_valid_quirk(chip, fmt, source_id);
 }
 
-static int __uac_clock_find_source(struct snd_usb_audio *chip, int entity_id,
+static int __uac_clock_find_source(struct snd_usb_audio *chip,
+				   struct audioformat *fmt, int entity_id,
 				   unsigned long *visited, bool validate)
 {
 	struct uac_clock_source_descriptor *source;
@@ -217,7 +247,7 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 	source = snd_usb_find_clock_source(chip->ctrl_intf, entity_id);
 	if (source) {
 		entity_id = source->bClockID;
-		if (validate && !uac_clock_source_is_valid(chip, UAC_VERSION_2,
+		if (validate && !uac_clock_source_is_valid(chip, fmt,
 								entity_id)) {
 			usb_audio_err(chip,
 				"clock source %d is not valid, cannot use\n",
@@ -248,8 +278,9 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 		}
 
 		cur = ret;
-		ret = __uac_clock_find_source(chip, selector->baCSourceID[ret - 1],
-					       visited, validate);
+		ret = __uac_clock_find_source(chip, fmt,
+					      selector->baCSourceID[ret - 1],
+					      visited, validate);
 		if (!validate || ret > 0 || !chip->autoclock)
 			return ret;
 
@@ -260,8 +291,9 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 			if (i == cur)
 				continue;
 
-			ret = __uac_clock_find_source(chip, selector->baCSourceID[i - 1],
-				visited, true);
+			ret = __uac_clock_find_source(chip, fmt,
+						      selector->baCSourceID[i - 1],
+						      visited, true);
 			if (ret < 0)
 				continue;
 
@@ -281,14 +313,16 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 	/* FIXME: multipliers only act as pass-thru element for now */
 	multiplier = snd_usb_find_clock_multiplier(chip->ctrl_intf, entity_id);
 	if (multiplier)
-		return __uac_clock_find_source(chip, multiplier->bCSourceID,
-						visited, validate);
+		return __uac_clock_find_source(chip, fmt,
+					       multiplier->bCSourceID,
+					       visited, validate);
 
 	return -EINVAL;
 }
 
-static int __uac3_clock_find_source(struct snd_usb_audio *chip, int entity_id,
-				   unsigned long *visited, bool validate)
+static int __uac3_clock_find_source(struct snd_usb_audio *chip,
+				    struct audioformat *fmt, int entity_id,
+				    unsigned long *visited, bool validate)
 {
 	struct uac3_clock_source_descriptor *source;
 	struct uac3_clock_selector_descriptor *selector;
@@ -307,7 +341,7 @@ static int __uac3_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 	source = snd_usb_find_clock_source_v3(chip->ctrl_intf, entity_id);
 	if (source) {
 		entity_id = source->bClockID;
-		if (validate && !uac_clock_source_is_valid(chip, UAC_VERSION_3,
+		if (validate && !uac_clock_source_is_valid(chip, fmt,
 								entity_id)) {
 			usb_audio_err(chip,
 				"clock source %d is not valid, cannot use\n",
@@ -338,7 +372,8 @@ static int __uac3_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 		}
 
 		cur = ret;
-		ret = __uac3_clock_find_source(chip, selector->baCSourceID[ret - 1],
+		ret = __uac3_clock_find_source(chip, fmt,
+					       selector->baCSourceID[ret - 1],
 					       visited, validate);
 		if (!validate || ret > 0 || !chip->autoclock)
 			return ret;
@@ -350,8 +385,9 @@ static int __uac3_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 			if (i == cur)
 				continue;
 
-			ret = __uac3_clock_find_source(chip, selector->baCSourceID[i - 1],
-				visited, true);
+			ret = __uac3_clock_find_source(chip, fmt,
+						       selector->baCSourceID[i - 1],
+						       visited, true);
 			if (ret < 0)
 				continue;
 
@@ -372,7 +408,8 @@ static int __uac3_clock_find_source(struct snd_usb_audio *chip, int entity_id,
 	multiplier = snd_usb_find_clock_multiplier_v3(chip->ctrl_intf,
 						      entity_id);
 	if (multiplier)
-		return __uac3_clock_find_source(chip, multiplier->bCSourceID,
+		return __uac3_clock_find_source(chip, fmt,
+						multiplier->bCSourceID,
 						visited, validate);
 
 	return -EINVAL;
@@ -389,18 +426,18 @@ static int __uac3_clock_find_source(struct snd_usb_audio *chip, int entity_id,
  *
  * Returns the clock source UnitID (>=0) on success, or an error.
  */
-int snd_usb_clock_find_source(struct snd_usb_audio *chip, int protocol,
-			      int entity_id, bool validate)
+int snd_usb_clock_find_source(struct snd_usb_audio *chip,
+			      struct audioformat *fmt, bool validate)
 {
 	DECLARE_BITMAP(visited, 256);
 	memset(visited, 0, sizeof(visited));
 
-	switch (protocol) {
+	switch (fmt->protocol) {
 	case UAC_VERSION_2:
-		return __uac_clock_find_source(chip, entity_id, visited,
+		return __uac_clock_find_source(chip, fmt, fmt->clock, visited,
 					       validate);
 	case UAC_VERSION_3:
-		return __uac3_clock_find_source(chip, entity_id, visited,
+		return __uac3_clock_find_source(chip, fmt, fmt->clock, visited,
 					       validate);
 	default:
 		return -EINVAL;
@@ -501,8 +538,7 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	 * automatic clock selection if the current clock is not
 	 * valid.
 	 */
-	clock = snd_usb_clock_find_source(chip, fmt->protocol,
-					  fmt->clock, true);
+	clock = snd_usb_clock_find_source(chip, fmt, true);
 	if (clock < 0) {
 		/* We did not find a valid clock, but that might be
 		 * because the current sample rate does not match an
@@ -510,8 +546,7 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 		 * and we will do another validation after setting the
 		 * rate.
 		 */
-		clock = snd_usb_clock_find_source(chip, fmt->protocol,
-						  fmt->clock, false);
+		clock = snd_usb_clock_find_source(chip, fmt, false);
 		if (clock < 0)
 			return clock;
 	}
@@ -577,7 +612,7 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 
 validation:
 	/* validate clock after rate change */
-	if (!uac_clock_source_is_valid(chip, fmt->protocol, clock))
+	if (!uac_clock_source_is_valid(chip, fmt, clock))
 		return -ENXIO;
 	return 0;
 }
diff --git a/sound/usb/clock.h b/sound/usb/clock.h
index 076e31b79ee0..68df0fbe09d0 100644
--- a/sound/usb/clock.h
+++ b/sound/usb/clock.h
@@ -6,7 +6,7 @@ int snd_usb_init_sample_rate(struct snd_usb_audio *chip, int iface,
 			     struct usb_host_interface *alts,
 			     struct audioformat *fmt, int rate);
 
-int snd_usb_clock_find_source(struct snd_usb_audio *chip, int protocol,
-			     int entity_id, bool validate);
+int snd_usb_clock_find_source(struct snd_usb_audio *chip,
+			      struct audioformat *fmt, bool validate);
 
 #endif /* __USBAUDIO_CLOCK_H */
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 9260136e4c9b..a77d6b1c403d 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -325,8 +325,7 @@ static int parse_audio_format_rates_v2v3(struct snd_usb_audio *chip,
 	struct usb_device *dev = chip->dev;
 	unsigned char tmp[2], *data;
 	int nr_triplets, data_size, ret = 0, ret_l6;
-	int clock = snd_usb_clock_find_source(chip, fp->protocol,
-					      fp->clock, false);
+	int clock = snd_usb_clock_find_source(chip, fp, false);
 
 	if (clock < 0) {
 		dev_err(&dev->dev,
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
