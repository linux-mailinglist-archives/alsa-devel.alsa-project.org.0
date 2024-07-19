Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A549374A3
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 10:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 053BAE82;
	Fri, 19 Jul 2024 10:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 053BAE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721376090;
	bh=v9/0vbm+9xHzYX4WGmZ8UM4iT9l5sSskUwKn4FkjE2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tKCya4R7bj+eM5MRDSMuGiWkbp0EzC4TeTUZ5bX80mFjlZqtftcfoGk/3W6ynI7o6
	 9CwZNYJ5OduY650GISI9Zi7mnS2MNtRwvDuaK8HXNmlRAx+EO0PrX09kjZniTIn90G
	 b7pbA9LkJ4xoo0WfglQ9LjAd1vS4zmqNZgWOGdmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED090F805AA; Fri, 19 Jul 2024 10:01:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B091F805AE;
	Fri, 19 Jul 2024 10:01:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D754F804FC; Fri, 19 Jul 2024 09:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1854EF8007E
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 09:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1854EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KVfutfg6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=A2Ql2yPf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=KVfutfg6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=A2Ql2yPf
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26BBA21B1B;
	Fri, 19 Jul 2024 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721375247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlCu6jKq2cJKf9rlzPvO/GG/OYPip1T18Fqi7rECkbU=;
	b=KVfutfg6gKzQ9LeSqaSwF/rYeJ//tnfA0RqucTxxLNdXuVO0ISqAtjGX2OcfFCIgp8NBRY
	AZPEvE+Kl52z9h8GNKFKi/QGBFlTsLkqib3C9nJsOrwBVYbpiP25VMDhM/N6pdm1Fww5Nn
	rmrEvf8GfUJNoFRJW5p0/ANMsVTkgKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721375247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlCu6jKq2cJKf9rlzPvO/GG/OYPip1T18Fqi7rECkbU=;
	b=A2Ql2yPfOid4IgdrP2MhjLC4WXdPYKhb6z2sCygsaCuvnJdy2r4t7lvTyO/5IsoFCuyyv9
	WfWJjdW9+XYhEECg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721375247;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlCu6jKq2cJKf9rlzPvO/GG/OYPip1T18Fqi7rECkbU=;
	b=KVfutfg6gKzQ9LeSqaSwF/rYeJ//tnfA0RqucTxxLNdXuVO0ISqAtjGX2OcfFCIgp8NBRY
	AZPEvE+Kl52z9h8GNKFKi/QGBFlTsLkqib3C9nJsOrwBVYbpiP25VMDhM/N6pdm1Fww5Nn
	rmrEvf8GfUJNoFRJW5p0/ANMsVTkgKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721375247;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wlCu6jKq2cJKf9rlzPvO/GG/OYPip1T18Fqi7rECkbU=;
	b=A2Ql2yPfOid4IgdrP2MhjLC4WXdPYKhb6z2sCygsaCuvnJdy2r4t7lvTyO/5IsoFCuyyv9
	WfWJjdW9+XYhEECg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1074136F7;
	Fri, 19 Jul 2024 07:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SgFHOQ4ammZ1KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Jul 2024 07:47:26 +0000
Date: Fri, 19 Jul 2024 09:48:00 +0200
Message-ID: <87r0bpu8jz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 00/xx] ALSA: ALSA: add snd_stream_is_playback/capture()
In-Reply-To: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: BKEQMYO5TA6DJQPO6DHXWVRWX63HPVVV
X-Message-ID-Hash: BKEQMYO5TA6DJQPO6DHXWVRWX63HPVVV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKEQMYO5TA6DJQPO6DHXWVRWX63HPVVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 Jul 2024 01:34:01 +0200,
Kuninori Morimoto wrote:
> 
> 
> Hi Iwai-san, Mark
> 
> Current many drivers are using below code to know its direction.
> 
> 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> 
> I think it should be handled by function. But is it acceptable idea ?

Is the conversion just for readability / consistency reason?
Or would it bring other benefit like code safety?
Honestly speaking, I see no big advantage of conversion, if it's only
about the readability.

> Because it will be too many patch-set, I want to know it was acceptable
> idea or not before posting patch-bomb.

A generic macro like Amadeusz suggested would be an interesting idea,
and that can be seen as a cleanup.  But the straightforward conversion
for the mass, I don't know whether it's worth...


thanks,

Takashi

> 
> I will post main patch, and sample driver patches.
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
