Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DF83AA10
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 13:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B9A741;
	Wed, 24 Jan 2024 13:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B9A741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706100090;
	bh=FZFP8leP7RAq5kGQxJmipIwDZPPhQviPXOnLVnpMR5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tFPelXnjAmSeo5dLW33HeWgtwRpisRgPSpq6xAHwlEVIJ7oEiwXPSvpiayVBR6Uv1
	 OzXgGCysbytiTX4hKvfmruyKb6X5zVNiTrp7DtOkBG1A2K1fgYtGF3gIlQK+4HXz6x
	 9VMGlXCSlFgIcdgtxkRm7pOdfGWNdSPfmiVsKfN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9D82F80564; Wed, 24 Jan 2024 13:40:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC50F80564;
	Wed, 24 Jan 2024 13:40:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB5A5F8028D; Wed, 24 Jan 2024 13:40:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A2EBF80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 13:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A2EBF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Qc6GPRuo
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5997492d71cso2104469eaf.2
        for <alsa-devel@alsa-project.org>;
 Wed, 24 Jan 2024 04:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706100039; x=1706704839;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWogWcbiiyuJh+FUerTxPBMWB5fr1e6cnL665YmIF/A=;
        b=Qc6GPRuonOoLBitUhbabYEPsXQs66u40SF+3B2xhNrVRrc2BgcZYvfn2W1K5yWSSky
         peXQ1+t7GzmiEoUzvO9nBO+luSxXZUmEuJzifHmsi6k7bFWvjMDTJ+51KlBL81nOks1+
         vRSfaur3lYAu5duW5ouZ0hLEOexoa8OlxWBBCgP1hp5eJRB5256TENAv6KE2alnHILTY
         WLVtLogetjKqXbgQFjFaBPUDW3OnlREyob4ZgSG5sif8naFpwjFZ2pisLCXzYjEWibun
         HxjTPaWwZb/M8wygBM3LeImHwxEN1pJcOib0MTYDreFynz7n7h5vS51Y1ClPIEbAeu4j
         bFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706100039; x=1706704839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWogWcbiiyuJh+FUerTxPBMWB5fr1e6cnL665YmIF/A=;
        b=icoi0KmWVlcRLxbvGkmoVSKxxwQYz4DNiMfBIkck9XrO5+knoeT0q2KE+FeBDfcXbg
         wyAaaiWdsFhsWjFMuO6DkkcPxemZ5KmAQLZEUSzC3WHMomUR2u9MRpZ4CnplXtx6r3F+
         4uGhMyzaTOszwYAuZXm/TexiEuIf1YKoHJYuiWdvBoU3FYnQKIh7yuhz8eAXCaGnkdqk
         rVzhKDKgVcXBCHTU71xWhjTdEwtiueceq9H1LH7Zuw0L23uVCsJc6m+EC9tWFTF4PQFj
         LS/3PipSm1dqZchQBgbNuyFGqlP9tZTW+C3IzwQCylHDHvihoEASfF7sB37ldXd1zJNX
         uDQw==
X-Gm-Message-State: AOJu0YwIT9y6AL0rwgJyThWxiqPQIXe5xyx63PQt+q5AlVoUO8QzHmPD
	1RU90kU31xwsoG3/TJxpUyb4MO2OWgc5IYyTJUviIZggNX3dnuvqcCZqJsDcT3+Nz5da1Ki+cCB
	ki77/KPGElYC7kecmFwINMX0iRvQ=
X-Google-Smtp-Source: 
 AGHT+IHyUNMoe1WPRltarBaK5ChqVz54utp+rmgY1rxh0GGzt82eqUUiuTyYaabcgKvybe1H2CF3w37Gbg8KjnLvC1Y=
X-Received: by 2002:a4a:d00e:0:b0:599:79ce:67e5 with SMTP id
 h14-20020a4ad00e000000b0059979ce67e5mr1167571oor.8.1706100039049; Wed, 24 Jan
 2024 04:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20240124120834.49410-1-lirongqing@baidu.com>
In-Reply-To: <20240124120834.49410-1-lirongqing@baidu.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 24 Jan 2024 07:40:26 -0500
Message-ID: 
 <CAJSP0QXP9KFSCO9mFkNmms=GKmMi+h4EjrVKf3Ng_BQV-LFiSQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: virtio: remove duplicate check if queue is broken
To: Li RongQing <lirongqing@baidu.com>
Cc: anton.yakovlev@opensynergy.com, mst@redhat.com, perex@perex.cz,
	tiwai@suse.com, virtualization@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: UJA3TIIVTS4NUF7JJIFXUPFXYO4TLPU7
X-Message-ID-Hash: UJA3TIIVTS4NUF7JJIFXUPFXYO4TLPU7
X-MailFrom: stefanha@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJA3TIIVTS4NUF7JJIFXUPFXYO4TLPU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 24 Jan 2024 at 07:17, Li RongQing <lirongqing@baidu.com> wrote:
>
> virtqueue_enable_cb() will call virtqueue_poll() which will check if
> queue is broken at beginning, so remove the virtqueue_is_broken() call
>
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  sound/virtio/virtio_card.c    | 2 --
>  sound/virtio/virtio_ctl_msg.c | 2 --
>  sound/virtio/virtio_pcm_msg.c | 2 --
>  3 files changed, 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

>
> diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
> index e2847c0..b158c3c 100644
> --- a/sound/virtio/virtio_card.c
> +++ b/sound/virtio/virtio_card.c
> @@ -91,8 +91,6 @@ static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
>                         virtsnd_event_dispatch(snd, event);
>                         virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
>                 }
> -               if (unlikely(virtqueue_is_broken(vqueue)))
> -                       break;
>         } while (!virtqueue_enable_cb(vqueue));
>         spin_unlock_irqrestore(&queue->lock, flags);
>  }
> diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
> index 18dc5ac..9dabea0 100644
> --- a/sound/virtio/virtio_ctl_msg.c
> +++ b/sound/virtio/virtio_ctl_msg.c
> @@ -303,8 +303,6 @@ void virtsnd_ctl_notify_cb(struct virtqueue *vqueue)
>                 virtqueue_disable_cb(vqueue);
>                 while ((msg = virtqueue_get_buf(vqueue, &length)))
>                         virtsnd_ctl_msg_complete(msg);
> -               if (unlikely(virtqueue_is_broken(vqueue)))
> -                       break;
>         } while (!virtqueue_enable_cb(vqueue));
>         spin_unlock_irqrestore(&queue->lock, flags);
>  }
> diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
> index 542446c..8c32efa 100644
> --- a/sound/virtio/virtio_pcm_msg.c
> +++ b/sound/virtio/virtio_pcm_msg.c
> @@ -358,8 +358,6 @@ static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
>                 virtqueue_disable_cb(queue->vqueue);
>                 while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
>                         virtsnd_pcm_msg_complete(msg, written_bytes);
> -               if (unlikely(virtqueue_is_broken(queue->vqueue)))
> -                       break;
>         } while (!virtqueue_enable_cb(queue->vqueue));
>         spin_unlock_irqrestore(&queue->lock, flags);
>  }
> --
> 2.9.4
>
>
