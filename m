Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DD72F573
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 09:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB3774C;
	Wed, 14 Jun 2023 09:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB3774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686726355;
	bh=lHXS29st+VhPH9WsDIsocV73WPfy+KW9XyxEQVHLsi0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FgQg7/Wsu2d9K126dS6QLUAC58AwGXvmegB5tYlvPUWYdGisKIHvJECZGMdwAJZIi
	 X8uwYR1VgxkPt9GH1P9DB7vn0FZ/xj3TOKpBvUa5aDy6S+4VqzJSyshyidz3YCZNGN
	 TD1bca+pw/hajEG/kbMuVjD00hJ7btnfp9pzmsAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27215F80155; Wed, 14 Jun 2023 09:05:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C35F80130;
	Wed, 14 Jun 2023 09:05:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F1A4F80132; Wed, 14 Jun 2023 09:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E549EF800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 09:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E549EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Xx4BN9hO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XJXfc2uM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 743121FDE2;
	Wed, 14 Jun 2023 07:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686726296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWE+RkxHjYktQzS7y33JQNdxPH8PUJVU2JWp2e825tg=;
	b=Xx4BN9hOnRqru8ALBeKVfhvqQTU418nvhTIC1SN1HBLXecQScy5svNLbHmQA8ySW5hV01l
	S9Hp29/RJdCxZSilZnf7vXRfIcTIy1kS2hfmLcAZqNBBVJfBQdXpO+TcbPdALW0qdzkMpr
	cygUgMQyJynGmCSGwcvOJcRhRZuBK5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686726296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWE+RkxHjYktQzS7y33JQNdxPH8PUJVU2JWp2e825tg=;
	b=XJXfc2uMDX8ipkukt4YIUsbT0bOWBuZRo7reHVKNV6Drjq4c5tnnCTFNMxURFaYXeEwA9A
	/XaIhfRpO746nRBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 248F81357F;
	Wed, 14 Jun 2023 07:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gdv7B5hmiWSMEAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 14 Jun 2023 07:04:56 +0000
Date: Wed, 14 Jun 2023 09:04:55 +0200
Message-ID: <87edmebk2w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com,
	corbet@lwn.net,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_plai@quicinc.com,
	quic_mohs@quicinc.com
Subject: Re: [PATCH v2] ALSA: compress: allow setting codec params after next
 track
In-Reply-To: <20230609150416.24525-1-srinivas.kandagatla@linaro.org>
References: <20230609150416.24525-1-srinivas.kandagatla@linaro.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HE4CEUUIZVU3O2ME6DWEXOONT3SG5EM5
X-Message-ID-Hash: HE4CEUUIZVU3O2ME6DWEXOONT3SG5EM5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE4CEUUIZVU3O2ME6DWEXOONT3SG5EM5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Jun 2023 17:04:16 +0200,
Srinivas Kandagatla wrote:
> 
> For gapless playback it is possible that each track can have different
> codec profile with same decoder, for example we have WMA album,
> we may have different tracks as WMA v9, WMA v10 and so on
> 
> Or if DSP's like QDSP have abililty to switch decoders on single stream
> for each track, then this call could be used to set new codec parameters.
> 
> Existing code does not allow to change this profile while doing gapless
> playback.
> 
> Reuse existing SNDRV_COMPRESS_SET_PARAMS to set this new track params along
> some additional checks to enforce proper state machine.
> 
> With this new changes now the user can call SNDRV_COMPRESS_SET_PARAMS
> anytime after setting next track and additional check in write should
> also ensure that params are set before writing new data.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1/RFC:
> 	- removed introduction of new IOCTL, as suggested.
> 	- update the state-machine doc.
> 
>  .../sound/designs/compress-offload.rst        | 52 +++++++++----------
>  sound/core/compress_offload.c                 | 10 ++--
>  2 files changed, 33 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
> index 935f325dbc77..205cadcabe70 100644
> --- a/Documentation/sound/designs/compress-offload.rst
> +++ b/Documentation/sound/designs/compress-offload.rst
> @@ -256,32 +256,32 @@ Gapless Playback SM
>  For Gapless, we move from running state to partial drain and back, along
>  with setting of meta_data and signalling for next track ::
>  
> -
> -                                        +----------+
> -                compr_drain_notify()    |          |
> -              +------------------------>|  RUNNING |
> -              |                         |          |
> -              |                         +----------+
> -              |                              |
> -              |                              |
> -              |                              | compr_next_track()
> -              |                              |
> -              |                              V
> -              |                         +----------+
> -              |                         |          |
> -              |                         |NEXT_TRACK|
> -              |                         |          |
> -              |                         +----------+
> -              |                              |
> -              |                              |
> -              |                              | compr_partial_drain()
> -              |                              |
> -              |                              V
> -              |                         +----------+
> -              |                         |          |
> -              +------------------------ | PARTIAL_ |
> -                                        |  DRAIN   |
> -                                        +----------+
> +                            +----------+
> +     compr_drain_notify()   |          | compr_set_params() iff next-track set.
> +  +------------------------>|  RUNNING |----------------------+
> +  |                         |          |                      |
> +  |                         +----------+                      |
> +  |                              |                            |
> +  |                              |                            |
> +  |                              | compr_next_track()         |
> +  |                              |                            V
> +  |                              V                            |
> +  |                         +----------+                      |
> +  |                         |          |                      |
> +  |                         |NEXT_TRACK|                      |
> +  |                         |          |                      |
> +  |                         +----------+                      |
> +  |                              |                            |
> +  |                              +----------------------------+
> +  |                              |
> +  |                              | compr_partial_drain()
> +  |                              |
> +  |                              V
> +  |                         +----------+
> +  |                         |          |
> +  +------------------------ | PARTIAL_ |
> +                            |  DRAIN   |
> +                            +----------+
>  
>  Not supported
>  =============
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index 243acad89fd3..fe67228e74b3 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -294,6 +294,9 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
>  	case SNDRV_PCM_STATE_SETUP:
>  	case SNDRV_PCM_STATE_PREPARED:
>  	case SNDRV_PCM_STATE_RUNNING:
> +		/* Make sure next track params are set before writing new data */
> +		if (stream->next_track)
> +			return -EPERM;

Hm, does this logic correctly match with the comment above?
Also, this misses the mutex unlock.


thanks,

Takashi
