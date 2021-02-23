Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07C322A34
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 13:11:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA4B1679;
	Tue, 23 Feb 2021 13:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA4B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614082270;
	bh=f2mKyJX9iLDS+wlDanCTSY6k2NDkC1EgZnJCSwqEsyc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyOfUUUeuSt7WX1P0HxgiMCSou8HFbKA/uTkjD7aI+j/cG8K9T5+bKgehdjBrWP8A
	 ybfce7Gn0FNEVl9YaZzMWxczKJjXDmDp0miAzxue0lv5Po8YWwxOguOGPW7HxKGxRb
	 IC4U4zMzDZ+kyLE4ZQxePY54dpV0PA0Z77MfZzNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1A2F8016D;
	Tue, 23 Feb 2021 13:09:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5453F8016A; Tue, 23 Feb 2021 13:09:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A9CF80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 13:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A9CF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Xp2MakAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614082167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yf9BgNu73AxJWcC+uWhBOUpOMoNk4abmVr/8YXLU2rU=;
 b=Xp2MakAlaf+HnmQ+4Yc6ZKAzUM/bGDWVOkumf2adhurUEuU2Fo2prELQ4oIhX8ojpyWz7d
 4DD7OOgMBN43S3lXfLbkjMTEhgB1bfc0GQ6PcOqqmuKL0b3/a9KF0/Laj2X3GIvl4hjPZA
 w7V2FRoorUBv8+IRgzxIoME+KXrDj+Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-4xMLy21mNR6ItIqoozh9HQ-1; Tue, 23 Feb 2021 07:09:06 -0500
X-MC-Unique: 4xMLy21mNR6ItIqoozh9HQ-1
Received: by mail-wr1-f71.google.com with SMTP id v1so7268060wru.2
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 04:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yf9BgNu73AxJWcC+uWhBOUpOMoNk4abmVr/8YXLU2rU=;
 b=JTm+h5E5lmAK23xElkDtTaQZZw5LyxTjkFXtlAa2/h/URDcbOBEqF9fnYdcGJqAzoh
 L3vzsfEEQsWvlV2/gGqpD8H6GGbm6zMRCtNBWoRW9kFLLnS5wi3tuOeZicePPCBTvjge
 Adr4i9JCqrY+th1y2OB9T0TeXM0rGUiHR5Xkhb8Y6YFqqwMlrn+TfLQVbPYcJ0d8PTUT
 oPTJIKx/ui33wM3By4dfam6lwahwRK3Vs7sWcM9D5Q1myYBXjPuAghruJwkIQyUaxFxL
 okNj9kwpdJAOLg8IVzzE54HTYDw/+rfLVpsuf2JgGeSqy6hw22SWv2BY+/dRHvsI6mPU
 5TRw==
X-Gm-Message-State: AOAM530di4uIEWMdQmUIriUHJ0wA1VyuqeK3+bHnI9F2ezfmDvm7RBX3
 0mzq2o9Zd54lTkcBcBA8Y/eps6nggiVfd8vsSZDiAU8hS8j1/HkWyqvU97UGIyYMS/KKacDUSRm
 s5+hop7qbEyHm4Icq8cakmf8=
X-Received: by 2002:a1c:b443:: with SMTP id d64mr5302929wmf.5.1614082145056;
 Tue, 23 Feb 2021 04:09:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPt/Ygq81ajNqFSVMer4KiuG1pgEpFuOONvcgTlmWAjxDDCBt2KXtxHvZfCw9RDPw2vNCAig==
X-Received: by 2002:a1c:b443:: with SMTP id d64mr5302917wmf.5.1614082144933;
 Tue, 23 Feb 2021 04:09:04 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x66sm2353275wmg.6.2021.02.23.04.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 04:09:04 -0800 (PST)
Date: Tue, 23 Feb 2021 07:09:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH v5 0/9] ALSA: add virtio sound driver
Message-ID: <20210223070839-mutt-send-email-mst@kernel.org>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux-foundation.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Feb 22, 2021 at 04:34:35PM +0100, Anton Yakovlev wrote:
> This series implements a driver part of the virtio sound device
> specification v8 [1].
> 
> The driver supports PCM playback and capture substreams, jack and
> channel map controls. A message-based transport is used to write/read
> PCM frames to/from a device.
> 
> As a device part was used OpenSynergy proprietary implementation.
> 
> v5 changes:
>  - Fixed another bunch of sparse warnings
>    (replaced virtio_cread() -> virtio_cread_le()), no functional changes.
> (Sorry, I didn't know how to run sparse locally, now everything should be fixed)
> 
> [1] https://lists.oasis-open.org/archives/virtio-dev/202003/msg00185.html


In the future please number patches from 1, not from 2.
thanks!

> 
> Anton Yakovlev (9):
>   uapi: virtio_ids: add a sound device type ID from OASIS spec
>   ALSA: virtio: add virtio sound driver
>   ALSA: virtio: handling control messages
>   ALSA: virtio: build PCM devices and substream hardware descriptors
>   ALSA: virtio: handling control and I/O messages for the PCM device
>   ALSA: virtio: PCM substream operators
>   ALSA: virtio: introduce jack support
>   ALSA: virtio: introduce PCM channel map support
>   ALSA: virtio: introduce device suspend/resume support
> 
>  MAINTAINERS                     |   9 +
>  include/uapi/linux/virtio_ids.h |   1 +
>  include/uapi/linux/virtio_snd.h | 334 +++++++++++++++++++++
>  sound/Kconfig                   |   2 +
>  sound/Makefile                  |   3 +-
>  sound/virtio/Kconfig            |  10 +
>  sound/virtio/Makefile           |  13 +
>  sound/virtio/virtio_card.c      | 462 +++++++++++++++++++++++++++++
>  sound/virtio/virtio_card.h      | 113 ++++++++
>  sound/virtio/virtio_chmap.c     | 219 ++++++++++++++
>  sound/virtio/virtio_ctl_msg.c   | 310 ++++++++++++++++++++
>  sound/virtio/virtio_ctl_msg.h   |  78 +++++
>  sound/virtio/virtio_jack.c      | 233 +++++++++++++++
>  sound/virtio/virtio_pcm.c       | 498 ++++++++++++++++++++++++++++++++
>  sound/virtio/virtio_pcm.h       | 120 ++++++++
>  sound/virtio/virtio_pcm_msg.c   | 392 +++++++++++++++++++++++++
>  sound/virtio/virtio_pcm_ops.c   | 491 +++++++++++++++++++++++++++++++
>  17 files changed, 3287 insertions(+), 1 deletion(-)
>  create mode 100644 include/uapi/linux/virtio_snd.h
>  create mode 100644 sound/virtio/Kconfig
>  create mode 100644 sound/virtio/Makefile
>  create mode 100644 sound/virtio/virtio_card.c
>  create mode 100644 sound/virtio/virtio_card.h
>  create mode 100644 sound/virtio/virtio_chmap.c
>  create mode 100644 sound/virtio/virtio_ctl_msg.c
>  create mode 100644 sound/virtio/virtio_ctl_msg.h
>  create mode 100644 sound/virtio/virtio_jack.c
>  create mode 100644 sound/virtio/virtio_pcm.c
>  create mode 100644 sound/virtio/virtio_pcm.h
>  create mode 100644 sound/virtio/virtio_pcm_msg.c
>  create mode 100644 sound/virtio/virtio_pcm_ops.c
> 
> -- 
> 2.30.0
> 

