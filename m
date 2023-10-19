Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226717CF1B8
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 09:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30EB2829;
	Thu, 19 Oct 2023 09:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30EB2829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697702038;
	bh=vdftc6yDy6LBU6MhnQvUw5mKmnszES4w/j5FuhUDFJI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vfOkSvAhzExOVXdxTq/qDt0MIfSLW/oX7m6D8Hx4CZpA6mL+bzt189CWsqEe7RXh3
	 ZzGVFjf+jrMAuEEqp0dzXpmy+2++PWj3h1V3vrv/cuPQVL2AZmHOZy9PanOk9KD4Yd
	 xcdpLJqBZT+lEoijzLtyi8JqX4Wz7MBZtYirGSRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13EEEF80558; Thu, 19 Oct 2023 09:52:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7118BF8024E;
	Thu, 19 Oct 2023 09:52:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8425CF8025F; Thu, 19 Oct 2023 09:48:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A71FF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 09:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A71FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YPZn9wvx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PT0jLXyC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55FA721A8F;
	Thu, 19 Oct 2023 07:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1697701684;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/up6iImzBECVgP8c98Qc7+rf+zQeyWGka8GeTnc3DCM=;
	b=YPZn9wvxOErWDxedcWf6qxY/tne2bYLEIwIPFdxg4u5PKnyb7N8aX3/gTEjCW7GUJL/aso
	oxXaal8jwTwKefWUhELQnZ0mSmTDdDMxKyAo5jN6L+968c/kPq7YVm26D4J+YV5asJQXeq
	bpU8HwVFbsJzKb9kmIxEVArk1FdBdik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1697701684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/up6iImzBECVgP8c98Qc7+rf+zQeyWGka8GeTnc3DCM=;
	b=PT0jLXyC9vnCMN83KCZKNrviDMg2DqUNIlKTK8M5TIk+HHsPWnBgX7P2TAyTSAHRtov4TW
	UD+JCqVtHGT488DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1F651357F;
	Thu, 19 Oct 2023 07:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +GgdOjPfMGUjIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 19 Oct 2023 07:48:03 +0000
Date: Thu, 19 Oct 2023 09:48:03 +0200
Message-ID: <87y1fzkq8c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
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
In-Reply-To: <e50c5a67-d2b7-4ef1-8aaa-309437fa8cb5@opensynergy.com>
References: <ZS+392ZzVIoEyv8n@fedora>
	<871qdrn6sg.wl-tiwai@suse.de>
	<e50c5a67-d2b7-4ef1-8aaa-309437fa8cb5@opensynergy.com>
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
Message-ID-Hash: OE7MIHXVNGVSFZOWMU7HRHYWR4WUO5YB
X-Message-ID-Hash: OE7MIHXVNGVSFZOWMU7HRHYWR4WUO5YB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OE7MIHXVNGVSFZOWMU7HRHYWR4WUO5YB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 03:20:19 +0200,
Anton Yakovlev wrote:
> 
> Hi Takashi,
> 
> On 19.10.2023 03:07, Takashi Iwai wrote:
> > On Wed, 18 Oct 2023 12:48:23 +0200,
> > Matias Ezequiel Vara Larsen wrote:
> >> 
> >> This commit replaces the mmap mechanism with the copy() and
> >> fill_silence() callbacks for both capturing and playback for the
> >> virtio-sound driver. This change is required to prevent the updating of
> >> the content of a buffer that is already in the available ring.
> >> 
> >> The current mechanism splits a dma buffer into descriptors that are
> >> exposed to the device. This dma buffer is shared with the user
> >> application. When the device consumes a buffer, the driver moves the
> >> request from the used ring to available ring.
> >> 
> >> The driver exposes the buffer to the device without knowing if the
> >> content has been updated from the user. The section 2.8.21.1 of the
> >> virtio spec states that: "The device MAY access the descriptor chains
> >> the driver created and the memory they refer to immediately". If the
> >> device picks up buffers from the available ring just after it is
> >> notified, it happens that the content may be old.
> >> 
> >> By providing the copy() callback, the driver first updates the content
> >> of the buffer, and then, exposes the buffer to the device by enqueuing
> >> it in the available ring. Thus, device always picks up a buffer that is
> >> updated. During copy(), the number of requests enqueued depends on the
> >> "pos" and "bytes" arguments. The length of each request is period_size
> >> bytes.
> >> 
> >> For capturing, the driver starts by exposing all the available buffers
> >> to device. After device updates the content of a buffer, it enqueues it
> >> in the used ring. It is only after the copy() for capturing is issued
> >> that the driver re-enqueues the buffer in the available ring.
> >> 
> >> Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> >> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> >> ---
> >> Changelog:
> >> v1 -> v2:
> >>   * Use snd_pcm_set_managed_buffer_all()for buffer allocation/freeing.
> >>   * Make virtsnd_pcm_msg_send() generic by specifying the offset and size
> >>     for the modified part of the buffer; this way no assumptions need to
> >>     be made.
> >>   * Disable SNDRV_PCM_INFO_NO_REWINDS since now only sequential
> >>     reading/writing of frames is supported.
> >>   * Correct comment at virtsnd_pcm_msg_send().
> >>   * v1 patch at:
> >>     https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flore.kernel.org%2flkml%2f20231016151000.GE119987%40fedora%2ft%2f&umid=2f305b77-83e7-47b6-a461-a8ca67d0bfe2&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-2d5775265e7e1741ae8eb783a3cb78ed553093c1
> >> 
> >>   sound/virtio/virtio_pcm.c     |  7 ++-
> >>   sound/virtio/virtio_pcm.h     |  9 ++--
> >>   sound/virtio/virtio_pcm_msg.c | 93 ++++++++++++++++++++++-------------
> >>   sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++-----
> >>   4 files changed, 137 insertions(+), 53 deletions(-)
> > 
> > Most of the code changes look good, but I wonder:
> > 
> >> 
> >> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> >> index c10d91fff2fb..66d67eef1bcc 100644
> >> --- a/sound/virtio/virtio_pcm.c
> >> +++ b/sound/virtio/virtio_pcm.c
> >> @@ -104,12 +104,11 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
> >>   	 * only message-based transport.
> >>   	 */
> >>   	vss->hw.info =
> >> -		SNDRV_PCM_INFO_MMAP |
> >> -		SNDRV_PCM_INFO_MMAP_VALID |
> > 
> > Do we need the removal of those MMAP features inevitably?
> > Usually mmap can still work even if the driver implements the copy
> > ops.  Those aren't always mutual exclusive.
> 
> The driver uses a message queue to communicate with the device. Thus,
> the audio buffer is sliced into several I/O requests (= number of
> periods) of the same size (= period size).
> 
> Before this, all such requests were enqueued when the substream started,
> and immediately re-enqueued once the request is completed. This approach
> made it possible to add mmap support. But for mmap there are no explicit
> notifications from the application how many frames were written or read.
> Thus, it was assumed that the virtual device should read/write frames to
> requests based on timings. And there are some problems here:
> 
>   1. This was found to violate the virtio specification: if a request is
>      already in the queue, the device can safely read/write there at any
>      time.
>   2. It looks like this breaks the use case with swiotlb. Personally I'm
>      not sure how the application handles DMA ownership in the case of
>      mmaped buffer.
> 
> To correctly implement mmap support, instead of transferring data via a
> message queue, the driver and device must have a shared memory region.
> We can add mmap in the future when we expand the functionality of the
> device to support such shared memory.

Ah, then this implementation might be an overkill.  You're still using
the (intermediate) vmalloc buffer allocated via PCM managed mode, and
the actual data is copied from/to there.  So it doesn't conflict with
the mmap operation at all.

I guess that the problem you're trying to solve (the immediate data
transfer to the queue) can be implemented rather via PCM ack callback
instead.  ALSA PCM core notifies the possible data transfer via PCM
ack callback right after each change of appl_ptr or hw_ptr, including
each read/write op or mmap commit.  Then the driver can check the
change of appl_ptr (or hw_ptr for capture), fetch the newly available
data, and queue it immediately.

Usually together with the use of ack callback, the driver sets
SNDRV_PCM_INFO_SYNC_APPLPTR flag.  This prevents the mmap of the PCM
control record (not the audio data) and enforces the use of
SNDRV_PCM_IOCTL_SYNC_PTR ioctl instead (so that the driver always gets
the ack callback).


thanks,

Takashi


> 
> 
> Best regards,
> 
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
> -- 
> Anton Yakovlev
> Senior Software Engineer
> 
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin
> 
