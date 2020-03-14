Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B29185B37
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:35:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B0371867;
	Sun, 15 Mar 2020 09:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B0371867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261343;
	bh=oVnru5yMXHwM6ttGqec4ooXGuyU2MMp8xCGHSGIq4nQ=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CVuw82bK9zew3KGylB7lgpk+1SKXTz6r+ydh9lKcWes45mjjzQ+psZ6Pxn85WMA9J
	 oZa1n7RUoGlVe9IP5vbZt20iOSN8pZbSCWZQPLlaXZY6lISZCs2LB4TO1cJYRy/+my
	 Hx+3ClFDZJDY6LXM23PiXdC/uzMXtGRaJ9CxYmuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D54AF8028C;
	Sun, 15 Mar 2020 09:33:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF95AF8020C; Sat, 14 Mar 2020 09:12:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0403EF8013D
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 09:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0403EF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="bFHfCXEr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From
 :Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BHrLHoS3b9S3egxYoGnr9pRgJAHSWSaim92tfzqxv8k=; b=bFHfCXErZASuEXo6DyPM3JU0/F
 8YlYbC7JYZzrY50rLaIzPS2pgm6EQa5qZ+bJ+6khnqOTf5tVo92fpBoBbG8BG4qHNpqEl/3Sm6VaK
 OtmzPn/zQkDeU8XieI2agKNMjEwnXaFpFK/5/HBiPKjd5piKQQPxW/EE8O2W2Nnw1MlI=;
Received: from [fd06:8443:81a1:74b0::212] (port=1226 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jD1tG-0001Od-0O; Sat, 14 Mar 2020 09:11:26 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jD1tF-0003cb-RN; Sat, 14 Mar 2020 09:11:25 +0100
Message-ID: <4d24ecd833aec61fec3decadf195861c4f22634d.camel@domdv.de>
Subject: [PATCH 2/3] ALSA USB MIDI: Make amount of output URBs selectable by
 user
From: Andreas Steinmetz <ast@domdv.de>
To: alsa-devel@alsa-project.org
Date: Sat, 14 Mar 2020 09:11:25 +0100
Organization: D.O.M. Datenverarbeitung GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 15 Mar 2020 09:32:59 +0100
Cc: clemens@ladisch.de
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

This patch introduces a new module parameter "outqueue" which allows
userspace to set the amount of output URBs is a range from 1 to 7
with 7 being the default (illegal values are clamped to the next
valid value).

It is assumed that the previous patch has been applied. Looking then
at a multiport USB MIDI interface with a wMaxPacketSize of 64 and
assuming an optimal output rate of 320us/byte the following is true:

16 MIDI events PER URB
Up to 3 bytes per MIDI event (3 bytes are assumed below)
A driver queue of 7 URBs which are completely filled.
Resulting latency is 16*3*7*320us=107.52ms

So if all URBs are filled by e.g. a sysex transfer on one port, a realtime
message delivered by userspace for another port will be delayed by 107.52ms
which is far too long.

After applying this patch and selecting a queue of only 1 URB tests show
that the throughput isn't really affected, the latency however drops to
16*3*1*320us=15.36ms which is considerably better.

As the default is not touched no implications are expected for existing
users. By making the parameter writable via sysfs it is possible to
do selective output URB queue size management from userspace via a script
that manages USB authorize and the module option.

Signed-off-by: Andreas Steinmetz <ast@domdv.de>

--- a/sound/usb/midi.c	2020-03-13 19:19:28.614798593 +0100
+++ b/sound/usb/midi.c	2020-03-13 19:37:08.097411436 +0100
@@ -45,6 +45,7 @@
 #include <linux/slab.h>
 #include <linux/timer.h>
 #include <linux/usb.h>
+#include <linux/moduleparam.h>
 #include <linux/wait.h>
 #include <linux/usb/audio.h>
 #include <linux/module.h>
@@ -77,6 +78,11 @@
 MODULE_DESCRIPTION("USB Audio/MIDI helper module");
 MODULE_LICENSE("Dual BSD/GPL");
 
+static int outqueue = OUTPUT_URBS;
+
+module_param(outqueue, int, 0644);
+MODULE_PARM_DESC(outqueue, "Outgoing queue size, 1-7 (default: 7).");
+
 
 struct usb_ms_header_descriptor {
 	__u8  bLength;
@@ -141,6 +147,7 @@
 	} urbs[OUTPUT_URBS];
 	unsigned int active_urbs;
 	unsigned int drain_urbs;
+	unsigned int out_urbs;
 	int max_transfer;		/* size of urb buffer */
 	struct tasklet_struct tasklet;
 	unsigned int next_urb;
@@ -335,7 +342,7 @@
 				break;
 			ep->active_urbs |= 1 << urb_index;
 		}
-		if (++urb_index >= OUTPUT_URBS)
+		if (++urb_index >= ep->out_urbs)
 			urb_index = 0;
 		if (urb_index == ep->next_urb)
 			break;
@@ -1364,7 +1371,7 @@
 {
 	unsigned int i;
 
-	for (i = 0; i < OUTPUT_URBS; ++i)
+	for (i = 0; i < ep->out_urbs; ++i)
 		if (ep->urbs[i].urb) {
 			free_urb_and_buffer(ep->umidi, ep->urbs[i].urb,
 					    ep->max_transfer);
@@ -1397,7 +1404,14 @@
 		return -ENOMEM;
 	ep->umidi = umidi;
 
-	for (i = 0; i < OUTPUT_URBS; ++i) {
+	if (outqueue < 1)
+		ep->out_urbs = 1;
+	else if (outqueue > OUTPUT_URBS)
+		ep->out_urbs = OUTPUT_URBS;
+	else
+		ep->out_urbs = outqueue;
+
+	for (i = 0; i < ep->out_urbs; ++i) {
 		ep->urbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!ep->urbs[i].urb) {
 			err = -ENOMEM;
@@ -1434,7 +1448,7 @@
 		ep->max_transfer = 9;
 		break;
 	}
-	for (i = 0; i < OUTPUT_URBS; ++i) {
+	for (i = 0; i < ep->out_urbs; ++i) {
 		buffer = usb_alloc_coherent(umidi->dev,
 					    ep->max_transfer, GFP_KERNEL,
 					    &ep->urbs[i].urb->transfer_dma);
@@ -1525,7 +1539,7 @@
 		if (ep->out)
 			tasklet_kill(&ep->out->tasklet);
 		if (ep->out) {
-			for (j = 0; j < OUTPUT_URBS; ++j)
+			for (j = 0; j < ep->out->out_urbs; ++j)
 				usb_kill_urb(ep->out->urbs[j].urb);
 			if (umidi->usb_protocol_ops->finish_out_endpoint)
 				umidi->usb_protocol_ops->finish_out_endpoint(ep->out);

