Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4870934B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:34:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D46F839;
	Fri, 19 May 2023 11:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D46F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488864;
	bh=vEQzrHo6VJEGfm5go/CkT90A0NC+14ni3kSvGMI7QN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q6Cyx1UbSG+60TmQ7Qlhl4V4kw56zD+J5q/nC/S0VF6ft8Gx1/1jSKIxswwv4XOdC
	 pw7mqN86Xh8dVOXlCYlhnwYd47xAOC1lFaknHo45pStIAcgg+9CfD5dV9pGCbkBn7L
	 cAz3bzCLMwMzhYPoiJjiIOjk/wmTRVrcBuzbVlGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2928F805E0; Fri, 19 May 2023 11:32:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7BDCF805DA;
	Fri, 19 May 2023 11:31:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90FDAF805C0; Fri, 19 May 2023 11:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CB53F8053D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB53F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ACI44F4l;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q5wt7OjM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DFE01FE32;
	Fri, 19 May 2023 09:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugcbMtUVSg/JEQCF/ffdQbD74DRPki/gHVZsQRV0nYo=;
	b=ACI44F4lJ7x6KsD3jha2MvlCilQFDWrPPRA0ln6EcFVdt5gMSIggfV8sn9OU8nv/vkLn07
	7oZdMXU/GmTGdJN7BycrJVqfy4Zbl1nUGBMct6RGsdZD6xZzIsgezzpBlZR5q1JvkjCbkl
	BY7uY3IQE9ou0mGegyJxWOy+mawxfeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugcbMtUVSg/JEQCF/ffdQbD74DRPki/gHVZsQRV0nYo=;
	b=Q5wt7OjMrkaLKqvvdlMbacT6kqY0pCj41ewRYNrLs05nEVM+wnqRcKxQg6LAG2sDnXTNQM
	ZoS6KuuhpyuYpKBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B84913A12;
	Fri, 19 May 2023 09:31:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6GEOAvZBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 07/36] ALSA: usb-audio: Define USB MIDI 2.0 specs
Date: Fri, 19 May 2023 11:30:45 +0200
Message-Id: <20230519093114.28813-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KAEW6F4DFEL2KMOTBPYIFGMXZBPS7P6H
X-Message-ID-Hash: KAEW6F4DFEL2KMOTBPYIFGMXZBPS7P6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAEW6F4DFEL2KMOTBPYIFGMXZBPS7P6H/>
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

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>
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

