Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC66185B3E
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Mar 2020 09:36:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87CC21876;
	Sun, 15 Mar 2020 09:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87CC21876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584261384;
	bh=cI6E34OUlUD5RYYnFmqm4z413wvx8gQIS1EQtokauJY=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LxsSQs7Pp2Qkcqkfbg3ZcU6TTV0nNIzpN6NSk5i/SOHsx9ow9jrEJUEnMoqGJsj9G
	 XoigYKIHbpZs/Z/ZfxBd0E4JDnzM5iWZ9mbxXbdarLCd/zxePNcUHXgwsj9PSdIPQ0
	 5F56gkwrdNWsIKHLAqsn3sUNVYjJ4z1LKc/CP/GQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 783C7F8028D;
	Sun, 15 Mar 2020 09:33:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56C0DF801D9; Sat, 14 Mar 2020 09:12:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from zeus.domdv.de (zeus.domdv.de [IPv6:2a02:2ad0:c00::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00CD9F80086
 for <alsa-devel@alsa-project.org>; Sat, 14 Mar 2020 09:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CD9F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=domdv.de header.i=@domdv.de
 header.b="LOg6oevp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=domdv.de;
 s=dk3; h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Cc:To:From
 :Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mXhR7kW5ab/f8b7vZ1VJFg3sVuCfHiT6IkAyckcRW9Y=; b=LOg6oevph3guW6mR3UjyFFnUjY
 zW1aT7Q0l6lZFE47dlS5YWJX587L4pyrL6Qv8rcxgcqvSksC8RfNJrZCekzWTGaKKKXveL2xz56xb
 oKHrUvWyH3GG+HwDH7vHWwFPLzSp/mdpIWcpMw8GaVWZNPYz7sKYyyal6WanFFCxKUeY=;
Received: from [fd06:8443:81a1:74b0::212] (port=1228 helo=castor.lan.domdv.de)
 by zeus.domdv.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ast@domdv.de>)
 id 1jD1tJ-0001Oo-14; Sat, 14 Mar 2020 09:11:29 +0100
Received: from woody.lan.domdv.de ([10.1.9.28]
 helo=host028-server-9.lan.domdv.de)
 by castor.lan.domdv.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <ast@domdv.de>)
 id 1jD1tI-0003cg-Rm; Sat, 14 Mar 2020 09:11:28 +0100
Message-ID: <00d9b60b04efca71748acb006c05217ec8a28ef8.camel@domdv.de>
Subject: [PATCH 3/3] ALSA USB MIDI:  Make amount of MIDI events per output
 URB selectable by user
From: Andreas Steinmetz <ast@domdv.de>
To: alsa-devel@alsa-project.org
Date: Sat, 14 Mar 2020 09:11:28 +0100
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

This patch introduces a new module parameter "events" which allows
userspace to limit the amount of MIDI events per output URB. An
"events" value of 0 which is the default means "use wMaxPacketSize".
Out of range values for "events" are clamped to the nearest valid value.

It is assumed that the previous patches are applied and "outqueue=1" is
used. Looking then at a four port USB MIDI interface with a wMaxPacketSize
of 64 and assuming an optimal output rate of 320us/byte the following is
true:

16 MIDI events PER URB
Up to 3 bytes per MIDI event (3 bytes are assumed below)
A driver queue of 1 URB which is completely filled.
Resulting latency is 16*3*1*320us=15.36ms which still is in the
audible range (a latency of less than 5ms is required, think playing
a keyboard to MIDI in and using MIDI out to control a piano module
and using headphones, while using another port for sysex transfers).

After applying this patch and selecting the valid minimum event value
of 4 (there must be at least space for one event per port to assert proper
output balancing) tests show that the throughput isn't really affected,
the worst case latency however drops to 3.84ms which is acceptable.

In case of the largest class compliant devices which do have 16 ports
the worst case latency is then 15.36ms which is tolerable. If this is
still to long it could be fixed by introducing additional complexity
to the balancing of snd_usbmidi_standard_output() at some later stage.

As the device default is used by default no implications are expected for
existing users. By making the parameter writable via sysfs it is possible
to do selective output URB event count management from userspace via a
script that manages USB authorize and the module option.

Signed-off-by: Andreas Steinmetz <ast@domdv.de>

--- a/sound/usb/midi.c	2020-03-13 20:18:33.443265194 +0100
+++ b/sound/usb/midi.c	2020-03-13 20:42:49.445546326 +0100
@@ -79,9 +79,12 @@
 MODULE_LICENSE("Dual BSD/GPL");
 
 static int outqueue = OUTPUT_URBS;
+static int events;
 
 module_param(outqueue, int, 0644);
-MODULE_PARM_DESC(outqueue, "Outgoing queue size, 1-7 (default: 7).");
+MODULE_PARM_DESC(outqueue, "Outgoing MIDI queue size, 1-7 (default: 7).");
+module_param(events, int, 0644);
+MODULE_PARM_DESC(events, "MIDI events per queue element, 0=device default (default: 0).");
 
 
 struct usb_ms_header_descriptor {
@@ -1426,6 +1429,17 @@
 	switch (umidi->usb_id) {
 	default:
 		ep->max_transfer = usb_maxpacket(umidi->dev, pipe, 1);
+		if (events) {
+			int ev = 0;
+
+			for (i = 0; i < 0x10; ++i)
+				if (ep_info->out_cables & (1 << i))
+					ev++;
+			if (events > ev)
+				ev = events;
+			if (ev < ep->max_transfer >> 2)
+				ep->max_transfer = ev << 2;
+		}
 		break;
 		/*
 		 * Various chips declare a packet size larger than 4 bytes, but

