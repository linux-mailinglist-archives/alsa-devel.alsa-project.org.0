Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2067BB351
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E23E1E3;
	Fri,  6 Oct 2023 10:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E23E1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696581432;
	bh=KtBfDnC5QE3SQefK/lpnA2k/F1dmertOLh45/HgIiZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CE19Ju4uNWyZ8u89PW2p2pjtP/48o2wFBkvANHybNay7t50uzWttvR41HvF72Dv7w
	 S/JNmoaX/McJPLYsSCutDag87vZCJXW772hqNukGVPbqP50H1g08ju5jvdv2FVMbLn
	 9HUFN+xErVU8ZiM70sROnQsiI59Wp6wYKJBjI39E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68008F8047D; Fri,  6 Oct 2023 10:36:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA70F80310;
	Fri,  6 Oct 2023 10:36:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E9F4F8047D; Fri,  6 Oct 2023 10:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DBC9F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DBC9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wP2UXOhu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UhUaC8ON
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6BDBF1F45F;
	Fri,  6 Oct 2023 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696581357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGO2mlUqE3aPcsibFoQXFlBLId1U3oI6EbfB7CylCGI=;
	b=wP2UXOhuOPQagS4qtjhTDzOcJuBmqZQagcfwVqH74ZrdSomM771xtKx2HusMgvXX2t8vRU
	Q9AHM8DQNRsnBvPCfLO1SqNw1qChCJE18GgPl2qRrDiGhgBSIdPbpOsblcmopRWlMfflKq
	I4NQSQxpUVFk6fNFzmnRcFF8SU296Io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696581357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGO2mlUqE3aPcsibFoQXFlBLId1U3oI6EbfB7CylCGI=;
	b=UhUaC8ONSa4MQOaXEnJZh82SKSYlYnn6Nro96QOl8VO42nDc7URMp0BCzwdElCIibJ+vrL
	CSLUS6HXWR9G/QCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2575F13A2E;
	Fri,  6 Oct 2023 08:35:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KvsuCO3GH2W+GQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 08:35:57 +0000
Date: Fri, 06 Oct 2023 10:35:56 +0200
Message-ID: <87zg0ww3kj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ma Ke <make_ruc2021@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	mhocko@suse.com,
	mgorman@techsingularity.net,
	42.hyeyoo@gmail.com,
	surenb@google.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: pcm: oss: Fix race at SNDCTL_DSP_SETTRIGGER
In-Reply-To: <20230921135837.3590897-1-make_ruc2021@163.com>
References: <20230921135837.3590897-1-make_ruc2021@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: IJMCNVVZMM7Z6NIWZMDQJAVD7J6HNCNR
X-Message-ID-Hash: IJMCNVVZMM7Z6NIWZMDQJAVD7J6HNCNR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJMCNVVZMM7Z6NIWZMDQJAVD7J6HNCNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 15:58:37 +0200,
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

Sorry for the late response, as I've been (still) off since the last
week.

The code change itself looks OK, but unlike the change (with almost
same changelog) in commit 8423f0b6d513, this won't hit a serious
problem like NULL dereference.  The code path merely sets
runtime->oss.trigger and start_threshold flags, then issues the ioctl
outside the lock.

Unless you really hit a problem with a fuzzer, the changelog is
misleading and better to be rewritten.


thanks,

Takashi

> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  sound/core/oss/pcm_oss.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
> index 728c211142d1..fd9d23c3684b 100644
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -2083,21 +2083,16 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
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
> +		if (err < 0) {
> +			mutex_unlock(&runtime->oss.params_lock);
> +			return err;
> +		}
>  		if (trigger & PCM_ENABLE_OUTPUT) {
>  			if (runtime->oss.trigger)
>  				goto _skip1;
> @@ -2128,6 +2123,11 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
>  		cmd = 0;
>  		if (mutex_lock_interruptible(&runtime->oss.params_lock))
>  			return -ERESTARTSYS;
> +		err = snd_pcm_oss_make_ready_locked(csubstream);
> +		if (err < 0) {
> +			mutex_unlock(&runtime->oss.params_lock);
> +			return err;
> +		}
>  		if (trigger & PCM_ENABLE_INPUT) {
>  			if (runtime->oss.trigger)
>  				goto _skip2;
> -- 
> 2.37.2
> 
