Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B95709361
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA361EF;
	Fri, 19 May 2023 11:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA361EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488986;
	bh=aZnEt7DMQXg+PTHj7G/q1ylkeHyu7m4ls/5gpIO7yeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LVGoZGAEnixeL/AnV0OZznXFpqNJ/AKDMF/EDEBT4GZNv+3QEriFs6FCcnhbxgXKf
	 CTcYps/OHhW3JZTgjtkckjonG+QuPwARILWI4KEj69GLR/neQsgGUTn3Ts0Jf/8dy/
	 rsi5sdfwSxUfUi8SjY25azPr7zcSPPGLj/vIDcjs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4399F8062F; Fri, 19 May 2023 11:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A2AF80618;
	Fri, 19 May 2023 11:32:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C7CCF80604; Fri, 19 May 2023 11:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 312A8F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312A8F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JE9gSUd/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WmJIhMPZ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B7C41FE3D;
	Fri, 19 May 2023 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xY1PXIKgQoKZfhDbEDsNHHq6OQlJxBtxfki3i8O/8I=;
	b=JE9gSUd/2Z0GCV3yULP+OP35bx1YeVcmky1+aocFqxQi4Rp84z6uoETDMbnlxXflqGpI4D
	tXhnfjfU1TIu/0MYsIVxOGZHBugPlmwcpSVy2AENcZ/yJ4B22HZCcwMj/RVVYqjgCXWCL7
	Hsd9qRGhXHBofvnjfSwjFllZ9sr6CgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xY1PXIKgQoKZfhDbEDsNHHq6OQlJxBtxfki3i8O/8I=;
	b=WmJIhMPZgi2CKwleYTaKJlxX0lv706rEobLQTKShNbtzZ8lU1rkGwdE5zJcp7vbmubwYIL
	u38d9bL5Jg+gjfDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BADE13A12;
	Fri, 19 May 2023 09:31:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EEtGHfpBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 14/36] ALSA: usb-audio: Enable the legacy raw MIDI support
Date: Fri, 19 May 2023 11:30:52 +0200
Message-Id: <20230519093114.28813-15-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HRB6GWGQIEDJ3BGBFN3KEF2T33IP3CVP
X-Message-ID-Hash: HRB6GWGQIEDJ3BGBFN3KEF2T33IP3CVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRB6GWGQIEDJ3BGBFN3KEF2T33IP3CVP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Attach the legacy rawmidi devices when enabled in Kconfig accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 3502a4b7fa41..f005de9f9b8a 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -856,6 +856,25 @@ static int create_blocks_from_gtb(struct snd_usb_midi2_interface *umidi)
 	return 0;
 }
 
+/* attach legacy rawmidis */
+static int attach_legacy_rawmidi(struct snd_usb_midi2_interface *umidi)
+{
+#if IS_ENABLED(CONFIG_SND_UMP_LEGACY_RAWMIDI)
+	struct snd_usb_midi2_ump *rmidi;
+	int err;
+
+	list_for_each_entry(rmidi, &umidi->rawmidi_list, list) {
+		err = snd_ump_attach_legacy_rawmidi(rmidi->ump,
+						    "Legacy MIDI",
+						    umidi->chip->num_rawmidis);
+		if (err < 0)
+			return err;
+		umidi->chip->num_rawmidis++;
+	}
+#endif
+	return 0;
+}
+
 static void snd_usb_midi_v2_free(struct snd_usb_midi2_interface *umidi)
 {
 	free_all_midi2_endpoints(umidi);
@@ -921,7 +940,7 @@ static int parse_midi_2_0(struct snd_usb_midi2_interface *umidi)
 		}
 	}
 
-	return 0;
+	return attach_legacy_rawmidi(umidi);
 }
 
 /* is the given interface for MIDI 2.0? */
@@ -990,6 +1009,12 @@ static void set_fallback_rawmidi_names(struct snd_usb_midi2_interface *umidi)
 			usb_string(dev, dev->descriptor.iSerialNumber,
 				   ump->info.product_id,
 				   sizeof(ump->info.product_id));
+#if IS_ENABLED(CONFIG_SND_UMP_LEGACY_RAWMIDI)
+		if (ump->legacy_rmidi && !*ump->legacy_rmidi->name)
+			snprintf(ump->legacy_rmidi->name,
+				 sizeof(ump->legacy_rmidi->name),
+				 "%s (MIDI 1.0)", ump->info.name);
+#endif
 	}
 }
 
-- 
2.35.3

