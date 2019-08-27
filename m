Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492F9E5B2
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 12:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD6E1667;
	Tue, 27 Aug 2019 12:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD6E1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566901829;
	bh=JiLNjLRs//uGscNdsh3VZMx50WAEJ1oTQYhrzs7RU1M=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcblhvqNCx110SnuRKjUvNrab+mCHigs2CvQzgtK18LzVFqhzxMrSOgZDIowIBjIL
	 C6XX7JNaK9ik4wMR52R9djD9QGiLrdthCO6rr9vAKTZCh/agEEPxGyvXl7y7oe/FLA
	 nj9GlhXaslxyG7qbjis/SmEqF+v6jJqq6YxJyIUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 069C0F802BE;
	Tue, 27 Aug 2019 12:28:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E88CF80274; Tue, 27 Aug 2019 12:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1603CF800E7
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 12:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1603CF800E7
Received: by mail-ed1-f68.google.com with SMTP id z51so30620171edz.13
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 03:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hpmMfEcW04e4wPdBKLOA6yCkiTAFKCBRUZkT3TMGsjY=;
 b=pPAAKON5DhWG/NDnyyFkBZqyfnxf8coF4CSWvA9dlP+08foA5o/63d8BDoeSDe3sZi
 gshJgNbTh6cqAoXlPbhEyRfixyqNHmUdIEq4cRAHhx9KvOsDNFB6UxJ+yAUBM5xq7H5h
 4zunHlyOw0C8rs/q3lwqV7R9FQdvEPT7v8gH2mhjLYzIybAu43WSfeP03ytx/T1Vq6Bp
 y0NuF3/foIqd1Z4zsJAWAT3+SsE5F9SfJdzJMMtcpsD6pZgV0KSUqWJqUwgTIEK8Ird8
 UKmPjOg/wcn6dfqNZ073qFBV8eTzINGwyOB9j6DCV4bVeOVKBDjc4Ztf/TtHUQsziXNj
 IIuQ==
X-Gm-Message-State: APjAAAVDj/lKCpRlitUCjC27Eszq2DQGaQMkRuF91mn2gXn2dVTcEFXO
 nISGlIx2XBO0JkT0I17P7kwtk51vcDw=
X-Google-Smtp-Source: APXvYqwaHjj3qQHH7RmhYkGj9mu3pEVhWbbd3yNY15ZkPOxT1O3gU5LOKqSO/qnPv5ZNR6XWgOwxXA==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr23270439eds.295.1566901712701; 
 Tue, 27 Aug 2019 03:28:32 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id n24sm3578398ejz.5.2019.08.27.03.28.31
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2019 03:28:32 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id p74so2497054wme.4
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 03:28:31 -0700 (PDT)
X-Received: by 2002:a1c:eb0a:: with SMTP id j10mr28275617wmh.125.1566901711153; 
 Tue, 27 Aug 2019 03:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-2-codekipper@gmail.com>
 <CAGb2v651jVp+J2eyWh7vw-yHmFTVy4eaMjHV0FvOF17C5_Hswg@mail.gmail.com>
 <CAEKpxBmCg4AkqKM-O3C76gto+mPWyEdDbviAmRJ8PxLOOMTJ7w@mail.gmail.com>
 <CAGb2v64VNZ0oyD_760uNccwJb7MKngSooWB72M+d1DfT4-djog@mail.gmail.com>
 <CAEKpxBn3g2hFaei6thAnAHX4nemrs9c_xWp1GheMfMS6+TJ7gQ@mail.gmail.com>
In-Reply-To: <CAEKpxBn3g2hFaei6thAnAHX4nemrs9c_xWp1GheMfMS6+TJ7gQ@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 27 Aug 2019 18:28:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v67MOE0bUrxO6NrObOCUO9ErknC0CNGYuk_Bs_iBwvU_DQ@mail.gmail.com>
Message-ID: <CAGb2v67MOE0bUrxO6NrObOCUO9ErknC0CNGYuk_Bs_iBwvU_DQ@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v6 1/3] ASoC: sun4i-i2s:
 incorrect regmap for A83T
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Aug 27, 2019 at 4:35 PM Code Kipper <codekipper@gmail.com> wrote:
>
> On Tue, 27 Aug 2019 at 10:01, Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Tue, Aug 27, 2019 at 1:55 PM Code Kipper <codekipper@gmail.com> wrote:
> > >
> > > On Tue, 27 Aug 2019 at 06:13, Chen-Yu Tsai <wens@csie.org> wrote:
> > > >
> > > > On Tue, Aug 27, 2019 at 2:07 AM <codekipper@gmail.com> wrote:
> > > > >
> > > > > From: Marcus Cooper <codekipper@gmail.com>
> > > > >
> > > > > The regmap configuration is set up for the legacy block on the
> > > > > A83T whereas it uses the new block with a larger register map.
> > > >
> > > > Looking at the code Allwinner previously released [1], that doesn't seem to be
> > > > the case. Keep in mind that the register map shown in the user manual is for
> > > > the TDM interface, which we don't actually support right now.
> > >
> > > Should it matter what we support right now?, the block according to the user
> > > manual shows the bigger range. I don't have a A83T device and from what I
> >
> > There are a total of four I2S controllers on the A83T. Currently three of them
> > are listed in the dtsi file, which are _not_ the one shown in the user manual.
> > The one shown is the fourth one, which is the TDM controller.
>
> The configuration for the A83T suggests that it's a mixture of old and
> new which I don't
> think is the case considering it was released around the same time as
> the H3. There
> is enough similarity between the blocks for it to still work. For
> example on the H6
> we referenced by mistake the H3 block and we still got audio (with
> only slight distortion).

The difference with the A83T here is large enough that if you play anything
it will simply stall. I already reported it as broken and Maxime has sent
fixes.

> I would suggest to validate all of the i2s blocks we need to test
> using the internal loopback
> as that will also cover capture.
>
> >
> > It's not like we haven't seen this before. IIRC the A64 also had two variants
> > of the I2S interface. The one coupled with the audio codec was different from
> > the others.
>
> Yes...but the i2s of the audio codec was documented in the audio codec
> section. I've used
> this device to ensure that I've not broken anything in the old block
> with these new changes.
>
> >
> > > gather not many users do. But the compatible for the H3 has been removed
> > > and replaced with the settings for the A83T which also has default settings in
> > > registers further up than SUNXI_RXCHMAP.
> >
> > I'll sync up with Maxime on this.
> >
> > > >
> > > > The file shows the base address as 0x01c22800, and the last defined register
> > > > is SUNXI_RXCHMAP at 0x3c.
> > > >
> > > > The I2S driver [2] also shows that it is the old register map size, but with
> > > > TX_FIFO and INT_STA swapped around. This might mean that it would need a
> > > > separate regmap_config, as the read/write callbacks need to be changed to
> > > > fit the swapped registers.
> > > >
> > > > Finally, the TDM driver [3], which matches the TDM section in the manual, shows
> > > > a larger register map.
> > > >
> > > > A83T is SUN8IW6, while SUN8IW7 refers to the H3.
> > >
> > > Since when have we trusted Allwinner code?, the TDM labelled block
> > > clearly supports
> >
> > Since they haven't listed the I2S block in the user manual, so that is what we
> > have to go by.
> >
> > The TDM section in the user manual only lists the block at 0x1c23000. The memory
> > map says DAUDIO-[012] for addresses 0x1c22000, 0x1c22400, 0x1c22800, and TDM for
> > address 0x1c23000. One would assume this meant these are somewhat different.
> >
> > > I2S. The biggest use case for this block is getting HDMI audio working
> > > on the newer
> >
> > I understand that.
> >
> > > devices(LibreELEC nightlies has a user base of over 300) and I've tested this on
> > > numerous set ups over the last couple of years.
> >
> > Tested on the H3, correct?
>
> Yes....but only with the additional changes for multi-channel with my
> LibreELEC build.
> These changes I tested on my pine64 before pushing upstream.
>
> >
> > > Failing that reverting (3e9acd7ac693: "ASoC: sun4i-i2s: Remove
> > > duplicated quirks structure")
> > > would help.
> >
> > I'll take a look. IIRC it worked with the old layout, with the two registers
> > swapped, playing standard 48 KHz / 16 bit audio when I added supported for
> > the A83T. Then again maybe the stars were perfectly aligned. At the very least
> > we could separate A83T and H3 as you suggested.

Maxime has sent a patch reverting the merger.

ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
