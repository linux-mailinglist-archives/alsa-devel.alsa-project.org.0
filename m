Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42670A656
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 10:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7748182A;
	Sat, 20 May 2023 10:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7748182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684570782;
	bh=BcvNj6b0bnDEa6K9cJO5UPfx/WlzLxjZAIF8G3ArCIM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e0ta0AViNy3jI8W197RFlkPwRSAmiB1LoopWM8XjspbW3Bp06dB8N3xjuAoUyMXpk
	 iBAoBzBTUdjfjhPijY8fSQFSYuk7q28HpgsfGwl/lAClyssSaUV6gA7TjmKXj7lKMJ
	 M02XO8yVpL3qk+Hs4o6h9Ffsk+SRNJtJ5WN2EyUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E500F80548; Sat, 20 May 2023 10:18:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C12BBF8025A;
	Sat, 20 May 2023 10:18:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC33BF80272; Sat, 20 May 2023 10:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D25AF80087
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 10:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D25AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TrRlVig2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=E9GLa6sD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AEF561FE47;
	Sat, 20 May 2023 08:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684570723;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja15y8XMTe42QTsiGosmU8QGb3JXxs+EBDUNM6FHOus=;
	b=TrRlVig2P+LX9WwFPVh7icY/Wjb3PYnBq8yJOu4s5z8i+2b09EYtrP6rNEyJxT6L7Af6Ks
	K46gFc7lkZzsDoyTaxiCI6TNLsKp+7AfrgEPz4L1IyOTV4v47VcICB3P3M3XdjI6PPXryR
	plh+qafQISx0ezHiij7RFsHvwy/a/10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684570723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ja15y8XMTe42QTsiGosmU8QGb3JXxs+EBDUNM6FHOus=;
	b=E9GLa6sD7W9VyAK5hwendacXi4tzYAhcD2j3Q/nreKGVwYfTP7RDzPJs0dUVbkIPcPXEph
	WQKc5w4YIJ5zUYBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86A2F1358F;
	Sat, 20 May 2023 08:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pDYCIGOCaGRfOAAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 08:18:43 +0000
Date: Sat, 20 May 2023 10:18:43 +0200
Message-ID: <87h6s7za8s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] ALSA: mixart: Replace one-element arrays with
 simple object declarations
In-Reply-To: <ZGfiFjcL8+r3mayq@work>
References: <ZGfiFjcL8+r3mayq@work>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: UWJBMC4B4VYJOPUMYH4IU3UIN57CJEBW
X-Message-ID-Hash: UWJBMC4B4VYJOPUMYH4IU3UIN57CJEBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWJBMC4B4VYJOPUMYH4IU3UIN57CJEBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 22:54:46 +0200,
Gustavo A. R. Silva wrote:
> 
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. However, in this case it seems those one-element
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
>  221         struct mixart_flow_info  stream_info;   /* could be an array[stream_count] */
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

Thanks, applied.


Takashi
