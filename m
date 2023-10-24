Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486F7D56B9
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 17:43:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3351E84A;
	Tue, 24 Oct 2023 17:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3351E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698162182;
	bh=5CT+jCDMXiSQesCCMen8he00pW6Kvj+KOWSnVS42Z6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uekUG97toME+zdBBm/y104KS6dlQle2wiw94EB4D5/ah/Tac4acMjnjYGQcHTUxN0
	 wURQ91jDbz3pd+sf9RB1sQatpxykPCtfUUVM12/B8evG6QBBjlQa8sHpscBUzXXQjy
	 JEefOeyRYRiJbbwkZcKEkk/dnfvFBAi3raDeqEG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C4AAF8056F; Tue, 24 Oct 2023 17:41:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 732FBF8055A;
	Tue, 24 Oct 2023 17:41:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F64BF80165; Tue, 24 Oct 2023 13:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76440F8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 13:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76440F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=S3VeLki8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698145961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2lXPU4q4S6eFWPmbdstO3s/7qoi/uNTcNbWNU4XbWU=;
	b=S3VeLki8ODV3x9/0RxnRX7oJjqnr1BygcEiV+zDzTczACXc1nSCV2o9u6wW48wuZYvx9bL
	lkubtP3CNRf7iILE9MC6csOhDUQVqmgOqEXWsO7t4JZUVo2msGcCEMkC0QqhUi3XWsK4Zb
	OfjsjkILAUJBXvNo6XWHKjzh+32lnck=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-c2FAWCnROaeikjgAVGNaRQ-1; Tue, 24 Oct 2023 07:12:40 -0400
X-MC-Unique: c2FAWCnROaeikjgAVGNaRQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-41e1d05a5d7so20564111cf.2
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 04:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698145960; x=1698750760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2lXPU4q4S6eFWPmbdstO3s/7qoi/uNTcNbWNU4XbWU=;
        b=HCtLfWtXl7OXOxk3e47+hZ7lqMtys/28NsmZyqutO6tSm+zxYWvmRB4KXPIXKHUZjN
         RXahw2n1GyEyL8OWx72MtVn/zFcoblKkET8JhM0aVXEklsuqWbvfe/O+mBZ6k1YgwXa2
         4oFgZIl3DvmvFvkie2gX1Tt3Kl7FCRO4AYCGtafFskBY4lkFNGVdGytegte4yUd//QL2
         CJfVaw+wF52Ztux8S2dLaNWcfjhGwjhtZrKFGBl2klXWL6RJX5DEGEBqFk6x65Pp+3pU
         7FnmIrmU08RuQMGyn86M5thgbOWkp/k09qhxf4QIbvUhrewoFjkEqLYDGnqfSO7k6XOP
         mEJg==
X-Gm-Message-State: AOJu0Yx5QTQUVKk0YTEiuQ2g/wxsR+yN5UF666a7b6KdPve4vQciiT65
	cth4qdiwcOD5EuEFOb0iw2bLDVbfTnFt2liOhOowTei2GdA4t40+7u0Saat4c1Nw6VcIuF5qQcD
	VbPgbaj/XVKvvko2REIh3zIs=
X-Received: by 2002:a05:622a:348:b0:41e:1d17:4ca1 with SMTP id
 r8-20020a05622a034800b0041e1d174ca1mr5741165qtw.67.1698145960013;
        Tue, 24 Oct 2023 04:12:40 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IGgH9JWinTw/3VyBxR3NnKUHUrfU7r6j4m3KUt/L2niRCaXzILlLO+k91SaFhh6Nmg6pOHNdg==
X-Received: by 2002:a05:622a:348:b0:41e:1d17:4ca1 with SMTP id
 r8-20020a05622a034800b0041e1d174ca1mr5741142qtw.67.1698145959653;
        Tue, 24 Oct 2023 04:12:39 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id
 z5-20020ac87ca5000000b00410ac0068d0sm3380879qtv.91.2023.10.24.04.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 04:12:39 -0700 (PDT)
Date: Tue, 24 Oct 2023 13:12:35 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: anton.yakovlev@opensynergy.com, mst@redhat.com, perex@perex.cz,
	tiwai@suse.com, virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	manos.pitsidianakis@linaro.org, mripard@redhat.com
Subject: Re: [PATCH v3] ALSA: virtio: use ack callback
Message-ID: <ZTemo0P/kEcceK/O@fedora>
References: <ZTaMEUZUTrRRUD6y@fedora>
 <87edhlwd7b.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <87edhlwd7b.wl-tiwai@suse.de>
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
Message-ID-Hash: LKZESUSVLCMX4BOBKMNCWVSJCTOLV4L7
X-Message-ID-Hash: LKZESUSVLCMX4BOBKMNCWVSJCTOLV4L7
X-Mailman-Approved-At: Tue, 24 Oct 2023 15:41:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKZESUSVLCMX4BOBKMNCWVSJCTOLV4L7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 23, 2023 at 05:50:00PM +0200, Takashi Iwai wrote:
> On Mon, 23 Oct 2023 17:06:57 +0200,
> Matias Ezequiel Vara Larsen wrote:
> > 
> > +static int virtsnd_pcm_ack(struct snd_pcm_substream *substream)
> > +{
> > +	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
> > +	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
> > +	unsigned long flags;
> > +	struct snd_pcm_runtime *runtime = vss->substream->runtime;
> > +	ssize_t appl_pos = frames_to_bytes(runtime, runtime->control->appl_ptr);
> > +	ssize_t buf_size = frames_to_bytes(runtime, runtime->buffer_size);
> > +	int rc;
> > +
> > +	spin_lock_irqsave(&queue->lock, flags);
> > +	spin_lock(&vss->lock);
> > +
> > +	ssize_t bytes = (appl_pos - vss->appl_ptr) % buf_size;
> 
> The variable declaration should be moved to the beginning of the
> function.
> 
> Also, there can be a overlap beyond runtime->boundary (which easily
> happens for 32bit apps), so the calculation can be a bit more complex
> with conditional.
> 

Should I use as an example `cs46xx_playback/capture_transfer()` which relies on
the `snd_pcm_indirect_playback/capture_transfer()`? It looks like it
does already that calculation.

Thanks, Matias.

