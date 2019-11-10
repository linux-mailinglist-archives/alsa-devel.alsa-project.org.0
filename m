Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C499F6928
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Nov 2019 14:45:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16371673;
	Sun, 10 Nov 2019 14:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16371673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573393556;
	bh=wW+vMbEA5JMMWN5i7uG5O0CT8S7woALabU1Hn+0uBn8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VAHRoHM283kkRYzKBPIFS7/7nT9OfRxFSQdNao/nYSRCUXueuUMHZsCwqq/FzwSqH
	 0hiq+mXJc1R9BYy1GlXGGCSdkPl2tdWeLTda8L4mDDLtH39gHpruY+DOEgCW2N7Za9
	 UTBvvSYfR9SDO6lTnsXu8/EJjBwWiiCrensHQU7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19513F802E0;
	Sun, 10 Nov 2019 14:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F067F80483; Sun, 10 Nov 2019 14:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from b4.vu (b4.vu [203.16.231.147])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7060CF802E0
 for <alsa-devel@alsa-project.org>; Sun, 10 Nov 2019 14:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7060CF802E0
Received: from b4.vu (localhost.localdomain [127.0.0.1])
 by b4.vu (8.13.8/8.13.8) with ESMTP id xAADhv7U031839
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 00:13:57 +1030
Received: (from g@localhost) by b4.vu (8.13.8/8.13.8/Submit) id xAADhuH5031838
 for alsa-devel@alsa-project.org; Mon, 11 Nov 2019 00:13:56 +1030
Date: Mon, 11 Nov 2019 00:13:56 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org
Message-ID: <20191110134356.GA31589@b4.vu>
Mime-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.4.2.2i
Subject: [alsa-devel] [PATCH RFC] ALSA: usb-audio: Fix Scarlett 6i6 Gen 2
	port data
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

The s6i6_gen2_info.ports[] array had the Mixer and PCM port type
entries in the wrong place. Use designators to explicitly specify the
array elements being set.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Reported-by: (TBA, have asked for permission)
Tested-by: Alex Fellows <alex.fellows@gmail.com>
Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")

---
 sound/usb/mixer_scarlett_gen2.c | 36 ++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 7d460b1f1735..94b903d95afa 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -261,34 +261,34 @@ static const struct scarlett2_device_info s6i6_gen2_info = {
 	},
 
 	.ports = {
-		{
+		[SCARLETT2_PORT_TYPE_NONE] = {
 			.id = 0x000,
 			.num = { 1, 0, 8, 8, 8 },
 			.src_descr = "Off",
 			.src_num_offset = 0,
 		},
-		{
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
 			.num = { 4, 4, 4, 4, 4 },
 			.src_descr = "Analogue %d",
 			.src_num_offset = 1,
 			.dst_descr = "Analogue Output %02d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			.id = 0x180,
 			.num = { 2, 2, 2, 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
 			.dst_descr = "S/PDIF Output %d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_MIX] = {
 			.id = 0x300,
 			.num = { 10, 18, 18, 18, 18 },
 			.src_descr = "Mix %c",
 			.src_num_offset = 65,
 			.dst_descr = "Mixer Input %02d Capture"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
 			.num = { 6, 6, 6, 6, 6 },
 			.src_descr = "PCM %d",
@@ -317,44 +317,44 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 	},
 
 	.ports = {
-		{
+		[SCARLETT2_PORT_TYPE_NONE] = {
 			.id = 0x000,
 			.num = { 1, 0, 8, 8, 4 },
 			.src_descr = "Off",
 			.src_num_offset = 0,
 		},
-		{
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
 			.num = { 8, 6, 6, 6, 6 },
 			.src_descr = "Analogue %d",
 			.src_num_offset = 1,
 			.dst_descr = "Analogue Output %02d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_SPDIF] = {
+			.id = 0x180,
 			/* S/PDIF outputs aren't available at 192KHz
 			 * but are included in the USB mux I/O
 			 * assignment message anyway
 			 */
-			.id = 0x180,
 			.num = { 2, 2, 2, 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
 			.dst_descr = "S/PDIF Output %d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_ADAT] = {
 			.id = 0x200,
 			.num = { 8, 0, 0, 0, 0 },
 			.src_descr = "ADAT %d",
 			.src_num_offset = 1,
 		},
-		{
+		[SCARLETT2_PORT_TYPE_MIX] = {
 			.id = 0x300,
 			.num = { 10, 18, 18, 18, 18 },
 			.src_descr = "Mix %c",
 			.src_num_offset = 65,
 			.dst_descr = "Mixer Input %02d Capture"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
 			.num = { 20, 18, 18, 14, 10 },
 			.src_descr = "PCM %d",
@@ -387,20 +387,20 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 	},
 
 	.ports = {
-		{
+		[SCARLETT2_PORT_TYPE_NONE] = {
 			.id = 0x000,
 			.num = { 1, 0, 8, 8, 6 },
 			.src_descr = "Off",
 			.src_num_offset = 0,
 		},
-		{
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {
 			.id = 0x080,
 			.num = { 8, 10, 10, 10, 10 },
 			.src_descr = "Analogue %d",
 			.src_num_offset = 1,
 			.dst_descr = "Analogue Output %02d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			/* S/PDIF outputs aren't available at 192KHz
 			 * but are included in the USB mux I/O
 			 * assignment message anyway
@@ -411,21 +411,21 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 			.src_num_offset = 1,
 			.dst_descr = "S/PDIF Output %d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_ADAT] = {
 			.id = 0x200,
 			.num = { 8, 8, 8, 4, 0 },
 			.src_descr = "ADAT %d",
 			.src_num_offset = 1,
 			.dst_descr = "ADAT Output %d Playback"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_MIX] = {
 			.id = 0x300,
 			.num = { 10, 18, 18, 18, 18 },
 			.src_descr = "Mix %c",
 			.src_num_offset = 65,
 			.dst_descr = "Mixer Input %02d Capture"
 		},
-		{
+		[SCARLETT2_PORT_TYPE_PCM] = {
 			.id = 0x600,
 			.num = { 20, 18, 18, 14, 10 },
 			.src_descr = "PCM %d",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
