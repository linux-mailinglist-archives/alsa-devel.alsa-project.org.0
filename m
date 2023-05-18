Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43671707974
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D154DE;
	Thu, 18 May 2023 07:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D154DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684386845;
	bh=UKPmSGiq4JZq5SsYcphN+ku/iqzDaBxuGqfuJSZZIzM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+s1mGsLTGddxbSyle7/7iF+weTWGe2n7ADTaP/b58gZUjLy7pdbgL/qX+/cCN0oe
	 fEQhKpEx0ktsSUMMz9o5tTbt+ah5O88Eg6uhfeS/YtRxfbVPscVTXqSjaHLjMwE0C8
	 gYRXuZ6T0pTSTOjpHEAp9NtifZvaNXi+aEcvbcvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 610BEF8016D; Thu, 18 May 2023 07:13:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B9F6F8025A;
	Thu, 18 May 2023 07:13:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA80F80272; Thu, 18 May 2023 07:13:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1603CF80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1603CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KyyZX/81;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lv9oiRk6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4AE32226D0;
	Thu, 18 May 2023 05:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684386775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmO37DvP4UrQhaPjWX+79UtSaADTqvbeHrY+J312Cv8=;
	b=KyyZX/81dQDVV43sNXuxFzpRZ+QWcCUN20/R+aCkeHVw6DJOFvTQQkakENvSNJdrZx37Ai
	M8GqAXMTf3iKu7M2Sxwd8NXggRrebhHXqqmDQDPrZ9lzXJwrn7ZYJ8yVukGXwjkjMMp2zS
	JfwzwMQ0zPGvO/ix/2wCuQBZnNMCdUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684386775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OmO37DvP4UrQhaPjWX+79UtSaADTqvbeHrY+J312Cv8=;
	b=lv9oiRk6o+Oy9nR16MSfeIAvW58O5YcxeWUrCMkrK6V22+eufGO3Qb/rHVVKlyxKQYP12C
	z2UQdx/oqIrYpxAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EF92138F5;
	Thu, 18 May 2023 05:12:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id e9hEBtezZWSxZwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 05:12:55 +0000
Date: Thu, 18 May 2023 07:12:54 +0200
Message-ID: <87y1lmz0h5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ALSA: mixart: Replace one-element arrays with
 simple object declarations
In-Reply-To: <ZGVlcpuvx1rSOMP8@work>
References: <ZGVlcpuvx1rSOMP8@work>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: Y35OM5JFVNOSSCE7N6VVZJDS6WAFE3HY
X-Message-ID-Hash: Y35OM5JFVNOSSCE7N6VVZJDS6WAFE3HY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y35OM5JFVNOSSCE7N6VVZJDS6WAFE3HY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 01:38:26 +0200,
Gustavo A. R. Silva wrote:
> 
> One-element arrays are deprecated, and we are replacing them with flexible
> array members, instead. However, in this case it seems those one-element
> arrays have never actually been used as fake flexible arrays.
> 
> See this code that dates from Linux-2.6.12-rc2 initial git repository build
> (commit 1da177e4c3f4 ("Linux-2.6.12-rc2")):
> 
> sound/pci/mixart/mixart_core.h:
>  215 struct mixart_stream_state_req
>  216 {
>  217         u32                 delayed;
>  218         u64                 scheduler;
>  219         u32                 reserved4np[3];
>  220         u32                 stream_count;  /* set to 1 for instance */
>  221         struct mixart_flow_info  stream_info;   /* could be an array[stream_cou    nt] */
>  222 } __attribute__((packed));
> 
> sound/pci/mixart/mixart.c:
>  388
>  389         memset(&stream_state_req, 0, sizeof(stream_state_req));
>  390         stream_state_req.stream_count = 1;
>  391         stream_state_req.stream_info.stream_desc.uid_pipe = stream->pipe->group_uid;
>  392         stream_state_req.stream_info.stream_desc.stream_idx = stream->substream->number;
>  393
> 
> So, taking the code above as example, replace multiple one-element
> arrays with simple object declarations, and refactor the rest of the
> code, accordingly.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> This results in no differences in binary output.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/296
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Replacing with a simple object itself is OK, but please keep the
comment; the statement there is still valid, as it could be rather a multi-member array in theory.


thanks,

Takashi

> ---
>  sound/pci/mixart/mixart.c      | 8 ++++----
>  sound/pci/mixart/mixart_core.h | 7 +++----
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
> index 1b078b789604..7ceaf6a7a77e 100644
> --- a/sound/pci/mixart/mixart.c
> +++ b/sound/pci/mixart/mixart.c
> @@ -98,7 +98,7 @@ static int mixart_set_pipe_state(struct mixart_mgr *mgr,
>  
>  	memset(&group_state, 0, sizeof(group_state));
>  	group_state.pipe_count = 1;
> -	group_state.pipe_uid[0] = pipe->group_uid;
> +	group_state.pipe_uid = pipe->group_uid;
>  
>  	if(start)
>  		request.message_id = MSG_STREAM_START_STREAM_GRP_PACKET;
> @@ -185,7 +185,7 @@ static int mixart_set_clock(struct mixart_mgr *mgr,
>  	clock_properties.clock_mode = CM_STANDALONE;
>  	clock_properties.frequency = rate;
>  	clock_properties.nb_callers = 1; /* only one entry in uid_caller ! */
> -	clock_properties.uid_caller[0] = pipe->group_uid;
> +	clock_properties.uid_caller = pipe->group_uid;
>  
>  	dev_dbg(&mgr->pci->dev, "mixart_set_clock to %d kHz\n", rate);
>  
> @@ -565,8 +565,8 @@ static int mixart_set_format(struct mixart_stream *stream, snd_pcm_format_t form
>  
>  	stream_param.pipe_count = 1;      /* set to 1 */
>  	stream_param.stream_count = 1;    /* set to 1 */
> -	stream_param.stream_desc[0].uid_pipe = stream->pipe->group_uid;
> -	stream_param.stream_desc[0].stream_idx = stream->substream->number;
> +	stream_param.stream_desc.uid_pipe = stream->pipe->group_uid;
> +	stream_param.stream_desc.stream_idx = stream->substream->number;
>  
>  	request.message_id = MSG_STREAM_SET_INPUT_STAGE_PARAM;
>  	request.uid = (struct mixart_uid){0,0};
> diff --git a/sound/pci/mixart/mixart_core.h b/sound/pci/mixart/mixart_core.h
> index 2f0e29ed5d63..ac74b2133c97 100644
> --- a/sound/pci/mixart/mixart_core.h
> +++ b/sound/pci/mixart/mixart_core.h
> @@ -231,7 +231,7 @@ struct mixart_group_state_req
>  	u64           scheduler;
>  	u32           reserved4np[2];
>  	u32           pipe_count;    /* set to 1 for instance */
> -	struct mixart_uid  pipe_uid[1];   /* could be an array[pipe_count] */
> +	struct mixart_uid  pipe_uid;
>  } __attribute__((packed));
>  
>  struct mixart_group_state_resp
> @@ -314,7 +314,7 @@ struct mixart_clock_properties
>  	u32 format;
>  	u32 board_mask;
>  	u32 nb_callers; /* set to 1 (see below) */
> -	struct mixart_uid uid_caller[1];
> +	struct mixart_uid uid_caller;
>  } __attribute__((packed));
>  
>  struct mixart_clock_properties_resp
> @@ -401,8 +401,7 @@ struct mixart_stream_param_desc
>  	u32 reserved4np[3];
>  	u32 pipe_count;                           /* set to 1 (array size !) */
>  	u32 stream_count;                         /* set to 1 (array size !) */
> -	struct mixart_txx_stream_desc stream_desc[1];  /* only one stream per command, but this could be an array */
> -
> +	struct mixart_txx_stream_desc stream_desc;
>  } __attribute__((packed));
>  
>  
> -- 
> 2.34.1
> 
