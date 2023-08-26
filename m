Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5A78944F
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 09:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E59E846;
	Sat, 26 Aug 2023 09:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E59E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693034924;
	bh=9Ppa7MOxJL9CjuTKfZR8NogE0iI8n5CoEAC9Nyo5eSo=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vXvbjRao/tAMRPvQwyueqrsYEoYROl3rhCHCxNLG7cE/BCLD1+hZ+C7Xs8XKK9b7F
	 zVoDTixKL6DElNKmJ8Bfp3yXSDOPqdRnRTh15WGQXiH6wkr8P9vf93WIcLvwuGTA+F
	 WZ810EQE7QVdPfm88+ppR8iZcyRnwAVSBAuBdY9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD4D8F8023B; Sat, 26 Aug 2023 09:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 770ADF800F5;
	Sat, 26 Aug 2023 09:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1210F80158; Sat, 26 Aug 2023 09:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F8E5F800F5
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 09:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8E5F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WsvaiyLU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bsfbSo+P
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7443D21E9B;
	Sat, 26 Aug 2023 07:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693034515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=6UmBLhW7R2EKc//4QVzBju8LaqVhtrybVayX7+xKQ0E=;
	b=WsvaiyLUMVUwtEE2PxlhvbJt48Vqj7hes32p2Ngyk2xCkxt/CR1/3P2JkeX1L8Le6kiHbh
	zbV8NLnJw9R3QAIO8R+wwASq9uCm1ZAAD+U9p7IYB7wJ8m8oYBirY7EbHICOlbdlapelmZ
	tfrpHRypYYMCHmNEQn8SRDv6zKxZxmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693034515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=6UmBLhW7R2EKc//4QVzBju8LaqVhtrybVayX7+xKQ0E=;
	b=bsfbSo+PvPW92YWPNwNXQIK2yONlY+3c1E6pk2kS4I1+VU2wdu6hSv2crPteaXwqvgxCC5
	tmAyz2KcNhpaEYDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 579E213585;
	Sat, 26 Aug 2023 07:21:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RFpYFBOo6WT0FgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 26 Aug 2023 07:21:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: ump: Fix -Wformat-truncation warnings
Date: Sat, 26 Aug 2023 09:21:51 +0200
Message-Id: <20230826072151.23408-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WBT6NPHO5ZXK4KHFF4H2JANUICDK2YZJ
X-Message-ID-Hash: WBT6NPHO5ZXK4KHFF4H2JANUICDK2YZJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBT6NPHO5ZXK4KHFF4H2JANUICDK2YZJ/>
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
v1->v2: change the precision to fit better

 sound/core/ump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index cd192bec227a..3bef1944e955 100644
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
+	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
 		 ump->info.name);
 	rmidi->info_flags = ump->core.info_flags & ~SNDRV_RAWMIDI_INFO_UMP;
 	rmidi->ops = &snd_ump_legacy_ops;
-- 
2.35.3

