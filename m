Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62B77229BB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 16:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2A074C;
	Mon,  5 Jun 2023 16:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2A074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685976590;
	bh=pLgnot7GrxGQfhgSHONBTPkF9lZwnqUnXogvVruYOXw=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FDRbg1jMSgaaKNOSHCFVwMq4639OlmF4vCJB1HabF/xcsAumB80l4G2Ds275cgNLD
	 R4y87ou3U2tbXMn+DTrdCTfH3YekyLGg0DalhmtlbQzhth1jucNB/ttJAR46SGfjwf
	 wOjJzHPjai20syERYcFpv/6atTQlzbhJYX05z2uA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 498D1F80557; Mon,  5 Jun 2023 16:48:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B554F80548;
	Mon,  5 Jun 2023 16:48:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22870F80199; Mon,  5 Jun 2023 16:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FFDFF80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 16:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFDFF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=2ShDTX0h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xR0PCrYH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D21FD21B5B;
	Mon,  5 Jun 2023 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685976481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=feAukb2LCzN3dc5mffNcaeofTYKQrjuHkiI++GeYCI4=;
	b=2ShDTX0hnK/q5x7nggUQFZbX8zokguWPkXerl8ZeslsdkrNrTv8kUWEyJc1aKd+HRSh5u4
	SGP5Boo5+gPajBEX0ORNUEUdahv4qgtykUpPfT/uUINbpaoIwNyaWiFI2pRbhYMx0ImUgD
	hWaihgeQSdbyq5bJ2rdhOtrrG3WZNR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685976481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=feAukb2LCzN3dc5mffNcaeofTYKQrjuHkiI++GeYCI4=;
	b=xR0PCrYH2ATwZJh+CTXT7HLTNxupH8gEAsyFxhD06PPKWVbwsNBJgLRITs2UXecmhBwk7d
	TLbUHz36ZlFZdzCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B87C0139C8;
	Mon,  5 Jun 2023 14:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pnD0K6H1fWQMXwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 14:48:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Use __le16 for 16bit USB descriptor
 fields
Date: Mon,  5 Jun 2023 16:47:57 +0200
Message-Id: <20230605144758.6677-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WSRUHOIEPEUCHPJRXVLTR2FQ7H7BPI6P
X-Message-ID-Hash: WSRUHOIEPEUCHPJRXVLTR2FQ7H7BPI6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSRUHOIEPEUCHPJRXVLTR2FQ7H7BPI6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use proper notion for 16bit values for fixing the sparse warnings.

Fixes: f8ddb0fb3289 ("ALSA: usb-audio: Define USB MIDI 2.0 specs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202305260528.wcqjXso8-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202305270534.odwHL9F0-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/linux/usb/midi-v2.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/usb/midi-v2.h b/include/linux/usb/midi-v2.h
index ebbffcae0417..16f09d959a2d 100644
--- a/include/linux/usb/midi-v2.h
+++ b/include/linux/usb/midi-v2.h
@@ -73,7 +73,7 @@ struct usb_ms20_gr_trm_block_header_descriptor {
 	__u8  bLength;			/* 5 */
 	__u8  bDescriptorType;		/* USB_DT_CS_GR_TRM_BLOCK */
 	__u8  bDescriptorSubtype;	/* USB_MS_GR_TRM_BLOCK_HEADER */
-	__u16 wTotalLength;		/* Total number of bytes */
+	__le16 wTotalLength;		/* Total number of bytes */
 } __packed;
 
 /* 5.4.2.1 Group Terminal Block Descriptor */
@@ -87,8 +87,8 @@ struct usb_ms20_gr_trm_block_descriptor {
 	__u8  nNumGroupTrm;		/* Number of member Group Terminals spanned */
 	__u8  iBlockItem;		/* String ID of Block item */
 	__u8  bMIDIProtocol;		/* Default MIDI protocol */
-	__u16 wMaxInputBandwidth;	/* Max input bandwidth capability in 4kB/s */
-	__u16 wMaxOutputBandwidth;	/* Max output bandwidth capability in 4kB/s */
+	__le16 wMaxInputBandwidth;	/* Max input bandwidth capability in 4kB/s */
+	__le16 wMaxOutputBandwidth;	/* Max output bandwidth capability in 4kB/s */
 } __packed;
 
 #endif /* __LINUX_USB_MIDI_V2_H */
-- 
2.35.3

