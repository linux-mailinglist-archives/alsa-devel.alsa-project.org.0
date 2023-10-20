Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602537D1053
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:14:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7047182B;
	Fri, 20 Oct 2023 15:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7047182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697807647;
	bh=/Vxv96U4WHjDdECFa0uSO3HrL1+ioFzWVl9/osx/ugE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LKEfOhcXPNLDIvbqQL8cN0K2MeK3Wh0zHdi6gSV4tahiDTAdx7eBjL1pbHsGVeVhh
	 W7r+caBDZNhM73Rp1QNh7SafaqdGncVi013oaMaN7sX8ZNeAH0/k201mPMgQ1+RwEM
	 Uz9S+p//jml88gCjSD6EcGD5XIKzCSX35HsasBGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC3B2F80558; Fri, 20 Oct 2023 15:12:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8F4F8055A;
	Fri, 20 Oct 2023 15:12:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF6DFF8025F; Fri, 20 Oct 2023 11:46:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB182F8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 11:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB182F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PCmBrZUN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697795146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6oCqkd2UpOjJ2soDQ5GWL14dH9A3ncVb57QOugTBNwU=;
	b=PCmBrZUNDH7vuybM1s5PCZuomjY1fR4XYUbDva5z7p0ZsiOG1LjMdScrfyLZWVQvv/UXIA
	sL7pmZsaIqy2N+qvFrMM4uMc9NehtcelQENo+tITWaBqJsm7VNKhD91llNysZBzVg8EieD
	AjFZdAZ419b3EAdt5pHSFj9V7bVyU9s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-dY3-Rds7PmKH6Z9X-9CYRA-1; Fri, 20 Oct 2023 05:45:45 -0400
X-MC-Unique: dY3-Rds7PmKH6Z9X-9CYRA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-775869cf2f5so268895385a.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 02:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697795144; x=1698399944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oCqkd2UpOjJ2soDQ5GWL14dH9A3ncVb57QOugTBNwU=;
        b=LfwoyR1w6mikKg1Ug8mDz7LBVfGRHNeGNYLuyt2PaNUD8kAskUo+V0GaTflxNQF+I5
         BbvQZI+y42YyzWRTPnOkmxUkqVhW8Pzc7noiNLMTsqCZ4EXkngVq9ySB5HvZDeptptRk
         aEuya9Ilke+dl/ZBoIo6xSK+hK0uBVg9yBSJfcXNf9txPslB/6CoGmC7yW01T0m+dVET
         JFsNM4OI8bkyODZCgaT0KyN2cMLitYZ+SMI8IowUofoo2s785xwl09422JhazvM4RUhv
         cfWLVic5Q2u204oi4zb2Zc0f+BRCgtfYGSJI+ZtaAOctpcuL22vYB7Gi4RLyutuTv9fw
         g+gA==
X-Gm-Message-State: AOJu0YyQEJPy/7Pa9cHuU1r5QUyBhSlbOYoTecyi0aEineavamJvowoP
	oWWBOjGmiX0iY7smH35nddi0OptLSaoj+ElSqNY8Pb/dP1o54DkuENZMSbjVyh2fCOAK7SKeZI+
	7TayajCC/y20VOCZoVhJWMBQ=
X-Received: by 2002:a05:620a:4407:b0:774:20b7:b88 with SMTP id
 v7-20020a05620a440700b0077420b70b88mr6908462qkp.0.1697795144615;
        Fri, 20 Oct 2023 02:45:44 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IG4X3I2IY6B/bPyYksLhL9XboCiKxu0P6kdHG2uHTdUZYV7mpUFf3Tsgg8xpvNTIxrM3CuWAQ==
X-Received: by 2002:a05:620a:4407:b0:774:20b7:b88 with SMTP id
 v7-20020a05620a440700b0077420b70b88mr6908428qkp.0.1697795144111;
        Fri, 20 Oct 2023 02:45:44 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id
 v10-20020ae9e30a000000b00777611164c6sm477508qkf.15.2023.10.20.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:45:43 -0700 (PDT)
Date: Fri, 20 Oct 2023 11:45:39 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>, mst@redhat.com,
	perex@perex.cz, tiwai@suse.com,
	virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org, mripard@redhat.com
Subject: Re: [PATCH v2] ALSA: virtio: use copy and fill_silence callbacks
Message-ID: <ZTJMQ/zU2exf9xsd@fedora>
References: <ZS+392ZzVIoEyv8n@fedora>
 <871qdrn6sg.wl-tiwai@suse.de>
 <e50c5a67-d2b7-4ef1-8aaa-309437fa8cb5@opensynergy.com>
 <87y1fzkq8c.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <87y1fzkq8c.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: mvaralar@redhat.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4XTPRTM2XARKLWOBAEE2B7PBQO5URFFP
X-Message-ID-Hash: 4XTPRTM2XARKLWOBAEE2B7PBQO5URFFP
X-Mailman-Approved-At: Fri, 20 Oct 2023 13:12:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Takashi,

On Thu, Oct 19, 2023 at 09:48:03AM +0200, Takashi Iwai wrote:
> On Thu, 19 Oct 2023 03:20:19 +0200,
> Anton Yakovlev wrote:
> > 
> > Hi Takashi,
> > 
> > On 19.10.2023 03:07, Takashi Iwai wrote:
> > > On Wed, 18 Oct 2023 12:48:23 +0200,
> > > Matias Ezequiel Vara Larsen wrote:
> > >> 
> > >> This commit replaces the mmap mechanism with the copy() and
> > >> fill_silence() callbacks for both capturing and playback for the
> > >> virtio-sound driver. This change is required to prevent the updating of
> > >> the content of a buffer that is already in the available ring.
> > >> 
> > >> The current mechanism splits a dma buffer into descriptors that are
> > >> exposed to the device. This dma buffer is shared with the user
> > >> application. When the device consumes a buffer, the driver moves the
> > >> request from the used ring to available ring.
> > >> 
> > >> The driver exposes the buffer to the device without knowing if the
> > >> content has been updated from the user. The section 2.8.21.1 of the
> > >> virtio spec states that: "The device MAY access the descriptor chains
> > >> the driver created and the memory they refer to immediately". If the
> > >> device picks up buffers from the available ring just after it is
> > >> notified, it happens that the content may be old.
> > >> 
> > >> By providing the copy() callback, the driver first updates the content
> > >> of the buffer, and then, exposes the buffer to the device by enqueuing
> > >> it in the available ring. Thus, device always picks up a buffer that is
> > >> updated. During copy(), the number of requests enqueued depends on the
> > >> "pos" and "bytes" arguments. The length of each request is period_size
> > >> bytes.
> > >> 
> > >> For capturing, the driver starts by exposing all the available buffers
> > >> to device. After device updates the content of a buffer, it enqueues it
> > >> in the used ring. It is only after the copy() for capturing is issued
> > >> that the driver re-enqueues the buffer in the available ring.
> > >> 
> > >> Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > >> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > >> ---
> > >> Changelog:
> > >> v1 -> v2:
> > >>   * Use snd_pcm_set_managed_buffer_all()for buffer allocation/freeing.
> > >>   * Make virtsnd_pcm_msg_send() generic by specifying the offset and size
> > >>     for the modified part of the buffer; this way no assumptions need to
> > >>     be made.
> > >>   * Disable SNDRV_PCM_INFO_NO_REWINDS since now only sequential
> > >>     reading/writing of frames is supported.
> > >>   * Correct comment at virtsnd_pcm_msg_send().
> > >>   * v1 patch at:
> > >>     https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2flore.kernel.org%2flkml%2f20231016151000.GE119987%40fedora%2ft%2f&umid=2f305b77-83e7-47b6-a461-a8ca67d0bfe2&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-2d5775265e7e1741ae8eb783a3cb78ed553093c1
> > >> 
> > >>   sound/virtio/virtio_pcm.c     |  7 ++-
> > >>   sound/virtio/virtio_pcm.h     |  9 ++--
> > >>   sound/virtio/virtio_pcm_msg.c | 93 ++++++++++++++++++++++-------------
> > >>   sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++-----
> > >>   4 files changed, 137 insertions(+), 53 deletions(-)
> > > 
> > > Most of the code changes look good, but I wonder:
> > > 
> > >> 
> > >> diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
> > >> index c10d91fff2fb..66d67eef1bcc 100644
> > >> --- a/sound/virtio/virtio_pcm.c
> > >> +++ b/sound/virtio/virtio_pcm.c
> > >> @@ -104,12 +104,11 @@ static int virtsnd_pcm_build_hw(struct virtio_pcm_substream *vss,
> > >>   	 * only message-based transport.
> > >>   	 */
> > >>   	vss->hw.info =
> > >> -		SNDRV_PCM_INFO_MMAP |
> > >> -		SNDRV_PCM_INFO_MMAP_VALID |
> > > 
> > > Do we need the removal of those MMAP features inevitably?
> > > Usually mmap can still work even if the driver implements the copy
> > > ops.  Those aren't always mutual exclusive.
> > 
> > The driver uses a message queue to communicate with the device. Thus,
> > the audio buffer is sliced into several I/O requests (= number of
> > periods) of the same size (= period size).
> > 
> > Before this, all such requests were enqueued when the substream started,
> > and immediately re-enqueued once the request is completed. This approach
> > made it possible to add mmap support. But for mmap there are no explicit
> > notifications from the application how many frames were written or read.
> > Thus, it was assumed that the virtual device should read/write frames to
> > requests based on timings. And there are some problems here:
> > 
> >   1. This was found to violate the virtio specification: if a request is
> >      already in the queue, the device can safely read/write there at any
> >      time.
> >   2. It looks like this breaks the use case with swiotlb. Personally I'm
> >      not sure how the application handles DMA ownership in the case of
> >      mmaped buffer.
> > 
> > To correctly implement mmap support, instead of transferring data via a
> > message queue, the driver and device must have a shared memory region.
> > We can add mmap in the future when we expand the functionality of the
> > device to support such shared memory.
> 
> Ah, then this implementation might be an overkill.  You're still using
> the (intermediate) vmalloc buffer allocated via PCM managed mode, and
> the actual data is copied from/to there.  So it doesn't conflict with
> the mmap operation at all.
> 
> I guess that the problem you're trying to solve (the immediate data
> transfer to the queue) can be implemented rather via PCM ack callback
> instead.  ALSA PCM core notifies the possible data transfer via PCM
> ack callback right after each change of appl_ptr or hw_ptr, including
> each read/write op or mmap commit.  Then the driver can check the
> change of appl_ptr (or hw_ptr for capture), fetch the newly available
> data, and queue it immediately.
> 
> Usually together with the use of ack callback, the driver sets
> SNDRV_PCM_INFO_SYNC_APPLPTR flag.  This prevents the mmap of the PCM
> control record (not the audio data) and enforces the use of
> SNDRV_PCM_IOCTL_SYNC_PTR ioctl instead (so that the driver always gets
> the ack callback).
> 
> 

Thanks for your comments. If I understand correctly, we have two
options:
1. Use copy/fill_silence callbacks and use my own buffers thus disabling
mmap.
2. Use mmap and the ack callback to track when appl_ptr changes thus
moving the content to the queues after it has been updated.

Am I right? 

Thanks, Matias.

> thanks,
> 
> Takashi
> 
> 
> > 
> > 
> > Best regards,
> > 
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> > 
> > -- 
> > Anton Yakovlev
> > Senior Software Engineer
> > 
> > OpenSynergy GmbH
> > Rotherstr. 20, 10245 Berlin
> > 
> 

