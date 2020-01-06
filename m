Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C5131961
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 21:29:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D465417E9;
	Mon,  6 Jan 2020 21:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D465417E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578342577;
	bh=9uUjcQxnIpnTOp0ro5E1QxmF+mWCNeZmZ6UUccQqM4E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hx4U+UBSVmAEXIEC11w9yfXaFXte+A25pl2tQivDaBvuBxYt3JCoXA4A8qiwtd9XM
	 1hv/pa6OO0gfQUHrHrGr8XeWOIJjyIDtVtlhA2lG3tlIK1z2KE0gDfk81JvCn8sQsm
	 87QVDX2Zjiw9FwQWimsdDtcrugWzHQOn+5VOOwZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACE7AF801ED;
	Mon,  6 Jan 2020 21:27:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03703F80159; Mon,  6 Jan 2020 21:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B7C0F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 21:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B7C0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LaRblfDw"
Received: by mail-qv1-xf41.google.com with SMTP id dp13so19610952qvb.7
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 12:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ehi3gR4/fTR5JVw77KNnf5PCLSqYwCvb6eTcSS6sxKU=;
 b=LaRblfDwWhyEeztWHAQ7YhQ7yFi+cBQh6Xc0wIB8J1ytaJK0O5CIE9Hdc/q5Lg2OvT
 k1aYsPnaPSRLRnLSBNkeHQJ7h8QlQOvYjPyfQxzbBj4/rsCcZyZghOh+4tevKld8S4aR
 ANOtHUVDX6AWEoMQlPvveD9mdUsGkX2YoL9OsofV2JNdpJCqdi8azXKet1GzQpWMCyre
 Aa+irCCI13VQiVz5WMDkX5jmGhQ9F4AGXGMbADIsmKnCZun8dXJYrUB1PQn2BA1VzTaT
 yLP6Tddmr/+OZb1m/0eWroxd0+1cKh2MQ1jkkGDYgltZVziXq8oYIcLCCdvUW85BDMEu
 6Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ehi3gR4/fTR5JVw77KNnf5PCLSqYwCvb6eTcSS6sxKU=;
 b=qlhkqL5Ig8uSSlGV1u4UyFJxkLbiANJiEeTU0ls2QQba2NVtIT06azvRpxh7y75UUD
 LPw+bZeDFr98TlVLf8m/onP0rC3tFupdk8I6UyNPFgBpguiw8TbcTMs+ZD2uFqvjf7mB
 +o+wFL50um4ehF4VqvawEI6Li7eIApFffWsRiP+3M9j3+aB/UPz9tT8/+1JqEd7egE5Y
 HeWtphqD2KUsZOJAptm/gw1IQwapBDUPPREYTJ4w2Hgf5sHimTs9ESKdXht6Zcr3nfQc
 i4DCxEotMC6LTBhcfI3J11Oedf+cypz+hBCmf+9AYCWhpzaz0LhvvajhoF791PCAz0Q/
 PQ/g==
X-Gm-Message-State: APjAAAUy1IoVl+UNbj3e6w9AgCkmxelrqVsGSEeWUgLJF2rJaVMSymhX
 F5QPKNGQ7LvssxqXiWN5XMhncq3Vfoz/OyuVHyf5xA==
X-Google-Smtp-Source: APXvYqzZv2Ge5EK+fYUN2iqnW4gL7wkrDtCBc7s73GJ78KnuHLzTUj80kt8NJWz9477wUn159ke1jZh3auzfnSaeZNk=
X-Received: by 2002:a05:6214:1907:: with SMTP id
 er7mr80801732qvb.199.1578342466332; 
 Mon, 06 Jan 2020 12:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20200103233401.160654-1-cujomalainey@chromium.org>
 <f7420fdd-2591-225e-55e4-34e69ac5292c@linux.intel.com>
In-Reply-To: <f7420fdd-2591-225e-55e4-34e69ac5292c@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 6 Jan 2020 12:27:35 -0800
Message-ID: <CAOReqxio6Y6uDaa1fPnFTwm+5ynNk92ibYY8UT_PCsfJJUEJeA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Pan Xiuli <xiuli.pan@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: add spi driver compile
	switches
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

On Fri, Jan 3, 2020 at 6:29 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 1/3/20 5:34 PM, Curtis Malainey wrote:
> > If the SPI driver is not compiled in then the RT5677_SPI driver will not
> > be included as well which will cause the bdw-rt5677 driver to fail to
> > probe since the DSP components are managed by the RT5677_SPI driver. The
> > solution is to remove them when the driver is not present as part of the
> > build.
>
> it should be the other way around, this machine driver should have a
> dependency on SPI and select RT5677_SPI?
>
> That said, even with this fix, I still see issues, somehow the
> spi-RT5677AA component does not probe/register, see
> https://github.com/thesofproject/linux/pull/1659
>
> There must be an additional issue with SPI support here.
>
Good point, we should select the dependencies. I commented on your bug
as to what the issue might be.
> >
> > Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > CC: Pan Xiuli <xiuli.pan@linux.intel.com>
> > ---
> >   sound/soc/intel/boards/bdw-rt5677.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> > index 2af8e5a62da84..d5ded2c545d2c 100644
> > --- a/sound/soc/intel/boards/bdw-rt5677.c
> > +++ b/sound/soc/intel/boards/bdw-rt5677.c
> > @@ -74,11 +74,13 @@ static const struct snd_soc_dapm_route bdw_rt5677_map[] = {
> >       /* CODEC BE connections */
> >       {"SSP0 CODEC IN", NULL, "AIF1 Capture"},
> >       {"AIF1 Playback", NULL, "SSP0 CODEC OUT"},
> > +#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
> >       {"DSP Capture", NULL, "DSP Buffer"},
> >
> >       /* DSP Clock Connections */
> >       { "DSP Buffer", NULL, "SSP0 CODEC IN" },
> >       { "SSP0 CODEC IN", NULL, "DSPTX" },
> > +#endif
> >   };
> >
> >   static const struct snd_kcontrol_new bdw_rt5677_controls[] = {
> > @@ -319,6 +321,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
> >               SND_SOC_DAILINK_REG(fe, dummy, platform),
> >       },
> >
> > +#if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
> >       /* Non-DPCM links */
> >       {
> >               .name = "Codec DSP",
> > @@ -326,6 +329,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
> >               .ops = &bdw_rt5677_dsp_ops,
> >               SND_SOC_DAILINK_REG(dsp),
> >       },
> > +#endif
> >
> >       /* Back End DAI links */
> >       {
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
