Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A13989C80
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 10:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF5B41914;
	Mon, 30 Sep 2024 10:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF5B41914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727684370;
	bh=OmPR7RsJg2VUdRRZB+J4pEcyAIzElAYjz6x0cM14dk0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MDw0sbSiqx1qFpleFSgzMFKifbQiE05DDPRgfEiMZDVwG5wPRKNT9kFcZWPcaSH9u
	 Vb1OmjvY495E6RWhrIA9zdtmiyV80cf69306eicYGo2nkjw0heKUzwVqcTeOg8lS0A
	 iZET4kMcQgXCbqCCQdKHcSDOUBFzWuGyRZ/RQXxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 008E6F805BE; Mon, 30 Sep 2024 10:18:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 903FEF805B1;
	Mon, 30 Sep 2024 10:18:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7456F80517; Mon, 30 Sep 2024 10:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB8D6F80074
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 10:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8D6F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WQIHWu+t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7a4xHNnQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=WQIHWu+t;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7a4xHNnQ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B983721A29;
	Mon, 30 Sep 2024 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727684315;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hEDFiHcw8K3hm+8LVEFDh1DO+3gJeGWsHpsFZs0OzgI=;
	b=WQIHWu+tODQKjMwAxLpMskzb3z4jX6fNUhriQoTQUvy/FPTuE9PgTVNJtgR8X7usLljdWn
	C7aS4YU1mBF3WUauK7jKoETG3f5Lf8FQ16RU7qzhbJWe8HZB79LE27p7hdXUpftzCg6CXL
	xnmE9exsP/s7b6KK94LuWLhImj3h5i4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727684315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hEDFiHcw8K3hm+8LVEFDh1DO+3gJeGWsHpsFZs0OzgI=;
	b=7a4xHNnQAq0HVM7M7gPxOfm6+8ebJeJv2F9hHR1DaQOTd0a2vE08HTcHmUgap5w6biuH2V
	d+O+KiAJj1xq8TDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1727684315;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hEDFiHcw8K3hm+8LVEFDh1DO+3gJeGWsHpsFZs0OzgI=;
	b=WQIHWu+tODQKjMwAxLpMskzb3z4jX6fNUhriQoTQUvy/FPTuE9PgTVNJtgR8X7usLljdWn
	C7aS4YU1mBF3WUauK7jKoETG3f5Lf8FQ16RU7qzhbJWe8HZB79LE27p7hdXUpftzCg6CXL
	xnmE9exsP/s7b6KK94LuWLhImj3h5i4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727684315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hEDFiHcw8K3hm+8LVEFDh1DO+3gJeGWsHpsFZs0OzgI=;
	b=7a4xHNnQAq0HVM7M7gPxOfm6+8ebJeJv2F9hHR1DaQOTd0a2vE08HTcHmUgap5w6biuH2V
	d+O+KiAJj1xq8TDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B27013A8B;
	Mon, 30 Sep 2024 08:18:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FeadJNte+mYkGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Sep 2024 08:18:35 +0000
Date: Mon, 30 Sep 2024 10:19:28 +0200
Message-ID: <8734lhk0z3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oldherl Oh <me@oldherl.one>
Cc: alsa-devel@alsa-project.org,
	bo.liu@senarytech.com
Subject: Re: [PATCH] ALSA: hda/conexant: fix some typos
In-Reply-To: <20240929154223.1869717-2-me@oldherl.one>
References: <20240929154223.1869717-1-me@oldherl.one>
	<20240929154223.1869717-2-me@oldherl.one>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: SQTTI3LOXTD6ZDVY3UFRAQMSRVSFD2SR
X-Message-ID-Hash: SQTTI3LOXTD6ZDVY3UFRAQMSRVSFD2SR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQTTI3LOXTD6ZDVY3UFRAQMSRVSFD2SR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 29 Sep 2024 17:41:00 +0200,
Oldherl Oh wrote:
> 
> Fix some typos in patch_conexant.c

Please give your Signed-off-by tag.
See https://docs.kernel.org/process/submitting-patches.html for
details.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_conexant.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> index e851785ff058..ade42a8209c2 100644
> --- a/sound/pci/hda/patch_conexant.c
> +++ b/sound/pci/hda/patch_conexant.c
> @@ -166,18 +166,18 @@ static void cxt_init_gpio_led(struct hda_codec *codec)
>  
>  static void cx_fixup_headset_recog(struct hda_codec *codec)
>  {
> -	unsigned int mic_persent;
> +	unsigned int mic_present;
>  
>  	/* fix some headset type recognize fail issue, such as EDIFIER headset */
> -	/* set micbiasd output current comparator threshold from 66% to 55%. */
> +	/* set micbias output current comparator threshold from 66% to 55%. */
>  	snd_hda_codec_write(codec, 0x1c, 0, 0x320, 0x010);
> -	/* set OFF voltage for DFET from -1.2V to -0.8V, set headset micbias registor
> +	/* set OFF voltage for DFET from -1.2V to -0.8V, set headset micbias register
>  	 * value adjustment trim from 2.2K ohms to 2.0K ohms.
>  	 */
>  	snd_hda_codec_write(codec, 0x1c, 0, 0x3b0, 0xe10);
>  	/* fix reboot headset type recognize fail issue */
> -	mic_persent = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
> -	if (mic_persent & AC_PINSENSE_PRESENCE)
> +	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
> +	if (mic_present & AC_PINSENSE_PRESENCE)
>  		/* enable headset mic VREF */
>  		snd_hda_codec_write(codec, 0x19, 0, AC_VERB_SET_PIN_WIDGET_CONTROL, 0x24);
>  	else
> @@ -249,9 +249,9 @@ static void cx_update_headset_mic_vref(struct hda_codec *codec, struct hda_jack_
>  {
>  	unsigned int mic_present;
>  
> -	/* In cx8070 and sn6140, the node 16 can only be config to headphone or disabled,
> -	 * the node 19 can only be config to microphone or disabled.
> -	 * Check hp&mic tag to process headset pulgin&plugout.
> +	/* In cx8070 and sn6140, the node 16 can only be configured to headphone or disabled,
> +	 * the node 19 can only be configured to microphone or disabled.
> +	 * Check hp&mic tag to process headset plugin & plugout.
>  	 */
>  	mic_present = snd_hda_codec_read(codec, 0x19, 0, AC_VERB_GET_PIN_SENSE, 0x0);
>  	if (!(mic_present & AC_PINSENSE_PRESENCE)) /* mic plugout */
> -- 
> 2.46.2
> 
