Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A13B0B0B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DDA1673;
	Tue, 22 Jun 2021 19:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DDA1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381480;
	bh=IDwnmqQoeDlhe6gRYHC758tw7Ig1qOJWldr3RNoUhCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoQHZXDw0wF80mDnazU5kyJ7esW30U3CEWV8H+8CVxz31zijihcGIKi/hSnzyuMhV
	 nXg3PF4D3BSBID7jom3LeQACSMEnk8LMLzy3sdw2AT4fs8jYJQkCN4YuCX+do0VAyM
	 FUF4b8//uW7d3BDdLHEHiBVMRet62BcCByiAtkAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C233DF800E1;
	Tue, 22 Jun 2021 19:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 600DAF804C3; Tue, 22 Jun 2021 19:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81ECBF804C3
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81ECBF804C3
Received: by m.b4.vu (Postfix, from userid 1000)
 id 112CB61E286D; Wed, 23 Jun 2021 02:32:25 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:32:25 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 06/17] ALSA: usb-audio: scarlett2: Allow bit-level access to
 config
Message-ID: <4e54e9e106ec7029c1a668c51b4fc769a7eb4ed0.1624379707.git.g@b4.vu>
References: <cover.1624379707.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624379707.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Add support for accessing configuration values when multiple values
are stored in one byte. Needed by the upcoming Solo and 2i2 Gen 3
support.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 68 ++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 13 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 7a5346c68603..08e7b687484e 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -814,7 +814,7 @@ enum {
 };
 
 /* Location, size, and activation command number for the configuration
- * parameters
+ * parameters. Size is in bits and may be 1, 8, or 16.
  */
 struct scarlett2_config {
 	u8 offset;
@@ -825,25 +825,25 @@ struct scarlett2_config {
 static const struct scarlett2_config
 		scarlett2_config_items[SCARLETT2_CONFIG_COUNT] = {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
-		.offset = 0x31, .size = 1, .activate = 2 },
+		.offset = 0x31, .size = 8, .activate = 2 },
 
 	[SCARLETT2_CONFIG_LINE_OUT_VOLUME] = {
-		.offset = 0x34, .size = 2, .activate = 1 },
+		.offset = 0x34, .size = 16, .activate = 1 },
 
 	[SCARLETT2_CONFIG_MUTE_SWITCH] = {
-		.offset = 0x5c, .size = 1, .activate = 1 },
+		.offset = 0x5c, .size = 8, .activate = 1 },
 
 	[SCARLETT2_CONFIG_SW_HW_SWITCH] = {
-		.offset = 0x66, .size = 1, .activate = 3 },
+		.offset = 0x66, .size = 8, .activate = 3 },
 
 	[SCARLETT2_CONFIG_LEVEL_SWITCH] = {
-		.offset = 0x7c, .size = 1, .activate = 7 },
+		.offset = 0x7c, .size = 8, .activate = 7 },
 
 	[SCARLETT2_CONFIG_PAD_SWITCH] = {
-		.offset = 0x84, .size = 1, .activate = 8 },
+		.offset = 0x84, .size = 8, .activate = 8 },
 
 	[SCARLETT2_CONFIG_MSD_SWITCH] = {
-		.offset = 0x9d, .size = 1, .activate = 6 },
+		.offset = 0x9d, .size = 8, .activate = 6 },
 };
 
 /* proprietary request/response format */
@@ -1008,9 +1008,25 @@ static int scarlett2_usb_get_config(
 {
 	const struct scarlett2_config *config_item =
 		&scarlett2_config_items[config_item_num];
-	int size = config_item->size * count;
+	int size, err, i;
+	u8 value;
 
-	return scarlett2_usb_get(mixer, config_item->offset, buf, size);
+	/* For byte-sized parameters, retrieve directly into buf */
+	if (config_item->size >= 8) {
+		size = config_item->size / 8 * count;
+		return scarlett2_usb_get(mixer, config_item->offset, buf, size);
+	}
+
+	/* For bit-sized parameters, retrieve into value */
+	err = scarlett2_usb_get(mixer, config_item->offset, &value, 1);
+	if (err < 0)
+		return err;
+
+	/* then unpack from value into buf[] */
+	for (i = 0; i < 8 && i < count; i++, value >>= 1)
+		*(u8 *)buf++ = value & 1;
+
+	return 0;
 }
 
 /* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
@@ -1047,18 +1063,44 @@ static int scarlett2_usb_set_config(
 		__le32 value;
 	} __packed req;
 	__le32 req2;
+	int offset, size;
 	int err;
 	struct scarlett2_data *private = mixer->private_data;
 
 	/* Cancel any pending NVRAM save */
 	cancel_delayed_work_sync(&private->work);
 
+	/* Convert config_item->size in bits to size in bytes and
+	 * calculate offset
+	 */
+	if (config_item->size >= 8) {
+		size = config_item->size / 8;
+		offset = config_item->offset + index * size;
+
+	/* If updating a bit, retrieve the old value, set/clear the
+	 * bit as needed, and update value
+	 */
+	} else {
+		u8 tmp;
+
+		size = 1;
+		offset = config_item->offset;
+
+		scarlett2_usb_get(mixer, offset, &tmp, 1);
+		if (value)
+			tmp |= (1 << index);
+		else
+			tmp &= ~(1 << index);
+
+		value = tmp;
+	}
+
 	/* Send the configuration parameter data */
-	req.offset = cpu_to_le32(config_item->offset + index * config_item->size);
-	req.bytes = cpu_to_le32(config_item->size);
+	req.offset = cpu_to_le32(offset);
+	req.bytes = cpu_to_le32(size);
 	req.value = cpu_to_le32(value);
 	err = scarlett2_usb(mixer, SCARLETT2_USB_SET_DATA,
-			    &req, sizeof(u32) * 2 + config_item->size,
+			    &req, sizeof(u32) * 2 + size,
 			    NULL, 0);
 	if (err < 0)
 		return err;
-- 
2.31.1

