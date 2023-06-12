Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647E372B9F0
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949A683B;
	Mon, 12 Jun 2023 10:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949A683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686557586;
	bh=DtDMEWObyx1K5jPjxKhsu73R/BSrB8CkEBist7ohkqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kw17nVaI/ORvDO/jf+RsX32VLpWWFxcjKfkkuqMFg5lqNyxrgDfhymliK2RGbqnVX
	 hUVLq0VyPgGMTpdrz+6IquqsEMjFe+OjBBP6C9wcMYVU2wpXVk3ecRIcnjRzGZLM+0
	 0yDonQk0DSJFuZr4nAgZYoxLvJokPinX64DHOguQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5143AF8057D; Mon, 12 Jun 2023 10:11:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ABB5F80549;
	Mon, 12 Jun 2023 10:11:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D33F8055C; Mon, 12 Jun 2023 10:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA765F80246
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA765F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BvQvCPJk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TpuiVNkt
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 84E5F20488;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686557466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wy55YqLCeSe3EZduBTyhl4afgk45rbKUhrCZNvDKi10=;
	b=BvQvCPJkbnJzqa/L7vHEK5tbiraToFmmOqK73lyrB05HXQZRg74dd6/7xh4m010xazDL5S
	ZHZ81p4x3OF5PBaafD5tqi7GzXaNmWRjZbB7PrE8P3yV/yRAuqoI4Bdyy76RVIB88W0O9u
	8NpVISUcK4aMn1+2Qfq+bWSOWGjm54s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686557466;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wy55YqLCeSe3EZduBTyhl4afgk45rbKUhrCZNvDKi10=;
	b=TpuiVNktfQB5h/primn0ugsehUY7Satk4q+BC3reLGS3Sn4sC/Jv1HLJDDzUMN6zsMweC7
	d/lqnH+yu+d0ilBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 620BF138EC;
	Mon, 12 Jun 2023 08:11:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uJggFhrThmSLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:11:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] ALSA: usb-audio: Add midi2_ump_probe option
Date: Mon, 12 Jun 2023 10:10:48 +0200
Message-Id: <20230612081054.17200-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081054.17200-1-tiwai@suse.de>
References: <20230612081054.17200-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EO4HCLNHGGNPK7Z377WL6FS623E22R2B
X-Message-ID-Hash: EO4HCLNHGGNPK7Z377WL6FS623E22R2B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EO4HCLNHGGNPK7Z377WL6FS623E22R2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a new option to enable/disable the UMP Endpoint probing.
Some firmware seems screwed up when such a new command issued, and
this option allows user to suppress it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index fad094e15999..13fa1978267a 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -27,6 +27,10 @@ static bool midi2_enable = true;
 module_param(midi2_enable, bool, 0444);
 MODULE_PARM_DESC(midi2_enable, "Enable MIDI 2.0 support.");
 
+static bool midi2_ump_probe = true;
+module_param(midi2_ump_probe, bool, 0444);
+MODULE_PARM_DESC(midi2_ump_probe, "Probe UMP v1.1 support at first.");
+
 /* stream direction; just shorter names */
 enum {
 	STR_OUT = SNDRV_RAWMIDI_STREAM_OUTPUT,
@@ -1136,10 +1140,12 @@ int snd_usb_midi_v2_create(struct snd_usb_audio *chip,
 		goto error;
 	}
 
-	err = parse_ump_endpoints(umidi);
-	if (err < 0) {
-		usb_audio_err(chip, "Failed to parse UMP endpoint\n");
-		goto error;
+	if (midi2_ump_probe) {
+		err = parse_ump_endpoints(umidi);
+		if (err < 0) {
+			usb_audio_err(chip, "Failed to parse UMP endpoint\n");
+			goto error;
+		}
 	}
 
 	err = create_blocks_from_gtb(umidi);
-- 
2.35.3

