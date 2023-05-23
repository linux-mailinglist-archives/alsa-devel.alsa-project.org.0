Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0388170D663
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 09:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85763AEA;
	Tue, 23 May 2023 09:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85763AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828725;
	bh=qX4dAtCEBrxHAyjjAuyQHzKaAJY9+vmAXF2peejKq54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gGMOPNvL0ipZbLL/c0sBWAiqgCMLuGU31uJyEw8GfOgrEIW0haqCPV+pvwOwYbspn
	 qxHUGrSCwPKLkOG9sRO8Px7i3ingjjtk2KbqxOL1i3e1I//lSd8/H9hmMtkwODt7Ks
	 qjrJm6oDG4m7EFmCMDCnjz1jICQ8LSlXvMcuiIJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50515F8062E; Tue, 23 May 2023 09:54:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A02F80553;
	Tue, 23 May 2023 09:54:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B1D0F805FA; Tue, 23 May 2023 09:54:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AF931F80558
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF931F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=spLCdVUS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cvLknQse
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 68B942040D;
	Tue, 23 May 2023 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TygGfmhyxHyXtO48ucZvDwYqdaCkFLRB2qITd7bHM2E=;
	b=spLCdVUSBOL1ydTQEo23AMV6VgxobeyHa2dCzCjAVgnS8XxN9lVMXGkNGIc7hxQvE8XguZ
	eseQ4BEd/mqqoyyem53sqj3iyE+eIuBl5flVzN75+V09d8BR8Tl1lGXiuFYBSxvvR9moBA
	UIKXMpCDPnrPd4AC/ZC5ke5j4yF8/8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TygGfmhyxHyXtO48ucZvDwYqdaCkFLRB2qITd7bHM2E=;
	b=cvLknQse9tQL16PGNajENYNTBkDL3gHpSCpwsYdEDQsOyn/nArxG+eEgWiwpbWjsO/vHhq
	HJXZ5lBOfsIWERBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2944B13A1A;
	Tue, 23 May 2023 07:54:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SCYhBx9xbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/37] ALSA: usb-audio: Enable the legacy raw MIDI support
Date: Tue, 23 May 2023 09:53:36 +0200
Message-Id: <20230523075358.9672-16-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 42BZLDNDND3DBZ3OHZNV6OP5DJYCVGCX
X-Message-ID-Hash: 42BZLDNDND3DBZ3OHZNV6OP5DJYCVGCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/42BZLDNDND3DBZ3OHZNV6OP5DJYCVGCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Attach the legacy rawmidi devices when enabled in Kconfig accordingly.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 7e849b2384ee..f3fba8b07cb3 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -857,6 +857,25 @@ static int create_blocks_from_gtb(struct snd_usb_midi2_interface *umidi)
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
@@ -922,7 +941,7 @@ static int parse_midi_2_0(struct snd_usb_midi2_interface *umidi)
 		}
 	}
 
-	return 0;
+	return attach_legacy_rawmidi(umidi);
 }
 
 /* is the given interface for MIDI 2.0? */
@@ -991,6 +1010,12 @@ static void set_fallback_rawmidi_names(struct snd_usb_midi2_interface *umidi)
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

