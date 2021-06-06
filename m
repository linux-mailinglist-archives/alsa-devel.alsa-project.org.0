Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3404939D040
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 19:47:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8C2174A;
	Sun,  6 Jun 2021 19:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8C2174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623001635;
	bh=10QxXFokLPcfgLLMbdADOEG7iCv56S4BrPK4nfvEId8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHTXljYfYd07Z/oTUULZ/3UDNRwqVHL1qitEOtpOVILCO7EvbOvn/SeNdUyNfQzzw
	 cakO59EX/qWKPcOLw54E82FCMcwVfihGq+atVaEkusfQ1q7kVSMMAdfjNLPgOpViHq
	 3wK+e8DqkwvTEUgF8ilN1+Y0IW0z1Y5/gZi7C+Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF1AF800D0;
	Sun,  6 Jun 2021 19:46:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8377FF804CB; Sun,  6 Jun 2021 19:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C208FF800D0
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 19:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C208FF800D0
Received: by m.b4.vu (Postfix, from userid 1000)
 id 1879B612FB14; Mon,  7 Jun 2021 03:15:54 +0930 (ACST)
Date: Mon, 7 Jun 2021 03:15:54 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/8] ALSA: usb-audio: scarlett2: Remove unused/useless code
Message-ID: <23a9a93d98566b5df7561103dfd62b51ce18d43b.1622999147.git.g@b4.vu>
References: <cover.1622999147.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1622999147.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vladimir Sadovnikov <sadko4u@gmail.com>
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

Remove #define not used.
Remove useless assignments and copies.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 2ebc8d6a9e6f..b134663f331a 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -271,7 +271,6 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 			.id = 0x000,
 			.num = { 1, 0, 8, 8, 8 },
 			.src_descr = "Off",
-			.src_num_offset = 0,
 		},
 		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
@@ -327,7 +326,6 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 			.id = 0x000,
 			.num = { 1, 0, 8, 8, 4 },
 			.src_descr = "Off",
-			.src_num_offset = 0,
 		},
 		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
@@ -393,7 +391,6 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 			.id = 0x000,
 			.num = { 1, 0, 8, 8, 6 },
 			.src_descr = "Off",
-			.src_num_offset = 0,
 		},
 		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
@@ -571,8 +568,6 @@ struct scarlett2_usb_packet {
 	u8 data[];
 };
 
-#define SCARLETT2_USB_PACKET_LEN (sizeof(struct scarlett2_usb_packet))
-
 static void scarlett2_fill_request_header(struct scarlett2_mixer_data *private,
 					  struct scarlett2_usb_packet *req,
 					  u32 cmd, u16 req_size)
@@ -595,8 +590,8 @@ static int scarlett2_usb(
 	struct scarlett2_mixer_data *private = mixer->private_data;
 	u16 req_buf_size = sizeof(struct scarlett2_usb_packet) + req_size;
 	u16 resp_buf_size = sizeof(struct scarlett2_usb_packet) + resp_size;
-	struct scarlett2_usb_packet *req = NULL, *resp = NULL;
-	int err = 0;
+	struct scarlett2_usb_packet *req, *resp = NULL;
+	int err;
 
 	req = kmalloc(req_buf_size, GFP_KERNEL);
 	if (!req) {
@@ -1026,10 +1021,6 @@ static int scarlett2_usb_set_mux(struct usb_mixer_interface *mixer)
 							ports, private->mux[j]
 						) << 12
 					  );
-
-			/* skip private->mux[j] entries not output */
-			j += ports[port_type].num[SCARLETT2_PORT_OUT] -
-			     ports[port_type].num[port_dir_rate];
 		}
 
 		err = scarlett2_usb(mixer, SCARLETT2_USB_SET_MUX,
@@ -1925,8 +1916,6 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 		ports[SCARLETT2_PORT_TYPE_ANALOGUE].num[SCARLETT2_PORT_OUT];
 	int num_mixer_out =
 		ports[SCARLETT2_PORT_TYPE_MIX].num[SCARLETT2_PORT_IN];
-	u8 level_switches[SCARLETT2_LEVEL_SWITCH_MAX];
-	u8 pad_switches[SCARLETT2_PAD_SWITCH_MAX];
 	struct scarlett2_usb_volume_status volume_status;
 	int err, i;
 
@@ -1935,11 +1924,9 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			mixer,
 			SCARLETT2_CONFIG_LEVEL_SWITCH,
 			info->level_input_count,
-			level_switches);
+			private->level_switch);
 		if (err < 0)
 			return err;
-		for (i = 0; i < info->level_input_count; i++)
-			private->level_switch[i] = level_switches[i];
 	}
 
 	if (info->pad_input_count) {
@@ -1947,11 +1934,9 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 			mixer,
 			SCARLETT2_CONFIG_PAD_SWITCH,
 			info->pad_input_count,
-			pad_switches);
+			private->pad_switch);
 		if (err < 0)
 			return err;
-		for (i = 0; i < info->pad_input_count; i++)
-			private->pad_switch[i] = pad_switches[i];
 	}
 
 	err = scarlett2_usb_get_volume_status(mixer, &volume_status);
-- 
2.31.1

