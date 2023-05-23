Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F5C70D63D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:56:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09900851;
	Tue, 23 May 2023 09:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09900851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828613;
	bh=wmP8bDCQKLWJezr9s2vqXPA73otrb6UlEETUzDpekWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X2lbDXRVTX6S1OYg5Tt7oJtpdJVHhXF4oGiYYmhRAmsVG29qUKP+7A+2ls2ATl+bC
	 oCGZdoCny7J66gEewYRIBRdpu2TiEifUpqbGo+HnZsb7Wz5lg5itPDy53Iuxwv4Zw2
	 DNmAL9gMNFw9Cly0E17M31upbwrZ6O+PFkBh1NGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F11C5F805EA; Tue, 23 May 2023 09:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 659FAF805DF;
	Tue, 23 May 2023 09:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 076F5F805CA; Tue, 23 May 2023 09:54:32 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A7229F80548
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7229F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=uLRLsHdX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jiHGGJt6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2B28A20403;
	Tue, 23 May 2023 07:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMiSIlSSN6kDoW8mqxsPxhE+FfS9q6ZCEyPe0Whc9mI=;
	b=uLRLsHdX3CG/lnTB3W7LhRY8Q4hDPsAxa4yUMX3XoUkU563CufPWk1XUQzKBMGPYubprsn
	kCjzzHsUu7+1mBbyjfxdmJg3FHMm2nbKn983PCotA/N4PQTuN9FygGo5ekWeLScdBYlXd/
	jMTURRtPj7Dukrd0U9KIFKUGluln6VQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMiSIlSSN6kDoW8mqxsPxhE+FfS9q6ZCEyPe0Whc9mI=;
	b=jiHGGJt6/40fYKU8gnPWA+LS9FQQtPvNVoHPt4iVJJ7cXrZQNDvbAp6QAdx6kbFJyF01wS
	PUvQcjHlM3DMncDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BFCB913588;
	Tue, 23 May 2023 07:54:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sF0qLBxxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:04 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/37] ALSA: usb-audio: Define USB MIDI 2.0 specs
Date: Tue, 23 May 2023 09:53:29 +0200
Message-Id: <20230523075358.9672-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A7OJXRAOFQCNMIXEJ2ZWEDX7YWULMNPF
X-Message-ID-Hash: A7OJXRAOFQCNMIXEJ2ZWEDX7YWULMNPF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7OJXRAOFQCNMIXEJ2ZWEDX7YWULMNPF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Define new structs and constants from USB MIDI 2.0 specification,
to be used in the upcoming MIDI 2.0 support in USB-audio driver.

A new class-specific endpoint descriptor and group terminal block
descriptors are defined.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/linux/usb/midi-v2.h | 94 +++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 include/linux/usb/midi-v2.h

diff --git a/include/linux/usb/midi-v2.h b/include/linux/usb/midi-v2.h
new file mode 100644
index 000000000000..ebbffcae0417
--- /dev/null
+++ b/include/linux/usb/midi-v2.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * <linux/usb/midi-v2.h> -- USB MIDI 2.0 definitions.
+ */
+
+#ifndef __LINUX_USB_MIDI_V2_H
+#define __LINUX_USB_MIDI_V2_H
+
+#include <linux/types.h>
+#include <linux/usb/midi.h>
+
+/* A.1 MS Class-Specific Interface Descriptor Types */
+#define USB_DT_CS_GR_TRM_BLOCK	0x26
+
+/* A.1 MS Class-Specific Interface Descriptor Subtypes */
+/* same as MIDI 1.0 */
+
+/* A.2 MS Class-Specific Endpoint Descriptor Subtypes */
+#define USB_MS_GENERAL_2_0	0x02
+
+/* A.3 MS Class-Specific Group Terminal Block Descriptor Subtypes */
+#define USB_MS_GR_TRM_BLOCK_UNDEFINED	0x00
+#define USB_MS_GR_TRM_BLOCK_HEADER	0x01
+#define USB_MS_GR_TRM_BLOCK		0x02
+
+/* A.4 MS Interface Header MIDIStreaming Class Revision */
+#define USB_MS_REV_MIDI_1_0		0x0100
+#define USB_MS_REV_MIDI_2_0		0x0200
+
+/* A.5 MS MIDI IN and OUT Jack Types */
+/* same as MIDI 1.0 */
+
+/* A.6 Group Terminal Block Types */
+#define USB_MS_GR_TRM_BLOCK_TYPE_BIDIRECTIONAL	0x00
+#define USB_MS_GR_TRM_BLOCK_TYPE_INPUT_ONLY	0x01
+#define USB_MS_GR_TRM_BLOCK_TYPE_OUTPUT_ONLY	0x02
+
+/* A.7 Group Terminal Default MIDI Protocol */
+#define USB_MS_MIDI_PROTO_UNKNOWN	0x00 /* Unknown (Use MIDI-CI) */
+#define USB_MS_MIDI_PROTO_1_0_64	0x01 /* MIDI 1.0, UMP up to 64bits */
+#define USB_MS_MIDI_PROTO_1_0_64_JRTS	0x02 /* MIDI 1.0, UMP up to 64bits, Jitter Reduction Timestamps */
+#define USB_MS_MIDI_PROTO_1_0_128	0x03 /* MIDI 1.0, UMP up to 128bits */
+#define USB_MS_MIDI_PROTO_1_0_128_JRTS	0x04 /* MIDI 1.0, UMP up to 128bits, Jitter Reduction Timestamps */
+#define USB_MS_MIDI_PROTO_2_0		0x11 /* MIDI 2.0 */
+#define USB_MS_MIDI_PROTO_2_0_JRTS	0x12 /* MIDI 2.0, Jitter Reduction Timestamps */
+
+/* 5.2.2.1 Class-Specific MS Interface Header Descriptor */
+/* Same as MIDI 1.0, use struct usb_ms_header_descriptor */
+
+/* 5.3.2 Class-Specific MIDI Streaming Data Endpoint Descriptor */
+struct usb_ms20_endpoint_descriptor {
+	__u8  bLength;			/* 4+n */
+	__u8  bDescriptorType;		/* USB_DT_CS_ENDPOINT */
+	__u8  bDescriptorSubtype;	/* USB_MS_GENERAL_2_0 */
+	__u8  bNumGrpTrmBlock;		/* Number of Group Terminal Blocks: n */
+	__u8  baAssoGrpTrmBlkID[];	/* ID of the Group Terminal Blocks [n] */
+} __packed;
+
+#define USB_DT_MS20_ENDPOINT_SIZE(n)	(4 + (n))
+
+/* As above, but more useful for defining your own descriptors: */
+#define DECLARE_USB_MS20_ENDPOINT_DESCRIPTOR(n)			\
+struct usb_ms20_endpoint_descriptor_##n {			\
+	__u8  bLength;						\
+	__u8  bDescriptorType;					\
+	__u8  bDescriptorSubtype;				\
+	__u8  bNumGrpTrmBlock;					\
+	__u8  baAssoGrpTrmBlkID[n];				\
+} __packed
+
+/* 5.4.1 Class-Specific Group Terminal Block Header Descriptor */
+struct usb_ms20_gr_trm_block_header_descriptor {
+	__u8  bLength;			/* 5 */
+	__u8  bDescriptorType;		/* USB_DT_CS_GR_TRM_BLOCK */
+	__u8  bDescriptorSubtype;	/* USB_MS_GR_TRM_BLOCK_HEADER */
+	__u16 wTotalLength;		/* Total number of bytes */
+} __packed;
+
+/* 5.4.2.1 Group Terminal Block Descriptor */
+struct usb_ms20_gr_trm_block_descriptor {
+	__u8  bLength;			/* 13 */
+	__u8  bDescriptorType;		/* USB_DT_CS_GR_TRM_BLOCK */
+	__u8  bDescriptorSubtype;	/* USB_MS_GR_TRM_BLOCK */
+	__u8  bGrpTrmBlkID;		/* ID of this Group Terminal Block */
+	__u8  bGrpTrmBlkType;		/* Group Terminal Block Type */
+	__u8  nGroupTrm;		/* The first member Group Terminal in this block */
+	__u8  nNumGroupTrm;		/* Number of member Group Terminals spanned */
+	__u8  iBlockItem;		/* String ID of Block item */
+	__u8  bMIDIProtocol;		/* Default MIDI protocol */
+	__u16 wMaxInputBandwidth;	/* Max input bandwidth capability in 4kB/s */
+	__u16 wMaxOutputBandwidth;	/* Max output bandwidth capability in 4kB/s */
+} __packed;
+
+#endif /* __LINUX_USB_MIDI_V2_H */
-- 
2.35.3

