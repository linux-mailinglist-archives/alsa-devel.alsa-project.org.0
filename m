Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893D7DD23D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 17:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6383E8;
	Tue, 31 Oct 2023 17:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6383E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698770215;
	bh=V8RNrz/Yva6AAXDhSbIVEu5DSJqLVVmt8DdeJIQrB/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z8NtqbBq03ABh7jVYZ1lEn+oNhWRlMgMTs+gmU0TVRdZwLEUHaZzB2mWZQcHLUYGy
	 rXKjDPXdyzmvp5QN7vrGFrYOo6uCizHlXNIWhgJ4t+voW/7DCs1khoqx9i7EftORxg
	 ZcA3mfdx46APRX4mBXhMsiMu3YzLel9mTvooKv5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7646F80537; Tue, 31 Oct 2023 17:36:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FAC4F80290;
	Tue, 31 Oct 2023 17:36:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE7FAF80425; Tue, 31 Oct 2023 17:35:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B016F80152
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 17:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B016F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QOP0lrmf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698770150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V8RNrz/Yva6AAXDhSbIVEu5DSJqLVVmt8DdeJIQrB/I=;
	b=QOP0lrmfC3ul9DaCQO7wkxB2OnHlzLX6kxigtHi1fFaphXJfcf99Cuscj1RuKW1718dtZl
	sraxuAyWhm0zieS33wEb8dU73xYYOPRfge6gRkm1kKD6raqEz56yRdPlHC9dEFE5agVnt/
	yIT7Tzk0wn+aCdPFlz//2nCESTnW9QA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-hlqksosiMzuBbJjj9IBk5g-1; Tue, 31 Oct 2023 12:35:49 -0400
X-MC-Unique: hlqksosiMzuBbJjj9IBk5g-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-53e305a5a1bso4476467a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 31 Oct 2023 09:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698770148; x=1699374948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8RNrz/Yva6AAXDhSbIVEu5DSJqLVVmt8DdeJIQrB/I=;
        b=C5XY3tqTFEr4i/RiWcyugDYz+ks4Kie0sSFKCyD/eFdRZUS0QLwTI6GLgTmhYpDpVL
         0ZDIbrCcqgL3p34m1FGAqlnk1futau2Y0hYiI9f2j8WvDgrsSYi4PDh+GpfwjnwAdUFJ
         N23Zq5dSPjasUNnYHy9LJ2hkJEOGCrydDZ4mohhMaSHOwkav6d7hvVtmWYB7bCVSj/iz
         9ffBsXZkNygODRZ9ESqhQi1tYNWkA/Zx/tWzMWLaLpO8HmufzIgid9827tC5Pq08BGtp
         2+jnLwJYp6sHNR+24gCp7TrPJc7ziDvavaUAiOFS7LUKRm7YonoDl6/raskp+WPQYTtx
         7FVQ==
X-Gm-Message-State: AOJu0YxJ38cK9JKWXvdOIkn9Gb6NyfleAE/+C3rbjklJO6OZ6c/h4y5h
	OaEuH1JhCK+jwwAqdefNcEWo9KKC1enax8kS3EuA81fUXKvFN4wkr80c3oVZNINf3Ctzeg+GzjB
	cjlRUvQM/JcX0VFOCrnPvcpQ=
X-Received: by 2002:a05:6402:221a:b0:53e:3d9f:3c72 with SMTP id
 cq26-20020a056402221a00b0053e3d9f3c72mr10202183edb.18.1698770148017;
        Tue, 31 Oct 2023 09:35:48 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IG23z5vX3pCUte1bczUsVj5YelU4MviK3+Zf1D5qHUrCaDe+xind2RjKzLc9AzkbRpkpnJ+RA==
X-Received: by 2002:a05:6402:221a:b0:53e:3d9f:3c72 with SMTP id
 cq26-20020a056402221a00b0053e3d9f3c72mr10202159edb.18.1698770147712;
        Tue, 31 Oct 2023 09:35:47 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.178.82])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a50cd07000000b0053e5a1bf77dsm1412398edi.88.2023.10.31.09.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 09:35:47 -0700 (PDT)
Date: Tue, 31 Oct 2023 17:35:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 anton.yakovlev@opensynergy.com, perex@perex.cz, tiwai@suse.com,
	virtualization@lists.linux-foundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, manos.pitsidianakis@linaro.org,
	mripard@redhat.com
Subject: Re: [PATCH v4] ALSA: virtio: use ack callback
Message-ID: <7agwvbpra7ywyeghawq6xs4l2rxyksyyarborezzndb73wfd6t@bxtb2n4dsrfa>
References: <ZTjkn1YAFz67yfqx@fedora>
 <87cyx0xvn7.wl-tiwai@suse.de>
 <jmuevryxo2nlqriqbwz6y2ttwzxwajfsnb5vaez2oqu7etkrd3@lu3pgnfushmr>
 <20231027100703-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231027100703-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Message-ID-Hash: ZC2YGGCJ265FL3WDO6RJAGEE4YPVI2ZE
X-Message-ID-Hash: ZC2YGGCJ265FL3WDO6RJAGEE4YPVI2ZE
X-MailFrom: sgarzare@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZC2YGGCJ265FL3WDO6RJAGEE4YPVI2ZE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 10:10:30AM -0400, Michael S. Tsirkin wrote:
>On Fri, Oct 27, 2023 at 12:18:00PM +0200, Stefano Garzarella wrote:
>> On Fri, Oct 27, 2023 at 11:27:40AM +0200, Takashi Iwai wrote:
>> > On Wed, 25 Oct 2023 11:49:19 +0200,
>> > Matias Ezequiel Vara Larsen wrote:
>> > >
>> > > This commit uses the ack() callback to determine when a buffer has been
>> > > updated, then exposes it to guest.
>> > >
>> > > The current mechanism splits a dma buffer into descriptors that are
>> > > exposed to the device. This dma buffer is shared with the user
>> > > application. When the device consumes a buffer, the driver moves the
>> > > request from the used ring to available ring.
>> > >
>> > > The driver exposes the buffer to the device without knowing if the
>> > > content has been updated from the user. The section 2.8.21.1 of the
>> > > virtio spec states that: "The device MAY access the descriptor chains
>> > > the driver created and the memory they refer to immediately". If the
>> > > device picks up buffers from the available ring just after it is
>> > > notified, it happens that the content may be old.
>> > >
>> > > When the ack() callback is invoked, the driver exposes only the buffers
>> > > that have already been updated, i.e., enqueued in the available ring.
>> > > Thus, the device always picks up a buffer that is updated.
>> > >
>> > > For capturing, the driver starts by exposing all the available buffers
>> > > to device. After device updates the content of a buffer, it enqueues it
>> > > in the used ring. It is only after the ack() for capturing is issued
>> > > that the driver re-enqueues the buffer in the available ring.
>> > >
>> > > Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> > > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
>> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> >
>> > Applied now to for-next branch.
>>
>> Cool, thanks for that!
>>
>> I just wonder if we should CC stable since we are fixing a virtio
>> specification violation.
>>
>> @Michael what do you think?
>>
>> Thanks,
>> Stefano
>
>
>Acked-by: Michael S. Tsirkin <mst@redhat.com>
>Fixes: de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")
>
>
>The patch is too big for stable - more than 100 lines added. See:
>Documentation/process/stable-kernel-rules.rst

Yeah, I see, thanks for sharing!

Stefano

