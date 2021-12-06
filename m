Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A531B46A304
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 18:30:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7C622DF;
	Mon,  6 Dec 2021 18:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7C622DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638811811;
	bh=4ju5o7FsoS2jpvAz5xVo8OtrCFZ1DUARdeX5FK9UzfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgRv/xbdtjTIfUzB8OXK0QxxBwOBvA7qEXJBwObR8cESLdT92vATQgqeWxTnkdx1B
	 foJudZQyBYj8CXK0nwRR89aut9aYyUkzHhzmDZunjWYDwvs2bMG8UC2M2KoYEbq4oY
	 kNBu+kGQ9xSn0d/exvP5hy9129igL4EOmgOBFQnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C990F804ED;
	Mon,  6 Dec 2021 18:28:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 065FBF804EC; Mon,  6 Dec 2021 18:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24C68F804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 18:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C68F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="Sd+DbBx5"
Received: by mail-ed1-x532.google.com with SMTP id o20so46128182eds.10
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 09:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Iwam9ntoKrXXFMW9GBBg/CP2/SJeMa2eol8Tt6Y/4w=;
 b=Sd+DbBx50iRRQDCEahfK/6JoYwkIW3PdLQoaN+VzpC2SB0+lVKLqv+7X5TPeOQDjX4
 xXZb28UYQhfHSN1ztNpmV+MKnyjh5R5gaRAfaWnuTWUUwOaH0h3dkVzroeVXtlgTmXgs
 pxcCogtoYtZgkBfFk4k7L2Y4Kh5AuakypT5UR4DQEzhlp/fTVxC9wKdgffqhEYiKY/GQ
 gYQWTcrf7tski3w4QdbRc3hPIb81CxU41+byZ2jHxSCfVgT6G/jOa7Aw+v5+pKwGOfGl
 ZiOr0pnqHwXYQRVtOv1X20hbypEhzSgiFXoQw6+zwh91goEhayT+AW/fu57OBK4XSXby
 R7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Iwam9ntoKrXXFMW9GBBg/CP2/SJeMa2eol8Tt6Y/4w=;
 b=anJ7BOt4H63t0t5fLA+/cYmatmCgls5hb2oXYd91xvk6IEhF6LZgbcJC0uNZOIAkcI
 F0eoukcat76hDFoA0JhQVeHD3nLKOAg/ef5FZllY0SdgSDWU3IWV8laMoPEnRpwCX2MI
 w1KN7W1UHQYTTi0Zr2aGKUALmUe16gsoDZ0l6ImlZKAIPh1/GwMV3OuSpFcBf2mQqRXr
 z3QhGMyOMcjpZ69/yjkZkVWPLxKhpSfpB7o5jvZe+eUEq+r7A46Bm0b6/W6tOjKS6cdn
 3R2o0ZSdTCpQzSBRIcStB/uZKjcm64rcto2vecc4RAIOzMteZBVncBjxtGCmZEglLR68
 waMw==
X-Gm-Message-State: AOAM5323Orj5Bjkh8wmZjR3CfDpAnOD7IHHFQCnUW3ALF1v+l2PjFZ9b
 ZTytydd4QFPTbAKPJfUOZGCdPWLtNN19Mwn4+JQ=
X-Google-Smtp-Source: ABdhPJx9/dmmMIp0k2nEWYLkPyQHjbt6A++ofLwsYD9nTGyKv6qQM4UpeYPChbhnOnPF9AqF77qtzNTlFRyRQ7ZtUy4=
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr602667eds.386.1638811723308;
 Mon, 06 Dec 2021 09:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
 <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 18:28:32 +0100
Message-ID: <CAFBinCAceRkO86bXfUYnDwup3At9MaN-PnOiLxa-1fYO5SwOQA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, Geraldo Nascimento <geraldogabriel@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Hi Jerome,

On Mon, Dec 6, 2021 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Sun 05 Dec 2021 at 19:08, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > The out-of-tree vendor driver uses the following approach to set the
> > AIU_I2S_MISC register:
> > 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
> > 2) configure AIU_I2S_MUTE_SWAP[15:0]
> > 3) write AIU_MEM_I2S_END_PTR
> > 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
> >    mode")
> > 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
> >    stays at 1 while for older drivers this bit is unset in step 4)
> > 6) set AIU_I2S_MISC[2] to 0
> > 7) write AIU_MEM_I2S_MASKS
> > 8) toggle AIU_MEM_I2S_CONTROL[0]
> > 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
> >
> > Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
> > interrupts are generated anymore. The way this bit is managed by the
> > vendor driver as well as not getting any interrupts can mean that it's
> > related to the FIFO and not the encoder.
>
> Not necessarily. If the encoder stops pulling data, the FIFO will going
> over the DDR. Since it generates an IRQ after reading N bytes, IRQ would
> stop too. AFAIK, if the pipeline is stalled, the IRQ stops anyway
ah, right. so I think you're right: it can be either way

> ... but this is not really important
I'll remove that section from the description in v2

> >
> > Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
> > closer resembles the flow in the vendor kernel. While here also
> > configure AIU_I2S_MISC[4] (documented as: "force each audio data to
> > left or right according to the bit attached with the audio data")
> > similar to how the vendor driver does this.
>
> I understand the part of HOLD, not about FORCE_LR.
> Is it necessary to fix the problem ? Have you tested without this change
> ?
On my Le Potato board (GXL / S905X) FORCE_LR is either enabled by the
bootloader or being enabled is the default value.
All versions of the vendor driver are also setting it in some way,
including the latest one that I have access to [0].
I prefer to keep this explicit write in for two reasons:
- we're not hit by surprise if some SoC/bootloaders don't set this bit
by default
- the code in the mainline does not skip anything that the vendor driver does

To specifically answer your question: I have not tried whether this
bit needs to be set and if unsetting it manually breaks anything.

> > This fixes the infamous and
> > long-standing "machine gun noise" issue (a buffer underrun issue).
>
> Well done ! It took us a while to nail it, Thanks a lot !!
Thanks - this took a while to figure out but it's great to finally
have it solved!


Best regards,
Martin


[0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/sound/soc/amlogic/meson/audio_hw.c#L194:L202
