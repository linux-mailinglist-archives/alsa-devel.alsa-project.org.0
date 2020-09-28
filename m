Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73C27A701
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B471B0C;
	Mon, 28 Sep 2020 07:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B471B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601271253;
	bh=V86dJEP00fotffkmXA8pZU/aW4Vg3Gihtx1gb+desn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knQUmKFM3/B/aVy02sYFMW3trSl/2PkeDgUOwIBuxVmrc9HrFmbxaW6EBm9QIHOmr
	 dQWpp14f8apXNA/lo3NCJSJRsAd2zkgRQpUvcdCEfPjaG3ATRBgwT3+9kGiWZZKGAX
	 /r0v+/RQWkYhQNF5s/r1nk52McIoT2MEhXIYj74I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0D21F801ED;
	Mon, 28 Sep 2020 07:32:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A38FAF801F9; Mon, 28 Sep 2020 07:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE963F800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE963F800DF
Received: by mail-lj1-f196.google.com with SMTP id y4so7223173ljk.8
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phlxL4gdu7otO3M0yS2hHFofM05cgFHXHWsfvHe5FGc=;
 b=pioAx8sjUfczofSJruF/Zi+Kgk4lLMeJx8Yrh68YS46st/a200ewqBcg2JMmEfpUwT
 5bmZ937XyGDZ2dZFUEbkdYKn5K5aARKfjpaGA4cPo2FGRsYtGoTpyajTFYzAFGNczBP5
 1trVOMQwWgRIksOapkrvrDsX6y71IEu3cScG5K9Q3h5NtYxOz409sxaeVjaPgIgJE4I4
 hUi6NjOrFI5/6vAD8VStk6zSB1Jgc3w80FSFRn/R3VlGvQCcFTkNDnjKb55yUcQc5d+t
 680T/MjrzT7UeUKDTfFhDoBJ7n3TGbSMQazn/cT+efTXNPRs6H/uBYddsUVPYChdiVDK
 Xadg==
X-Gm-Message-State: AOAM5304CulKLv/Dihz/6mU6EfveE6LFkcv4jLgjRyHq4mA/k2gZQqnw
 E51076BFLEUpg7rYDauWut/auXPO8Xgq/w==
X-Google-Smtp-Source: ABdhPJy94X3wX7Tyde2+p+EASaFyjulHKYdSAIpuSmezSh4ZN0/aYsNJvGyyiw9MMP+5MkzOEq4o0Q==
X-Received: by 2002:a2e:86d7:: with SMTP id n23mr4174200ljj.105.1601271136305; 
 Sun, 27 Sep 2020 22:32:16 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id s13sm2654289lfd.286.2020.09.27.22.32.15
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 22:32:15 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 77so9632647lfj.0
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:32:15 -0700 (PDT)
X-Received: by 2002:a19:383:: with SMTP id 125mr3418787lfd.356.1601271135695; 
 Sun, 27 Sep 2020 22:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-10-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-10-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 13:32:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
Message-ID: <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 09/20] arm64: dts: allwinner: h6: Add DAI
 node and soundcard for HDMI
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
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

On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> Add the I2S node used by the HDMI and a simple-soundcard to
> link audio between HDMI and I2S.
>
> Note that the HDMI codec requires an inverted frame clock and
> a fixed I2S width. As there is no such option for I2S we use
> TDM property of the simple-soundcard to do that.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 28c77d6872f6..a8853ee7885a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -67,6 +67,25 @@ de: display-engine {
>                 status =3D "disabled";
>         };
>
> +       hdmi_sound: hdmi-sound {
> +               compatible =3D "simple-audio-card";
> +               simple-audio-card,format =3D "i2s";
> +               simple-audio-card,name =3D "sun50i-h6-hdmi";
> +               simple-audio-card,mclk-fs =3D <128>;
> +               simple-audio-card,frame-inversion;
> +               status =3D "disabled";
> +
> +               simple-audio-card,codec {
> +                       sound-dai =3D <&hdmi>;
> +               };
> +
> +               simple-audio-card,cpu {
> +                       sound-dai =3D <&i2s1>;
> +                       dai-tdm-slot-num =3D <2>;

Doesn't this end up limiting the number of audio channels HDMI can carry?
AFAICT the TDM properties are all optional, so just leave it out.

Same goes for the other two patches.

> +                       dai-tdm-slot-width =3D <32>;
> +               };
> +       };
> +
>         osc24M: osc24M_clk {
>                 #clock-cells =3D <0>;
>                 compatible =3D "fixed-clock";
> @@ -609,6 +628,19 @@ mdio: mdio {
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
> +                       status =3D "disabled";
> +               };
> +
>                 spdif: spdif@5093000 {
>                         #sound-dai-cells =3D <0>;
>                         compatible =3D "allwinner,sun50i-h6-spdif";
> @@ -739,6 +771,7 @@ ohci3: usb@5311400 {
>                 };
>
>                 hdmi: hdmi@6000000 {
> +                       #sound-dai-cells =3D <0>;
>                         compatible =3D "allwinner,sun50i-h6-dw-hdmi";
>                         reg =3D <0x06000000 0x10000>;
>                         reg-io-width =3D <1>;

The rest of the patch looks OK.
