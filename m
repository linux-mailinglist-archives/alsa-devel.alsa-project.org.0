Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC8271454
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 14:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AA611683;
	Sun, 20 Sep 2020 14:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AA611683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600605639;
	bh=PdMyXsaH0YkG61SmB69PGGiSLBfvSVtVQw+2PDGbmqo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DI3rmZqIoa+ZK2j0oRZsvMTqbwNlvcmHWMOc+6X9YR3sZwNndV7nsyed2hzFchxsU
	 4z6B6qbbxV4W8hCQlCokwXShblB8LzKFg0ER5GjokHe+INBTR6aG/ccp5RdBWX7SMa
	 wgm8kCdEUAujcWY7Dr4MEBKCcC00eN6QUyT/Zm/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B79CF80229;
	Sun, 20 Sep 2020 14:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43EFCF80232; Sun, 20 Sep 2020 14:38:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A48F801EC
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 14:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A48F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zq+i9zAb"
Received: by mail-io1-xd44.google.com with SMTP id z25so12408552iol.10
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 05:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7yLC45oNPBKamsN5IPYHoKjdcmeugfCFnTTGzw/Mp7k=;
 b=Zq+i9zAbfyWQfSJr9OKDJifsxf3ndrkd5j44FWFcFw/Gmr1KeQdT8BMHR/9Buq0lvq
 Re9hE/hHEr6qlUlqI8PPwM+hCdLzTUREY2ROmHSm7xpyb0UT9XVJJ9ktPI29FsvUbQCd
 ZhAoYeoLInbl9H1KtclMlfY6fF1wx1lZ6dMSG5zoV4FB/HJd0tTL1jix9AjJ+GKgPYHG
 +NZaufQcn176FB/emFwPzkEfgB1g5o+PyR7Sk8N6QoHUC2sesVF8fMmj+tM9N6W4QFke
 omKqKMy1y1qQ8/oaC4RiY56moUZbSAsd1LyoQ07tvvsDoXrlRiPZ7o9mxgneHWiIOcA6
 u03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7yLC45oNPBKamsN5IPYHoKjdcmeugfCFnTTGzw/Mp7k=;
 b=GnPrxtfA905paGu8AKVJ3MaYeyDP5IrxilMxXS+2qdgdK5wqRI9G6TqT82/0vH6h/G
 rUXQmpxQ5XVHSf4hmDqieoSfM0CnTbtW4WQmv1bchOdQLE6YlFOGj99RlhSTSj5kJwKt
 i2nuYzJ6UrWibJVofJk8YPRTCW5qusHfVk7jgbDhbEQJImADRTMFr4uJxr2BWwOWb5mD
 jQl3sGNtAfEeOaecYQAb94BizoCLvZ9Hem3MisjDCvWhld+lisaySKLoeJjoKg3Ffl5v
 iPe3VyGFRkp2KzFvg4+59FPQlkJbrC3FdiGbY/Yrs/4/ZFeG92gPgZVyOopkHvuNj9Nb
 ZgIA==
X-Gm-Message-State: AOAM532lK35JbukmjNXx8r+bMlRlf7WA0xVpTn5JhGGzqQjdEgkknlHh
 ErWq/N03kQv8PQ5fUAzXJPeIDiqxtocmEgsY6j8=
X-Google-Smtp-Source: ABdhPJx3H7Q7/haYuNT6KsqJc7+aVqi2qaAKhZ/jyoP4KWhJYrllhDu11AA7rHaFz6tJ3aBBOB1B2vhVFwxHJf0xZK8=
X-Received: by 2002:a05:6638:168c:: with SMTP id
 f12mr36462448jat.16.1600605519510; 
 Sun, 20 Sep 2020 05:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
 <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
 <20200729151548.GB5612@sirena.org.uk>
 <CAJiuCcdf=TNLPTUPzHP9NzPHqdxG06TRDkQfONY+ScK0DV_v5w@mail.gmail.com>
 <20200903205851.gdnpthserywsxrbs@gilmour.lan>
 <80b5a4e3-c8bc-9521-4ff1-12bb6424516f@sholland.org>
 <20200910143314.qku7po6htiiq5lzf@gilmour.lan>
 <57f8bdeb-14dc-583e-ffa8-43d7a9f1bb24@sholland.org>
 <20200917132128.e6z4gwoluipbzigm@gilmour.lan>
 <CAJiuCcdWQRVMeTLvxibZ37CF9BMiC_L2bWBDiin2Uz0CWq2FuQ@mail.gmail.com>
 <20200917140611.5qpsz24yfii5kzcn@gilmour.lan>
In-Reply-To: <20200917140611.5qpsz24yfii5kzcn@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 20 Sep 2020 14:38:28 +0200
Message-ID: <CAJiuCcfnXH44sBu6659Misvfxrrj2ZDmLmU5sABMwdrBBYd1Lg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
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

On Thu, 17 Sep 2020 at 16:06, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Clement,
>
> On Thu, Sep 17, 2020 at 03:55:45PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Maxime and Samuel,
> >
> > On Thu, 17 Sep 2020 at 15:21, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Sep 12, 2020 at 03:29:55PM -0500, Samuel Holland wrote:
> > > > On 9/10/20 9:33 AM, Maxime Ripard wrote:
> > > > > On Thu, Sep 03, 2020 at 09:54:39PM -0500, Samuel Holland wrote:
> > > > >> On 9/3/20 3:58 PM, Maxime Ripard wrote:
> > > > >>> On Thu, Sep 03, 2020 at 10:02:31PM +0200, Cl=C3=A9ment P=C3=A9r=
on wrote:
> > > > >>>> Hi Maxime,
> > > > >>>>
> > > > >>>> On Wed, 29 Jul 2020 at 17:16, Mark Brown <broonie@kernel.org> =
wrote:
> > > > >>>>>
> > > > >>>>> On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote=
:
> > > > >>>>>
> > > > >>>>>> It really looks like the polarity of LRCK is fine though. Th=
e first word
> > > > >>>>>> is sent with LRCK low, and then high, so we have channel 0 a=
nd then
> > > > >>>>>> channel 1 which seems to be the proper ordering?
> > > > >>
> > > > >> Which image file is this in reference to?
> > > > >>
> > > > >>>>> Yes, that's normal.
> > > > >>>>
> > > > >>>> Thank you very much for this test.
> > > > >>>>
> > > > >>>> So I will revert the following commit:
> > > > >>>>
> > > > >>>> ASoC: sun4i-i2s: Fix the LRCK polarity
> > > > >>>>
> > > > >>>> https://github.com/clementperon/linux/commit/dd657eae8164f7e4b=
afe8b875031a7c6c50646a9
> > > > >>>
> > > > >>> Like I said, the current code is working as expected with regar=
d to the
> > > > >>> LRCK polarity. The issue is that the samples are delayed and st=
art to be
> > > > >>> transmitted on the wrong phase of the signal.
> > > > >>
> > > > >> Since an I2S LRCK frame is radially symmetric, "wrong phase" and=
 "inverted
> > > > >> polarity" look the same. The only way to definitively distinguis=
h them is by
> > > > >> looking at the sample data.
> > > > >>
> > > > >> In "i2s-h6.png", the samples are all zeroes, so you're assuming =
that the first
> > > > >> sample transmitted (that is, when the bit clock starts transitio=
ning) was a
> > > > >> "left" sample.
> > > > >>
> > > > >> However, in "h6-i2s-start-data.png", there are pairs of samples =
we can look at.
> > > > >> I'm still assuming that similar samples are a left/right pair, b=
ut that's
> > > > >> probably a safe assumption. Here we see the first sample in each=
 pair is
> > > > >> transmitted with LRCK *high*, and the second sample in the pair =
is transmitted
> > > > >> with LRCK *low*. This is the opposite of your claim above.
> > > > >>
> > > > >> An ideal test would put left/right markers and frame numbers in =
the data
> > > > >> channel. The Python script below can generate such a file. Then =
you would know
> > > > >> how much startup delay there is, which channel the "first sample=
" came from, and
> > > > >> how each channel maps to the LRCK level.
> > > > >>
> > > > >> It would also be helpful to test DSP_A mode, where the LRCK sign=
al is
> > > > >> asymmetric and an inversion would be obvious.
> > > > >
> > > > > I had no idea that there was a wave module in Python, that's a gr=
eat
> > > > > suggestion, thanks!
> > > > >
> > > > > You'll find attached the screenshots for both the I2S and DSP_A f=
ormats.
> > > > > I zoomed out a bit to be able to have the first valid samples, bu=
t it
> > > > > should be readable.
> > > > >
> > > > > The code I used is there:
> > > > > https://github.com/mripard/linux/tree/sunxi/h6-i2s-test
> > > > >
> > > > > It's basically the v3, plus the DT bits.
> > > > >
> > > > > As you can see, in the i2s case, LRCK starts low and then goes up=
, with
> > > > > the first channel (0x2*** samples) transmitted first, so everythi=
ng
> > > > > looks right here.
> > > > >
> > > > > On the DSP_A screenshot, LRCK will be low with small bursts high,=
 and
> > > > > once again with the first channel being transmitted first, so it =
looks
> > > > > right to me too.
> > > >
> > > > Indeed, for H6 i2s0 with LRCK inversion in software, everything loo=
ks correct on
> > > > the wire.
> > > >
> > > > It's still concerning to me that the BSP has no evidence of this in=
version,
> > > > either for i2s0 or i2s1[1]. And the inversion seems not to be requi=
red for HDMI
> > > > audio on mainline either (but there could be an inversion on the HD=
MI side or on
> > > > the interconnect).
> > >
> > > One can only guess here, but it's also quite easy to fix it at the ca=
rd
> > > level (or maybe there's a similar inversion in the codecs, or whateve=
r).
> >
> > Thanks for the test and the explanation.
> >
> > Quite disturbing that there is no evidence of the LRCK inversion in
> > kernel vendor indeed...
> > Could it be an issue with the mainline code?
>
> I'm not sure what you mean here, this was tested with mainline?

Sorry i was not clear, I meant either there is an issue in the vendor
kernel that doesn't set properly the LRCK or maybe we did something or
forgot to do it that set this inversion.

But I just checked a device-tree used with a kernel vendor and indeed
codecs are inverted but not hdmi so the vendor kernel has an issue
here...

E.g this is what is used for Tanix TX6

daudio@0x05091000 {
    compatible =3D "allwinner,sunxi-tdmhdmi";
    reg =3D <0x00 0x5091000 0x00 0x74>;
    clocks =3D <0x04 0x4d>;
    status =3D "okay";
    phandle =3D <0x63>;
    device_type =3D "audiohdmi";
};

daudio@0x05092000 {
    compatible =3D "allwinner,sunxi-daudio";
    reg =3D <0x00 0x5092000 0x00 0x74>;
    clocks =3D <0x04 0x4e>;
    pinctrl-names =3D "default\0sleep";
    pinctrl-0 =3D <0x4f>;
    pinctrl-1 =3D <0x50>;
    pcm_lrck_period =3D <0x40>;
    slot_width_select =3D <0x20>;
    daudio_master =3D <0x04>;
    audio_format =3D <0x04>;
    signal_inversion =3D <0x03>;
    tdm_config =3D <0x01>;
    frametype =3D <0x00>;
    tdm_num =3D <0x02>;
    mclk_div =3D <0x01>;
    status =3D "okay";
    phandle =3D <0x65>;
    device_type =3D "daudio2";
};

daudio@0x0508f000 {
    compatible =3D "allwinner,sunxi-daudio";
    reg =3D <0x00 0x508f000 0x00 0x74>;
    clocks =3D <0x04 0x51>;
    pinctrl-names =3D "default\0sleep";
    pinctrl-0 =3D <0x52>;
    pinctrl-1 =3D <0x53>;
    pcm_lrck_period =3D <0x20>;
    slot_width_select =3D <0x20>;
    daudio_master =3D <0x04>;
    audio_format =3D <0x01>;
    signal_inversion =3D <0x01>;
    tdm_config =3D <0x01>;
    frametype =3D <0x00>;
    tdm_num =3D <0x03>;
    mclk_div =3D <0x01>;
    status =3D "okay";
    phandle =3D <0x67>;
    device_type =3D "daudio3";
};

Clement


>
> Maxime
