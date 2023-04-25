Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F076F2ED0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A051747;
	Mon,  1 May 2023 08:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A051747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923403;
	bh=PCCsXpbqVQ3fxAMp6f4dFjrTYAQVaZDSU2yzNT0L+UU=;
	h=References:In-Reply-To:Date:Subject:To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=jaRWZwttoOl8UlC8iEINX/tYc+ZBzUZz1e09wO6KZ+IgJo6Zkqjx1VszRgq5OgTqt
	 elg9OZT18qmvvoRI3l+MiAr1WOklg9FO3dFSvEipSDrEdPvYmq3tSMmQGvkhjHSvL2
	 ICa+k5O0UCoyD62z9+u6/VnMCHsQDz2hylAeSodE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27764F80568;
	Mon,  1 May 2023 08:40:22 +0200 (CEST)
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-2-pan@semihalf.com>
 <e64b438e-1205-4e54-b8c0-1b9a5d074752@sirena.org.uk>
In-Reply-To: <e64b438e-1205-4e54-b8c0-1b9a5d074752@sirena.org.uk>
Date: Tue, 25 Apr 2023 17:59:52 +0200
Subject: Re: [PATCH 1/9] ASoC: Add Chameleon v3 audio
To: Mark Brown <broonie@kernel.org>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQCXF5VW6G3LV2XNZRVGKFLEDM4XQYOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168292322113.26.16973021424862239828@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F75AF80236; Tue, 25 Apr 2023 18:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81255F80104
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 18:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81255F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=ACrFG0ml
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso1091789566b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1682438403; x=1685030403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW5w9nK23U/V6j0PQ9boJ4GotqhlTheLhPRyr44ceZ0=;
        b=ACrFG0mlKY8ai67MpmptwG7BxbOUWdzpuxNABQsdI2BDCrnJvFKrVEeDFCXntmZweH
         rSPZK2kbXftvUvAH7T/eKbLT7ZHfE98ahClF07TMys1W7L7RglUZ5LeywE5TxCEd50uP
         EkVuxhq7DIs586WPuVM/Y19BeAN/u2o+7jQN7ky83ja8tPhQEopfLNBNF7VSDy5l/kVJ
         7J7lzpViF5ropULfhpUgj4j9qavyto9KxOwFp7eBzAuKMLjc6MbaJ6kkzoj7gMJnelJT
         0mWU/+C9QoE/KOdMzuGEbeuHLU0EQ1tygGwOI/0H6bWKAdOl4OlkeLxin6QMf6Bcx29G
         R7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682438403; x=1685030403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW5w9nK23U/V6j0PQ9boJ4GotqhlTheLhPRyr44ceZ0=;
        b=a0R7mDSFwBIoqrnn4JxFRC65/ZfV0pSTzWL5K51CWMVsuMwsyf+DW1CQo/LgWWdRBr
         y2G8aE4ZZf3t0xgT8Yb870DzO+mN15f3Y+4wDMRXogsihiUXkL5bbzyA7n7WciQz/xFZ
         S/uhMmGymg56DVYpClM2G9SVjw1zBF6sjdkQTdPN8VGMUaWLNbXhHHlfr4Wlsfk0dWsC
         Qj8lyzHS/J5mzwZb/Wxa+lbUNVgGNC+br9PUPKg6AdzvhiwA1dnsB2ZgmhTavLEYF3AO
         mYb4S1CaPKAaOY4EY2feeQ89PKokGvN0r2XcpTB4O/fvxvaaMXzbkIq9qORIIb2yr5w2
         7oDw==
X-Gm-Message-State: AAQBX9dqUxqihQAGlUWFElrCIyCzwhivh2PVrox/xEpEdniY/X07gj2m
	DP4FT2wZ5HCgyR9d+F9Wqx+BuYRLL1vMARCG46nqzw==
X-Google-Smtp-Source: 
 AKy350bRMqreBk2BEw7LdRmTw8kY2PHkOlhrblZA47zUSJSl7M7YQwo036CjMlDB2cAO15HNV0bXA4XQxkPtwEebJow=
X-Received: by 2002:a17:907:90c4:b0:94e:ff23:992a with SMTP id
 gk4-20020a17090790c400b0094eff23992amr12659918ejb.59.1682438403555; Tue, 25
 Apr 2023 09:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-2-pan@semihalf.com>
 <e64b438e-1205-4e54-b8c0-1b9a5d074752@sirena.org.uk>
In-Reply-To: <e64b438e-1205-4e54-b8c0-1b9a5d074752@sirena.org.uk>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
Date: Tue, 25 Apr 2023 17:59:52 +0200
Message-ID: 
 <CAF9_jYTyhJZaCk1zN93Rr5AXAmpk4nu6z0Z9+RQb4HxGQ=zZLQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] ASoC: Add Chameleon v3 audio
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JQCXF5VW6G3LV2XNZRVGKFLEDM4XQYOL
X-Message-ID-Hash: JQCXF5VW6G3LV2XNZRVGKFLEDM4XQYOL
X-Mailman-Approved-At: Mon, 01 May 2023 06:39:58 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 lars@metafoo.de, nuno.sa@analog.com, upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQCXF5VW6G3LV2XNZRVGKFLEDM4XQYOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you for all the comments, I'm sorry for taking long to respond.

On Fri, Apr 14, 2023 at 7:19=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Apr 14, 2023 at 04:01:55PM +0200, Pawe=C5=82 Anikiel wrote:
>
> > ---
> >  .../boot/dts/socfpga_arria10_chameleonv3.dts  |  28 ++
>
> Updates to the DT should be in a separate patch.

Ok, I'll fix in next patchset

>
> >  sound/soc/chameleonv3/chv3-audio.c            | 111 ++++++
> >  sound/soc/chameleonv3/chv3-i2s.c              | 347 ++++++++++++++++++
> >  sound/soc/chameleonv3/chv3-it68051.c          |  41 +++
>
> The machine driver and board drivers (if needed) should also be separate
> patches - one patch per driver.

Ok, I'll fix in next patchset

>
> > +config SND_SOC_CHV3
> > +       tristate "SoC Audio support for Chameleon v3"
> > +       select SND_SOC_SSM2602
> > +       select SND_SOC_SSM2602_I2C
> > +       help
> > +         Say Y if you want to add audio support for the Chameleon v3.
>
> It woudl be better to have a separate selectable symbol for each drier.

I'm not sure about this. If I disable just one driver, the entire card
fails to probe (even if some audio device doesn't need that driver).
Does it then make sense to be able to deselect some drivers? Please
correct me if I'm misunderstanding.

>
> > +static int chv3_ssm2603_hw_params(struct snd_pcm_substream *substream,
> > +                       struct snd_pcm_hw_params *params)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substre=
am);
> > +     struct snd_soc_dai *dai =3D asoc_rtd_to_codec(rtd, 0);
> > +
> > +     return snd_soc_dai_set_sysclk(dai, 0, 22579200, SND_SOC_CLOCK_IN)=
;
> > +}
>
> This could be done once at init, though in general I can't tell why this
> isn't audio-graph-card.

I will read up on audio-graph-card and see if it's possible to use here

>
> > + * Because of the two pointer design, the ring buffer can never be ful=
l. With
> > + * capture this isn't a problem, because the hardware being the produc=
er
> > + * will wait for the consumer index to move out of the way.  With play=
back,
> > + * however, this is problematic, because ALSA wants to fill up the buf=
fer
> > + * completely when waiting for hardware. In the .ack callback, the dri=
ver
> > + * would have to wait for the consumer index to move out of the way by
> > + * busy-waiting, which would keep stalling the kernel for quite a long=
 time.
> > + *
> > + * The workaround to this problem is to "lie" to ALSA that the hw_poin=
ter
> > + * is one period behind what it actually is (see chv3_dma_pointer). Th=
is
> > + * way, ALSA will not try to fill up the entire buffer, and all callba=
cks
> > + * are wait-free.
>
> Would it not be better to just lag by one (or some small number of)
> sample instead?

The benefit of lagging by an entire period is that we get an IRQ when
the first period is processed, which means we can drop the first call
to snd_pcm_period_elapsed() and have everything be coherent.

Having said that, I did try to remove that logic and simply delay
hw_pointer by one frame, and it appears to work (the playback seems
fine and without glitches). However, I'm worried about calling
snd_pcm_period_elapsed() and then reporting that the hw_pointer hasn't
actually reached the end of the period. Is that ok to do?

>
> > +static irqreturn_t chv3_i2s_isr(int irq, void *data)
> > +{
> > +     struct chv3_i2s_dev *i2s =3D data;
> > +     u32 reg;
> > +
> > +     reg =3D readl(i2s->iobase_irq + I2S_IRQ_CLR);
> > +     if (!reg)
> > +             return IRQ_NONE;
> > +
> > +     if (reg & I2S_IRQ_RX_BIT)
> > +             snd_pcm_period_elapsed(i2s->rx_substream);
> > +
> > +     if (reg & I2S_IRQ_TX_BIT) {
> > +             if (i2s->tx_ready)
> > +                     snd_pcm_period_elapsed(i2s->tx_substream);
> > +             i2s->tx_ready =3D 1;
> > +     }
> > +
> > +     writel(reg, i2s->iobase_irq + I2S_IRQ_CLR);
> > +
> > +     return IRQ_HANDLED;
> > +}
>
> Really we should only ack things that were handled here and report
> appropriately, that's defensive against bugs causing interrupts to
> scream and shared interrupts.

What do you mean by handled? Should I check the hardware pointer and
check if a period really has elapsed?

>
> > +     dev_info(&pdev->dev, "probed\n");
>
> This is just noise, remove it.

Ok

>
> > +++ b/sound/soc/chameleonv3/chv3-it68051.c
> > @@ -0,0 +1,41 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +#include <linux/module.h>
> > +#include <sound/soc.h>
> > +
> > +static struct snd_soc_dai_driver it68051_dai =3D {
> > +     .name =3D "it68051-hifi",
> > +     .capture =3D {
> > +             .stream_name =3D "Capture",
> > +             .channels_min =3D 8,
> > +             .channels_max =3D 8,
> > +             .rates =3D SNDRV_PCM_RATE_CONTINUOUS,
> > +             .formats =3D SNDRV_PCM_FMTBIT_S32_LE,
> > +     },
> > +};
> > +
> > +static const struct snd_soc_component_driver soc_component_dev_it68051=
 =3D {
> > +};
>
> This looks awfully like it's a generic CODEC driver for a device with no
> control available,

Yes, it's a dummy capture-only codec with fixed 8 channels, arbitrary
rate, and S32_LE format.

> why is it not being added as a CODEC?

Do you mean I should put it in sound/soc/codecs/?

Also, I used the name of the HDMI receiver chip (IT68051), but really
this goes through some extra processing in an FPGA, so the result has
little in common with the chip itself. Do you have any advice on how
it should be named?

Regards,
Pawe=C5=82
