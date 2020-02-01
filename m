Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4014F738
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Feb 2020 09:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF761696;
	Sat,  1 Feb 2020 09:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF761696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580544483;
	bh=LIkfGeZMOAPVuSc14AsvEjVvCZ1uBibmQb8ojGI7hgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTAZSe6JOMs19tTejJaepSBtbDhXqFZVXMhJBZdMgzEVvXdBuB6uiASv5L6Bvd3Or
	 adB5QW3uTwWCKMTKq8YbKeV3SVUWqPtV2DxuoixMT2ZvfXrLxg9umUgvahzLSS1mpL
	 Xm0nvS+Wp7gOo/8CTmPf1nxhj/IC4s5oow1z7PuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7FE3F80259;
	Sat,  1 Feb 2020 09:05:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 852ABF80227; Sat,  1 Feb 2020 09:05:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 302CFF801EB
 for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2020 09:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302CFF801EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 360A2AD77
 for <alsa-devel@alsa-project.org>; Sat,  1 Feb 2020 08:05:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sat,  1 Feb 2020 09:05:29 +0100
Message-Id: <20200201080530.22390-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200201080530.22390-1-tiwai@suse.de>
References: <20200201080530.22390-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/3] ALSA: usb-audio: Annotate endianess in
	Scarlett gen2 quirk
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Scarlett gen2 mixer quirk code defines a few record types to
communicate via USB hub, and those must be all little-endian.
This patch changes the field types to LE to annotate endianess
properly.  It also fixes the incorrect usage of leXX_to_cpu() in a
couple of places, which was caught by sparse after this change.

Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett_gen2.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 94b903d95afa..74c00c905d24 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -558,11 +558,11 @@ static const struct scarlett2_config
 
 /* proprietary request/response format */
 struct scarlett2_usb_packet {
-	u32 cmd;
-	u16 size;
-	u16 seq;
-	u32 error;
-	u32 pad;
+	__le32 cmd;
+	__le16 size;
+	__le16 seq;
+	__le32 error;
+	__le32 pad;
 	u8 data[];
 };
 
@@ -664,11 +664,11 @@ static int scarlett2_usb(
 			"Scarlett Gen 2 USB invalid response; "
 			   "cmd tx/rx %d/%d seq %d/%d size %d/%d "
 			   "error %d pad %d\n",
-			le16_to_cpu(req->cmd), le16_to_cpu(resp->cmd),
+			le32_to_cpu(req->cmd), le32_to_cpu(resp->cmd),
 			le16_to_cpu(req->seq), le16_to_cpu(resp->seq),
 			resp_size, le16_to_cpu(resp->size),
-			le16_to_cpu(resp->error),
-			le16_to_cpu(resp->pad));
+			le32_to_cpu(resp->error),
+			le32_to_cpu(resp->pad));
 		err = -EINVAL;
 		goto unlock;
 	}
@@ -687,7 +687,7 @@ static int scarlett2_usb(
 /* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
 static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 {
-	u32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
+	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
 
 	scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
 		      &req, sizeof(u32),
@@ -713,11 +713,11 @@ static int scarlett2_usb_set_config(
 	const struct scarlett2_config config_item =
 	       scarlett2_config_items[config_item_num];
 	struct {
-		u32 offset;
-		u32 bytes;
-		s32 value;
+		__le32 offset;
+		__le32 bytes;
+		__le32 value;
 	} __packed req;
-	u32 req2;
+	__le32 req2;
 	int err;
 	struct scarlett2_mixer_data *private = mixer->private_data;
 
@@ -753,8 +753,8 @@ static int scarlett2_usb_get(
 	int offset, void *buf, int size)
 {
 	struct {
-		u32 offset;
-		u32 size;
+		__le32 offset;
+		__le32 size;
 	} __packed req;
 
 	req.offset = cpu_to_le32(offset);
@@ -794,8 +794,8 @@ static int scarlett2_usb_set_mix(struct usb_mixer_interface *mixer,
 	const struct scarlett2_device_info *info = private->info;
 
 	struct {
-		u16 mix_num;
-		u16 data[SCARLETT2_INPUT_MIX_MAX];
+		__le16 mix_num;
+		__le16 data[SCARLETT2_INPUT_MIX_MAX];
 	} __packed req;
 
 	int i, j;
@@ -850,9 +850,9 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 	};
 
 	struct {
-		u16 pad;
-		u16 num;
-		u32 data[SCARLETT2_MUX_MAX];
+		__le16 pad;
+		__le16 num;
+		__le32 data[SCARLETT2_MUX_MAX];
 	} __packed req;
 
 	req.pad = 0;
@@ -911,9 +911,9 @@ static int scarlett2_usb_get_meter_levels(struct usb_mixer_interface *mixer,
 					  u16 *levels)
 {
 	struct {
-		u16 pad;
-		u16 num_meters;
-		u32 magic;
+		__le16 pad;
+		__le16 num_meters;
+		__le32 magic;
 	} __packed req;
 	u32 resp[SCARLETT2_NUM_METERS];
 	int i, err;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
