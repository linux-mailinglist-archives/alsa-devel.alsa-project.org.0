Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE52FCCBF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:34:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4F217EB;
	Wed, 20 Jan 2021 09:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4F217EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611131688;
	bh=I0DfCniKPGoqAABiXfSJOD/bTLf2CqPs7kkxY0xXYhc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vV0u/7IYChrlrIHVvdctRO1ehtlUOwfeY7Z6X5zgPHpuG1WgV7ySCyKvDHb0tJfy1
	 MBqOE6tYRkl4fSBknrfD3IpjEtXwAAyp7ZcEwpZOmlRuHj2krwHshtMul8+pORncnt
	 kovx2zG++zYcm51VF2p9RT9FcrPUC58xMFZMx6BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DFCCF8019B;
	Wed, 20 Jan 2021 09:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22147F8016E; Wed, 20 Jan 2021 09:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_47,PRX_BODY_64,PRX_BODY_65,PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1052EF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1052EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="iEpUuc87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611131585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NaMBw2tMF3iseHMhvTJvNTqHZMfiwOcXK6SQcatqOxg=;
 b=iEpUuc876q82jnhXk35mG/9xhcQ7mXjGdq9G2EVicpZA9Cm8OpbnNp8Gn114vg8TfVCk1e
 IlsJi/cTaXY8TbgRhUUdKzGNRTozxiYn4EhZL/HMM6whFFqQdCXP4JBrXlfVxPKRRL9cac
 5OiTlN9Au4KLF0u5Z0I+BObO5J5sczc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-5lJrB4gwPPin7p3Il31dIQ-1; Wed, 20 Jan 2021 03:33:03 -0500
X-MC-Unique: 5lJrB4gwPPin7p3Il31dIQ-1
Received: by mail-wr1-f71.google.com with SMTP id w5so11000694wrl.9
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 00:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NaMBw2tMF3iseHMhvTJvNTqHZMfiwOcXK6SQcatqOxg=;
 b=sVvjJc4Mvpx1pp8LHyR7tMfhTlL05KlqU1U5mUMvbzrFwtPTBiTBQwYoXuVTT8sx6o
 ezfglFitoPtKvt1gHKHNgIZMqJ3dG3xZG0Ld1VLv/dcAeuq7WbItIHeGaUR7emGPV1tc
 gqs5RCMGPftEqbcDpaCtIiAnf5Xs1UlgaIU9J6HbD54jnfCFiqRP1uPsrukIZ2C6P7Ub
 cZ8ZJS4+5BUXpzlrjdhnVawmO/H1Zb2xnW1NY5HWjQYl4x276nmDXenrFLBEuvngC4m7
 0oeKoLf4rcH49cdqbcXwEbftBEdY+sdA87uvAuWAD46FyjqB0TPS1zJMoOUY8S+I93TX
 1QQA==
X-Gm-Message-State: AOAM531yayvRsmZBMQf+Xh82AfSc+L256XTzjJ4EGK1zDJkA6Hd8YQLC
 UzWdfY1q4gCwQz+NvkA5J+Y1L+781vPgyCckPAkC97x+xESvjIMZ68F1AEd11Vex1pBPZ7O6Kvb
 q0Z1IS8OBniUaMYpFPjCu0Hc=
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr8090186wrr.306.1611131582109; 
 Wed, 20 Jan 2021 00:33:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPD6OzXYUboYwoh/qMFIbwcZAFlksqo65pLgzDuI8xjWPdsNA4radRvxWviHGRwSJ5UOnbpQ==
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr8090165wrr.306.1611131581857; 
 Wed, 20 Jan 2021 00:33:01 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id a62sm2543589wmf.7.2021.01.20.00.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 00:33:00 -0800 (PST)
Date: Wed, 20 Jan 2021 03:32:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>
Subject: Re: [PATCH 2/7] uapi: virtio_snd: add the sound device header file
Message-ID: <20210120033211-mutt-send-email-mst@kernel.org>
References: <20210120003638.3339987-1-anton.yakovlev@opensynergy.com>
 <20210120003638.3339987-3-anton.yakovlev@opensynergy.com>
MIME-Version: 1.0
In-Reply-To: <20210120003638.3339987-3-anton.yakovlev@opensynergy.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Jan 20, 2021 at 01:36:30AM +0100, Anton Yakovlev wrote:
> The file contains the definitions for the sound device from the OASIS
> virtio spec.
> 
> Signed-off-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> ---
>  MAINTAINERS                     |   6 +
>  include/uapi/linux/virtio_snd.h | 361 ++++++++++++++++++++++++++++++++
>  2 files changed, 367 insertions(+)
>  create mode 100644 include/uapi/linux/virtio_snd.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00836f6452f0..6dfd59eafe82 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18936,6 +18936,12 @@ W:	https://virtio-mem.gitlab.io/
>  F:	drivers/virtio/virtio_mem.c
>  F:	include/uapi/linux/virtio_mem.h
>  
> +VIRTIO SOUND DRIVER
> +M:	Anton Yakovlev <anton.yakovlev@opensynergy.com>
> +L:	virtualization@lists.linux-foundation.org
> +S:	Maintained
> +F:	include/uapi/linux/virtio_snd.h
> +
>  VIRTUAL BOX GUEST DEVICE DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  M:	Arnd Bergmann <arnd@arndb.de>

Who's merging this driver me? If so pls add mst@redhat.com so I'm copied
on patches.

> diff --git a/include/uapi/linux/virtio_snd.h b/include/uapi/linux/virtio_snd.h
> new file mode 100644
> index 000000000000..1ff6310e54d6
> --- /dev/null
> +++ b/include/uapi/linux/virtio_snd.h
> @@ -0,0 +1,361 @@
> +/* SPDX-License-Identifier: BSD-3-Clause */
> +/*
> + * Copyright (C) 2020  OpenSynergy GmbH
> + *
> + * This header is BSD licensed so anyone can use the definitions to
> + * implement compatible drivers/servers.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. Neither the name of OpenSynergy GmbH nor the names of its contributors
> + *    may be used to endorse or promote products derived from this software
> + *    without specific prior written permission.
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> + * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
> + * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
> + * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> + * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
> + * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + * SUCH DAMAGE.
> + */
> +#ifndef VIRTIO_SND_IF_H
> +#define VIRTIO_SND_IF_H
> +
> +#include <linux/virtio_types.h>
> +
> +/*******************************************************************************
> + * CONFIGURATION SPACE
> + */
> +struct virtio_snd_config {
> +	/* # of available physical jacks */
> +	__le32 jacks;
> +	/* # of available PCM streams */
> +	__le32 streams;
> +	/* # of available channel maps */
> +	__le32 chmaps;
> +};
> +
> +enum {
> +	/* device virtqueue indexes */
> +	VIRTIO_SND_VQ_CONTROL = 0,
> +	VIRTIO_SND_VQ_EVENT,
> +	VIRTIO_SND_VQ_TX,
> +	VIRTIO_SND_VQ_RX,
> +	/* # of device virtqueues */
> +	VIRTIO_SND_VQ_MAX
> +};
> +
> +/*******************************************************************************
> + * COMMON DEFINITIONS
> + */
> +
> +/* supported dataflow directions */
> +enum {
> +	VIRTIO_SND_D_OUTPUT = 0,
> +	VIRTIO_SND_D_INPUT
> +};
> +
> +enum {
> +	/* jack control request types */
> +	VIRTIO_SND_R_JACK_INFO = 1,
> +	VIRTIO_SND_R_JACK_REMAP,
> +
> +	/* PCM control request types */
> +	VIRTIO_SND_R_PCM_INFO = 0x0100,
> +	VIRTIO_SND_R_PCM_SET_PARAMS,
> +	VIRTIO_SND_R_PCM_PREPARE,
> +	VIRTIO_SND_R_PCM_RELEASE,
> +	VIRTIO_SND_R_PCM_START,
> +	VIRTIO_SND_R_PCM_STOP,
> +
> +	/* channel map control request types */
> +	VIRTIO_SND_R_CHMAP_INFO = 0x0200,
> +
> +	/* jack event types */
> +	VIRTIO_SND_EVT_JACK_CONNECTED = 0x1000,
> +	VIRTIO_SND_EVT_JACK_DISCONNECTED,
> +
> +	/* PCM event types */
> +	VIRTIO_SND_EVT_PCM_PERIOD_ELAPSED = 0x1100,
> +	VIRTIO_SND_EVT_PCM_XRUN,
> +
> +	/* common status codes */
> +	VIRTIO_SND_S_OK = 0x8000,
> +	VIRTIO_SND_S_BAD_MSG,
> +	VIRTIO_SND_S_NOT_SUPP,
> +	VIRTIO_SND_S_IO_ERR
> +};
> +
> +/* common header */
> +struct virtio_snd_hdr {
> +	__le32 code;
> +};
> +
> +/* event notification */
> +struct virtio_snd_event {
> +	/* VIRTIO_SND_EVT_XXX */
> +	struct virtio_snd_hdr hdr;
> +	/* optional event data */
> +	__le32 data;
> +};
> +
> +/* common control request to query an item information */
> +struct virtio_snd_query_info {
> +	/* VIRTIO_SND_R_XXX_INFO */
> +	struct virtio_snd_hdr hdr;
> +	/* item start identifier */
> +	__le32 start_id;
> +	/* item count to query */
> +	__le32 count;
> +	/* item information size in bytes */
> +	__le32 size;
> +};
> +
> +/* common item information header */
> +struct virtio_snd_info {
> +	/* function group node id (High Definition Audio Specification 7.1.2) */
> +	__le32 hda_fn_nid;
> +};
> +
> +/*******************************************************************************
> + * JACK CONTROL MESSAGES
> + */
> +struct virtio_snd_jack_hdr {
> +	/* VIRTIO_SND_R_JACK_XXX */
> +	struct virtio_snd_hdr hdr;
> +	/* 0 ... virtio_snd_config::jacks - 1 */
> +	__le32 jack_id;
> +};
> +
> +/* supported jack features */
> +enum {
> +	VIRTIO_SND_JACK_F_REMAP = 0
> +};
> +
> +struct virtio_snd_jack_info {
> +	/* common header */
> +	struct virtio_snd_info hdr;
> +	/* supported feature bit map (1 << VIRTIO_SND_JACK_F_XXX) */
> +	__le32 features;
> +	/* pin configuration (High Definition Audio Specification 7.3.3.31) */
> +	__le32 hda_reg_defconf;
> +	/* pin capabilities (High Definition Audio Specification 7.3.4.9) */
> +	__le32 hda_reg_caps;
> +	/* current jack connection status (0: disconnected, 1: connected) */
> +	__u8 connected;
> +
> +	__u8 padding[7];
> +};
> +
> +/* jack remapping control request */
> +struct virtio_snd_jack_remap {
> +	/* .code = VIRTIO_SND_R_JACK_REMAP */
> +	struct virtio_snd_jack_hdr hdr;
> +	/* selected association number */
> +	__le32 association;
> +	/* selected sequence number */
> +	__le32 sequence;
> +};
> +
> +/*******************************************************************************
> + * PCM CONTROL MESSAGES
> + */
> +struct virtio_snd_pcm_hdr {
> +	/* VIRTIO_SND_R_PCM_XXX */
> +	struct virtio_snd_hdr hdr;
> +	/* 0 ... virtio_snd_config::streams - 1 */
> +	__le32 stream_id;
> +};
> +
> +/* supported PCM stream features */
> +enum {
> +	VIRTIO_SND_PCM_F_SHMEM_HOST = 0,
> +	VIRTIO_SND_PCM_F_SHMEM_GUEST,
> +	VIRTIO_SND_PCM_F_MSG_POLLING,
> +	VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS,
> +	VIRTIO_SND_PCM_F_EVT_XRUNS
> +};
> +
> +/* supported PCM sample formats */
> +enum {
> +	/* analog formats (width / physical width) */
> +	VIRTIO_SND_PCM_FMT_IMA_ADPCM = 0,	/*  4 /  4 bits */
> +	VIRTIO_SND_PCM_FMT_MU_LAW,		/*  8 /  8 bits */
> +	VIRTIO_SND_PCM_FMT_A_LAW,		/*  8 /  8 bits */
> +	VIRTIO_SND_PCM_FMT_S8,			/*  8 /  8 bits */
> +	VIRTIO_SND_PCM_FMT_U8,			/*  8 /  8 bits */
> +	VIRTIO_SND_PCM_FMT_S16,			/* 16 / 16 bits */
> +	VIRTIO_SND_PCM_FMT_U16,			/* 16 / 16 bits */
> +	VIRTIO_SND_PCM_FMT_S18_3,		/* 18 / 24 bits */
> +	VIRTIO_SND_PCM_FMT_U18_3,		/* 18 / 24 bits */
> +	VIRTIO_SND_PCM_FMT_S20_3,		/* 20 / 24 bits */
> +	VIRTIO_SND_PCM_FMT_U20_3,		/* 20 / 24 bits */
> +	VIRTIO_SND_PCM_FMT_S24_3,		/* 24 / 24 bits */
> +	VIRTIO_SND_PCM_FMT_U24_3,		/* 24 / 24 bits */
> +	VIRTIO_SND_PCM_FMT_S20,			/* 20 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_U20,			/* 20 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_S24,			/* 24 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_U24,			/* 24 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_S32,			/* 32 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_U32,			/* 32 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_FLOAT,		/* 32 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_FLOAT64,		/* 64 / 64 bits */
> +	/* digital formats (width / physical width) */
> +	VIRTIO_SND_PCM_FMT_DSD_U8,		/*  8 /  8 bits */
> +	VIRTIO_SND_PCM_FMT_DSD_U16,		/* 16 / 16 bits */
> +	VIRTIO_SND_PCM_FMT_DSD_U32,		/* 32 / 32 bits */
> +	VIRTIO_SND_PCM_FMT_IEC958_SUBFRAME	/* 32 / 32 bits */
> +};
> +
> +/* supported PCM frame rates */
> +enum {
> +	VIRTIO_SND_PCM_RATE_5512 = 0,
> +	VIRTIO_SND_PCM_RATE_8000,
> +	VIRTIO_SND_PCM_RATE_11025,
> +	VIRTIO_SND_PCM_RATE_16000,
> +	VIRTIO_SND_PCM_RATE_22050,
> +	VIRTIO_SND_PCM_RATE_32000,
> +	VIRTIO_SND_PCM_RATE_44100,
> +	VIRTIO_SND_PCM_RATE_48000,
> +	VIRTIO_SND_PCM_RATE_64000,
> +	VIRTIO_SND_PCM_RATE_88200,
> +	VIRTIO_SND_PCM_RATE_96000,
> +	VIRTIO_SND_PCM_RATE_176400,
> +	VIRTIO_SND_PCM_RATE_192000,
> +	VIRTIO_SND_PCM_RATE_384000
> +};
> +
> +struct virtio_snd_pcm_info {
> +	/* common header */
> +	struct virtio_snd_info hdr;
> +	/* supported feature bit map (1 << VIRTIO_SND_PCM_F_XXX) */
> +	__le32 features;
> +	/* supported sample format bit map (1 << VIRTIO_SND_PCM_FMT_XXX) */
> +	__le64 formats;
> +	/* supported frame rate bit map (1 << VIRTIO_SND_PCM_RATE_XXX) */
> +	__le64 rates;
> +	/* dataflow direction (VIRTIO_SND_D_XXX) */
> +	__u8 direction;
> +	/* minimum # of supported channels */
> +	__u8 channels_min;
> +	/* maximum # of supported channels */
> +	__u8 channels_max;
> +
> +	__u8 padding[5];
> +};
> +
> +/* set PCM stream format */
> +struct virtio_snd_pcm_set_params {
> +	/* .code = VIRTIO_SND_R_PCM_SET_PARAMS */
> +	struct virtio_snd_pcm_hdr hdr;
> +	/* size of the hardware buffer */
> +	__le32 buffer_bytes;
> +	/* size of the hardware period */
> +	__le32 period_bytes;
> +	/* selected feature bit map (1 << VIRTIO_SND_PCM_F_XXX) */
> +	__le32 features;
> +	/* selected # of channels */
> +	__u8 channels;
> +	/* selected sample format (VIRTIO_SND_PCM_FMT_XXX) */
> +	__u8 format;
> +	/* selected frame rate (VIRTIO_SND_PCM_RATE_XXX) */
> +	__u8 rate;
> +
> +	__u8 padding;
> +};
> +
> +/*******************************************************************************
> + * PCM I/O MESSAGES
> + */
> +
> +/* I/O request header */
> +struct virtio_snd_pcm_xfer {
> +	/* 0 ... virtio_snd_config::streams - 1 */
> +	__le32 stream_id;
> +};
> +
> +/* I/O request status */
> +struct virtio_snd_pcm_status {
> +	/* VIRTIO_SND_S_XXX */
> +	__le32 status;
> +	/* current device latency */
> +	__le32 latency_bytes;
> +};
> +
> +/*******************************************************************************
> + * CHANNEL MAP CONTROL MESSAGES
> + */
> +struct virtio_snd_chmap_hdr {
> +	/* VIRTIO_SND_R_CHMAP_XXX */
> +	struct virtio_snd_hdr hdr;
> +	/* 0 ... virtio_snd_config::chmaps - 1 */
> +	__le32 chmap_id;
> +};
> +
> +/* standard channel position definition */
> +enum {
> +	VIRTIO_SND_CHMAP_NONE = 0,	/* undefined */
> +	VIRTIO_SND_CHMAP_NA,		/* silent */
> +	VIRTIO_SND_CHMAP_MONO,		/* mono stream */
> +	VIRTIO_SND_CHMAP_FL,		/* front left */
> +	VIRTIO_SND_CHMAP_FR,		/* front right */
> +	VIRTIO_SND_CHMAP_RL,		/* rear left */
> +	VIRTIO_SND_CHMAP_RR,		/* rear right */
> +	VIRTIO_SND_CHMAP_FC,		/* front center */
> +	VIRTIO_SND_CHMAP_LFE,		/* low frequency (LFE) */
> +	VIRTIO_SND_CHMAP_SL,		/* side left */
> +	VIRTIO_SND_CHMAP_SR,		/* side right */
> +	VIRTIO_SND_CHMAP_RC,		/* rear center */
> +	VIRTIO_SND_CHMAP_FLC,		/* front left center */
> +	VIRTIO_SND_CHMAP_FRC,		/* front right center */
> +	VIRTIO_SND_CHMAP_RLC,		/* rear left center */
> +	VIRTIO_SND_CHMAP_RRC,		/* rear right center */
> +	VIRTIO_SND_CHMAP_FLW,		/* front left wide */
> +	VIRTIO_SND_CHMAP_FRW,		/* front right wide */
> +	VIRTIO_SND_CHMAP_FLH,		/* front left high */
> +	VIRTIO_SND_CHMAP_FCH,		/* front center high */
> +	VIRTIO_SND_CHMAP_FRH,		/* front right high */
> +	VIRTIO_SND_CHMAP_TC,		/* top center */
> +	VIRTIO_SND_CHMAP_TFL,		/* top front left */
> +	VIRTIO_SND_CHMAP_TFR,		/* top front right */
> +	VIRTIO_SND_CHMAP_TFC,		/* top front center */
> +	VIRTIO_SND_CHMAP_TRL,		/* top rear left */
> +	VIRTIO_SND_CHMAP_TRR,		/* top rear right */
> +	VIRTIO_SND_CHMAP_TRC,		/* top rear center */
> +	VIRTIO_SND_CHMAP_TFLC,		/* top front left center */
> +	VIRTIO_SND_CHMAP_TFRC,		/* top front right center */
> +	VIRTIO_SND_CHMAP_TSL,		/* top side left */
> +	VIRTIO_SND_CHMAP_TSR,		/* top side right */
> +	VIRTIO_SND_CHMAP_LLFE,		/* left LFE */
> +	VIRTIO_SND_CHMAP_RLFE,		/* right LFE */
> +	VIRTIO_SND_CHMAP_BC,		/* bottom center */
> +	VIRTIO_SND_CHMAP_BLC,		/* bottom left center */
> +	VIRTIO_SND_CHMAP_BRC		/* bottom right center */
> +};
> +
> +/* maximum possible number of channels */
> +#define VIRTIO_SND_CHMAP_MAX_SIZE	18
> +
> +struct virtio_snd_chmap_info {
> +	/* common header */
> +	struct virtio_snd_info hdr;
> +	/* dataflow direction (VIRTIO_SND_D_XXX) */
> +	__u8 direction;
> +	/* # of valid channel position values */
> +	__u8 channels;
> +	/* channel position values (VIRTIO_SND_CHMAP_XXX) */
> +	__u8 positions[VIRTIO_SND_CHMAP_MAX_SIZE];
> +};
> +
> +#endif /* VIRTIO_SND_IF_H */
> -- 
> 2.30.0
> 
> 

