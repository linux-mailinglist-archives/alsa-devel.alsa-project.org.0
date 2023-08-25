Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22740788C29
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 17:10:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCD883B;
	Fri, 25 Aug 2023 17:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCD883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692976222;
	bh=eTsyzlBbfmq/Le+3Cn1cevyPu84zu+E34+QvDFlJUsE=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VXs7izuMs5BsnedDyqKiaBreg9KTryjpYOuzWoKg2DwZ3P0bkIXfLfABoCqdgtIJm
	 WfCMCSpQlXCOKGqehfmTFpaqmiXtt2fwuC3ZERYricTPhVRD/QQnL1tSepYFmtF+8H
	 En9R6Wr5M8YudLCI9/JU2lehSnr1qMNtUw1/EPx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30CA9F800AE; Fri, 25 Aug 2023 17:09:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D63F800D1;
	Fri, 25 Aug 2023 17:09:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3E09F800F5; Fri, 25 Aug 2023 17:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53D75F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 17:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D75F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GNZ+mY4G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FT2YJp0P
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9613322468;
	Fri, 25 Aug 2023 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692976157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=tJ0qi/i3EYD8R2ZCtEHMhMZUc4PDdZLJPb/tuIgjrl8=;
	b=GNZ+mY4GfoaFh+OaqZ+4MFDcokZP2K5ANql9ySx8yc9HSX1PfgN53GvlHowgEpSEJOyXib
	Mf1V5lXvXdKCZVvjXlvbOSnjI4NI86eXAfEe/kSgmR9DOy+5UlGChXOHQppSbQ8akCqW2h
	JHQ4RZRbelb8wDgs3L80uKR9Eck/adw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692976157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=tJ0qi/i3EYD8R2ZCtEHMhMZUc4PDdZLJPb/tuIgjrl8=;
	b=FT2YJp0P+kwpWPg5gAFIgg97NUY79k+iQYFIn504XLRv8SF+/wjmzn/J8b/Zgqb/YWw2nF
	BRSLOFp/Zpj4B3AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 790581340A;
	Fri, 25 Aug 2023 15:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 60g8Gx3E6GT0KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 15:09:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: ump: Fix -Wformat-truncation warnings
Date: Fri, 25 Aug 2023 17:09:15 +0200
Message-Id: <20230825150915.1595-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 67SKJCKZPQBFO4S62GSTTTTC3ODSK7KF
X-Message-ID-Hash: 67SKJCKZPQBFO4S62GSTTTTC3ODSK7KF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67SKJCKZPQBFO4S62GSTTTTC3ODSK7KF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Filling the rawmidi name and substream name can be truncated, and this
leads to spurious compiler warnings due to -Wformat-truncation.
Although the truncation is the expected behavior, it'd be better to
truncate the string within "(...)"

This patch puts the precision specifies to each %s for fitting the
words within the size-limited strings.

Fixes: 5f11dd938fe7 ("ALSA: usb-audio: Attach legacy rawmidi after probing all UMP EPs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308251844.1FuQYsql-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 9d6e3e748f7e..a2f91fe7905a 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1157,7 +1157,7 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 	struct snd_rawmidi_substream *s;
 
 	list_for_each_entry(s, &rmidi->streams[dir].substreams, list)
-		snprintf(s->name, sizeof(s->name), "Group %d (%s)",
+		snprintf(s->name, sizeof(s->name), "Group %d (%.16s)",
 			 ump->legacy_mapping[s->number] + 1, ump->info.name);
 }
 
@@ -1191,7 +1191,7 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	if (output)
 		snd_rawmidi_set_ops(rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT,
 				    &snd_ump_legacy_output_ops);
-	snprintf(rmidi->name, sizeof(rmidi->name), "%s (MIDI 1.0)",
+	snprintf(rmidi->name, sizeof(rmidi->name), "%.69s (MIDI 1.0)",
 		 ump->info.name);
 	rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
 	rmidi->ops = &snd_ump_legacy_ops;
-- 
2.35.3

