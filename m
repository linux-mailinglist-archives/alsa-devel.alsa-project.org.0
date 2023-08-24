Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9EC7868F2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 09:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523E4846;
	Thu, 24 Aug 2023 09:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523E4846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692863620;
	bh=3f0i9oJ+WRKyv779SX3uruagHBLb5v1gBMDkGKsKl5M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=psSqrKVHnHAPQMrHEd1Skb2/FUpfo2ZuvaviUIaAxxo1RdoJ4/uCqubQiqbtlgkzn
	 y8vYahl07w7vfrDWzzmIWEbeglPQaAi7RKcanuhezyNzEGiwMCv/mNOIkEQyCuwuv7
	 YMNiIjzSW2F7hu1b4p6DPDLmHWDuvVEpE+EBVp2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B65AF805A9; Thu, 24 Aug 2023 09:51:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD9DF805A1;
	Thu, 24 Aug 2023 09:51:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6EA5F80536; Thu, 24 Aug 2023 09:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED978F80158
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 09:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED978F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BNIow5JS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qaIzCqN3
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E36F520EC4;
	Thu, 24 Aug 2023 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692863470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GIojMTy4LRngrr08IOpIav6TbdbIHToJexf9X20rPQ=;
	b=BNIow5JSDgfh4lfvFhv7LFLpDRNCE0EZxrndbKl8ET+S8A9Fs8yUTXjsSYT+GwjPXQuv/R
	Mhi8TCtwA/l9zxUVdwbv7eQ8Ep0CToNNyYz9Wmkul7RZQs88xkKukfBxLDBl3M/mNEpDss
	HAr+Xd85BXQ8d97ZbpnkvpPevGh4qms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692863470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GIojMTy4LRngrr08IOpIav6TbdbIHToJexf9X20rPQ=;
	b=qaIzCqN3UpXmaCnNe8JQ7GPO3x5rUUVhTzSPajRg9m8LClaMsMhplN4i0cnQ8qyJFR7v4I
	AUjkUmlLLpwfrjAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C82B8139BC;
	Thu, 24 Aug 2023 07:51:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kP7/L+4L52TtLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 24 Aug 2023 07:51:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: usb-audio: Attach legacy rawmidi after probing all
 UMP EPs
Date: Thu, 24 Aug 2023 09:51:05 +0200
Message-Id: <20230824075108.29958-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230824075108.29958-1-tiwai@suse.de>
References: <20230824075108.29958-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SCM5F2HVHOVFN7GL55QMBFJ64TVLJATL
X-Message-ID-Hash: SCM5F2HVHOVFN7GL55QMBFJ64TVLJATL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCM5F2HVHOVFN7GL55QMBFJ64TVLJATL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The legacy rawmidi devices are the shadows of the main UMP devices,
hence it's better to initialize them after all UMP Endpoints are
parsed.  Then, at the moment the legacy rawmidi is created, we already
know the static flag or the proper EP name string, and we can fill
those information at UMP core side instead of fiddling the attributes
at a later point.

Fixes: ec362b63c4b5 ("ALSA: usb-audio: Enable the legacy raw MIDI support")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c  |  2 ++
 sound/usb/midi2.c | 15 ++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 246348766ec1..2cffd3686339 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1150,6 +1150,8 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	if (output)
 		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
 				    &snd_ump_legacy_output_ops);
+	snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
+		 ump->info.name);
 	rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
 	rmidi->ops = &snd_ump_legacy_ops;
 	rmidi->private_data = ump;
diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index ee2835741479..a27e244650c8 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -990,7 +990,7 @@ static int parse_midi_2_0(struct snd_usb_midi2_interface *umidi)
 		}
 	}
 
-	return attach_legacy_rawmidi(umidi);
+	return 0;
 }
 
 /* is the given interface for MIDI 2.0? */
@@ -1059,12 +1059,6 @@ static void set_fallback_rawmidi_names(struct snd_usb_midi2_interface *umidi)
 			usb_string(dev, dev->descriptor.iSerialNumber,
 				   ump->info.product_id,
 				   sizeof(ump->info.product_id));
-#if IS_ENABLED(CONFIG_SND_UMP_LEGACY_RAWMIDI)
-		if (ump->legacy_rmidi && !*ump->legacy_rmidi->name)
-			snprintf(ump->legacy_rmidi->name,
-				 sizeof(ump->legacy_rmidi->name),
-				 "%s (MIDI 1.0)", ump->info.name);
-#endif
 	}
 }
 
@@ -1157,6 +1151,13 @@ int snd_usb_midi_v2_create(struct snd_usb_audio *chip,
 	}
 
 	set_fallback_rawmidi_names(umidi);
+
+	err = attach_legacy_rawmidi(umidi);
+	if (err < 0) {
+		usb_audio_err(chip, "Failed to create legacy rawmidi\n");
+		goto error;
+	}
+
 	return 0;
 
  error:
-- 
2.35.3

