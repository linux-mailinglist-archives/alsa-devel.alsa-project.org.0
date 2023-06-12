Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5572B9F8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E9782A;
	Mon, 12 Jun 2023 10:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E9782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557645;
	bh=x34k5HlKagBjm6HcOlCy4MRX7pyWilvP01etGzEyIyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R1GwvHEZAmQYqbmJwSBxopEkWNTCkJ71cIFOUN140ozOY8Bd6MK5FDHfWZ1gUyOAM
	 58cZQ6O7kOLUav9c1/3KXXFcxn2wRXCXSUfPUcE07e+jhVvJ25ib84MzIGS7njAP3Z
	 /iE1MoE+AWnA0LfMMgEl8qJfDmrQk2wzmPFsGpt0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1211DF805BE; Mon, 12 Jun 2023 10:11:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63B87F805BD;
	Mon, 12 Jun 2023 10:11:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA64F805AD; Mon, 12 Jun 2023 10:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FABCF80533
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FABCF80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=McvdlDx2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MSRPFRgO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 70A332048B;
	Mon, 12 Jun 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SIBmxqeQ7gKHxtys0xkr2bAxcRQemUER/BeFZdM6z0=;
	b=McvdlDx2GrstjfjXf8uq08XezKulkiuUGMnUWYBKX2eA1Y8oXJD/+1/4GpwEYKpW+aiyyn
	cPJxlAgWam5ywxdEmNwmDfRdpxZYYB2p+nsxUDajFoBhCzWT5vzXaA+4IXPRmF08SBrBj9
	JzGaiDX3x4S745KvzMjiNsE/OgJlMm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557467;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SIBmxqeQ7gKHxtys0xkr2bAxcRQemUER/BeFZdM6z0=;
	b=MSRPFRgOFIGRDN+kOzpfKdmsoEFKfuUtAb9pNVAJKCZ/SyOXNJx8ux4pKSRey09uW8mFCU
	nsHcs/c4UM/78nAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F8C4138EC;
	Mon, 12 Jun 2023 08:11:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +GlFEhvThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] ALSA: docs: Update MIDI 2.0 documentation for UMP 1.1
 enhancement
Date: Mon, 12 Jun 2023 10:10:54 +0200
Message-Id: <20230612081054.17200-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VULGZAZ7INL3T4ZG5CBBZTDZOQ3POSHU
X-Message-ID-Hash: VULGZAZ7INL3T4ZG5CBBZTDZOQ3POSHU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VULGZAZ7INL3T4ZG5CBBZTDZOQ3POSHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There have been a few enhancements for the new UMP 1.1 features.
Update the documentation accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/designs/midi-2.0.rst | 39 ++++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/designs/midi-2.0.rst b/Documentation/sound/designs/midi-2.0.rst
index d55b0a4c6acb..27d0d3dea1b0 100644
--- a/Documentation/sound/designs/midi-2.0.rst
+++ b/Documentation/sound/designs/midi-2.0.rst
@@ -68,6 +68,15 @@ default instead of the MIDI 1.0 interface (at altset 0).  You can
 switch back to the binding with the old MIDI 1.0 interface by passing
 `midi2_enable=0` option to snd-usb-audio driver module, too.
 
+The USB audio driver tries to query the UMP Endpoint and UMP Function
+Block information that are provided since UMP v1.1, and builds up the
+topology based on those information.  When the device is older and
+doesn't respond to the new UMP inquiries, the driver falls back and
+builds the topology based on Group Terminal Block (GTB) information
+from the USB descriptor.  Some device might be screwed up by the
+unexpected UMP command; in such a case, pass `midi2_probe=0` option to
+snd-usb-audio driver for skipping the UMP v1.1 inquiries.
+
 When the MIDI 2.0 device is probed, the kernel creates a rawmidi
 device for each UMP Endpoint of the device.  Its device name is
 `/dev/snd/umpC*D*` and different from the standard rawmidi device name
@@ -101,11 +110,15 @@ opening `/dev/snd/midiC*D*` will end up with opening the first
 substream.
 
 Each UMP Endpoint can provide the additional information, constructed
-from USB MIDI 2.0 descriptors.  And a UMP Endpoint may contain one or
-more UMP Blocks, where UMP Block is an abstraction introduced in the
-ALSA UMP implementations to represent the associations among UMP
-Groups.  UMP Block corresponds to Group Terminal Block (GTB) in USB
-MIDI 2.0 specifications but provide a few more generic information.
+from the information inquired via UMP 1.1 Stream messages or USB MIDI
+2.0 descriptors.  And a UMP Endpoint may contain one or more UMP
+Blocks, where UMP Block is an abstraction introduced in the ALSA UMP
+implementations to represent the associations among UMP Groups.  UMP
+Block corresponds to Function Block in UMP 1.1 specification.  When
+UMP 1.1 Function Block information isn't available, it's filled
+partially from Group Terminal Block (GTB) as defined in USB MIDI 2.0
+specifications.
+
 The information of UMP Endpoints and UMP Blocks are found in the proc
 file `/proc/asound/card*/midi*`.  For example::
 
@@ -207,6 +220,8 @@ The "MIDI 2.0" port is for a UMP Endpoint, and its difference from
 other UMP Group ports is that UMP Endpoint port sends the events from
 the all ports on the device ("catch-all"), while each UMP Group port
 sends only the events from the given UMP Group.
+Also, UMP groupless messages (such as the UMP message type 0x0f) are
+sent only to the UMP Endpoint port.
 
 Note that, although each UMP sequencer client usually creates 16
 ports, those ports that don't belong to any UMP Blocks (or belonging
@@ -273,6 +288,11 @@ Rawmidi API Extensions
   The direction is either `SNDRV_UMP_DIR_INPUT`,
   `SNDRV_UMP_DIR_OUTPUT` or `SNDRV_UMP_DIR_BIDIRECTION`.
 
+* For the device supports UMP v1.1, the UMP MIDI protocol can be
+  switched via "Stream Configuration Request" message (UMP type 0x0f,
+  status 0x05).  When UMP core receives such a message, it updates the
+  UMP EP info and the corresponding sequencer clients as well.
+
 
 Control API Extensions
 ======================
@@ -337,7 +357,7 @@ Sequencer API Extensions
   `group_filter` bitmap.  The filter consists of bitmap from 1-based
   Group numbers.  For example, when the bit 1 is set, messages from
   Group 1 (i.e. the very first group) are filtered and not delivered.
-  The bit 0 is reserved for future use.
+  The bit 0 is used for filtering UMP groupless messages.
 
 * Two new ioctls are added for UMP-capable clients:
   `SNDRV_SEQ_IOCTL_GET_CLIENT_UMP_INFO` and
@@ -349,3 +369,10 @@ Sequencer API Extensions
   For an Endpoint data, pass 0 to the `type` field, while for a Block
   data, pass the block number + 1 to the `type` field.
   Setting the data for a kernel client shall result in an error.
+
+* With UMP 1.1, Function Block information may be changed
+  dynamically.  When the update of Function Block is received from the
+  device, ALSA sequencer core changes the corresponding sequencer port
+  name and attributes accordingly, and notifies the changes via the
+  announcement to the ALSA sequencer system port, similarly like the
+  normal port change notification.
-- 
2.35.3

