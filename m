Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 040D9225C91
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 12:22:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 653951612;
	Mon, 20 Jul 2020 12:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 653951612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595240571;
	bh=xOQOxpBIYTXcyPCpGr5q7yz/8PcK4f2fsK+6Eb2u1N8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kq8ej3r5NyIWUYKNp8NTRK0Tkvj+0PKLg9dqa0c63e9/p+CbDxJQ1mgKb0FRbiXIk
	 shzZ3/h7YMAF3Q1CBihLEmV6i+VkteIfg9LiREwaGxA/xoc/Ad/p5XElpIRpBF1CU9
	 zELCxvNXvBCUpKBv78PP3J0cXeUn+T7HtgHXxUTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97399F80125;
	Mon, 20 Jul 2020 12:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8607DF800F5; Mon, 20 Jul 2020 12:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C196F800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 12:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C196F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SFWm6Psq"
Received: by mail-qt1-x843.google.com with SMTP id d27so12500378qtg.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MhkKfJe2vN50KwqiqlKQ9gFxPDyQEC8YdZGqi/NZNXo=;
 b=SFWm6PsqSFR5b1rJnuTYoVeqYWbN2x/nOSAIGXrqH9MsPly4B8p26uO0N/N5d36lYh
 xMyxG8prCiRCfPsUbu9TnohIxoo+twqSvyI0zw88XksQNZBCTLZ4HsZJ8pIoDkn9qGyh
 KXd+ht0o2RbNnZrVn1xM0XOVk0mPqtaxmNnkuQkQz6xDaZbsYhqjL3hFLxO4zWyvedTH
 QTHv+CsdnRCC7FNpU4Sbs0gIz8Aa8mzOLcRjmK9iacF2oHr/dNM0auwBW1Jy49RzwhW1
 YqoSZGVIQnOaqVryp4jVT8fRFNUxlw7Avw904PWdl5MEbzr4+fxwsqSOjXsa7UzsxqwM
 RJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MhkKfJe2vN50KwqiqlKQ9gFxPDyQEC8YdZGqi/NZNXo=;
 b=gTNI4v3b2FBI61Oc+bHKFunkF3Ob9JNx/IEdxxjVMKjFa+k1z6FOlFMylSV9t9urcT
 cDxAgM+5kFoP8iM4QYVdn+WRT9IEsREzJTyqXxpsp1vwPSL4HiA7ONS4VHLgALKpWhoj
 T3yil5ovlZh2upb95Q2QO8OuJ/rIknoIKIj6nEyoz5NRHQJLLBhZ2XP40S0pasHg6ip3
 gBeemX9OAXtJ4D4Rg7KfGkDU0SjDp2ZJEmfSSct3maMPebms2ihh0nj6y5peo2Nte3h+
 36X7wHjuWlaZbGAfuDx7T/KSZIm2dHbgKUBJNEPZ1k+mZ8fs0jUJEtYwym+ro5fZreWJ
 yNMQ==
X-Gm-Message-State: AOAM531mhGgRbjvt/Cch2Fk4caZ3UWgXoA2t6ruOTUSXkbWdukd8Eu0r
 J3Vq/Ow2iGfZpKH+qkbLaA0Vt5D3kinGN6M5CtM=
X-Google-Smtp-Source: ABdhPJz7fulXENVaQqfHlTahgzq5pfizgFs85b1RislcevMtP/GeZ4wxSo6H4gSafIdQOyr/wGv/xjr793+x0CkOfDg=
X-Received: by 2002:ac8:4316:: with SMTP id z22mr22618788qtm.121.1595240455411; 
 Mon, 20 Jul 2020 03:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200716145201.186270-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-1-arnaud.ferraris@collabora.com>
 <20200716151352.193451-3-arnaud.ferraris@collabora.com>
 <20200716233742.GA27376@Asurada-Nvidia>
 <e4d96e1f-b988-bb24-b784-b4198d172e40@collabora.com>
In-Reply-To: <e4d96e1f-b988-bb24-b784-b4198d172e40@collabora.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Jul 2020 18:20:44 +0800
Message-ID: <CAA+D8AP+cN5Z_ahBm2Kh+eE4TzA=LHaSoFQEiZw=Qr2jCf1OwA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_asrc: always use internal ratio
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

On Fri, Jul 17, 2020 at 5:58 PM Arnaud Ferraris
<arnaud.ferraris@collabora.com> wrote:
>
>
>
> Le 17/07/2020 =C3=A0 01:37, Nicolin Chen a =C3=A9crit :
> >> @@ -507,8 +507,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pa=
ir *pair, bool use_ideal_rate)
> >>
> >>      /* Enable Ideal Ratio mode */
> >
> > The code is against the comments now -- need to update this line.
>
> It isn't, the following code still enables "Ideal Ratio" mode (see below)
>
> >>      regmap_update_bits(asrc->regmap, REG_ASRCTR,
> >> -                       ASRCTR_IDRi_MASK(index) | ASRCTR_USRi_MASK(ind=
ex),
> >> -                       ASRCTR_IDR(index) | ASRCTR_USR(index));
> >> +                       ASRCTR_IDRi_MASK(index), ASRCTR_IDR(index);
> >
> > The driver falls back to ideal ratio mode if there is no matched
> > clock source. Your change seems to apply internal ratio mode any
> > way? Probably would break the fallback routine.
>
> Strictly speaking, internal ratio is only enabled when we have matched
> clock sources, and is used in addition to the calculated dividers
> (allows the ASRC to better adjust to drifting/inaccurate physical
> clocks). "Ideal Ratio" mode is different, and still enabled as a
> fallback when no clock source is matched.
>
> Ideal ratio requires both USRi and IDRi bits to be set, and that would
> still be the case if there is no matched clock source.
>
> The only difference my patch introduces is that USRi is always set (was
> previously cleared for "normal" mode), and therefore only IDRi needs to
> be set in order to enable ideal ratio mode.
>

In my experience, the USRi =3D 0, no matter the value of IDRi, it is
internal ratio mode.  USRi=3D1, IDRi=3D0, it is also internal ratio mode.
So original code should be ok for internal ratio mode,  no need
to add this change.
could you please double check it?

best regards
wang shengjiu
