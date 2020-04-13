Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 677161A637F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 09:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E561016D2;
	Mon, 13 Apr 2020 09:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E561016D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586762468;
	bh=Dc6PLjOdDhtcyFz6E9kF06yBCXq+M6QjrtPrw7BFYps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u4dgbVSFkdwQVAL6W+sEfWX8+os6juvl/VXfxOjW8hnvx6odz5VTjmp5fu5xGpZIS
	 s+2Xh6QpfKll5H5+wd6pkeCJdCJqeFTjxG1jp2Ap6OtvDEfbPLD9VoyBCm1fI2f0tO
	 i1MNX5Lt0ie/HrF1mbN4UUic5xMOo8d5cC37JvpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033C0F80115;
	Mon, 13 Apr 2020 09:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72B57F80245; Mon, 13 Apr 2020 09:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC79DF80115
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 09:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC79DF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Lm3du3ZN"
Received: by mail-qt1-x844.google.com with SMTP id b10so6450511qtt.9
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 00:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2nT3Va3E4vwilp1Fdp7ARRfOyF9O8UdBycnmN+9Xhsw=;
 b=Lm3du3ZNa8HvaBi6XryhBn8zFP8p7bnaPyDhrcxfNIvLvG0xa9ym0IHVYBQ/nv9i9R
 sayue0wrNelJykTg46+IjgbVRRHGLYy7MZ6Lc0xIeBoLYkv5gtnJZXaDFqTWw0RZzYAl
 d9d0fz9wc5Fx2L+T6rvAWERt7aUZ4w8U+UXjORxiMrtg6Vps8Z93DdGOv9qIGL3LYGMQ
 vjInJ5kMEmKYQfraZHjLv6FpJ0LYJzSJYpJRnhzsCcCaaop1hAG98Uq7m1vU/LImOmDi
 eiLqXAV1rFX/qITBUBI3RwJIdPorIsc7k32KSrLj8kuzqJDfkJuSRClis03CI5UhSnEg
 UJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2nT3Va3E4vwilp1Fdp7ARRfOyF9O8UdBycnmN+9Xhsw=;
 b=sZyDcFFKXQGbDN4C1pTkbB1j6R45Bxgd1NfnaOBAaQx89JsVqX4HOpZSXxWD9UK9Ps
 aGZnMbEASbjRIwKQs0WwMUvG18iZKYGHfTc/yE16UqPPxmV0u3O4Is0LZeXOPiihuTok
 0pRCTr71cnW0Cu4pou1ATUj0HWKsmGDTy6TjCzgza/FgXEaq56hAy9jHka7nFwoEda8B
 Wxt3/wVLK6Jl2HEfb7i4SPbY6ZZOF4XFPEhYLcorGbBZqSiLX/vT+wlOHmXKR8oF5/O7
 lZ8hAhgMlEQNvszLZ+uVHT3ME7PJM6O5LSJj+NLsDHRp+sEDAQJc1/OHc3dSOeKqlxrv
 pMQg==
X-Gm-Message-State: AGi0PuYPOdlDkeUHrP7TFFMxC9UHejzKZcI5JX8jiXiVcR6qQdtZtYlq
 yqMco3BLEhmybW7j1F+60B7pfhRsZhKLfaCKWkc=
X-Google-Smtp-Source: APiQypLiZzOmvvNbZthlcuAk+7DNZ/bAtcOVLzBOGnKD29q18014aTMKUIxT6RpYFvwJHP1TcCDBEfyHYQ62HhVJz7M=
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr9986167qta.292.1586762359717; 
 Mon, 13 Apr 2020 00:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
 <20200412020814.GA5984@Asurada>
 <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
 <20200413043143.GA9116@Asurada>
In-Reply-To: <20200413043143.GA9116@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 13 Apr 2020 15:19:08 +0800
Message-ID: <CAA+D8ANUDAfLVJ6NQvtHSV27G4RUoQYEnA3Ym0wH28YCA6bZMg@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Apr 13, 2020 at 12:31 PM Nicolin Chen <nicoleotsuka@gmail.com> wrot=
e:
>
> On Mon, Apr 13, 2020 at 11:16:31AM +0800, Shengjiu Wang wrote:
> > On Sun, Apr 12, 2020 at 10:08 AM Nicolin Chen <nicoleotsuka@gmail.com> =
wrote:
> > >
> > > On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:
> > >
> > > > > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_a=
src_dma.c
> > > > > > index b15946e03380..5cf0468ce6e3 100644
> > > > > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > > > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > > > >
> > > > > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct sn=
d_soc_component *component,
> > > > > >               return ret;
> > > > > >       }
> > > > > >
> > > > > > -     pair =3D kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL=
);
> > > > > > +     pair =3D kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIV=
AT_SIZE, GFP_KERNEL);
> > > > >
> > > > > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > > > > define in this file too, rather than in the header file.
> > > > >
> > > > > And could fit 80 characters:
> > > > >
> > > > > +       pair =3D kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KE=
RNEL);
> > >
> > > > I will use a function pointer
> > > >     int (*get_pair_priv_size)(void)
> > >
> > > Since it's the size of pair or cts structure, could be just a
> > > size_t variable?
> >
> > Yes, should be "size_t (*get_pair_priv_size)(void)"
>
> Does it have to be a function? -- how about this:
>
> struct pair {
>         ...
>         size_t private_size;
>         void *private;
> };
>
> probe/or-somewhere() {
>         ...
>         pair->private =3D pair_priv;

we need to know the size of pair_priv before allocate memory.

>         pair->private_size =3D sizeof(*pair_priv);
>         ...
> }

In fsl_asrc_dma_startup, we need to allocate memory for pair and
pair->private=EF=BC=8Cbut we don't know the object, so we don't know the
size of private, so function pointer is better.

best regards
wang shengjiu
