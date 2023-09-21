Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0407A94D0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EA4DEBF;
	Thu, 21 Sep 2023 15:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EA4DEBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695303029;
	bh=9Xfdb96CFH/rTanYrZSeXopEq2SO8VZNYu0lA6yqv/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=glT0lGiwUjClQeelPogTzu6t5BXtIBecZMmwIzpijCrpqRtL5YAIRgm0ggRo82P4F
	 evS4wws7vdHypQFzsvZv6zdpZzcTv5WA96Ukg+kfhQbbiO/5Um+qdbFqn8hVj+b5y+
	 CUmMq6xUNQY82WwveFiGZ+RhlCKxqnLfzpjbghYc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 514F8F801F5; Thu, 21 Sep 2023 15:29:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2069DF801F5;
	Thu, 21 Sep 2023 15:29:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF6D8F8025A; Thu, 21 Sep 2023 15:29:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CF467F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 15:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF467F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=uJQgO2Dm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ieGH00Us
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 05151338AA;
	Thu, 21 Sep 2023 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695302968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4ukeL06gNkW2qwY73xzCc5or7ZOWYu47UFNiHA4sRE=;
	b=uJQgO2DmrOlob0nOo/gvqcHgDMSNFGUM2gGXPdp79ntAOsVO7hmqxktnsfDHPFZniVf01T
	v7Kn5AgQT6huYctuoqJ8LwO6G7g0cwZ44V3ggVgYfN2VUsSeIQQ80bnmTP05396MlpEmII
	fSA/dV5eo7ZFdyCoaSK4+dAcLUSAbRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695302968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B4ukeL06gNkW2qwY73xzCc5or7ZOWYu47UFNiHA4sRE=;
	b=ieGH00UspKgSKl5QEaY/iWTETyiW7Scz3JDoW1tgNAc/gFtBfLNVWlYo33/zUyHcj0IeaR
	NPwDU9XbPWCYX2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA60B134B0;
	Thu, 21 Sep 2023 13:29:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id A5qWLDdFDGV0OQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 13:29:27 +0000
Date: Thu, 21 Sep 2023 15:29:27 +0200
Message-ID: <87il83zmbs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ma Ke <make_ruc2021@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	Liam.Howlett@Oracle.com,
	rppt@kernel.org,
	mgorman@techsingularity.net,
	mhocko@suse.com,
	surenb@google.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER
In-Reply-To: <20230921064258.3582115-1-make_ruc2021@163.com>
References: <20230921064258.3582115-1-make_ruc2021@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: T5XABTKZYEBCZFPSAO5NUEQBOKAD5XFQ
X-Message-ID-Hash: T5XABTKZYEBCZFPSAO5NUEQBOKAD5XFQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5XABTKZYEBCZFPSAO5NUEQBOKAD5XFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 08:42:58 +0200,
Ma Ke wrote:
> 
> There is a small race window at snd_pcm_oss_set_trigger() that is
> called from OSS PCM SNDCTL_DSP_SETTRIGGER ioctl; namely the function
> calls snd_pcm_oss_make_ready() at first, then takes the params_lock
> mutex for the rest. When the stream is set up again by another thread
> between them, it leads to inconsistency, and may result in unexpected
> results such as NULL dereference of OSS buffer as a fuzzer spotted
> recently.
> The fix is simply to cover snd_pcm_oss_make_ready() call into the same
> params_lock mutex with snd_pcm_oss_make_ready_locked() variant.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  sound/core/oss/pcm_oss.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index 728c211142d1..f6340a2fe52b 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -2083,21 +2083,15 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
>  	psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
>  	csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
>  
> -	if (psubstream) {
> -		err = snd_pcm_oss_make_ready(psubstream);
> -		if (err < 0)
> -			return err;
> -	}
> -	if (csubstream) {
> -		err = snd_pcm_oss_make_ready(csubstream);
> -		if (err < 0)
> -			return err;
> -	}
>        	if (psubstream) {
>        		runtime = psubstream->runtime;
>  		cmd = 0;
>  		if (mutex_lock_interruptible(&runtime->oss.params_lock))
>  			return -ERESTARTSYS;
> +		err = snd_pcm_oss_make_ready_locked(psubstream);
> +		if (err < 0)
> +			mutex_unlock(&runtime->oss.params_lock);
> +			return err;

This breaks totally;  you missed braces...  (Ditto for another place).


Takashi

>  		if (trigger & PCM_ENABLE_OUTPUT) {
>  			if (runtime->oss.trigger)
>  				goto _skip1;
> @@ -2128,6 +2122,10 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
>  		cmd = 0;
>  		if (mutex_lock_interruptible(&runtime->oss.params_lock))
>  			return -ERESTARTSYS;
> +		err = snd_pcm_oss_make_ready_locked(csubstream);
> +		if (err < 0)
> +			mutex_unlock(&runtime->oss.params_lock);
> +			return err;
>  		if (trigger & PCM_ENABLE_INPUT) {
>  			if (runtime->oss.trigger)
>  				goto _skip2;
> -- 
> 2.37.2
> 
