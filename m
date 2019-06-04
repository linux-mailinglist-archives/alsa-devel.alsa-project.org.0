Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A334297
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 11:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F72168E;
	Tue,  4 Jun 2019 11:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F72168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559639089;
	bh=FMP7OM561nh1Lho07wLARAnz8rEJvxhDWNOCan61JAw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLA1COcYHbkNHMJdMpV3XCWhsEc3IRcK3vWr7OMezrZHbsM9CxDgeYcLcPrWsRvv1
	 EN+GqFTzK4o6OWuujs/cN2GW/X6X69pXZrJGQyx+cB7aceUHL91ujxl4+Ldr49cXva
	 ZMf7HaIXWYpjCyoZk23QlW3Z35HdN6tAyfWZ7514=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A086F896EF;
	Tue,  4 Jun 2019 11:03:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02520F896F7; Tue,  4 Jun 2019 11:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from web2.default.djames.uk0.bigv.io
 (web2.default.djames.uk0.bigv.io [IPv6:2001:41c8:51:1f6::246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5FE3F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 11:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5FE3F89673
Received: from mail-it1-f178.google.com ([209.85.166.178])
 by web2.default.djames.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <chris@64studio.com>) id 1hY5LM-00007e-3w
 for alsa-devel@alsa-project.org; Tue, 04 Jun 2019 10:02:56 +0100
Received: by mail-it1-f178.google.com with SMTP id n189so12698906itd.0
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 02:02:56 -0700 (PDT)
X-Gm-Message-State: APjAAAX4/lbfgVLChlEfFM7ycfwoQ0pf/1qbDA5kRi2/wErnQ3wViXLm
 siegAqB2FeGPHhtvw2Z3pQcrEVehTnJ81FP8yjc=
X-Google-Smtp-Source: APXvYqy5fOqmW1LpJnYMNhUIlz6rmDEGpblhX6WaThh9eDcSVUboO20xGeWQwLkQRBSt8dunKGmdzQEmWj26Bi7ROz8=
X-Received: by 2002:a02:a493:: with SMTP id d19mr16646745jam.22.1559638974496; 
 Tue, 04 Jun 2019 02:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190603174735.21002-1-codekipper@gmail.com>
 <20190603174735.21002-7-codekipper@gmail.com>
 <20190604075840.kquy3zcuckuzmvzr@flea>
 <CAEKpxB=RdYF9eEvAJ+R7sT6OtdtBWjhMM1am+EhaN=9ZO9Gd2A@mail.gmail.com>
In-Reply-To: <CAEKpxB=RdYF9eEvAJ+R7sT6OtdtBWjhMM1am+EhaN=9ZO9Gd2A@mail.gmail.com>
From: Christopher Obbard <chris@64studio.com>
Date: Tue, 4 Jun 2019 10:02:59 +0100
X-Gmail-Original-Message-ID: <CAP03XepJVPge5sz4WcmK8pp2jHAPJdGb6v6A3R0DzSf5O6qj-g@mail.gmail.com>
Message-ID: <CAP03XepJVPge5sz4WcmK8pp2jHAPJdGb6v6A3R0DzSf5O6qj-g@mail.gmail.com>
To: Code Kipper <codekipper@gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] Re: [PATCH v4 6/9] ASoC: sun4i-i2s:
	Add multi-lane functionality
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

On Tue, 4 Jun 2019 at 09:43, Code Kipper <codekipper@gmail.com> wrote:
>
> On Tue, 4 Jun 2019 at 09:58, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Mon, Jun 03, 2019 at 07:47:32PM +0200, codekipper@gmail.com wrote:
> > > From: Marcus Cooper <codekipper@gmail.com>
> > >
> > > The i2s block supports multi-lane i2s output however this functionality
> > > is only possible in earlier SoCs where the pins are exposed and for
> > > the i2s block used for HDMI audio on the later SoCs.
> > >
> > > To enable this functionality, an optional property has been added to
> > > the bindings.
> > >
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> >
> > I'd like to have Mark's input on this, but I'm really worried about
> > the interaction with the proper TDM support.
> >
> > Our fundamental issue is that the controller can have up to 8
> > channels, but either on 4 lines (instead of 1), or 8 channels on 1
> > (like proper TDM) (or any combination between the two, but that should
> > be pretty rare).
>
> I understand...maybe the TDM needs to be extended to support this to consider
> channel mapping and multiple transfer lines. I was thinking about the later when
> someone was requesting support on IIRC a while ago, I thought masking might
> of been a solution. These can wait as the only consumer at the moment is
> LibreELEC and we can patch it there.

Hi Marcus,

FWIW, the TI McASP driver has support for TDM & (i think?) multiple
transfer lines which are called serializers.
Maybe this can help with inspiration?
see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/ti/davinci-mcasp.c
sample DTS:

&mcasp0 {
    #sound-dai-cells = <0>;
    status = "okay";
    pinctrl-names = "default";
    pinctrl-0 = <&mcasp0_pins>;

    op-mode = <0>;
    tdm-slots = <8>;
    serial-dir = <
        2 0 1 0
        0 0 0 0
        0 0 0 0
        0 0 0 0
    >;
    tx-num-evt = <1>;
    rx-num-evt = <1>;
};


Cheers!

> Do you have any ideas Master?
> CK
> >
> > You're trying to do the first one, and I'm trying to do the second one.
> >
> > There's a number of assumptions later on that will break the TDM case,
> > see below for examples
> >
> > > ---
> > >  sound/soc/sunxi/sun4i-i2s.c | 44 ++++++++++++++++++++++++++++++++-----
> > >  1 file changed, 39 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > > index bca73b3c0d74..75217fb52bfa 100644
> > > --- a/sound/soc/sunxi/sun4i-i2s.c
> > > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > > @@ -23,7 +23,7 @@
> > >
> > >  #define SUN4I_I2S_CTRL_REG           0x00
> > >  #define SUN4I_I2S_CTRL_SDO_EN_MASK           GENMASK(11, 8)
> > > -#define SUN4I_I2S_CTRL_SDO_EN(sdo)                   BIT(8 + (sdo))
> > > +#define SUN4I_I2S_CTRL_SDO_EN(lines)         (((1 << lines) - 1) << 8)
> > >  #define SUN4I_I2S_CTRL_MODE_MASK             BIT(5)
> > >  #define SUN4I_I2S_CTRL_MODE_SLAVE                    (1 << 5)
> > >  #define SUN4I_I2S_CTRL_MODE_MASTER                   (0 << 5)
> > > @@ -355,14 +355,23 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> > >       struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> > >       int sr, wss, channels;
> > >       u32 width;
> > > +     int lines;
> > >
> > >       channels = params_channels(params);
> > > -     if (channels != 2) {
> > > +     if ((channels > dai->driver->playback.channels_max) ||
> > > +             (channels < dai->driver->playback.channels_min)) {
> > >               dev_err(dai->dev, "Unsupported number of channels: %d\n",
> > >                       channels);
> > >               return -EINVAL;
> > >       }
> > >
> > > +     lines = (channels + 1) / 2;
> > > +
> > > +     /* Enable the required output lines */
> > > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> > > +                        SUN4I_I2S_CTRL_SDO_EN_MASK,
> > > +                        SUN4I_I2S_CTRL_SDO_EN(lines));
> > > +
> >
> > This has the assumption that each line will have 2 channels, which is wrong.
> >
> > >       if (i2s->variant->is_h3_i2s_based) {
> > >               regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
> > >                                  SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
> > > @@ -373,8 +382,19 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> > >       }
> > >
> > >       /* Map the channels for playback and capture */
> > > -     regmap_field_write(i2s->field_txchanmap, 0x76543210);
> > >       regmap_field_write(i2s->field_rxchanmap, 0x00003210);
> > > +     regmap_field_write(i2s->field_txchanmap, 0x10);
> > > +     if (i2s->variant->is_h3_i2s_based) {
> > > +             if (channels > 2)
> > > +                     regmap_write(i2s->regmap,
> > > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+4, 0x32);
> > > +             if (channels > 4)
> > > +                     regmap_write(i2s->regmap,
> > > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+8, 0x54);
> > > +             if (channels > 6)
> > > +                     regmap_write(i2s->regmap,
> > > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+12, 0x76);
> > > +     }
> >
> > And this creates a mapping matching that.
> >
> > >       /* Configure the channels */
> > >       regmap_field_write(i2s->field_txchansel,
> > > @@ -1057,9 +1077,10 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
> > >  static int sun4i_i2s_probe(struct platform_device *pdev)
> > >  {
> > >       struct sun4i_i2s *i2s;
> > > +     struct snd_soc_dai_driver *soc_dai;
> > >       struct resource *res;
> > >       void __iomem *regs;
> > > -     int irq, ret;
> > > +     int irq, ret, val;
> > >
> > >       i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> > >       if (!i2s)
> > > @@ -1126,6 +1147,19 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
> > >       i2s->capture_dma_data.addr = res->start + SUN4I_I2S_FIFO_RX_REG;
> > >       i2s->capture_dma_data.maxburst = 8;
> > >
> > > +     soc_dai = devm_kmemdup(&pdev->dev, &sun4i_i2s_dai,
> > > +                            sizeof(*soc_dai), GFP_KERNEL);
> > > +     if (!soc_dai) {
> > > +             ret = -ENOMEM;
> > > +             goto err_pm_disable;
> > > +     }
> > > +
> > > +     if (!of_property_read_u32(pdev->dev.of_node,
> > > +                               "allwinner,playback-channels", &val)) {
> > > +             if (val >= 2 && val <= 8)
> > > +                     soc_dai->playback.channels_max = val;
> > > +     }
> > > +
> >
> > I'm not quite sure how this works.
> >
> > of_property_read_u32 will return 0, so you will enter in the
> > condition. But what happens if the property is missing?
> >
> > Maxime
> >
> > --
> > Maxime Ripard, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/CAEKpxB%3DRdYF9eEvAJ%2BR7sT6OtdtBWjhMM1am%2BEhaN%3D9ZO9Gd2A%40mail.gmail.com.
> For more options, visit https://groups.google.com/d/optout.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
