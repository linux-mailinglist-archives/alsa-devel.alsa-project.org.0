Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B297A73A6
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 09:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A9E6950;
	Wed, 20 Sep 2023 09:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A9E6950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695193567;
	bh=L8zJrU36zq86rP/GiaecLsglbuVVL8hjj6GZESOK4WA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ma38QZMnuvWrvUm1MVGFN+PDiCydBtvcJ/rVgCNiQDReszosCTueRd9vdrKmbQU05
	 22E/HYuUdXExxUc+Z9YHF5EtQwe1tQ4zgKZebU7ZL6dabi+yQHVNTKTpfE0F+OqwlQ
	 M0Yjv2BnJWP770+EepVOyFmqBLoOt7ezwoXIUSm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C1A8F80494; Wed, 20 Sep 2023 09:05:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3280F801F5;
	Wed, 20 Sep 2023 09:05:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3742F8025A; Wed, 20 Sep 2023 09:05:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5430FF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 09:05:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5430FF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VUdNbspt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5Sa7R9Oc
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 953072251C;
	Wed, 20 Sep 2023 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695193504;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtpT9rmsvNdD25C52w/dsFnFom7gmr6h8hTnMT9pppA=;
	b=VUdNbsptH6xtu8SuSD1phRT0W/65IBdC356rMtSp3IQLekQbLsJxbwDlmZjGBov3oaLqRB
	c/RiR3ah/OzaVhc+F0ig/I9Vlzp645LprpNEG8znmpmzCYGfbSr5pNmFf+wWcvMdtjCNkN
	H31bI+i0XvPIYCvOeI3NHFp31r0uEI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695193504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YtpT9rmsvNdD25C52w/dsFnFom7gmr6h8hTnMT9pppA=;
	b=5Sa7R9OcmwNsSJDDy17+/1xNUt5/Qo67Eu1e4a9fpmRM2Y3HvpWjCY+kmyG0My/2mWR799
	rLVDYboGJxWv1GBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 523051333E;
	Wed, 20 Sep 2023 07:05:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iygqE6CZCmXUJgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 07:05:04 +0000
Date: Wed, 20 Sep 2023 09:05:03 +0200
Message-ID: <871qetwcio.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ma Ke <make_ruc2021@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	mhocko@suse.com,
	akpm@linux-foundation.org,
	mgorman@techsingularity.net,
	42.hyeyoo@gmail.com,
	surenb@google.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER There
 is a small race window at snd_pcm_oss_set_trigger() that is called from OSS
 PCM SNDCTL_DSP_SETTRIGGER ioctl;
 namely the function calls snd_pcm_oss_make_ready() at first,
 then takes the params_lock mutex for the rest.  When the stream is set up
 again by another thread between them, it leads to inconsistency,
 and may result in unexpected results such as NULL dereference of OSS buffer
 as a fuzzer spotted recently.
In-Reply-To: <20230920023536.3535439-1-make_ruc2021@163.com>
References: <20230920023536.3535439-1-make_ruc2021@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OKFHFDBPLYOM77GI2EQNDCNVRUQ5DVCX
X-Message-ID-Hash: OKFHFDBPLYOM77GI2EQNDCNVRUQ5DVCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKFHFDBPLYOM77GI2EQNDCNVRUQ5DVCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 04:35:36 +0200,
Ma Ke wrote:
> 
> The fix is simply to cover snd_pcm_oss_make_ready() call into the same
> params_lock mutex with snd_pcm_oss_make_ready_locked() variant.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

The patch subject needs to be fixed.  The subject line can't be that
long.  It must be concise.  Put more text in the patch description
instead.

About the code change: the error handling is different after the
patch.  The current code returns an error immediately while your patch
does "goto _skip1" etc, which doesn't abort but continues.


thanks,

Takashi

> ---
>  sound/core/oss/pcm_oss.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index 728c211142d1..9a830aeeba63 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -2083,21 +2083,14 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
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
> +			goto _skip1;
>  		if (trigger & PCM_ENABLE_OUTPUT) {
>  			if (runtime->oss.trigger)
>  				goto _skip1;
> @@ -2128,6 +2121,9 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
>  		cmd = 0;
>  		if (mutex_lock_interruptible(&runtime->oss.params_lock))
>  			return -ERESTARTSYS;
> +		err = snd_pcm_oss_make_ready_locked(csubstream);
> +		if (err < 0)
> +			goto _skip2;
>  		if (trigger & PCM_ENABLE_INPUT) {
>  			if (runtime->oss.trigger)
>  				goto _skip2;
> -- 
> 2.37.2
> 
