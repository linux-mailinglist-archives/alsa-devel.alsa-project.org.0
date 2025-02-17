Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B541A38149
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2025 12:05:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83BDB602C4;
	Mon, 17 Feb 2025 12:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83BDB602C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739790308;
	bh=sZXsNekn/CNLNWt2F5ullpeJsNlR05xyk4w3Pu9o1Sc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qnL0czK4gPJdV7hoM4yBmwAsdC2Fr3fCyauWW0ME0JT0vZsQP2iPcWYWY+xJLjQm4
	 V6XgWv0W9Xbs2rXi0KWp5WUAvEh2ATa2vITzTd3vPNJHz7NDhlRVKYN/Nv9s+ae3GI
	 b7+k8ix9AKqmmtGedf2pxAFhtUvl2WSwFrXQVSHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56C24F80246; Mon, 17 Feb 2025 12:04:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BFC7F8058C;
	Mon, 17 Feb 2025 12:04:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A082F80246; Mon, 17 Feb 2025 12:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DCFCF80100
	for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2025 12:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DCFCF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bsOwedKI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PVzt+7Sn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bsOwedKI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PVzt+7Sn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D1E281F74D;
	Mon, 17 Feb 2025 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739790266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1KUGEnYvq/QL0lbtLCLDgu/CvocU2FxPdDMItv10P8=;
	b=bsOwedKIKNRNmbgAR1D8Vdpaajm4i/sN6F8EbsSUzcMLA124CxmErEpX7xFyUtSZzpFgm5
	VK4rJ397JJYfgqJkTAT/seTnEBTBssXpIfjj/jV5GFN6iPQr38NhRjv7PNI2txmupa3ja+
	0o2p0i5TVvZHpECN+M89CdhJtrRz8Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739790266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1KUGEnYvq/QL0lbtLCLDgu/CvocU2FxPdDMItv10P8=;
	b=PVzt+7SnUEPrlgU4M4O8GP/TVswN/0JbVYseYp3Dc3QkrczvHeHdi0g/qSE37jTIonGh7W
	lulTxLAN/5R2gPCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1739790266;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1KUGEnYvq/QL0lbtLCLDgu/CvocU2FxPdDMItv10P8=;
	b=bsOwedKIKNRNmbgAR1D8Vdpaajm4i/sN6F8EbsSUzcMLA124CxmErEpX7xFyUtSZzpFgm5
	VK4rJ397JJYfgqJkTAT/seTnEBTBssXpIfjj/jV5GFN6iPQr38NhRjv7PNI2txmupa3ja+
	0o2p0i5TVvZHpECN+M89CdhJtrRz8Yc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739790266;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1KUGEnYvq/QL0lbtLCLDgu/CvocU2FxPdDMItv10P8=;
	b=PVzt+7SnUEPrlgU4M4O8GP/TVswN/0JbVYseYp3Dc3QkrczvHeHdi0g/qSE37jTIonGh7W
	lulTxLAN/5R2gPCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 982371379D;
	Mon, 17 Feb 2025 11:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j5HeIboXs2fGXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Feb 2025 11:04:26 +0000
Date: Mon, 17 Feb 2025 12:04:21 +0100
Message-ID: <87cyfg96iy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Carlos <correocebe@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: Possible bug with snd_seq_event_input_pending
In-Reply-To: <b77a2cd6-7b59-4eb0-a8db-22d507d3af5f@gmail.com>
References: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
	<b77a2cd6-7b59-4eb0-a8db-22d507d3af5f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 2M35OI326EN2A6O3OMKKGDIZKNXW2M7R
X-Message-ID-Hash: 2M35OI326EN2A6O3OMKKGDIZKNXW2M7R
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2M35OI326EN2A6O3OMKKGDIZKNXW2M7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 02 Feb 2025 00:11:51 +0100,
Carlos wrote:
> 
> Hi, I don't know if this is a bug or not, but I'll report it in case it is.
> 
> If I configure my client as follows:
> 
> snd_seq_set_client_midi_version(seq, SND_SEQ_CLIENT_LEGACY_MIDI);
> 
> snd_seq_set_client_ump_conversion(seq, 0);//I disable ump conversion
> 
> And then I send a midi event from a MIDI 2.0 device, the
> snd_seq_event_input_pending(seq, 1) function will not respond until it
> receives any other legacy event.
> 
> Now I know that with SND_SEQ_CLIENT_LEGACY_MIDI I shouldn't disable
> ump conversion, but I expected it to return 0.

This can be indeed a problem in the kernel side.  It shouldn't deliver
the UMP events if the destination can't handle it.

Could you try the patch below?


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: seq: Drop UMP events when no UMP-conversion is set

When a destination client is a user client in the legacy MIDI mode and
it sets the no-UMP-conversion flag, currently the all UMP events are
still passed as-is.  But this may confuse the user-space, because the
event packet size is different from the legacy mode.

Since we cannot handle UMP events in user clients unless it's running
in the UMP client mode, we should filter out those events instead of
accepting blindly.  This patch addresses it by slightly adjusting the
conditions for UMP event handling at the event delivery time.

Fixes: 329ffe11a014 ("ALSA: seq: Allow suppressing UMP conversions")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 073b56dc2225..cb66ec42a3f8 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -678,12 +678,18 @@ static int snd_seq_deliver_single_event(struct snd_seq_client *client,
 					  dest_port->time_real);
 
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
-	if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
-		if (snd_seq_ev_is_ump(event)) {
+	if (snd_seq_ev_is_ump(event)) {
+		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
 			result = snd_seq_deliver_from_ump(client, dest, dest_port,
 							  event, atomic, hop);
 			goto __skip;
-		} else if (snd_seq_client_is_ump(dest)) {
+		} else if (dest->type == USER_CLIENT &&
+			   !snd_seq_client_is_ump(dest)) {
+			result = 0; // drop the event
+			goto __skip;
+		}
+	} else if (snd_seq_client_is_ump(dest)) {
+		if (!(dest->filter & SNDRV_SEQ_FILTER_NO_CONVERT)) {
 			result = snd_seq_deliver_to_ump(client, dest, dest_port,
 							event, atomic, hop);
 			goto __skip;
-- 
2.43.0

