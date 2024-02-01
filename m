Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E3845822
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 13:51:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FFEB7F1;
	Thu,  1 Feb 2024 13:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FFEB7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706791915;
	bh=343a9e1WFUuOnEOu9+au4m0gA+bLOdwwLZSK8bIBbJA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vdbGzn5my3B1YCdltKtmt7ayAsgL7bCMnqwrxhNBhyjL8Caf1zEQg9XlrdBhvazZT
	 g+NRCtx57USZhTCorNJJ2HHuPCrT7U6eqXSF3zproJ+/hL+bP0Mw4fCliD7EOLH1Qh
	 P1nqizI46WHjSX8+FOu2SImuJ41uU/40SnXVskfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E37A0F805BE; Thu,  1 Feb 2024 13:51:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3750F805A1;
	Thu,  1 Feb 2024 13:51:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 023B3F8055C; Thu,  1 Feb 2024 13:51:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4599DF804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4599DF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sGwVcA39;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=67GPQQus;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=sGwVcA39;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=67GPQQus
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 03A7D21EF1;
	Thu,  1 Feb 2024 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706791876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpSbK7+BN8UmNhYXG1qx7P8+E4GboGNSjolIn2XEwdc=;
	b=sGwVcA39IYabFCxRAczfBAu4ci+6Fon/CjKqmC3ieBGR8Ffvn6Rm/xo8nQoFvxcaCD9SSm
	Q69VKhJZHniz4x5BW0djzfUoQdePBCcD7z6Wsg6xpnN5+yW1J9TRBvsIDIwRJJbIeqg9v2
	XE+c1HzwpWPgWeePzg8iBh54FJ+cqA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706791876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpSbK7+BN8UmNhYXG1qx7P8+E4GboGNSjolIn2XEwdc=;
	b=67GPQQusTsRI6X/THTl4vLRUt/rxsofyXPUW26zGagnzeH+LsyeBOq/unAvfBWVFxTfQE1
	UYLh9Z5zVPjbS5Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706791876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpSbK7+BN8UmNhYXG1qx7P8+E4GboGNSjolIn2XEwdc=;
	b=sGwVcA39IYabFCxRAczfBAu4ci+6Fon/CjKqmC3ieBGR8Ffvn6Rm/xo8nQoFvxcaCD9SSm
	Q69VKhJZHniz4x5BW0djzfUoQdePBCcD7z6Wsg6xpnN5+yW1J9TRBvsIDIwRJJbIeqg9v2
	XE+c1HzwpWPgWeePzg8iBh54FJ+cqA8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706791876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpSbK7+BN8UmNhYXG1qx7P8+E4GboGNSjolIn2XEwdc=;
	b=67GPQQusTsRI6X/THTl4vLRUt/rxsofyXPUW26zGagnzeH+LsyeBOq/unAvfBWVFxTfQE1
	UYLh9Z5zVPjbS5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C43E2139B1;
	Thu,  1 Feb 2024 12:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KY5oLsOTu2XPOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 12:51:15 +0000
Date: Thu, 01 Feb 2024 13:51:15 +0100
Message-ID: <87le84z6t8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: usb-audio: Ignore clock selector errors for single
 connection
In-Reply-To: <20240201115308.17838-1-alexander@tsoy.me>
References: <20240201115308.17838-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: GLP2VNC3UWPGZNM74SQON6O7DEXWT43L
X-Message-ID-Hash: GLP2VNC3UWPGZNM74SQON6O7DEXWT43L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GLP2VNC3UWPGZNM74SQON6O7DEXWT43L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Feb 2024 12:53:08 +0100,
Alexander Tsoy wrote:
> 
> For devices with multiple clock sources connected to a selector, we need
> to check what a clock selector control request has returned. This is
> needed to ensure that a requested clock source is indeed selected and for
> autoclock feature to work.
> 
> For devices with single clock source connected, if we get an error there
> is nothing else we can do about it. We can't skip clock selector setup as
> it is required by some devices. So lets just ignore error in this case.
> 
> This should fix various buggy Mackie devices:
> 
> [  649.109785] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
> [  649.111946] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
> [  649.113822] usb 1-1.3: parse_audio_format_rates_v2v3(): unable to find clock source (clock -32)
> 
> There is also interesting info from the Windows documentation [1] (this
> is probably why manufacturers dont't even test this feature):
> 
> "The USB Audio 2.0 driver doesn't support clock selection. The driver
> uses the Clock Source Entity, which is selected by default and never
> issues a Clock Selector Control SET CUR request."
> 
> Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers [1]
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217314
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218175
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218342
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> ---
>  sound/usb/clock.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> index a8204c6d6fac..60fcb872a80b 100644
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -347,8 +347,16 @@ static int __uac_clock_find_source(struct snd_usb_audio *chip,
>  			    !writeable)
>  				return ret;
>  			err = uac_clock_selector_set_val(chip, entity_id, cur);
> -			if (err < 0)
> +			if (err < 0) {
> +				if (pins == 1) {
> +					usb_audio_dbg(chip,
> +						      "%s(): selector returned an error, "
> +						      "assuming a firmware bug, id %d, ret %d\n",
> +						      __func__, clock_id, err);
> +					return ret;
> +				}
>  				return err;
> +			}

Hmm, what's the difference of the behavior except for the additional
debug message?  Both returns ret, so I don't see how it fixes.


thanks,

Takashi
