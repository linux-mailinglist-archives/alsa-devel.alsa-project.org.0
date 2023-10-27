Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D04787D9AE2
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 16:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C88B0A4B;
	Fri, 27 Oct 2023 16:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C88B0A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698415906;
	bh=sJYFThSa5RWbpZAb5uLCt6nWCzxkELL06q9YI69o794=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WHZfIjQE4C4ZQ8eoN6KsCC8q/4mPnjNTb/AqqC/+MEofelhPdeYerzSZQTmrJJiQh
	 9L/1KR3KEK0k84c/ItKs+idkF8R5wCOabfLaoEyOkrxFzWV6BKFUqrFuVZDQMQEMO/
	 5PJri2sEvSwIYVV474wQ25g8CojQxwjeJiLj/oCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 433DAF80165; Fri, 27 Oct 2023 16:10:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4CCDF80165;
	Fri, 27 Oct 2023 16:10:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E5EAF8019B; Fri, 27 Oct 2023 16:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77FB2F8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77FB2F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KftGWpfL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698415839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRdYkYxdau6CHgpGFJcrqTFnU1sI1stdpBHA/cH/+NM=;
	b=KftGWpfLq5X1BdoTBEgOoD6fD2MJ1MSxKx9eqzcOb77/g7cmHC79MWqDSet6KabpFxTGJy
	3pMT392XtC8kSchYM2lXWrbWNUUQlBWDliLI4J5d8mkMMO+9Dvvyqt/LV/FBli5sOj+iAP
	ZFSQJsOniZ/ncMM4OeHx/dg6qK9zL70=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-aq6nYS_IPKiOHk0lsazQjQ-1; Fri, 27 Oct 2023 10:10:38 -0400
X-MC-Unique: aq6nYS_IPKiOHk0lsazQjQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-993c2d9e496so142233966b.0
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Oct 2023 07:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698415837; x=1699020637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRdYkYxdau6CHgpGFJcrqTFnU1sI1stdpBHA/cH/+NM=;
        b=d6GaWO4RNEYcRveZdjA6/GB5vl2prJvFiC9vWBWf/uAXZ7OnqmCL45RFnTH8UI+bgn
         OLoP7iwRJCztpU8shizFi/rl34/iW98Ks8YEBV5UDBkHWriiQRD+TwwppLS1l+oAoG/i
         4SDqISz23Cz6HhgSnp1vF+qnPKtZTC0AS6G/K4hUq0omDv4g4gDue3CSJFiOJbWVyn6v
         JyQeK9hu9V8eCrPP8+Tg2kiRODU5Ixipn5jntGpjsrxEvfHhqlz4Gs3XnM5yjVwL9hPl
         B12mTZvsMFO/xnCalrzymZ4H8l+4xn/NYf3m+Rw8cIlnGsOD3WunBaIMeDCY0nxR8M6z
         XhCA==
X-Gm-Message-State: AOJu0YxElSj5Ek8FlIXXOLSNmyQLrfT58ZHfIAhfpExEMuFyqZrTQcpM
	AEQ0I5F6YnVCMaERKzalmlBs70b9PZCK3utWc+SGVeU/shGfz69HOE4nc4kTE3768VOhgKLQhuT
	8DdFaS06iDY4z0ahjww3FPzk=
X-Received: by 2002:a17:907:26c4:b0:9b9:f980:8810 with SMTP id
 bp4-20020a17090726c400b009b9f9808810mr2403294ejc.34.1698415836785;
        Fri, 27 Oct 2023 07:10:36 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IGMqeS/ENQMteZysZriJDyAUYQDfdM2t4FWgavS3j/Huq1sdB1zR86mo2jMEQI9/MoAZHy9gg==
X-Received: by 2002:a17:907:26c4:b0:9b9:f980:8810 with SMTP id
 bp4-20020a17090726c400b009b9f9808810mr2403261ejc.34.1698415836321;
        Fri, 27 Oct 2023 07:10:36 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:52a8:fc3f:6e84:948f:e841])
        by smtp.gmail.com with ESMTPSA id
 cf17-20020a170906b2d100b00997d7aa59fasm1275905ejb.14.2023.10.27.07.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 07:10:35 -0700 (PDT)
Date: Fri, 27 Oct 2023 10:10:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	anton.yakovlev@opensynergy.com, perex@perex.cz, tiwai@suse.com,
	virtualization@lists.linux-foundation.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	pbonzini@redhat.com, stefanha@redhat.com,
	manos.pitsidianakis@linaro.org, mripard@redhat.com
Subject: Re: [PATCH v4] ALSA: virtio: use ack callback
Message-ID: <20231027100703-mutt-send-email-mst@kernel.org>
References: <ZTjkn1YAFz67yfqx@fedora>
 <87cyx0xvn7.wl-tiwai@suse.de>
 <jmuevryxo2nlqriqbwz6y2ttwzxwajfsnb5vaez2oqu7etkrd3@lu3pgnfushmr>
MIME-Version: 1.0
In-Reply-To: <jmuevryxo2nlqriqbwz6y2ttwzxwajfsnb5vaez2oqu7etkrd3@lu3pgnfushmr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: ITW7EO4SDDO6SNP2XJAVVFQXRNRB7EHG
X-Message-ID-Hash: ITW7EO4SDDO6SNP2XJAVVFQXRNRB7EHG
X-MailFrom: mst@redhat.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITW7EO4SDDO6SNP2XJAVVFQXRNRB7EHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 27, 2023 at 12:18:00PM +0200, Stefano Garzarella wrote:
> On Fri, Oct 27, 2023 at 11:27:40AM +0200, Takashi Iwai wrote:
> > On Wed, 25 Oct 2023 11:49:19 +0200,
> > Matias Ezequiel Vara Larsen wrote:
> > > 
> > > This commit uses the ack() callback to determine when a buffer has been
> > > updated, then exposes it to guest.
> > > 
> > > The current mechanism splits a dma buffer into descriptors that are
> > > exposed to the device. This dma buffer is shared with the user
> > > application. When the device consumes a buffer, the driver moves the
> > > request from the used ring to available ring.
> > > 
> > > The driver exposes the buffer to the device without knowing if the
> > > content has been updated from the user. The section 2.8.21.1 of the
> > > virtio spec states that: "The device MAY access the descriptor chains
> > > the driver created and the memory they refer to immediately". If the
> > > device picks up buffers from the available ring just after it is
> > > notified, it happens that the content may be old.
> > > 
> > > When the ack() callback is invoked, the driver exposes only the buffers
> > > that have already been updated, i.e., enqueued in the available ring.
> > > Thus, the device always picks up a buffer that is updated.
> > > 
> > > For capturing, the driver starts by exposing all the available buffers
> > > to device. After device updates the content of a buffer, it enqueues it
> > > in the used ring. It is only after the ack() for capturing is issued
> > > that the driver re-enqueues the buffer in the available ring.
> > > 
> > > Co-developed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > > Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > 
> > Applied now to for-next branch.
> 
> Cool, thanks for that!
> 
> I just wonder if we should CC stable since we are fixing a virtio
> specification violation.
> 
> @Michael what do you think?
> 
> Thanks,
> Stefano


Acked-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: de3a9980d8c3 ("ALSA: virtio: add virtio sound driver")


The patch is too big for stable - more than 100 lines added. See:
Documentation/process/stable-kernel-rules.rst



-- 
MST

