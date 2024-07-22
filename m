Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F300D938B12
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 10:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3F1EF2;
	Mon, 22 Jul 2024 10:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3F1EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721636345;
	bh=vZFvpXbU/MGHKIc+ekE1z4eKS9CeUQEbMPzdv2EDJQ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HY+QwjnLsA0DtQONp+wA+GlTyTbB7wM8XEUSbV0F8TMxBj/O/6KuH0hTZkJlzkl3w
	 5+kZ/tO8r2AwzfJnUEJOzFlk2RSQU2n4jwFAzbwC3V4KAj0A3l0s21D7onBb4LyjM4
	 CHC1ptkds+C32VrApqEmPsmi1Utnfd+aCVHX9AdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72679F805CB; Mon, 22 Jul 2024 10:18:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A10F805C0;
	Mon, 22 Jul 2024 10:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E17D9F801F5; Mon, 22 Jul 2024 10:15:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE557F800C9
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 10:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE557F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TwqOtxrd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Erhh0PvT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=TwqOtxrd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Erhh0PvT
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B08A71FB5F;
	Mon, 22 Jul 2024 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721636140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lX9sLpWpvnKidmJX+wXpWxlGpGJOTEt0nAB5IFVmws=;
	b=TwqOtxrdufQtmvyUczgeAv6OGkhL5uDoZxY0rXjmIROmFwzGG+lfsD6Bht+q9gcTwcngiO
	GZ5GzR5yc8r4NwBRohLtryDwt+uhc1yzyzubd0wwHpFAhPj8zXpheGBVsu/+JiAPzSHXw6
	rMmvDlZBtHyu0SFwoUYYxwdOsMshF6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721636140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lX9sLpWpvnKidmJX+wXpWxlGpGJOTEt0nAB5IFVmws=;
	b=Erhh0PvTQAZHgUXAOUYs4+SKF7CmX4i8cSzPZsX68anKJEYlUJeSZD0WQ5Ccu2dDf5RICg
	crFCYkZPW44d/sDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721636140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lX9sLpWpvnKidmJX+wXpWxlGpGJOTEt0nAB5IFVmws=;
	b=TwqOtxrdufQtmvyUczgeAv6OGkhL5uDoZxY0rXjmIROmFwzGG+lfsD6Bht+q9gcTwcngiO
	GZ5GzR5yc8r4NwBRohLtryDwt+uhc1yzyzubd0wwHpFAhPj8zXpheGBVsu/+JiAPzSHXw6
	rMmvDlZBtHyu0SFwoUYYxwdOsMshF6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721636140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lX9sLpWpvnKidmJX+wXpWxlGpGJOTEt0nAB5IFVmws=;
	b=Erhh0PvTQAZHgUXAOUYs4+SKF7CmX4i8cSzPZsX68anKJEYlUJeSZD0WQ5Ccu2dDf5RICg
	crFCYkZPW44d/sDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82BBD138A7;
	Mon, 22 Jul 2024 08:15:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sRZHHiwVnmaCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 08:15:40 +0000
Date: Mon, 22 Jul 2024 10:16:14 +0200
Message-ID: <87v80xq1td.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Takashi Iwai <tiwai@suse.com>,	Mark
 Brown <broonie@kernel.org>,	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
In-Reply-To: <87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
	<87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
	<9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
	<87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
	<87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: RZSXE3FW3HFOADOYV2QFCDMRPAMUTJG4
X-Message-ID-Hash: RZSXE3FW3HFOADOYV2QFCDMRPAMUTJG4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZSXE3FW3HFOADOYV2QFCDMRPAMUTJG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 Jul 2024 07:58:41 +0200,
Kuninori Morimoto wrote:
> 
> 
> Hi Amadeusz, Takashi
> 
> > > Perhaps you could use generics here, so you could have one caller for
> > > both cases?
> > > 
> > > Something like:
> > > #define snd_pcm_is_playback(x) _Generic((x),                   \
> > >         int :         (x == SNDRV_PCM_STREAM_PLAYBACK), \
> > >         struct snd_pcm_substream *substream * : (x->stream ==
> > > SNDRV_PCM_STREAM_PLAYBACK))(x)
> > > or just call the above functions in it?
> 
> Hmm... I couldn't compile above inline style.
> I need to create function, and use it on _Generic().
> 
> And then, _Generic() is very picky for variable sytle.
> This means I need to create function for "int" / "const int",
> "unsigned int", "const unsigned int"
> 
> static inline int snd_pcm_stream_is_playback_(const int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_stream_is_playback(int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_stream_is_playback_u(const unsigned int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }
> 
> static inline int snd_pcm_stream_is_playbacku(unsigned int stream)
> {
> 	return stream == SNDRV_PCM_STREAM_PLAYBACK;
> }

I really don't see any merit of those inline.  If this simplifies the
code, I'd agree, but that's adding just more code...

> 
> static inline int snd_pcm_substream_is_playback_(const struct snd_pcm_substream *substream)
> {
> 	return snd_pcm_stream_is_playback(substream->stream);
> }
> 
> static inline int snd_pcm_substream_is_playback(struct snd_pcm_substream *substream)
> {
> 	return snd_pcm_stream_is_playback(substream->stream);
> }
> 
> #define snd_pcm_is_playback(x) _Generic((x), \
> 	const int : snd_pcm_stream_is_playback_, \
> 	      int : snd_pcm_stream_is_playback, \
> 	const unsigned int : snd_pcm_stream_is_playback_u, \
> 	      unsigned int : snd_pcm_stream_is_playbacku, \
> 	const struct snd_pcm_substream * : snd_pcm_substream_is_playback_, \
> 	      struct snd_pcm_substream * : snd_pcm_substream_is_playback)(x)
> 
> And I'm not sure how to handle "bit field" by _Generic.
> 
> 	${LINUX}/sound/pci/ac97/ac97_pcm.c:153:13: note: in expansion of macro 'snd_pcm_is_playback'
> 	  153 |         if (snd_pcm_is_playback(pcm->stream))
> 	      |             ^~~~~~~~~~~~~~~~~~~
> 	${LINUX}/sound/pci/ac97/ac97_pcm.c: In function 'snd_ac97_pcm_assign':
> 	${LINUX}/include/sound/pcm.h:544:41: error: '_Generic' selector of type 'unsigned char:1' is not compatible with any association
> 	  544 | #define snd_pcm_is_playback(x) _Generic((x), \
> 
> Not using _Generic() is easy, "const int" version can handle everything
> (= "int", "const int", "unsigned int", "const unsigned int", "short",
> "const short", "bit field", etc).
> 
> If there is better _Generic() grammar, I can follow it.
> If there wasn't, unfortunately let's give up this conversion...

IMO, if the retrieval of the stream direction and its evaluation are
done separately, there is little use of the inline functions like the
above.  It doesn't give a better readability nor code safety.

That said, as of now, I'm not much convinced to go further.
OTOH, I'm not strongly against taking this kind of change -- if other
people do find it absolutely better, I'm ready to be convinced :)


thanks,

Takashi
