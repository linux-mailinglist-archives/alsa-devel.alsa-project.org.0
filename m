Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21153185B36
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:35:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71892186D;
	Sun, 15 Mar 2020 09:34:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71892186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261327;
	bh=kNNS1tzXTwKdeGXskUOrDXYItI9YqzaFmgWLUqd7SFg=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NAQ0gv9N/hBY/BqBLkJI02BsTzfDM8Uw2f1spmUASKdHr+3DMBKGUF5U9DCnaWzxl
	 KNpgw6awYRzGswprdUYNd+CEb5Cz61CZ1a154HIXevDw1URyI2p51Alyh7U84RFMxs
	 5CJGBKnpoQUmwL7M29q3fKaZ+vNpHHbvDuyl82Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DD5F80254;
	Sun, 15 Mar 2020 09:33:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C915F80086; Sat, 14 Mar 2020 09:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9A27F80086
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 09:12:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A27F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="N7A2DJXj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From
 :Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQp47Lfq/dlfZXdFAAgWsmuiRUI/yH3jDUEAaG1yTuk=; b=N7A2DJXjr0O2E7rSCFdKARDXfC
 dhp+QE08WIPRmfvxBp9Qh0GgJJoeWA4hSHVocIPxGtcNlIe//Tl97LGA6aCjI88ZbTUqytupSF34U
 dX0iKyZdJFN4du8FPJpLvRPIdCmfZYrSj5zC6RR5T6zV/3+4TQWo2Rb2EqgIOrRNt5mw=;
Received: from [fd06:8443:81a1:74b0::212] (port=1224 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jD1tC-0001OQ-9y; Sat, 14 Mar 2020 09:11:22 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jD1tC-0003cW-4k; Sat, 14 Mar 2020 09:11:22 +0100
Message-ID: <c9aed355adc93d5de0cc4c740d16d19e3e210f79.camel@domdv.de>
Subject: [PATCH 1/3] ALSA USB MIDI: Fix port starvation
From: Andreas Steinmetz <ast@domdv.de>
To: alsa-devel@alsa-project.org
Date: Sat, 14 Mar 2020 09:11:21 +0100
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

In case of a multiport USB MIDI interface the lower numbered ports starve
higher numbered ports when more than one port is busy transmitting data.
The starvation as of the current code is complete and can be for an
arbitrarily long time. Control from userspace is not possible without
at least halving the theoretically possible device throughput.
This is especially bad as there are now 16x16 interface products available.

An unpredicable and arbitrarily long latency is not acceptable. The
loss of half of the throughput is not acceptable, either. Fair
scheduling of all busy ports is required.

The patch below balances the actual USB output between all busy ports.
It is done in such a way that the single port use performance before
applying the patch is identical to the one after applying the patch.
To get there, the snd_usbmidi_transmit_byte helper had to be converted to
return output notification to allow for the 'repeat' shortcut.

The patch tries to avoid O(2) load increase by scaling the balancing
loop to the ports that are actually busy as far as this is possible.

For the patch to properly work the wMaxPacketSize of the device must be
large enough to allow for at least one MIDI event per port in a URB.
If this constraint is not met, which is quite improbable, starvation
will occur again. Though this could be fixed the likelyhood of such
a device is so low that the additional overhead introduced for all
other devices is not worth it. Current multi port MIDI interfaces do
typically have 2^n output ports and 2^x as wMaxPacketSize where x>n.

For a four port USB MIDI interface with a wMaxPacketSize of 64 the
maximum latency for any port is changed by the patch from indefinite
to 107.52ms.

The patch affects the output of all class compliant USB MIDI interfaces.
Users will typically experience either no change or increased response,
depending on their use case.

Signed-off-by: Andreas Steinmetz <ast@domdv.de>

--- a/sound/usb/midi.c	2020-03-12 22:45:06.611877152 +0100
+++ b/sound/usb/midi.c	2020-03-13 02:33:21.392847930 +0100
@@ -554,7 +554,7 @@ static void snd_usbmidi_output_midiman_p
 /*
  * Converts MIDI commands to USB MIDI packets.
  */
-static void snd_usbmidi_transmit_byte(struct usbmidi_out_port *port,
+static int snd_usbmidi_transmit_byte(struct usbmidi_out_port *port,
 				      uint8_t b, struct urb *urb)
 {
 	uint8_t p0 = port->cable;
@@ -563,6 +563,7 @@ static void snd_usbmidi_transmit_byte(st
 
 	if (b >= 0xf8) {
 		output_packet(urb, p0 | 0x0f, b, 0, 0);
+		return 1;
 	} else if (b >= 0xf0) {
 		switch (b) {
 		case 0xf0:
@@ -585,20 +586,20 @@ static void snd_usbmidi_transmit_byte(st
 		case 0xf6:
 			output_packet(urb, p0 | 0x05, 0xf6, 0, 0);
 			port->state = STATE_UNKNOWN;
-			break;
+			return 1;
 		case 0xf7:
 			switch (port->state) {
 			case STATE_SYSEX_0:
 				output_packet(urb, p0 | 0x05, 0xf7, 0, 0);
-				break;
+				return 1;
 			case STATE_SYSEX_1:
 				output_packet(urb, p0 | 0x06, port->data[0],
 					      0xf7, 0);
-				break;
+				return 1;
 			case STATE_SYSEX_2:
 				output_packet(urb, p0 | 0x07, port->data[0],
 					      port->data[1], 0xf7);
-				break;
+				return 1;
 			}
 			port->state = STATE_UNKNOWN;
 			break;
@@ -619,7 +620,7 @@ static void snd_usbmidi_transmit_byte(st
 				port->state = STATE_UNKNOWN;
 			}
 			output_packet(urb, p0, port->data[0], b, 0);
-			break;
+			return 1;
 		case STATE_2PARAM_1:
 			port->data[1] = b;
 			port->state = STATE_2PARAM_2;
@@ -633,7 +634,7 @@ static void snd_usbmidi_transmit_byte(st
 				port->state = STATE_UNKNOWN;
 			}
 			output_packet(urb, p0, port->data[0], port->data[1], b);
-			break;
+			return 1;
 		case STATE_SYSEX_0:
 			port->data[0] = b;
 			port->state = STATE_SYSEX_1;
@@ -646,29 +647,49 @@ static void snd_usbmidi_transmit_byte(st
 			output_packet(urb, p0 | 0x04, port->data[0],
 				      port->data[1], b);
 			port->state = STATE_SYSEX_0;
-			break;
+			return 1;
 		}
 	}
+	return 0;
 }
 
 static void snd_usbmidi_standard_output(struct snd_usb_midi_out_endpoint *ep,
 					struct urb *urb)
 {
 	int p;
+	int start = 0;
+	int total = 0x10;
+	int max = ep->max_transfer - 4;
+
+	if (max < 0)
+		return;
+
+	while (1) {
+		int first = -1;
+		int final = -1;
 
-	/* FIXME: lower-numbered ports can starve higher-numbered ports */
-	for (p = 0; p < 0x10; ++p) {
-		struct usbmidi_out_port *port = &ep->ports[p];
-		if (!port->active)
-			continue;
-		while (urb->transfer_buffer_length + 3 < ep->max_transfer) {
+		for (p = start; p < total; ++p) {
+			struct usbmidi_out_port *port = &ep->ports[p];
 			uint8_t b;
+			if (!port->active)
+				continue;
+repeat:
 			if (snd_rawmidi_transmit(port->substream, &b, 1) != 1) {
 				port->active = 0;
-				break;
+				continue;
 			}
-			snd_usbmidi_transmit_byte(port, b, urb);
+			if (!snd_usbmidi_transmit_byte(port, b, urb))
+				goto repeat;
+			if (urb->transfer_buffer_length > max)
+				return;
+			if (first == -1)
+				first = p;
+			final = p;
 		}
+		if (final == -1)
+			return;
+		start = first;
+		total = final + 1;
 	}
 }
 

