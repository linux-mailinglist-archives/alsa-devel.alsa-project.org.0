Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936511B8F94
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 13:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 194F61679;
	Sun, 26 Apr 2020 13:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 194F61679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587902009;
	bh=AWoYuR4X5whFyYcZ1s0kxk8t6Foa/hY7aecQnScM2l8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hmGQgpgxtUwzQPVIDNNg8qx73iNZJ+NT0daXPMBYVgyitcmK8LxN3eBOCfYdS+/nL
	 TCOyS7PmbFEY/1z9rC9VSLEtcbqOt2I2+Gaw3pd7Cnl1VmDis9lu5ezqf/1ppOxGGz
	 R3xmkgj6awtnmkHvDmS3Z6FCNz/WaKT298Ux+zdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04C29F80105;
	Sun, 26 Apr 2020 13:51:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833A5F801DB; Sun, 26 Apr 2020 13:51:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60F45F80113
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 13:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F45F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DxAhqJJ/"
Received: by mail-io1-xd41.google.com with SMTP id b12so15745134ion.8
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 04:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zzsgb0bSas/OG7O+OpGibPBYKUg7XSUZ1PjoBegHMxc=;
 b=DxAhqJJ/wQgFg6ol8/V/EbSESD9xxzG/GvqGW5TNxf5CI7dpnx/S2VKRj9wUtueIBV
 3mDmrZBjRzWztKSMmg+fkEVqU63CPy4S13gNdFfhkb8lkOByaay629I6VMGYG9snKt8u
 l5q3vM+e8+mFhbz0EFQQD810W+W7HUO+l9PnDlcXfeHD8pmg5UyrhaRG5rA5uIdErs2U
 d8TbZRSuC93nK0UTrKJbPlNAqcLfL3pJdoGstSmHRcz0qNxh3+RRVs+Cls5dNi1/aaPy
 6GjieOKiHsSoDg111lXJmfV38HDdh0SkvnjaqBxb60YPs4oT648UMCI/KI1EhHtJEwbp
 kTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zzsgb0bSas/OG7O+OpGibPBYKUg7XSUZ1PjoBegHMxc=;
 b=soXkcen2IbCL4gzsDiFwRB1euJ2gogEFvsKg72figtZdZJ1YkPCrvQpRd6cF3JT3Hp
 FDXCNp5C7X9Bwe3JnHIEycySSVS8Gv1n5Tm61wno32Z0xgYLtlRNLrAlGXwzpFuYE+3o
 v3E+sPt5z0jnMJAVrqUnPDNTNt7eg5OMrps3LZAIwE6uvu/2kidPT82vcHTM0FeJppHQ
 mWGcs2XqJAL0IhmQRIhMbZv78SEYxeQCevpjL5nufLDsLn3MeGv6mdpanvkS6B36hqRQ
 wwtWWCb0QKXAYzNxTB6rgsRDEUY4TqAtWXjimZzHb5XGXfvhcX+pDoCwd+ciosgQ1ZzQ
 r09A==
X-Gm-Message-State: AGi0PuZ/S5f474gObslyf3w9j1jKaZOKvDiBSsZqQJovFdsfOBF3iLU+
 9o0HzpUFttq2eBXADXl8z4C/2iMtPeNj9JwWc6k=
X-Google-Smtp-Source: APiQypKq7oXcr9IeMjM8MZxjatFWiOsSh24aUP+LwC+13d1DBgzun3vwOHINHuAmcSK9qbROS4jgfWwkk4wJsA7yiA0=
X-Received: by 2002:a05:6602:2fcd:: with SMTP id
 v13mr16297176iow.124.1587901890849; 
 Sun, 26 Apr 2020 04:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-8-peron.clem@gmail.com>
In-Reply-To: <20200426104115.22630-8-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 26 Apr 2020 13:51:19 +0200
Message-ID: <CAJiuCcfkk3huywjBcHqfCimEXzH2iX=MYriWyhfrKWX47C=CvA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>,
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

Hi,

On Sun, 26 Apr 2020 at 12:41, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> Add a simple-soundcard to link audio between HDMI and I2S.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index a5ee68388bd3..558fe63739cb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -88,6 +88,24 @@
>                         (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>         };
>
> +       sound_hdmi: sound {

I will rename this to
hdmi_sound: hdmi-sound {

in the next version

> +               compatible =3D "simple-audio-card";
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,name =3D "allwinner-hdmi";
> +               simple-audio-card,mclk-fs =3D <128>;
> +               simple-audio-card,frame-inversion;

And I will add a status=3D"disabled" here as not all board have an hdmi con=
nector

Regards,
Clement

> +
> +               simple-audio-card,codec {
> +                       sound-dai =3D <&hdmi>;
> +               };
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&i2s1>;
> +                       dai-tdm-slot-num =3D <2>;
> +                       dai-tdm-slot-width =3D <32>;
> +               };
> +       };
> +
>         soc {
>                 compatible =3D "simple-bus";
>                 #address-cells =3D <1>;
> @@ -581,6 +599,18 @@
>                         };
>                 };
>
> +               i2s1: i2s@5091000 {
> +                       #sound-dai-cells =3D <0>;
> +                       compatible =3D "allwinner,sun50i-h6-i2s";
> +                       reg =3D <0x05091000 0x1000>;
> +                       interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>;
> +                       clock-names =3D "apb", "mod";
> +                       dmas =3D <&dma 4>, <&dma 4>;
> +                       resets =3D <&ccu RST_BUS_I2S1>;
> +                       dma-names =3D "rx", "tx";
> +               };
> +
>                 spdif: spdif@5093000 {
>                         #sound-dai-cells =3D <0>;
>                         compatible =3D "allwinner,sun50i-h6-spdif";
> @@ -711,6 +741,7 @@
>                 };
>
>                 hdmi: hdmi@6000000 {
> +                       #sound-dai-cells =3D <0>;
>                         compatible =3D "allwinner,sun50i-h6-dw-hdmi";
>                         reg =3D <0x06000000 0x10000>;
>                         reg-io-width =3D <1>;
> --
> 2.20.1
>
