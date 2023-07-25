Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57C760A52
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 08:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A56E92;
	Tue, 25 Jul 2023 08:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A56E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690266468;
	bh=u2h5IVSkSiYC0Yv58w2KAoolrN20623YMQHuGvzvV9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jplBwAZ+RXabKOUp6UCZhecTOrJEIksqkv6iz+jb/s/jnB1jm4Hd+Hiq6nvCfx2ZZ
	 AC50YaganJFXC9DkwBU/9LJNGNRUOyagiCCoPHiO9KVpNEqDR78KQx/Ml3k3IEw7Q+
	 1Vki2vP/xheqQhugPZqdVOFmUR0KVxBIPFZkF8mI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73981F800C7; Tue, 25 Jul 2023 08:26:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1269AF80163;
	Tue, 25 Jul 2023 08:26:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 188A5F80163; Tue, 25 Jul 2023 08:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35904F80310
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 08:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35904F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=k0QQ3EIa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=igRWm8yi
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 948D7224B1;
	Tue, 25 Jul 2023 06:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690266132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38Kf27qLGwtr7mNgdf5byvs73kGBmPsZ0oBHrWVAK5U=;
	b=k0QQ3EIaWdzg6N065CdlgUBl13ElrvnYlI/5vgNCVFG2LgzTPigbYzY1l8GUa8ocaJXkxV
	eWZLLR3/msQFV/oOGy0tid19Yqg37dgfpkzDGfNeA9yo3bwnI5DzwK3gqQnM+bbfm/Moaj
	pgzBPeAw2aE4Iw2P3CA5WHUxgnSGQQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690266132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38Kf27qLGwtr7mNgdf5byvs73kGBmPsZ0oBHrWVAK5U=;
	b=igRWm8yi487PeE6Zy2MbG8e13BHbkKPiD5Sts4RIicjp9/T+3EwwSO8jtgnOIbEQztTtlA
	N+I4mUp3MGJ+juCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F61A1390F;
	Tue, 25 Jul 2023 06:22:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2Ng0GhRqv2S0dQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 06:22:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] usb: gadget: midi2: Add testing documentation
Date: Tue, 25 Jul 2023 08:22:04 +0200
Message-Id: <20230725062206.9674-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230725062206.9674-1-tiwai@suse.de>
References: <20230725062206.9674-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LK542U5NW2CZPHFBAAM4LIUV635JBNOG
X-Message-ID-Hash: LK542U5NW2CZPHFBAAM4LIUV635JBNOG
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LK542U5NW2CZPHFBAAM4LIUV635JBNOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Describing brief testing of the new MIDI 2.0 function driver.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/usb/gadget-testing.rst | 141 +++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 2fca40443dc9..0f3708ae5bc8 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -27,6 +27,7 @@ provided by gadgets.
    18. UVC function
    19. PRINTER function
    20. UAC1 function (new API)
+   21. MIDI2 function
 
 
 1. ACM function
@@ -965,3 +966,143 @@ e.g.::
 
 	$ arecord -f dat -t wav -D hw:CARD=UAC1Gadget,DEV=0 | \
 	  aplay -D default:CARD=OdroidU3
+
+
+21. MIDI2 function
+==================
+
+The function is provided by usb_f_midi2.ko module.
+It will create a virtual ALSA card containing a UMP rawmidi device
+where the UMP packet is looped back. In addition, a legacy rawmidi
+device is created. The UMP rawmidi is bound with ALSA sequencer
+clients, too.
+
+Function-specific configfs interface
+------------------------------------
+
+The function name to use when creating the function directory is "midi2".
+The midi2 function provides these attributes in its function directory
+as the card top-level information:
+
+	=============	=================================================
+	process_ump	Bool flag to process UMP Stream messages (0 or 1)
+	static_block	Bool flag for static blocks (0 or 1)
+	iface_name	Optional interface name string
+	=============	=================================================
+
+The directory contains a subdirectory "ep.0", and this provides the
+attributes for a UMP Endpoint (which is a pair of USB MIDI Endpoints):
+
+	=============	=================================================
+	protocol_caps	MIDI protocol capabilities;
+			1: MIDI 1.0, 2: MIDI 2.0, or 3: both protocols
+	protocol	Default MIDI protocol (either 1 or 2)
+	ep_name		UMP Endpoint name string
+	product_id	Product ID string
+	manufacturer	Manufacture ID number (24 bit)
+	family		Device family ID number (16 bit)
+	model		Device model ID number (16 bit)
+	sw_revision	Software revision (32 bit)
+	=============	=================================================
+
+Each Endpoint subdirectory contains a subdirectory "block.0", which
+represents the Function Block for Block 0 information.
+Its attributes are:
+
+	===============	===============================================
+	name		Function Block name string
+	direction	Direction of this FB
+			1: input, 2: output, or 3: bidirectional
+	first_group	The first UMP Group number (0-15)
+	num_groups	The number of groups in this FB (1-16)
+	ui_hint		UI-hint of this FB
+			0: unknown, 1: receiver, 2: sender, 3: both
+	midi_ci_verison	Supported MIDI-CI version number (8 bit)
+	is_midi1	Legacy MIDI 1.0 device (0-2)
+			0: MIDI 2.0 device,
+			1: MIDI 1.0 without restriction, or
+			2: MIDI 1.0 with low speed
+	sysex8_streams	Max number of SysEx8 streams (8 bit)
+	active		Bool flag for FB activity (0 or 1)
+	===============	===============================================
+
+If multiple Function Blocks are required, you can add more Function
+Blocks by creating subdirectories "block.<num>" with the corresponding
+Function Block number (1, 2, ....). The FB subdirectories can be
+dynamically removed, too. Note that the Function Block numbers must be
+continuous.
+
+Similarly, if you multiple UMP Endpoints are required, you can add
+more Endpoints by creating subdirectories "ep.<num>". The number must
+be continuous.
+
+For emulating the old MIDI 2.0 device without UMP v1.1 support, pass 0
+to `process_ump` flag. Then the whole UMP v1.1 requests are ignored.
+
+Testing the MIDI2 function
+--------------------------
+
+On the device: run the gadget, and running::
+
+  $ cat /proc/asound/cards
+
+will show a new sound card containing a MIDI2 device.
+
+OTOH, on the host::
+
+  $ cat /proc/asound/cards
+
+will show a new sound card containing either MIDI1 or MIDI2 device,
+depending on the USB audio driver configuration.
+
+On both, when ALSA sequencer is enabled on the host, you can find the
+UMP MIDI client such as "MIDI 2.0 Gadget".
+
+As the driver simply loops back the data, there is no need for a real
+device just for testing.
+
+For testing a MIDI input from the gadget to the host (e.g. emulating a
+MIDI keyboard), you can send a MIDI stream like the following.
+
+On the gadget::
+
+  $ aconnect -o
+  ....
+  client 20: 'MIDI 2.0 Gadget' [type=kernel,card=1]
+      0 'MIDI 2.0        '
+      1 'Group 1 (MIDI 2.0 Gadget I/O)'
+  $ aplaymidi -p 20:1 to_host.mid
+
+On the host::
+
+  $ aconnect -i
+  ....
+  client 24: 'MIDI 2.0 Gadget' [type=kernel,card=2]
+      0 'MIDI 2.0        '
+      1 'Group 1 (MIDI 2.0 Gadget I/O)'
+  $ arecordmidi -p 24:1 from_gadget.mid
+
+If you have a UMP-capable application, you can use the UMP port to
+send/receive the raw UMP packets, too. For example, aseqdump program
+with UMP support can receive from UMP port. On the host::
+
+  $ aseqdump -u 2 -p 24:1
+  Waiting for data. Press Ctrl+C to end.
+  Source  Group    Event                  Ch  Data
+   24:1   Group  0, Program change          0, program 0, Bank select 0:0
+   24:1   Group  0, Channel pressure        0, value 0x80000000
+
+For testing a MIDI output to the gadget to the host (e.g. emulating a
+MIDI synth), it'll be just other way round.
+
+On the gadget::
+
+  $ arecordmidi -p 20:1 from_host.mid
+
+On the host::
+
+  $ aplaymidi -p 24:1 to_gadget.mid
+
+The access to MIDI 1.0 on altset 0 on the host is supported, and it's
+translated from/to UMP packets on the gadget. It's bound to only
+Function Block 0.
-- 
2.35.3

