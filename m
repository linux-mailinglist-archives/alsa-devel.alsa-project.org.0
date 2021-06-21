Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C64253AF4CB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530A416F8;
	Mon, 21 Jun 2021 20:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530A416F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299496;
	bh=XPXwYis85l+2H3wX2hRoWLPZFiJ4+8VSMwn2dqRDaTc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SETGuTUzmHITrSu3C8qpLx2eKuf0uuSHjsriHlZC4GntobopFBiGYmy8MNQcYAojV
	 4ZW6FmmH5W9eNWB9i+mJK5NmHI4RqYr+vmE4keAcmaHtGEDbV1AhavTuRVB9ZreXZ6
	 xjGGc+SDgJZduvSczGe1TS4tG3ltFhoETXQRWhW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 145AEF805A8;
	Mon, 21 Jun 2021 20:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F38F8057C; Mon, 21 Jun 2021 20:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8168F8055A
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8168F8055A
Received: by m.b4.vu (Postfix, from userid 1000)
 id 2EEF261E287C; Tue, 22 Jun 2021 03:39:55 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:55 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 19/31] ALSA: usb-audio: scarlett2: Move get config above set
 config
Message-ID: <61337880a0eaec60cb6c15e4882435408528694d.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
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

Move scarlett2_usb_get() and scarlett2_usb_get_config() above the
functions relating to updating the configuration so that
scarlett2_usb_set_config() can call scarlett2_usb_get() in a
subsequent patch.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 6995d692c6b2..87a90cafb175 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -985,6 +985,34 @@ static int scarlett2_usb(
 	return err;
 }
 
+/* Send a USB message to get data; result placed in *buf */
+static int scarlett2_usb_get(
+	struct usb_mixer_interface *mixer,
+	int offset, void *buf, int size)
+{
+	struct {
+		__le32 offset;
+		__le32 size;
+	} __packed req;
+
+	req.offset = cpu_to_le32(offset);
+	req.size = cpu_to_le32(size);
+	return scarlett2_usb(mixer, SCARLETT2_USB_GET_DATA,
+			     &req, sizeof(req), buf, size);
+}
+
+/* Send a USB message to get configuration parameters; result placed in *buf */
+static int scarlett2_usb_get_config(
+	struct usb_mixer_interface *mixer,
+	int config_item_num, int count, void *buf)
+{
+	const struct scarlett2_config *config_item =
+		&scarlett2_config_items[config_item_num];
+	int size = config_item->size * count;
+
+	return scarlett2_usb_get(mixer, config_item->offset, buf, size);
+}
+
 /* Send SCARLETT2_USB_DATA_CMD SCARLETT2_USB_CONFIG_SAVE */
 static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 {
@@ -1049,34 +1077,6 @@ static int scarlett2_usb_set_config(
 	return 0;
 }
 
-/* Send a USB message to get data; result placed in *buf */
-static int scarlett2_usb_get(
-	struct usb_mixer_interface *mixer,
-	int offset, void *buf, int size)
-{
-	struct {
-		__le32 offset;
-		__le32 size;
-	} __packed req;
-
-	req.offset = cpu_to_le32(offset);
-	req.size = cpu_to_le32(size);
-	return scarlett2_usb(mixer, SCARLETT2_USB_GET_DATA,
-			     &req, sizeof(req), buf, size);
-}
-
-/* Send a USB message to get configuration parameters; result placed in *buf */
-static int scarlett2_usb_get_config(
-	struct usb_mixer_interface *mixer,
-	int config_item_num, int count, void *buf)
-{
-	const struct scarlett2_config *config_item =
-		&scarlett2_config_items[config_item_num];
-	int size = config_item->size * count;
-
-	return scarlett2_usb_get(mixer, config_item->offset, buf, size);
-}
-
 /* Send a USB message to get sync status; result placed in *sync */
 static int scarlett2_usb_get_sync_status(
 	struct usb_mixer_interface *mixer,
-- 
2.31.1

