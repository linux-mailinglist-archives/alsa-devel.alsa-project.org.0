Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811D27A707
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A623F1DAD;
	Mon, 28 Sep 2020 07:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A623F1DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601271858;
	bh=vhcQrUsinXVWPSqJyuZbgrOOBKUU0ax+W8EPP9g7Utw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HekAenfUtiWu8y7QFPnu6y+A8CQhaoMXkZfMUVBU5ALsIs9+UxG9F2iDeAocaiL4Z
	 vIGR67WgqhBGEGWkzS4iS3SIPg+BfS/B7O2TxQI18nNFxmm9ekccBYHGIlf2/Ol5VH
	 ZRIQo3XUm5B122VQAGUxYLOhQX18rHLx1fGFwuqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F9FF801F9;
	Mon, 28 Sep 2020 07:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EEFF801F9; Mon, 28 Sep 2020 07:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9671AF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9671AF800DF
Received: by mail-lf1-f67.google.com with SMTP id m5so9635867lfp.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=62VVtrR40xPsUderogAnod9rxvj1xY9G9jJZfGS80Yo=;
 b=kVJTk79OtlaD+aHnuUjORV8gMcozuEZK6+qGTZemmC373BtOpMekGOH1jhuFHCr1b5
 k57AFdGF7T9gA/KySgQdK0+7O3WaN+oEDKIHC/2v2oK17r/I/qjUigObpRGHB745Dilk
 BT1WPPWz/Ua8jNZt8a5PhqI//qVypLdOLCaycHfOF7Gl9HKv5JuzJLMxJGfvU6dpSbQj
 Q8oGwG2LoP2I3q2L+phoJDKhlgO2EuN3unj3iUBO7GkNOSMMIlVZ2yVF0+Osupr2Xh3Y
 i/aX79zouItrlCvRydvOAyTVcqE8s5ePQcphx06Fza0Fno13k6MTmEn7NorRxs7qqSbI
 hGmg==
X-Gm-Message-State: AOAM5308ba1VBZAc60BKDrCF+lDT50+R6gooQmO4tOTkALvDvAmTIEO3
 w1D+LqR5C6W9ca80IFFRqmd5eo8lxZfpSA==
X-Google-Smtp-Source: ABdhPJyb3bJhfjUhpc9UUBlD5wYbKM5wG8xpmk22kceerUX4yk7zGbImSzl1uwPOS9VSxrpMXwScfQ==
X-Received: by 2002:ac2:489c:: with SMTP id x28mr3614819lfc.544.1601271742605; 
 Sun, 27 Sep 2020 22:42:22 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51])
 by smtp.gmail.com with ESMTPSA id l10sm2725027lfg.142.2020.09.27.22.42.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 22:42:22 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id b22so9602448lfs.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:42:22 -0700 (PDT)
X-Received: by 2002:a19:c6c8:: with SMTP id w191mr2928439lff.348.1601271742080; 
 Sun, 27 Sep 2020 22:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-10-peron.clem@gmail.com>
 <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
In-Reply-To: <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 13:42:10 +0800
X-Gmail-Original-Message-ID: <CAGb2v64U9b1Ayq-XNCHb3z6spsds6eDaz3C4EsV9xFOquHrB7w@mail.gmail.com>
Message-ID: <CAGb2v64U9b1Ayq-XNCHb3z6spsds6eDaz3C4EsV9xFOquHrB7w@mail.gmail.com>
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

On Mon, Sep 28, 2020 at 1:32 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > Add the I2S node used by the HDMI and a simple-soundcard to
> > link audio between HDMI and I2S.
> >
> > Note that the HDMI codec requires an inverted frame clock and
> > a fixed I2S width. As there is no such option for I2S we use
> > TDM property of the simple-soundcard to do that.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 28c77d6872f6..a8853ee7885a 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -67,6 +67,25 @@ de: display-engine {
> >                 status =3D "disabled";
> >         };
> >
> > +       hdmi_sound: hdmi-sound {
> > +               compatible =3D "simple-audio-card";
> > +               simple-audio-card,format =3D "i2s";
> > +               simple-audio-card,name =3D "sun50i-h6-hdmi";
> > +               simple-audio-card,mclk-fs =3D <128>;
> > +               simple-audio-card,frame-inversion;
> > +               status =3D "disabled";
> > +
> > +               simple-audio-card,codec {
> > +                       sound-dai =3D <&hdmi>;
> > +               };
> > +
> > +               simple-audio-card,cpu {
> > +                       sound-dai =3D <&i2s1>;
> > +                       dai-tdm-slot-num =3D <2>;
>
> Doesn't this end up limiting the number of audio channels HDMI can carry?
> AFAICT the TDM properties are all optional, so just leave it out.
>
> Same goes for the other two patches.
>
> > +                       dai-tdm-slot-width =3D <32>;
> > +               };
> > +       };
> > +
> >         osc24M: osc24M_clk {
> >                 #clock-cells =3D <0>;
> >                 compatible =3D "fixed-clock";
> > @@ -609,6 +628,19 @@ mdio: mdio {
> >                         };
> >                 };
> >
> > +               i2s1: i2s@5091000 {
> > +                       #sound-dai-cells =3D <0>;
> > +                       compatible =3D "allwinner,sun50i-h6-i2s";
> > +                       reg =3D <0x05091000 0x1000>;
> > +                       interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>=
;
> > +                       clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S1>=
;
> > +                       clock-names =3D "apb", "mod";
> > +                       dmas =3D <&dma 4>, <&dma 4>;
> > +                       resets =3D <&ccu RST_BUS_I2S1>;
> > +                       dma-names =3D "rx", "tx";

Sorry, missed this one.

Given that usage for this interface is transmit only, and there is no
RX DRQ number assigned to it, you should drop the RX DMA number and name.

> > +                       status =3D "disabled";
> > +               };
> > +
> >                 spdif: spdif@5093000 {
> >                         #sound-dai-cells =3D <0>;
> >                         compatible =3D "allwinner,sun50i-h6-spdif";
> > @@ -739,6 +771,7 @@ ohci3: usb@5311400 {
> >                 };
> >
> >                 hdmi: hdmi@6000000 {
> > +                       #sound-dai-cells =3D <0>;
> >                         compatible =3D "allwinner,sun50i-h6-dw-hdmi";
> >                         reg =3D <0x06000000 0x10000>;
> >                         reg-io-width =3D <1>;
>
> The rest of the patch looks OK.
