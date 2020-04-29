Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D71BE3F2
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 251CB1689;
	Wed, 29 Apr 2020 18:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 251CB1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588178103;
	bh=y50DCgBitWHhx0CGvNoomImelZf8QjK5ddr/H8+4TqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=em+1xiA70/kS9zqac2tstwyAm8IS7V5Y48R2iHa2GO9kbpP+9F8KN+e3hsEq4aF9S
	 KrLMY3LNJ/wwu3poIOAYUzEdOYhUa56UsHQCXOm6fP8aBitASMu0i2iNrTQZwF/1SQ
	 SN6rbCRaKPsefybZjo3HLa4FU8n+gLbjIfJI6ycM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CCEF80232;
	Wed, 29 Apr 2020 18:33:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11BFEF8022B; Wed, 29 Apr 2020 18:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF8EF800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF8EF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mc66UOQw"
Received: by mail-io1-xd42.google.com with SMTP id 19so2866992ioz.10
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xrYwlO7xNNj9fkAP9oHGsbabPQftzUzMxzOAeS45YvA=;
 b=Mc66UOQw3PSrCzfUt6SnAmBJoNfERd9Wgtuu4ajltmzI21Ad5iqV7T71c8OI9Ovx1v
 UxxzA7h0TGO5GWL2VglyGBffnr0d9cScTY/ANtdLj0LwQo17VUHpUGaHhYFzDP/1b7BU
 BfZr9vzg7bEQgtQESFGg168Xj7ZbCChxBeJCm2xCHo5xHMwqcMWh7EjbdDjwYLXpiWdZ
 WTO4n9KOYAOMQ2e2FzTKWPrQn/hqw7ZzpvEdmn8h8jKEvVkwydzGC1PJkMhEo1I34irb
 w4g4l2QH3Po8cb4YZCx2yMeR8mEoalay7vXdec9wI4PhU7O8tihJA0koPXKOOtxaarIq
 JCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xrYwlO7xNNj9fkAP9oHGsbabPQftzUzMxzOAeS45YvA=;
 b=MtNNF09bJwb6syiT3IlP0Qo80Tti4neDVhWuxvMl/GWoPvySPI/Yky+Z18rpS1JBbF
 8gvSYHv1vSi3tf1o7uar5xb7T/orFsSArD/6l6Eofay9Z6TC+NdHBZhadh/Z/6ibaOYW
 DS78BpJNTH1aCWjsAyAhDRl+eWx5Vk2EbWWFUBPMEuy7mdHI+OY4rTG/oZqciPQUQt3R
 LRlTJJdh8rjAVAJt8jopecgsn3FSEMNAW/PgePOzeCGfXGJIPMlS1ayPBs+07stcg+Gf
 lqZ6/uROBtnHvNOOgrZDRZoCO/0pas1DsndBDygqoWi5GpGzoiuPtH+7wpj5Svov2CNC
 HrkA==
X-Gm-Message-State: AGi0PuaT9xdXKsj5UynWwpYxaRoIrhxWzMH46Blag6P0fJtYV5sDdTfq
 d7WPOMQrzNinRuj5GrFOkdz3soxXpn8KUuynBvA=
X-Google-Smtp-Source: APiQypKu3/he3vcgwJi5RApDarGi5QWrtRiRJCHqu6zQTJlBLBWHScAvv0k9XsP7FCPb/0GQhJgoWCNAfwSwS562ako=
X-Received: by 2002:a05:6602:2fcd:: with SMTP id
 v13mr30928449iow.124.1588177991512; 
 Wed, 29 Apr 2020 09:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
In-Reply-To: <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 29 Apr 2020 18:33:00 +0200
Message-ID: <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Maxime,

On Wed, 29 Apr 2020 at 14:35, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Apr 28, 2020 at 10:55:47AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > > > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > > > +                              unsigned int fmt)
> > >
> > > The alignment is off here
> > >
> > > > +{
> > > > +     u32 mode, val;
> > > > +     u8 offset;
> > > > +
> > > > +     /*
> > > > +      * DAI clock polarity
> > > > +      *
> > > > +      * The setup for LRCK contradicts the datasheet, but under a
> > > > +      * scope it's clear that the LRCK polarity is reversed
> > > > +      * compared to the expected polarity on the bus.
> > > > +      */
> > >
> > > Did you check this or has it been copy-pasted?
> >
> > copy-pasted, I will check this.
>
> It's not going to be easy to do this if you only have a board with HDMI. =
If you
> can't test that easily, just remove the comment (or make it explicit that=
 you
> copy pasted it?), no comment is better than a wrong one.

I have talked with Marcus Cooper it may be able to test this this week-end.
Also this can explain why we need the "
simple-audio-card,frame-inversion;" in the device-tree.

If think this fix has been introduced by you, correct? Could you say
on which SoC did you see this issue?

Thanks
Clement

>
> Maxime
