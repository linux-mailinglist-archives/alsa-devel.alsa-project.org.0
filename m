Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478497868EF
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:52:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB79C84A;
	Thu, 24 Aug 2023 09:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB79C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692863577;
	bh=1LPIAPgHqcUP5VQM6IQUhEjMcZhe3uLVFoaG+ZNQqfw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lofPuUDHWhDsQOeIWpCoVarRyQm1bw70GC7enOysaosftK/f8uxCIcccW+eptUosU
	 3WCzgDKcK7FY8lwg1oTPoGGkY7KEfDy2iyyr/sYbGbWjkyVtKjZehxB5sV4EZqCEtH
	 OR69HmDGEWWF4Bv8hRIiOyQ8WEURuXNlRjYD59Ko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B76F80558; Thu, 24 Aug 2023 09:51:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279FDF8022B;
	Thu, 24 Aug 2023 09:51:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CEB0F8025F; Thu, 24 Aug 2023 09:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C045F8022B
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C045F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=X1+mte/q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BqOCBEFh
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C74722CC0;
	Thu, 24 Aug 2023 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692863471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YghiKRcgLFIsxq+fLwAH4m1a20sGATL7xsSuDRkcDkQ=;
	b=X1+mte/qR5XtoP0a7SmAYlv98Kn/0zEJQpG8XTU9N7omoOGdK5P4GVa9W3r+8RZcC+khVB
	Sg/7vpu0pjkFHxGgim940htT5O6paYeoToPfbf7c3Lmjd4UC7egcurUW9ifsZC6wn41yJM
	Ct+b75jF8RdYVAfyLphZRpD8P7cGtmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692863471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YghiKRcgLFIsxq+fLwAH4m1a20sGATL7xsSuDRkcDkQ=;
	b=BqOCBEFhIGxDODMzoH+H+iniQNQ0K3x9R4GKioyCnmK1/xuRpPVPkdE/MOAlh3SWZnugMe
	u2AvELCcvVXMa5Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F034139BC;
	Thu, 24 Aug 2023 07:51:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sLSpCu8L52TtLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 07:51:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: documentation: Add description for USB MIDI 2.0
 gadget driver
Date: Thu, 24 Aug 2023 09:51:08 +0200
Message-Id: <20230824075108.29958-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230824075108.29958-1-tiwai@suse.de>
References: <20230824075108.29958-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5RTIQE6PHYI3ZVQ4HZ5H7PAHCN47WLQP
X-Message-ID-Hash: 5RTIQE6PHYI3ZVQ4HZ5H7PAHCN47WLQP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5RTIQE6PHYI3ZVQ4HZ5H7PAHCN47WLQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The USB MIDI 2.0 gadget driver is now supported for 6.6 kernel, and
here we show a brief instruction how to enable and use it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/designs/midi-2.0.rst | 188 +++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/Documentation/sound/designs/midi-2.0.rst b/Documentation/sound/designs/midi-2.0.rst
index 27d0d3dea1b0..3b08b98354f8 100644
--- a/Documentation/sound/designs/midi-2.0.rst
+++ b/Documentation/sound/designs/midi-2.0.rst
@@ -376,3 +376,191 @@ Sequencer API Extensions
   name and attributes accordingly, and notifies the changes via the
   announcement to the ALSA sequencer system port, similarly like the
   normal port change notification.
+
+
+MIDI2 USB Gadget Function Driver
+================================
+
+The latest kernel contains the support for USB MIDI 2.0 gadget
+function driver, which can be used for prototyping and debugging MIDI
+2.0 features.
+
+`CONFIG_USB_GADGET`, `CONFIG_USB_CONFIGFS` and
+`CONFIG_USB_CONFIGFS_F_MIDI2` need to be enabled for the MIDI2 gadget
+driver.
+
+In addition, for using a gadget driver, you need a working UDC driver.
+In the example below, we use `dummy_hcd` driver (enabled via
+`CONFIG_USB_DUMMY_HCD`) that is available on PC and VM for debugging
+purpose.  There are other UDC drivers depending on the platform, and
+those can be used for a real device, instead, too.
+
+At first, on a system to run the gadget, load `libcomposite` module::
+
+  % modprobe libcomposite
+
+and you'll have `usb_gadget` subdirectory under configfs space
+(typically `/sys/kernel/config` on modern OS).  Then create a gadget
+instance and add configurations there, for example::
+
+  % cd /sys/kernel/config
+  % mkdir usb_gadget/g1
+
+  % cd usb_gadget/g1
+  % mkdir configs/c.1
+  % mkdir functions/midi2.usb0
+
+  % echo 0x0004 > idProduct
+  % echo 0x17b3 > idVendor
+  % mkdir strings/0x409
+  % echo "ACME Enterprises" > strings/0x409/manufacturer
+  % echo "ACMESynth" > strings/0x409/product
+  % echo "ABCD12345" > strings/0x409/serialnumber
+
+  % mkdir configs/c.1/strings/0x409
+  % echo "Monosynth" > configs/c.1/strings/0x409/configuration
+  % echo 120 > configs/c.1/MaxPower
+
+At this point, there must be a subdirectory `ep.0`, and that is the
+configuration for a UMP Endpoint.  You can fill the Endpoint
+information like::
+
+  % echo "ACMESynth" > functions/midi2.usb0/iface_name
+  % echo "ACMESynth" > functions/midi2.usb0/ep.0/ep_name
+  % echo "ABCD12345" > functions/midi2.usb0/ep.0/product_id
+  % echo 0x0123 > functions/midi2.usb0/ep.0/family
+  % echo 0x4567 > functions/midi2.usb0/ep.0/model
+  % echo 0x123456 > functions/midi2.usb0/ep.0/manufacturer
+  % echo 0x12345678 > functions/midi2.usb0/ep.0/sw_revision
+
+The default MIDI protocol can be set either 1 or 2::
+
+  % echo 2 > functions/midi2.usb0/ep.0/protocol
+
+And, you can find a subdirectory `block.0` under this Endpoint
+subdirectory.  This defines the Function Block information::
+
+  % echo "Monosynth" > functions/midi2.usb0/ep.0/block.0/name
+  % echo 0 > functions/midi2.usb0/ep.0/block.0/first_group
+  % echo 1 > functions/midi2.usb0/ep.0/block.0/num_groups
+
+Finally, link the configuration and enable it::
+
+  % ln -s functions/midi2.usb0 configs/c.1
+  % echo dummy_udc.0 > UDC
+
+where `dummy_udc.0` is an example case and it differs depending on the
+system.  You can find the UDC instances in `/sys/class/udc` and pass
+the found name instead::
+
+  % ls /sys/class/udc
+  dummy_udc.0
+
+Now, the MIDI 2.0 gadget device is enabled, and the gadget host
+creates a new sound card instance containing a UMP rawmidi device by
+`f_midi2` driver::
+
+  % cat /proc/asound/cards
+  ....
+  1 [Gadget         ]: f_midi2 - MIDI 2.0 Gadget
+                       MIDI 2.0 Gadget
+
+And on the connected host, a similar card should appear, too, but with
+the card and device names given in the configfs above::
+
+  % cat /proc/asound/cards
+  ....
+  2 [ACMESynth      ]: USB-Audio - ACMESynth
+                       ACME Enterprises ACMESynth at usb-dummy_hcd.0-1, high speed
+
+You can play a MIDI file on the gadget side::
+
+  % aplaymidi -p 20:1 to_host.mid
+
+and this will appear as an input from a MIDI device on the connected
+host::
+
+  % aseqdump -p 20:0 -u 2
+
+Vice versa, a playback on the connected host will work as an input on
+the gadget, too.
+
+Each Function Block may have different direction and UI-hint,
+specified via `direction` and `ui_hint` attributes.
+Passing `1` is for input-only, `2` for out-only and `3` for
+bidirectional (the default value).  For example::
+
+  % echo 2 > functions/midi2.usb0/ep.0/block.0/direction
+  % echo 2 > functions/midi2.usb0/ep.0/block.0/ui_hint
+
+When you need more than one Function Blocks, you can create
+subdirectories `block.1`, `block.2`, etc dynamically, and configure
+them in the configuration procedure above before linking.
+For example, to create a second Function Block for a keyboard::
+
+  % mkdir functions/midi2.usb0/ep.0/block.1
+  % echo "Keyboard" > functions/midi2.usb0/ep.0/block.1/name
+  % echo 1 > functions/midi2.usb0/ep.0/block.1/first_group
+  % echo 1 > functions/midi2.usb0/ep.0/block.1/num_groups
+  % echo 1 > functions/midi2.usb0/ep.0/block.1/direction
+  % echo 1 > functions/midi2.usb0/ep.0/block.1/ui_hint
+
+The `block.*` subdirectories can be removed dynamically, too (except
+for `block.0` which is persistent).
+
+For assigning a Function Block for MIDI 1.0 I/O, set up in `is_midi1`
+attribute.  1 is for MIDI 1.0, and 2 is for MIDI 1.0 with low speed
+connection::
+
+  % echo 2 > functions/midi2.usb0/ep.0/block.1/is_midi1
+
+For disabling the processing of UMP Stream messages in the gadget
+driver, pass `0` to `process_ump attribute in the top-level config::
+
+  % echo 0 > functions/midi2.usb0/process_ump
+
+The MIDI 1.0 interface at altset 0 is supported by the gadget driver,
+too.  When MIDI 1.0 interface is selected by the connected host, the
+UMP I/O on the gadget is translated from/to USB MIDI 1.0 packets
+accordingly while the gadget driver keeps communicating with the
+user-space over UMP rawmidi.
+
+MIDI 1.0 ports are set up from the config in each Function Block.
+For example::
+
+  % echo 0 > functions/midi2.usb0/ep.0/block.0/midi1_first_group
+  % echo 1 > functions/midi2.usb0/ep.0/block.0/midi1_num_groups
+
+The configuration above will enable the Group 1 (the index 0) for MIDI
+1.0 interface.  Note that those groups must be in the groups defined
+for the Function Block itself.
+
+The gadget driver supports more than one UMP Endpoints, too.
+Similarly like the Function Blocks, you can create a new subdirectory
+`ep.1` (but under the card top-level config) to enable a new Endpoint::
+
+  % mkdir functions/midi2.usb0/ep.1
+
+and create a new Function Block there.  For example, to create 4
+Groups for the Function Block of this new Endpoint::
+
+  % mkdir functions/midi2.usb0/ep.1/block.0
+  % echo 4 > functions/midi2.usb0/ep.1/block.0/num_groups
+
+Now, you'll have 4 rawmidi devices in total: the first two are UMP
+rawmidi devices for Endpoint 0 and Endpoint 1, and other two for the
+legacy MIDI 1.0 rawmidi devices corresponding to both EP 0 and EP 1.
+
+The current altsetting on the gadget can be informed via a control
+element "Operation Mode" with `RAWMIDI` iface.  e.g. you can read it
+via `amixer` program running on the gadget host like::
+
+  % amixer -c1 cget iface=RAWMIDI,name='Operation Mode'
+  ; type=INTEGER,access=r--v----,values=1,min=0,max=2,step=0
+  : values=2
+
+The value (shown in the second returned line with `: values=`)
+indicates 1 for MIDI 1.0 (altset 0), 2 for MIDI 2.0 (altset 1) and 0
+for unset.
+
+As of now, the configurations can't be changed after binding.
-- 
2.35.3

