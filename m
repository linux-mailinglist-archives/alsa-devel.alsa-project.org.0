Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1847A9490
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:15:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0552206;
	Thu, 21 Sep 2023 15:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0552206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302122;
	bh=A31TZjPpoJSB1zwAWhjt+iKjrHH3d/4A+9x9gatJ8Xk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NlcCdcxX3ZH987B2A0KxEF1+71rWlSj7fBlp6aYi4ciqI4+jMtxqnF9Tjo5Q8Qdz5
	 9+M9is/Vhu6kqYYj2AsQcR7M3RHmlX+XxTODGt9mvPNUO/kf3K7xA1Qjn5Hajkvsoc
	 sEyInAWDPtc+v3ZWL70l7o1NFZz5GdDV6iEx1Ego=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AB1F80558; Thu, 21 Sep 2023 15:14:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9167F801F5;
	Thu, 21 Sep 2023 15:14:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD21FF8025A; Thu, 21 Sep 2023 15:14:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 461F7F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 15:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 461F7F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yQ9zS8ML;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=956IPJl5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C1591FE17;
	Thu, 21 Sep 2023 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695302058;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hr4dJrGCAHGoorv5nC8n0VYn5plN0T8DDF/tRgAs9xw=;
	b=yQ9zS8MLtbBzIv4XI+Fx8UAy9OA58BxnvA0q2n1vhQLjUSsNzM4w4MdLAlqHixUwTRUdoz
	XubkwoYkWO2vMUvbTapSgZvfIRIZERoGsyfrIx8lbCcnL4Q5xOqDi0chiiy+ZoYKd3EIit
	dDKtvAuqYXOAhz9Frc0BAj0JX4LPLQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695302058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hr4dJrGCAHGoorv5nC8n0VYn5plN0T8DDF/tRgAs9xw=;
	b=956IPJl5aJAhxsQTTbR4rPzctFBiEm6NaXj8nUVK+t2LBvTby0r5Safd7j/+V6jKUnW38T
	CX4LhyiTf45bK1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5F23134B0;
	Thu, 21 Sep 2023 13:14:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id o5KBJ6lBDGVtMQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 13:14:17 +0000
Date: Thu, 21 Sep 2023 15:14:17 +0200
Message-ID: <87o7hvzn12.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Howells <dhowells@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Christian Brauner <christian@brauner.io>,
	David Laight <David.Laight@ACULAB.COM>,
	Matthew Wilcox <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v5 01/11] sound: Fix snd_pcm_readv()/writev() to use iov
 access functions
In-Reply-To: <20230920222231.686275-2-dhowells@redhat.com>
References: <20230920222231.686275-1-dhowells@redhat.com>
	<20230920222231.686275-2-dhowells@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: U2FIBCDOIHNHLTHUP7FEHCIL4IKJDCHE
X-Message-ID-Hash: U2FIBCDOIHNHLTHUP7FEHCIL4IKJDCHE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2FIBCDOIHNHLTHUP7FEHCIL4IKJDCHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 00:22:21 +0200,
David Howells wrote:
> 
> Fix snd_pcm_readv()/writev() to use iov access functions rather than poking
> at the iov_iter internals directly.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jaroslav Kysela <perex@perex.cz>
> cc: Takashi Iwai <tiwai@suse.com>
> cc: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> cc: Jens Axboe <axboe@kernel.dk>
> cc: Suren Baghdasaryan <surenb@google.com>
> cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> cc: alsa-devel@alsa-project.org

Reviewed-by: Takashi Iwai <tiwai@suse.de>

Would you apply it through your tree, or shall I apply this one via
sound git tree?


thanks,

Takashi

> ---
>  sound/core/pcm_native.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index bd9ddf412b46..9a69236fa207 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3527,7 +3527,7 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, struct iov_iter *to)
>  	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
>  	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
>  		return -EBADFD;
> -	if (!to->user_backed)
> +	if (!user_backed_iter(to))
>  		return -EINVAL;
>  	if (to->nr_segs > 1024 || to->nr_segs != runtime->channels)
>  		return -EINVAL;
> @@ -3567,7 +3567,7 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, struct iov_iter *from)
>  	if (runtime->state == SNDRV_PCM_STATE_OPEN ||
>  	    runtime->state == SNDRV_PCM_STATE_DISCONNECTED)
>  		return -EBADFD;
> -	if (!from->user_backed)
> +	if (!user_backed_iter(from))
>  		return -EINVAL;
>  	if (from->nr_segs > 128 || from->nr_segs != runtime->channels ||
>  	    !frame_aligned(runtime, iov->iov_len))
> 
