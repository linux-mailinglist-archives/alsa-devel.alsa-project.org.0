Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D29FE5AA
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2024 12:35:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AD9E60542;
	Mon, 30 Dec 2024 12:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AD9E60542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735558507;
	bh=lrfqXdc/BndCAd7nVeFdk9mWfMh/nJ/2GeWMxZwOPG4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZKtEhE6xeC//intjMMBud4bJUwJF1LQODRpsTUzwvqsrjzfSvkib2Faz6P6enzH62
	 IgqzZChGoA7DvVkWCyNXFhM0XgoLbe8Vl64iZtO3nSoNdLIymEtNhIPYiEBPcJmxC0
	 dflXbvTQSO7l30jPiZcU7z4zwFqzFS6SzKe9HO3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25F8FF805BE; Mon, 30 Dec 2024 12:34:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 129D6F805B6;
	Mon, 30 Dec 2024 12:34:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E69F80508; Mon, 30 Dec 2024 12:34:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7175F8001D
	for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2024 12:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7175F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=x2M9QTdt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BQ+2Zm9n;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=x2M9QTdt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BQ+2Zm9n
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9BB4D1F38C;
	Mon, 30 Dec 2024 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1735558465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JO/n1sGLOdeh5vehsbwpFWhE1luRFGv/fPRrrZGaDcA=;
	b=x2M9QTdtG9NXJ19GTKPXZPZUawXLuvYHaCBo8Cb2V+T6xlPfs3wVmbKxTF17sy6agmdtST
	gCLvtj2KCfnVeQ//6qKTk2Aevo2mq1kponoQvb3d6TbYnKvkATHIeiItHMKlf1TB9xSM69
	gsX58+8iFNkAfhU4icthDDkxFdlD1E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735558465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JO/n1sGLOdeh5vehsbwpFWhE1luRFGv/fPRrrZGaDcA=;
	b=BQ+2Zm9nrrkHfnpg/I4NW9x1ZtwGBjXQEz6fT2i4MRX3Pb0Tbnu++ambQfdmt3kZfQjo3s
	jQ3K0cI9pM2dfACA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1735558465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JO/n1sGLOdeh5vehsbwpFWhE1luRFGv/fPRrrZGaDcA=;
	b=x2M9QTdtG9NXJ19GTKPXZPZUawXLuvYHaCBo8Cb2V+T6xlPfs3wVmbKxTF17sy6agmdtST
	gCLvtj2KCfnVeQ//6qKTk2Aevo2mq1kponoQvb3d6TbYnKvkATHIeiItHMKlf1TB9xSM69
	gsX58+8iFNkAfhU4icthDDkxFdlD1E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735558465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JO/n1sGLOdeh5vehsbwpFWhE1luRFGv/fPRrrZGaDcA=;
	b=BQ+2Zm9nrrkHfnpg/I4NW9x1ZtwGBjXQEz6fT2i4MRX3Pb0Tbnu++ambQfdmt3kZfQjo3s
	jQ3K0cI9pM2dfACA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7991013A6C;
	Mon, 30 Dec 2024 11:34:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oocMHEGFcmf+dAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 11:34:25 +0000
Date: Mon, 30 Dec 2024 12:34:25 +0100
Message-ID: <87jzbhwgji.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Correo Alternativo <correocebe@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: Ask snd_seq_set_client_midi_version
In-Reply-To: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
References: <cb5ca1c7-64a3-43df-b506-db07a2b5f790@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: EG5LDGILH3MQ5MZXQOJ2BVS3QQTWB34E
X-Message-ID-Hash: EG5LDGILH3MQ5MZXQOJ2BVS3QQTWB34E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EG5LDGILH3MQ5MZXQOJ2BVS3QQTWB34E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Dec 2024 00:24:11 +0100,
Correo Alternativo wrote:
> 
> Hi, I'm trying out MIDI 2.0 and found a problem, when using
> snd_seq_set_client_midi_version
> 
> With SND_SEQ_CLIENT_LEGACY_MIDI I get the following sequence of events
> when connecting a midi device (using the method snd_seq_event_input or
> snd_seq_ump_event_input) (timidity command:timidity --interface=A
> --buffer-fragments=2,8 --output-mode=s1l --sampling-freq=44100):
> 
> SND_SEQ_EVENT_CLIENT_START
> SND_SEQ_EVENT_PORT_START
> SND_SEQ_EVENT_PORT_START
> SND_SEQ_EVENT_PORT_START
> SND_SEQ_EVENT_PORT_START
> 
> But with SND_SEQ_CLIENT_UMP_MIDI_1_0 and SND_SEQ_CLIENT_UMP_MIDI_2_0 I
> don't get the SND_SEQ_EVENT_PORT_START events, I only get the
> following:
> 
> SND_SEQ_EVENT_CLIENT_START
> SND_SEQ_EVENT_SYSTEM
> SND_SEQ_EVENT_SYSTEM
> SND_SEQ_EVENT_SYSTEM
> 
> I don't know if I'm asking this in the right place, what mistake am I
> making? Just by modifying that it stops working.

Hmm, there should be no difference in this regard between the legacy
and UMP clients.

Do you mean that the destination client (i.e. timidity) doesn't
receive *_PORT_START events when you send from a UMP client?
Or how is the actual setup and the connection?


thanks,

Takashi
