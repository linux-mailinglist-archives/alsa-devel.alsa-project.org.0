Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 928A83B0B0A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 19:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF4D165E;
	Tue, 22 Jun 2021 19:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF4D165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624381449;
	bh=P4NxamtGL4Q6Rkyv1pK2MSFiVUtdTDl6AXcan80CgiA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p+4uBbf2sxvkvTEEZcEYhLcvalclhVd9j0nWbDHMWPouI6W2ZeZxenLcr0jws38nE
	 rFyqeYjRFjsDFZMZpyg0RAM5cOGxJpEVhuMWBFrADmjuCNdu9L+wCTSeA53xtAD8/H
	 yD3kCt2rPnn4FossSqivnl/syUaoKEtBq0qbLn0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 289E9F804EC;
	Tue, 22 Jun 2021 19:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5CA0F804EB; Tue, 22 Jun 2021 19:02:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 535EDF804E6
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 19:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 535EDF804E6
Received: by m.b4.vu (Postfix, from userid 1000)
 id 316A061E286D; Wed, 23 Jun 2021 02:32:09 +0930 (ACST)
Date: Wed, 23 Jun 2021 02:32:09 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/17] ALSA: usb-audio: scarlett2: Move get config above set
 config
Message-ID: <1549f8e44548be679119f0b1462f888f4a03812d.1624379707.git.g@b4.vu>
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

Move scarlett2_usb_get() and scarlett2_usb_get_config() above the
functions relating to updating the configuration so that
scarlett2_usb_set_config() can call scarlett2_usb_get() in a
subsequent patch.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index f35420369042..7a5346c68603 100644
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

