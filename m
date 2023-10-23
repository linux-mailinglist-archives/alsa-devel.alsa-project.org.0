Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B957D3B7C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 17:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D9A85D;
	Mon, 23 Oct 2023 17:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D9A85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698076270;
	bh=O/9tHskBgFCXhHNRiFER+v5m81VS45vErEJ5SJS3194=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bqgjweh7ZdoAJ80Kw8vQHRFTNOXH+Ev9lS2ZRHDv7qQhEoM61CKbFlFYSypTe7P2C
	 IbvqwgxLavmhw1YHdCV9Kcmpn9WNmGfXGGJxQXnkgZj8B6LD/sesRZxsQ9aBKYztMu
	 v5+H9oyBON5mmE6lrtGBIthL3wgluInOLgKri5Cw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BFC8F804F3; Mon, 23 Oct 2023 17:50:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A72F804F3;
	Mon, 23 Oct 2023 17:50:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C511FF80552; Mon, 23 Oct 2023 17:50:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E6AFF8032D
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 17:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6AFF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=w2XeUGCq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Vy+oN4Rg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C3FD21AFC;
	Mon, 23 Oct 2023 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698076201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s55KBBdkaxhAnoFxBZ3RJHysL0tvL4Uht6f0m+5T79E=;
	b=w2XeUGCqssnXKjmZtCZHymL8Nl9c35rbJnRMdqhK3iMyLwihI8/D+BpPt77nS+xmAb1PZu
	+NxMDTV5w59F2+A9E90Y83AF/MN150lSSV0IRa2EAd/TS2/uxYUqacBjWl5ENufZaXIaHz
	g6NVRCOmHFNZ7CPmW50E+stXLgWxCiw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698076201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s55KBBdkaxhAnoFxBZ3RJHysL0tvL4Uht6f0m+5T79E=;
	b=Vy+oN4RgY7IbkWEe8BkFel1fEG9YEejT0ejW70iykea05+L7d2/ijCUba5qJ0n4ZJPP5WM
	HCUXRCMwPDwVbXDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD18A132FD;
	Mon, 23 Oct 2023 15:50:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id pxTGMCiWNmVWHQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 23 Oct 2023 15:50:00 +0000
Date: Mon, 23 Oct 2023 17:50:00 +0200
Message-ID: <87edhlwd7b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	perex@perex.cz,
	tiwai@suse.com,
	virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org,
	mripard@redhat.com
Subject: Re: [PATCH v3] ALSA: virtio: use ack callback
In-Reply-To: <ZTaMEUZUTrRRUD6y@fedora>
References: <ZTaMEUZUTrRRUD6y@fedora>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-10.09 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.99)[99.96%]
Message-ID-Hash: OUUKKDNEYKKGSUJ23KBRAUMOBLGIE6QI
X-Message-ID-Hash: OUUKKDNEYKKGSUJ23KBRAUMOBLGIE6QI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUUKKDNEYKKGSUJ23KBRAUMOBLGIE6QI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 23 Oct 2023 17:06:57 +0200,
Matias Ezequiel Vara Larsen wrote:
> 
> +static int virtsnd_pcm_ack(struct snd_pcm_substream *substream)
> +{
> +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> +	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
> +	unsigned long flags;
> +	struct snd_pcm_runtime *runtime = vss->substream->runtime;
> +	ssize_t appl_pos = frames_to_bytes(runtime, runtime->control->appl_ptr);
> +	ssize_t buf_size = frames_to_bytes(runtime, runtime->buffer_size);
> +	int rc;
> +
> +	spin_lock_irqsave(&queue->lock, flags);
> +	spin_lock(&vss->lock);
> +
> +	ssize_t bytes = (appl_pos - vss->appl_ptr) % buf_size;

The variable declaration should be moved to the beginning of the
function.

Also, there can be a overlap beyond runtime->boundary (which easily
happens for 32bit apps), so the calculation can be a bit more complex
with conditional.


thanks,

Takashi
