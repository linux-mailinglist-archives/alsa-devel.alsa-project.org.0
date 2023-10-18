Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FDF7CE5F4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 20:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95CC482A;
	Wed, 18 Oct 2023 20:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95CC482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697652733;
	bh=DrofURGmHsiRcNIBfR55mvdCAKYmcvbqP5jcZs4A3Ms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YXtzrzo9k3LoEqxl++QBfk1nv685sBO+j9g0R9ZQWwmV90HmgLkwCTq+p9lBvGykv
	 o6WMzb318uGxlHMk32zQBaTMHSK6Zpel/BsP+NGHcqgJglmlz32eB+GBsHnhsKvSg5
	 DUo1JjEygR1FwPnWKo2A+aRJgt/jtkQPXNQn0otA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12C27F8024E; Wed, 18 Oct 2023 20:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1126F8025F;
	Wed, 18 Oct 2023 20:11:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8FFF8019B; Wed, 18 Oct 2023 20:09:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BEF15F8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 20:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF15F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TKfib127;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rPq8p6Kg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6B3B121B6E;
	Wed, 18 Oct 2023 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697652448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rgWIZctOW4uIbvAqVFAKuzU4R6bejxr6bFDySXRomUs=;
	b=TKfib127vE0yESnlakrcaG6iYKuFRLAxet2Tw0XvVsK0VF2QIFdEE4w/3pUi7pycvYRzci
	Y+kO6EJoxJIUve1e2qRayrB04uP5SkBGeSR5wRL2dTOPoav6a69gjY+juqQb8id6GRpPe8
	qZNghYKuNBzo1Nzw4UyZ9zC0l/2iqp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697652448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rgWIZctOW4uIbvAqVFAKuzU4R6bejxr6bFDySXRomUs=;
	b=rPq8p6KgNU5YezSgzvOGtloZv4OA7fVDrfn5rPVv3oklRhlaObEelElPoRQuTzsOGsV6DE
	8xUJ9GDw8Qwz1SAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1553113915;
	Wed, 18 Oct 2023 18:07:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kHo/BOAeMGWKRwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 18 Oct 2023 18:07:28 +0000
Date: Wed, 18 Oct 2023 20:07:27 +0200
Message-ID: <871qdrn6sg.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v2] ALSA: virtio: use copy and fill_silence callbacks
In-Reply-To: <ZS+392ZzVIoEyv8n@fedora>
References: <ZS+392ZzVIoEyv8n@fedora>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-10.10 / 50.00];
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
	 BAYES_HAM(-3.00)[100.00%]
Message-ID-Hash: YDXUU23MPCZHBXAJVY37VHE57WHWEOLT
X-Message-ID-Hash: YDXUU23MPCZHBXAJVY37VHE57WHWEOLT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDXUU23MPCZHBXAJVY37VHE57WHWEOLT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 18 Oct 2023 12:48:23 +0200,
Matias Ezequiel Vara Larsen wrote:
> 
> This commit replaces the mmap mechanism with the copy() and
> fill_silence() callbacks for both capturing and playback for the
> virtio-sound driver. This change is required to prevent the updating of
> the content of a buffer that is already in the available ring.
> 
> The current mechanism splits a dma buffer into descriptors that are
> exposed to the device. This dma buffer is shared with the user
> application. When the device consumes a buffer, the driver moves the
> request from the used ring to available ring.
> 
> The driver exposes the buffer to the device without knowing if the
> content has been updated from the user. The section 2.8.21.1 of the
> virtio spec states that: "The device MAY access the descriptor chains
> the driver created and the memory they refer to immediately". If the
> device picks up buffers from the available ring just after it is
> notified, it happens that the content may be old.
> 
> By providing the copy() callback, the driver first updates the content
> of the buffer, and then, exposes the buffer to the device by enqueuing
> it in the available ring. Thus, device always picks up a buffer that is
> updated. During copy(), the number of requests enqueued depends on the
> "pos" and "bytes" arguments. The length of each request is period_size
> bytes.
> 
> For capturing, the driver starts by exposing all the available buffers
> to device. After device updates the content of a buffer, it enqueues it
> in the used ring. It is only after the copy() for capturing is issued
> that the driver re-enqueues the buffer in the available ring.
> 
> Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> Changelog:
> v1 -> v2:
>  * Use snd_pcm_set_managed_buffer_all()for buffer allocation/freeing.
>  * Make virtsnd_pcm_msg_send() generic by specifying the offset and size
>    for the modified part of the buffer; this way no assumptions need to
>    be made.
>  * Disable SNDRV_PCM_INFO_NO_REWINDS since now only sequential
>    reading/writing of frames is supported.
>  * Correct comment at virtsnd_pcm_msg_send().
>  * v1 patch at:
>    https://lore.kernel.org/lkml/20231016151000.GE119987@fedora/t/
> 
>  sound/virtio/virtio_pcm.c     |  7 ++-
>  sound/virtio/virtio_pcm.h     |  9 ++--
>  sound/virtio/virtio_pcm_msg.c | 93 ++++++++++++++++++++++-------------
>  sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++-----
>  4 files changed, 137 insertions(+), 53 deletions(-)

Most of the code changes look good, but I wonder:

> 
> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> index c10d91fff2fb..66d67eef1bcc 100644
> --- a/sound/virtio/virtio_pcm.c
> +++ b/sound/virtio/virtio_pcm.c
> @@ -104,12 +104,11 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
>  	 * only message-based transport.
>  	 */
>  	vss->hw.info =
> -		SNDRV_PCM_INFO_MMAP |
> -		SNDRV_PCM_INFO_MMAP_VALID |

Do we need the removal of those MMAP features inevitably?
Usually mmap can still work even if the driver implements the copy
ops.  Those aren't always mutual exclusive.


thanks,

Takashi
