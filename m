Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E119D828E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Nov 2024 10:38:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82247852;
	Mon, 25 Nov 2024 10:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82247852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732527489;
	bh=3e48gaUbkDzZ93m48FEwSR97Hxj9SDLoJZuV45gj9WA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pWYRdfCau2izWV/z5RIhtENUZJ0GwxRUfxnDsQ+psWAnL0A6nmPXUbNRheaDLW3w3
	 O4SN5YGnUnNG+24J30OIcHlcdq+WIve6uzHOlAJs9j4h/hgyVXKY0LsqOnrMX20hxw
	 ggScjpLwI763hpVHCZjYBiIbzHesRXJ4jkh1sAl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30A33F805C6; Mon, 25 Nov 2024 10:37:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E660F805AB;
	Mon, 25 Nov 2024 10:37:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 477A0F80496; Mon, 25 Nov 2024 10:37:31 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A959F80073
	for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2024 10:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A959F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VU26Kd4h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jJgPSuFL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=VU26Kd4h;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jJgPSuFL
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 451B81F381;
	Mon, 25 Nov 2024 09:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732527445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5I0Ry1gX0OsOzPhf8uCQlia2F1vD9Gr6PeuL1Lfqx4=;
	b=VU26Kd4hHvq6MF8bHUd7r6p4enJIlcVqA6N7D0Bskva5RhIh5koOZmTwNNI/tRZeaKlz94
	uvCc7/Rq+gO1LcmdfkLdrshPcVuSBRCybg3OdgK4N6rnf5vyH3Hg38g32N2Ta98+mIyEYG
	sLzfnobNyfJJE2pN9vPDr1/NPyZWtM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732527445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5I0Ry1gX0OsOzPhf8uCQlia2F1vD9Gr6PeuL1Lfqx4=;
	b=jJgPSuFLtIj1JNIe1ChBChDjw3PwaA0uknph168wjxwXOovW8Gm7q4iCE6U7WvxDB8XOME
	zluRt7oAFGNFNCCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VU26Kd4h;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jJgPSuFL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732527445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5I0Ry1gX0OsOzPhf8uCQlia2F1vD9Gr6PeuL1Lfqx4=;
	b=VU26Kd4hHvq6MF8bHUd7r6p4enJIlcVqA6N7D0Bskva5RhIh5koOZmTwNNI/tRZeaKlz94
	uvCc7/Rq+gO1LcmdfkLdrshPcVuSBRCybg3OdgK4N6rnf5vyH3Hg38g32N2Ta98+mIyEYG
	sLzfnobNyfJJE2pN9vPDr1/NPyZWtM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732527445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x5I0Ry1gX0OsOzPhf8uCQlia2F1vD9Gr6PeuL1Lfqx4=;
	b=jJgPSuFLtIj1JNIe1ChBChDjw3PwaA0uknph168wjxwXOovW8Gm7q4iCE6U7WvxDB8XOME
	zluRt7oAFGNFNCCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C10D13890;
	Mon, 25 Nov 2024 09:37:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ETxJCVVFRGcZZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 25 Nov 2024 09:37:25 +0000
Date: Mon, 25 Nov 2024 10:37:24 +0100
Message-ID: <87bjy3zmaz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lentczner <mark@glyphic.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: kernel snd seq bugs: SND_SEQ_EVENT_CLIENT_CHANGE &
 SND_SEQ_EVENT_PORT_CHANGE
In-Reply-To: 
 <CAPnksqRok7xGa4bxq9WWimVV=28-7_j628OmrWLS=S0=hzaTHQ@mail.gmail.com>
References: 
 <CAPnksqRok7xGa4bxq9WWimVV=28-7_j628OmrWLS=S0=hzaTHQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 451B81F381
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: XDHKW4GF5LIW4KKQUNHKIUH3XPAVAFN7
X-Message-ID-Hash: XDHKW4GF5LIW4KKQUNHKIUH3XPAVAFN7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDHKW4GF5LIW4KKQUNHKIUH3XPAVAFN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 24 Nov 2024 22:31:13 +0100,
Mark Lentczner wrote:
> 
> I'm the author of amidiminder - a utility that keeps track of desired
> connections between ALSA Seq (MIDI) ports.
> 
> I've found a bug in the kernel part of the ALSA Sequencer, and am not sure
> where or how to report it.
> 
> Summary:
> The events:
> * SND_SEQ_EVENT_CLIENT_CHANGE is never sent
> * SND_SEQ_EVENT_PORT_CHANGE is not sent on common port changes (name and
> port info)
> 
> I have a lot of detail on these bugs, what other software causes them to be
> a problem (PureData), and where the missing code in the kernel
> sound/core/seq files is.
> 
> Before I dump all the details in this forum.... where is the right place
> for me to report and/or discuss this?

Those events aren't created indeed.  I don't remember exactly, as the
implementation was really old (decades ago), but I guess it was
because it'd give too much broadcasting when the event is triggered at
each client / port change.

Actually it's trivial to enable those events.  It's just a patch like
below.  But, I have to consider the result by this change and try to
avoid the unnecessary event bombing before going ahead.


thanks,

Takashi

-- 8< --
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1290,6 +1290,10 @@ static int snd_seq_ioctl_set_client_info(struct snd_seq_client *client,
 		client->midi_version = client_info->midi_version;
 	memcpy(client->event_filter, client_info->event_filter, 32);
 	client->group_filter = client_info->group_filter;
+
+	/* notify the change */
+	snd_seq_system_client_ev_client_change(client->number);
+
 	return 0;
 }
 
@@ -1413,6 +1417,9 @@ static int snd_seq_ioctl_set_port_info(struct snd_seq_client *client, void *arg)
 	if (port) {
 		snd_seq_set_port_info(port, info);
 		snd_seq_port_unlock(port);
+		/* notify the change */
+		snd_seq_system_client_ev_port_change(info->addr.client,
+						     info->addr.port);
 	}
 	return 0;
 }
