Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 731293AF49F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:14:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB1B16C5;
	Mon, 21 Jun 2021 20:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB1B16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299264;
	bh=bo8UWv1o7PXNmZigW5otDOyN8WVqD1Gwy3yAQcAcTL8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qroqsh73apaEvk0k4rr6mAPsFMijMacZabm2u6d7lJkCmYcQrnbHY4qstea3IMxyi
	 upAyOYlH8Ymrcyog7sgyGoYuicRggQhipIw5ImW0qzA9xJqqLnjVaVAwwlkUmpngOJ
	 4q/WdD//VyRkh/3lW3s0HTsipIs2YZ5LQswbKsHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C06BF80525;
	Mon, 21 Jun 2021 20:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D20D7F80519; Mon, 21 Jun 2021 20:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 252A1F80510
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252A1F80510
Received: by m.b4.vu (Postfix, from userid 1000)
 id AB4EC61E287C; Tue, 22 Jun 2021 03:39:35 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:35 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 10/31] ALSA: usb-audio: scarlett2: Remove repeated device
 info comments
Message-ID: <3486e4d38973333d4ec38f32578c16a9f97bf6c8.1624294591.git.g@b4.vu>
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

Document the fields of struct scarlett2_device_info in the definition
of the struct, not in each instantiation.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 5cc4296944f5..ded99baa92de 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -218,10 +218,24 @@ struct scarlett2_ports {
 
 struct scarlett2_device_info {
 	u32 usb_id; /* USB device identifier */
-	u8 line_out_hw_vol; /* line out hw volume is sw controlled */
-	u8 level_input_count; /* inputs with level selectable */
-	u8 pad_input_count; /* inputs with pad selectable */
+
+	/* line out hw volume is sw controlled */
+	u8 line_out_hw_vol;
+
+	/* the number of analogue inputs with a software switchable
+	 * level control that can be set to line or instrument
+	 */
+	u8 level_input_count;
+
+	/* the number of analogue inputs with a software switchable
+	 * 10dB pad control
+	 */
+	u8 pad_input_count;
+
+	/* additional description for the line out volume controls */
 	const char * const line_out_descrs[SCARLETT2_ANALOGUE_MAX];
+
+	/* port count and type data */
 	struct scarlett2_ports ports[SCARLETT2_PORT_TYPE_COUNT];
 };
 
@@ -260,12 +274,7 @@ struct scarlett2_data {
 static const struct scarlett2_device_info s6i6_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8203),
 
-	/* The first two analogue inputs can be switched between line
-	 * and instrument levels.
-	 */
 	.level_input_count = 2,
-
-	/* The first two analogue inputs have an optional pad. */
 	.pad_input_count = 2,
 
 	.line_out_descrs = {
@@ -315,12 +324,7 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 static const struct scarlett2_device_info s18i8_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8204),
 
-	/* The first two analogue inputs can be switched between line
-	 * and instrument levels.
-	 */
 	.level_input_count = 2,
-
-	/* The first four analogue inputs have an optional pad. */
 	.pad_input_count = 4,
 
 	.line_out_descrs = {
@@ -378,9 +382,6 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 static const struct scarlett2_device_info s18i20_gen2_info = {
 	.usb_id = USB_ID(0x1235, 0x8201),
 
-	/* The analogue line outputs on the 18i20 can be switched
-	 * between software and hardware volume control
-	 */
 	.line_out_hw_vol = 1,
 
 	.line_out_descrs = {
-- 
2.31.1

