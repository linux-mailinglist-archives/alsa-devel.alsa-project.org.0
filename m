Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265561BC17B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 16:38:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CB501690;
	Tue, 28 Apr 2020 16:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CB501690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588084736;
	bh=Dmex3LDQcneY4J/M3ShTQVtfi+xtbHgPNK20/B0dRUA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uhQN+H/90oq+psakhKR8nanjjNiT1uITRLBs+9BPjRxoCpSfgMtZAirjFicLPLzPT
	 80yInvf9Bteh71AeEeOk2c84VjZ3ZR5LwrPrdUWmxVTyzfQVk7FBrVqZarbwU9kAbg
	 At+Y2qEB0l2uJ5o+K6H/p7UVrN54FyX3AB8qliH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CADF800D2;
	Tue, 28 Apr 2020 16:37:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90C13F801DB; Tue, 28 Apr 2020 16:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CDDAF800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 16:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CDDAF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FwnL/1+A"
Received: by mail-io1-xd44.google.com with SMTP id 19so23008412ioz.10
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VPA9Kxr39ERnqwIoc2UJSAp5IoBA3dbxr68iA+juyP0=;
 b=FwnL/1+AgacLVrzfCLrLz36o10+EmBtDT+Vx71m9oQ+I8Ep9EruaY8kVJkEYTxwWXr
 9mOoV34Me4r25FtQL4YIVI1WVIVyNTGJK3zSm5wkSCPHE+jnDdwe8NCx9Zz/Iyqozj4x
 Ru/LBFO5YLFEmUqcxt3LPB/c+vkH0Gq2GNhQFwD/3Om8Pufxq/LBJGmYKrJI2cgyygFA
 /KDRbpoVEG3SaE2JJ1Sl/nF5C1H4Disv6rZrIdh6EUgw/R53UwhrWWCzxwA8WJVh/hUy
 JPoJ0VP1t3RZs7VoNBMzXnRTP2nnt1Cw16eNbJ98uAjMlPANVBDzEt5854f2gIwdTT4i
 c67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VPA9Kxr39ERnqwIoc2UJSAp5IoBA3dbxr68iA+juyP0=;
 b=PDcbotAid89Etg9Fg9947dggYua5DjxcBvPrZPMGShg6nWH1k7B+z+Mrp6W79N/TXZ
 UnLLe+wrhh6iYfqQKfD4PChwSdrWyDdnu5SFn3UTj/qsg/Bm2bjg2HZUSBk+rLdfPhtp
 eD9dWJKYk3UCuQzOSmGqWVxH3pMcZwMbM32R42L/T92gSu3WZ5fJF0ro9thGo7vKjyKO
 wwm1J3dphXnTv87tnliFrwxbs8XWvjEqMEEIztrPLonV04cMbACcpP321K9SWDcZf/sY
 dmWdrxJDw6DoOQajdrl3MvOCYBQfAkWqDrZSnMl/BH5/h0uPTWrGK1TbW5SUiKKlg6Kg
 6uwg==
X-Gm-Message-State: AGi0PubfRonDLwim+LggSn6pTZwlFhdF1tfD9B/zatkPdkOnQ6LxYuSy
 b4MDXHzPBdXVOqESsDyACMaLOOkB87NjkF1u5BM=
X-Google-Smtp-Source: APiQypJWKcOZwolIsn7a73yc4aMqWx+mk2KAdEK/HRRLB/AFX92WYN4FJ4pKWxX8TsolxV933sbSRmnXvsBuyeUoSoo=
X-Received: by 2002:a5d:84d4:: with SMTP id z20mr15044943ior.36.1588084601133; 
 Tue, 28 Apr 2020 07:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-8-peron.clem@gmail.com>
 <20200428081444.vddwswsorl5tf7yp@gilmour.lan>
In-Reply-To: <20200428081444.vddwswsorl5tf7yp@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 28 Apr 2020 16:36:30 +0200
Message-ID: <CAJiuCcf6xzB+HhV4GSOuawi3FJDeA4dvHXkKMV36+UF8gLLj7w@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI
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

On Tue, 28 Apr 2020 at 10:14, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sun, Apr 26, 2020 at 12:41:15PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > Add a simple-soundcard to link audio between HDMI and I2S.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 31 ++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index a5ee68388bd3..558fe63739cb 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -88,6 +88,24 @@
> >                       (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> >       };
> >
> > +     sound_hdmi: sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,name =3D "allwinner-hdmi";
>
> It doesn't seem to be on purpose, but the name is different from the othe=
r
> series you sent.

Indeed, I have sent this serie before looking at the other.

I will change this to keep coherency, once we agree on the correct card nam=
e.

Thanks for the review,
Clement

>
> Maxime
