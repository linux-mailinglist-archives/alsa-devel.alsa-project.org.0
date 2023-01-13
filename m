Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD066908F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 09:20:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6BA8067;
	Fri, 13 Jan 2023 09:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6BA8067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673598044;
	bh=r2K0ak8DVZkQ6fyNn6qg97KcGCTK59pRTq9ItdTOoXA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CYLBa9+oQtMTJ6805ExEwo9GzUV+pmErktBQJ7YeEK6qTjHvyT1o2474qHpwRNr/C
	 klrQkeinW4ISTzw6Yv4QOlnbmNuCvQcGVrQJ/zfgs+mVIYVKyiFw03KvwWhjGTm/Mz
	 GDgubPVMZZhw4E/q6R2c3+KsDdVcg5ce7xsQbwkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FEF3F8019B;
	Fri, 13 Jan 2023 09:19:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4C36F8016D; Fri, 13 Jan 2023 09:19:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00028F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 09:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00028F8016D
Received: by mail-qt1-f179.google.com with SMTP id s5so14075751qtx.6
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MowQaQp0G9uX2jhG1rQLtIGSPC7S+MJhKLN+g9WmpVM=;
 b=OeMn/KetG83n+l6JCEn6vc5HYWQcToYVfwMjgF3u2xz71qAjkf8BmOmTfZfsRUtee5
 mIenI8oLoq2Q5Arogjc3piCoI5yG1vHbTNClhpmUtg09RrLNWKfvP9PxPM/GGwXicrla
 C7gPxznZc9ESYSBerWQ3LK8JOmNYKIRsMOSTf05rH57N8lnNZoFcqNBNNQqPWU19+xn6
 cMJ+gudDTPhKntKuCrwl/N8QoP0Rq78mi43lCgU9USRRFpTNu2gzU/g2RL7oo8URF8Gz
 M3cQYQTKXqhj2TvpbfMzlFrCJZquUrKl7HlHTnIQaWxZxO27apVnC1Cajzv1K+uXMSC4
 iRZQ==
X-Gm-Message-State: AFqh2kphmE234Ht4EAUGjvZb+Vr5AdtkfFuD8G40wjzmxU2rNfb5SkvD
 9Dg9R9HTuKmk9wc1j1Gqpr9/+Plu9PYHaw==
X-Google-Smtp-Source: AMrXdXuaUnKUp+ElO/qKEWiSpxMgA2X6CUL9DgY1o6QU9DTKlP4+eIyK1uddm86peRCbR96BymmOfQ==
X-Received: by 2002:ac8:5451:0:b0:3a8:171d:2414 with SMTP id
 d17-20020ac85451000000b003a8171d2414mr108806111qtq.15.1673597987347; 
 Fri, 13 Jan 2023 00:19:47 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 do55-20020a05620a2b3700b00706193127c6sm922011qkb.85.2023.01.13.00.19.46
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:19:46 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-4d59d518505so105449817b3.1
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 00:19:46 -0800 (PST)
X-Received: by 2002:a05:690c:313:b0:37e:6806:a5f9 with SMTP id
 bg19-20020a05690c031300b0037e6806a5f9mr3489142ywb.47.1673597985912; Fri, 13
 Jan 2023 00:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
 <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
In-Reply-To: <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:19:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRkUu3AuLs7X30ki1votAQfBU3HWvWB6qMQJBSUEr6WA@mail.gmail.com>
Message-ID: <CAMuHMdXRkUu3AuLs7X30ki1votAQfBU3HWvWB6qMQJBSUEr6WA@mail.gmail.com>
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jan 13, 2023 at 8:55 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jan 13, 2023 at 09:46:49AM +0200, Laurent Pinchart wrote:
> > On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> > > This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> > > set for each/sh, making the driver dead code except for the COMPILE_TEST
> > > case.
> > >
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> >
> > No objection from me.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> To expand a little bit on this, ARCH_SHMOBILE used to be set for the
> ARM-based shmobile SoCs too, until
>
> commit 08e735233ea29b17bfec8e4cb302e799d9f920b8
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
> Date:   Tue Aug 28 17:10:10 2018 +0200
>
>     ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol
>
>     All drivers for Renesas ARM SoCs have gained proper ARCH_RENESAS
>     platform dependencies.  Hence finish the conversion from ARCH_SHMOBILE
>     to ARCH_RENESAS for Renesas 32-bit ARM SoCs, as started by commit
>     9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS").
>
>     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
> merged in v4.20. The DRM shmobile driver's Kconfig entry wasn't updated,
> making it dead code indeed.

Note that it wasn't updated because this driver was not used on Renesas
ARM platforms, due to the lack of DT bindings and DT support, so it
didn't make sense to make it selectable.

> I haven't tested this driver in ages, hence my lack of objection, but
> someone may want to keep it for the pre-R-Car ARM SoCs.

Indeed, this driver should work with the R-Mobile A1 (which made it
into orbit, so we could call it the first member of R-Space ;-) and
SH-Mobile AG5 SoCs.  The major blocker is the lack of DT bindings.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
