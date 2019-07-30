Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEAF7BD2B
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 11:29:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E313F171D;
	Wed, 31 Jul 2019 11:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E313F171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564565385;
	bh=lXdAJhJRDWeWnRoBdOVHUQApxWo6yf0vwqIzauafPN8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rtFwuLaNSG5GPEjalaCLOBZTFUWhX+seSbxBEpQ0vSS0ykMjeYUaXgEK82iTlV+s6
	 27tV853gqVJXELwacsGfRgeA0Zz1rsi3yOP+a5yXYL9TwCxqZc5i7vvZZQFK4HVcJx
	 1BQe7CpP9zlNLo2eAlzrjFmAWNxV4lvS0wY7GTUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F1BF8059F;
	Wed, 31 Jul 2019 11:26:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B87D8F804CA; Tue, 30 Jul 2019 19:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_EXCESS_BASE64,PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B11F804CB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 19:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B11F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y6M7AaP5"
Received: by mail-wr1-x443.google.com with SMTP id n4so66822163wrs.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9gr1REy9uU6tIvdybdq1wzB3yKSOtp91cfB88+O2No=;
 b=Y6M7AaP5KZ0RlOVpdvuT71waGZaMGFG7LB6Ue/fz3whPZ/OM1Dol+xR5rhWZOUaYDB
 3oQgI3oYF8IxRB2eIavbT1IJ0lb3lwl3dOLfpkn1iFRigKgsp2/XlQd2cN/T/qx7vqxT
 oCMq238bpwZann7Ow8V9o5QUcYgwVAbTj2qXdhKV1c2lKohoGhBQ9EB4iZqo94uB8pX0
 rPMFEmyyqTRG9EXWylTjZmzluhiTTTkWlifiadyF9F0rCK+JEyWZ4bDE7SVvU3Wv6ztQ
 bQIsxeeoi6TgMXwvrb1JPtat1HV0VCBwNaXikDdmW9GckY7k3Bf7iLs7SggiNHxUcLLF
 OHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9gr1REy9uU6tIvdybdq1wzB3yKSOtp91cfB88+O2No=;
 b=GMV3AXIRWdO1opOvVWTt6fT8i8sz+/OsZI7fEUUAxHe2nGy9PersBAe3o4SCVNMQ6I
 6NSJGt+Nv5/gOKkMuiygLQkdo82NJum/gDMF75kL2/qf3V944V0QIe3QVGurkgDRzbVe
 sbNTaEY4pKKCgRE/aXFVzZ9Y8ZkCSHT7YxuKK4APykGWcWo6vVyPfcAeQ7nyhDO8RYDL
 zMVWTF981lgpwIH3Na4CLych0s+YRdsG2uUJdFVBgN8KX6MY8l8Bd/+kWiHHM2LYYHHe
 Zn2CZgbbXfuuEzOi7UZ1hTeSiHLbdCel/j5HWBSZBTef5CSD16TwT2BMDcjXtsQbplhH
 rwKw==
X-Gm-Message-State: APjAAAXZB5+hzr/Hoeo6jcPld8SVArR24HkC+dJbbnv/eZOJ1L68d337
 GUDZXnWntfD3Xaad9bGGm2M=
X-Google-Smtp-Source: APXvYqzx5NI6SbGv7qui28JNpALH7QcF23N8BuTvy+CDvbHuqnUie9rrRjsQg2wIu41CMjukigKb9A==
X-Received: by 2002:adf:f005:: with SMTP id j5mr80353105wro.251.1564509433345; 
 Tue, 30 Jul 2019 10:57:13 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-194-152-11-237.cable.triera.net.
 [194.152.11.237])
 by smtp.gmail.com with ESMTPSA id a84sm82098514wmf.29.2019.07.30.10.57.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 10:57:12 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@googlegroups.com, codekipper@gmail.com
Date: Tue, 30 Jul 2019 19:57:10 +0200
Message-ID: <2092329.vleAuWJ0xl@jernej-laptop>
In-Reply-To: <CAEKpxBmxAQKgDhvjpczAWwNtNhYRs07wjMSnr8nqHk1XxMT=nw@mail.gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
 <CAP03XepJVPge5sz4WcmK8pp2jHAPJdGb6v6A3R0DzSf5O6qj-g@mail.gmail.com>
 <CAEKpxBmxAQKgDhvjpczAWwNtNhYRs07wjMSnr8nqHk1XxMT=nw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 11:19:38 +0200
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Christopher Obbard <chris@64studio.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
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

Hi!

Dne torek, 04. junij 2019 ob 11:38:44 CEST je Code Kipper napisal(a):
> On Tue, 4 Jun 2019 at 11:02, Christopher Obbard <chris@64studio.com> wrote:
> > On Tue, 4 Jun 2019 at 09:43, Code Kipper <codekipper@gmail.com> wrote:
> > > On Tue, 4 Jun 2019 at 09:58, Maxime Ripard <maxime.ripard@bootlin.com> 
wrote:
> > > > On Mon, Jun 03, 2019 at 07:47:32PM +0200, codekipper@gmail.com wrote:
> > > > > From: Marcus Cooper <codekipper@gmail.com>
> > > > > 
> > > > > The i2s block supports multi-lane i2s output however this
> > > > > functionality
> > > > > is only possible in earlier SoCs where the pins are exposed and for
> > > > > the i2s block used for HDMI audio on the later SoCs.
> > > > > 
> > > > > To enable this functionality, an optional property has been added to
> > > > > the bindings.
> > > > > 
> > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > 
> > > > I'd like to have Mark's input on this, but I'm really worried about
> > > > the interaction with the proper TDM support.
> > > > 
> > > > Our fundamental issue is that the controller can have up to 8
> > > > channels, but either on 4 lines (instead of 1), or 8 channels on 1
> > > > (like proper TDM) (or any combination between the two, but that should
> > > > be pretty rare).
> > > 
> > > I understand...maybe the TDM needs to be extended to support this to
> > > consider channel mapping and multiple transfer lines. I was thinking
> > > about the later when someone was requesting support on IIRC a while
> > > ago, I thought masking might of been a solution. These can wait as the
> > > only consumer at the moment is LibreELEC and we can patch it there.
> > 
> > Hi Marcus,
> > 
> > FWIW, the TI McASP driver has support for TDM & (i think?) multiple
> > transfer lines which are called serializers.
> > Maybe this can help with inspiration?
> > see
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s
> > ound/soc/ti/davinci-mcasp.c sample DTS:
> > 
> > &mcasp0 {
> > 
> >     #sound-dai-cells = <0>;
> >     status = "okay";
> >     pinctrl-names = "default";
> >     pinctrl-0 = <&mcasp0_pins>;
> >     
> >     op-mode = <0>;
> >     tdm-slots = <8>;
> >     serial-dir = <
> >     
> >         2 0 1 0
> >         0 0 0 0
> >         0 0 0 0
> >         0 0 0 0
> >     >
> >     >;
> >     
> >     tx-num-evt = <1>;
> >     rx-num-evt = <1>;
> > 
> > };
> > 
> > 
> > Cheers!
> 
> Thanks, this looks good.

I would really like to see this issue resolved, because HDMI audio support in 
mainline Linux for those SoCs is long overdue.

However, there is a possibility to still add HDMI audio suport (stereo only) 
even if this issue is not completely solved. If we agree that configuration of 
channels would be solved with additional property as Christopher suggested, 
support for >2 channels can be left for a later time when support for that 
property would be implemented. Currently, stereo HDMI audio support can be 
added with a few patches.

I think all I2S cores are really the same, no matter if internally connected 
to HDMI controller or routed to pins, so it would make sense to use same 
compatible for all of them. It's just that those I2S cores which are routed to 
pins can use only one lane and >2 channels can be used only in TDM mode of 
operation, if I understand this correctly.

New property would have to be optional, so it's omission would result in same 
channel configuration as it is already present, to preserve compatibility with 
old device trees. And this mode is already sufficient for stereo HDMI audio 
support.

Side note: HDMI audio with current sun4i-i2s driver has a delay (about a 
second), supposedly because DW HDMI controller automatically generates CTS 
value based on I2S clock (auto CTS value generation is enabled per DesignWare 
recomendation for DW HDMI I2S interface). I2S driver from BSP Linux solves 
that by having I2S clock output enabled all the time. Should this be flagged 
with some additional property in DT?

Best regards,
Jernej

> CK
> 
> > > Do you have any ideas Master?
> > > CK
> > > 
> > > > You're trying to do the first one, and I'm trying to do the second
> > > > one.
> > > > 
> > > > There's a number of assumptions later on that will break the TDM case,
> > > > see below for examples
> > > > 
> > > > > ---
> > > > > 
> > > > >  sound/soc/sunxi/sun4i-i2s.c | 44
> > > > >  ++++++++++++++++++++++++++++++++-----
> > > > >  1 file changed, 39 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/sound/soc/sunxi/sun4i-i2s.c
> > > > > b/sound/soc/sunxi/sun4i-i2s.c
> > > > > index bca73b3c0d74..75217fb52bfa 100644
> > > > > --- a/sound/soc/sunxi/sun4i-i2s.c
> > > > > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > > > > @@ -23,7 +23,7 @@
> > > > > 
> > > > >  #define SUN4I_I2S_CTRL_REG           0x00
> > > > >  #define SUN4I_I2S_CTRL_SDO_EN_MASK           GENMASK(11, 8)
> > > > > 
> > > > > -#define SUN4I_I2S_CTRL_SDO_EN(sdo)                   BIT(8 + (sdo))
> > > > > +#define SUN4I_I2S_CTRL_SDO_EN(lines)         (((1 << lines) - 1) <<
> > > > > 8)
> > > > > 
> > > > >  #define SUN4I_I2S_CTRL_MODE_MASK             BIT(5)
> > > > >  #define SUN4I_I2S_CTRL_MODE_SLAVE                    (1 << 5)
> > > > >  #define SUN4I_I2S_CTRL_MODE_MASTER                   (0 << 5)
> > > > > 
> > > > > @@ -355,14 +355,23 @@ static int sun4i_i2s_hw_params(struct
> > > > > snd_pcm_substream *substream,> > > > 
> > > > >       struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> > > > >       int sr, wss, channels;
> > > > >       u32 width;
> > > > > 
> > > > > +     int lines;
> > > > > 
> > > > >       channels = params_channels(params);
> > > > > 
> > > > > -     if (channels != 2) {
> > > > > +     if ((channels > dai->driver->playback.channels_max) ||
> > > > > +             (channels < dai->driver->playback.channels_min)) {
> > > > > 
> > > > >               dev_err(dai->dev, "Unsupported number of channels:
> > > > >               %d\n",
> > > > >               
> > > > >                       channels);
> > > > >               
> > > > >               return -EINVAL;
> > > > >       
> > > > >       }
> > > > > 
> > > > > +     lines = (channels + 1) / 2;
> > > > > +
> > > > > +     /* Enable the required output lines */
> > > > > +     regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
> > > > > +                        SUN4I_I2S_CTRL_SDO_EN_MASK,
> > > > > +                        SUN4I_I2S_CTRL_SDO_EN(lines));
> > > > > +
> > > > 
> > > > This has the assumption that each line will have 2 channels, which is
> > > > wrong.> > > 
> > > > >       if (i2s->variant->is_h3_i2s_based) {
> > > > >       
> > > > >               regmap_update_bits(i2s->regmap,
> > > > >               SUN8I_I2S_CHAN_CFG_REG,
> > > > >               
> > > > >                                  SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK
> > > > >                                  ,
> > > > > 
> > > > > @@ -373,8 +382,19 @@ static int sun4i_i2s_hw_params(struct
> > > > > snd_pcm_substream *substream,> > > > 
> > > > >       }
> > > > >       
> > > > >       /* Map the channels for playback and capture */
> > > > > 
> > > > > -     regmap_field_write(i2s->field_txchanmap, 0x76543210);
> > > > > 
> > > > >       regmap_field_write(i2s->field_rxchanmap, 0x00003210);
> > > > > 
> > > > > +     regmap_field_write(i2s->field_txchanmap, 0x10);
> > > > > +     if (i2s->variant->is_h3_i2s_based) {
> > > > > +             if (channels > 2)
> > > > > +                     regmap_write(i2s->regmap,
> > > > > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+4,
> > > > > 0x32);
> > > > > +             if (channels > 4)
> > > > > +                     regmap_write(i2s->regmap,
> > > > > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+8,
> > > > > 0x54);
> > > > > +             if (channels > 6)
> > > > > +                     regmap_write(i2s->regmap,
> > > > > +                                  SUN8I_I2S_TX_CHAN_MAP_REG+12,
> > > > > 0x76);
> > > > > +     }
> > > > 
> > > > And this creates a mapping matching that.
> > > > 
> > > > >       /* Configure the channels */
> > > > >       regmap_field_write(i2s->field_txchansel,
> > > > > 
> > > > > @@ -1057,9 +1077,10 @@ static int
> > > > > sun4i_i2s_init_regmap_fields(struct device *dev,> > > > 
> > > > >  static int sun4i_i2s_probe(struct platform_device *pdev)
> > > > >  {
> > > > >  
> > > > >       struct sun4i_i2s *i2s;
> > > > > 
> > > > > +     struct snd_soc_dai_driver *soc_dai;
> > > > > 
> > > > >       struct resource *res;
> > > > >       void __iomem *regs;
> > > > > 
> > > > > -     int irq, ret;
> > > > > +     int irq, ret, val;
> > > > > 
> > > > >       i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
> > > > >       if (!i2s)
> > > > > 
> > > > > @@ -1126,6 +1147,19 @@ static int sun4i_i2s_probe(struct
> > > > > platform_device *pdev)> > > > 
> > > > >       i2s->capture_dma_data.addr = res->start +
> > > > >       SUN4I_I2S_FIFO_RX_REG;
> > > > >       i2s->capture_dma_data.maxburst = 8;
> > > > > 
> > > > > +     soc_dai = devm_kmemdup(&pdev->dev, &sun4i_i2s_dai,
> > > > > +                            sizeof(*soc_dai), GFP_KERNEL);
> > > > > +     if (!soc_dai) {
> > > > > +             ret = -ENOMEM;
> > > > > +             goto err_pm_disable;
> > > > > +     }
> > > > > +
> > > > > +     if (!of_property_read_u32(pdev->dev.of_node,
> > > > > +                               "allwinner,playback-channels",
> > > > > &val)) {
> > > > > +             if (val >= 2 && val <= 8)
> > > > > +                     soc_dai->playback.channels_max = val;
> > > > > +     }
> > > > > +
> > > > 
> > > > I'm not quite sure how this works.
> > > > 
> > > > of_property_read_u32 will return 0, so you will enter in the
> > > > condition. But what happens if the property is missing?
> > > > 
> > > > Maxime
> > > > 
> > > > --
> > > > Maxime Ripard, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> > > 
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "linux-sunxi" group. To unsubscribe from this group and stop
> > > receiving emails from it, send an email to
> > > linux-sunxi+unsubscribe@googlegroups.com. To view this discussion on
> > > the web, visit
> > > https://groups.google.com/d/msgid/linux-sunxi/CAEKpxB%3DRdYF9eEvAJ%2BR7
> > > sT6OtdtBWjhMM1am%2BEhaN%3D9ZO9Gd2A%40mail.gmail.com. For more options,
> > > visit https://groups.google.com/d/optout.




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
