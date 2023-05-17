Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB567072FC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 22:26:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8924D1FA;
	Wed, 17 May 2023 22:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8924D1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684355183;
	bh=CGoZEOmuJrg+8lefdpITe1mtp2XAM5J5RN/ASvw7H94=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KZMo9nR/nxjVG3aZjbxgfGolnPy6+W6NxtWHoYPloMuuDY9yVY0f/hznjP2tts1Ym
	 y7qcBUFIXWojU6cj8fPR9Rogl5f8UXVVqm+G1KZmYbjQcMXxHb0b/a8CN++mOxzIJM
	 YpozrDpvfAwIbMkGDRJ34H5/B5yfq5EKQ3oJZOv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B5D0F8053D; Wed, 17 May 2023 22:25:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB6BEF8025A;
	Wed, 17 May 2023 22:25:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B191F80272; Wed, 17 May 2023 22:25:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1AD1F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 22:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AD1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hupOUHwy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ppx1NF7P
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 007F822615;
	Wed, 17 May 2023 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684355101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Yg6l6dlwufskUkfmjYYJdnjWswl8pdfUEvRuJFdPik=;
	b=hupOUHwy/6inJUUSBGDrG69r/X7qbwK87E8oMv/ri+EtDeinoesJVIk5qgsyy6oQ0cSeCQ
	9eKQU/05qVOCK3YfCs/VywY47dM3mZy4Aog6hAoWZyjh7Rv0mYaZT9TXtQ7+VOJOcPzOde
	RsvxReqFZPLPt6/rYgpy1SgYRNEZwcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684355101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Yg6l6dlwufskUkfmjYYJdnjWswl8pdfUEvRuJFdPik=;
	b=Ppx1NF7PNmHFBwkzfh4ghYJVjHcC458OthTSB6n301OEG2PHNZ9ylajeiJVUvEZoaK+4m7
	kgQJTqaVIYARe8Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD5A613478;
	Wed, 17 May 2023 20:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id G7vCMBw4ZWQ8BwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 17 May 2023 20:25:00 +0000
Date: Wed, 17 May 2023 22:25:00 +0200
Message-ID: <874joa1zab.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 6/9] ALSA: emu10k1: fix PCM playback buffer size
 constraints
In-Reply-To: <20230517174256.3657060-6-oswald.buddenhagen@gmx.de>
References: <20230517174256.3657060-1-oswald.buddenhagen@gmx.de>
	<20230517174256.3657060-6-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZQ52NVST26NP5MROTWSMRGLUSJ3ZCYWO
X-Message-ID-Hash: ZQ52NVST26NP5MROTWSMRGLUSJ3ZCYWO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQ52NVST26NP5MROTWSMRGLUSJ3ZCYWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 19:42:53 +0200,
Oswald Buddenhagen wrote:
> 
> The period_bytes_min parameter made no sense at all, as it didn't
> correlate with any hardware limitation.

Does the device really work with less than 64 bytes period size?
I meant not in theory but in practice.  Without any value set,
dumb applications may try to set 4 bytes for period size, so setting
some practical limit still makes sense.


Takashi

> The same can be said of the buffer_bytes minimum constraint.
> Instead, apply a buffer_size constraint, which works on frames.
> 
> Sync up the constraints of the EFX playback with those of the regular
> playback, as there is no reason for them to diverge.
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> ---
>  sound/pci/emu10k1/emupcm.c | 38 ++++++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
> index feb575922738..5226f0978408 100644
> --- a/sound/pci/emu10k1/emupcm.c
> +++ b/sound/pci/emu10k1/emupcm.c
> @@ -457,9 +457,8 @@ static const struct snd_pcm_hardware snd_emu10k1_efx_playback =
>  	.rate_max =		48000,
>  	.channels_min =		NUM_EFX_PLAYBACK,
>  	.channels_max =		NUM_EFX_PLAYBACK,
> -	.buffer_bytes_max =	(64*1024),
> -	.period_bytes_min =	64,
> -	.period_bytes_max =	(64*1024),
> +	.buffer_bytes_max =	(128*1024),
> +	.period_bytes_max =	(128*1024),
>  	.periods_min =		2,
>  	.periods_max =		2,
>  	.fifo_size =		0,
> @@ -851,7 +850,6 @@ static const struct snd_pcm_hardware snd_emu10k1_playback =
>  	.channels_min =		1,
>  	.channels_max =		2,
>  	.buffer_bytes_max =	(128*1024),
> -	.period_bytes_min =	64,
>  	.period_bytes_max =	(128*1024),
>  	.periods_min =		1,
>  	.periods_max =		1024,
> @@ -956,25 +954,46 @@ static int snd_emu10k1_efx_playback_close(struct snd_pcm_substream *substream)
>  	return 0;
>  }
>  
> +static int snd_emu10k1_playback_set_constraints(struct snd_pcm_runtime *runtime)
> +{
> +	int err;
> +
> +	// The buffer size must be a multiple of the period size, to avoid a
> +	// mismatch between the extra voice and the regular voices.
> +	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (err < 0)
> +		return err;
> +	// The hardware is typically the cache's size of 64 frames ahead.
> +	// Leave enough time for actually filling up the buffer.
> +	err = snd_pcm_hw_constraint_minmax(
> +			runtime, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 256, UINT_MAX);
> +	return err;
> +}
> +
>  static int snd_emu10k1_efx_playback_open(struct snd_pcm_substream *substream)
>  {
>  	struct snd_emu10k1 *emu = snd_pcm_substream_chip(substream);
>  	struct snd_emu10k1_pcm *epcm;
>  	struct snd_emu10k1_pcm_mixer *mix;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
> -	int i, j;
> +	int i, j, err;
>  
>  	epcm = kzalloc(sizeof(*epcm), GFP_KERNEL);
>  	if (epcm == NULL)
>  		return -ENOMEM;
>  	epcm->emu = emu;
>  	epcm->type = PLAYBACK_EFX;
>  	epcm->substream = substream;
>  	
>  	runtime->private_data = epcm;
>  	runtime->private_free = snd_emu10k1_pcm_free_substream;
>  	runtime->hw = snd_emu10k1_efx_playback;
> -	
> +	err = snd_emu10k1_playback_set_constraints(runtime);
> +	if (err < 0) {
> +		kfree(epcm);
> +		return err;
> +	}
> +
>  	for (i = 0; i < NUM_EFX_PLAYBACK; i++) {
>  		mix = &emu->efx_pcm_mixer[i];
>  		for (j = 0; j < 8; j++)
> @@ -1005,12 +1024,7 @@ static int snd_emu10k1_playback_open(struct snd_pcm_substream *substream)
>  	runtime->private_data = epcm;
>  	runtime->private_free = snd_emu10k1_pcm_free_substream;
>  	runtime->hw = snd_emu10k1_playback;
> -	err = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
> -	if (err < 0) {
> -		kfree(epcm);
> -		return err;
> -	}
> -	err = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256, UINT_MAX);
> +	err = snd_emu10k1_playback_set_constraints(runtime);
>  	if (err < 0) {
>  		kfree(epcm);
>  		return err;
> -- 
> 2.40.0.152.g15d061e6df
> 
