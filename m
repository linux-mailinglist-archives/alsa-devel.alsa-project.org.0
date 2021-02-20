Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E13204B9
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 10:31:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D66166C;
	Sat, 20 Feb 2021 10:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D66166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613813486;
	bh=QbAi7KHTw8UYaowKhN2IMeGcT9kHAvJqFvi59WhdjgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ooW8Kp+CF0kPq2w8kbwI1sAZ4/6ChhtMuKNds9Q+2/ViHLVOMkcZjShkVM0nfOLTi
	 XFuNOQ09NYOW2AYV7YIQNHVJn8qrCn+dI9cMIrCDEWOGTy/mAFaNlQMVUn+c1Vno3F
	 ReVXjh84mALjbyQyjz5Pet0/18XGkB9/m6Y72+D4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A6AF8016E;
	Sat, 20 Feb 2021 10:29:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5FB4F8015A; Sat, 20 Feb 2021 10:29:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 560E7F8011C
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 10:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 560E7F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rCHKtoCG"
Received: by mail-qt1-x82e.google.com with SMTP id c1so5828085qtc.1
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vS4vaApRyWmnyuAR5usD24NB4PjLJDD1KYfDkQckzGM=;
 b=rCHKtoCGWPixlLajV45lGFGYkTGnjq3wYnKVF5C8RgPlQKm0KhsvyngeK21STwDE/u
 sjGis3pMu/HUFb5kcjBp6WpnaZskD1fU99kAKaNXCdbt9n5MYbIf+rgnAvEw28WgM3uY
 4TKboWbvg2KQx2zNW6zZJIeOFQOJBLDeCCsW/G7x4vygeEkquAI3aPJrkvPgZB/gAzdE
 h+0ESvqEV+gg+WGqP5P5Y9ajVk5KLDi/nkDu+vm7DueuxmBAfs4OQSOJYtc8/3xBJ6/k
 x8uIJfIYyEv/Z6G2wieeCYzehUIhvaqwzHtcoO29ay6v1bp6Mress1AiChn00THGFfWS
 PUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vS4vaApRyWmnyuAR5usD24NB4PjLJDD1KYfDkQckzGM=;
 b=dlWCIoLL7URz3ByZLWsVrvYqdYeNih+fTiYr45HWlC4avX8iFei069Q0AZOUwuao8a
 pZ2KIN90GXiJCIxttyGBysbHp5dDj9+sYppyeZyyfj6YyLivG27yK7HGumNUCN8EXveN
 LPK1d+0+AE8jxr/gyAs/x/3FTmYosChUY/4JQ6yEosMOVf3LjDpsPxhf9nz+EIYpmGwj
 zco4/NqXf1JmAIIPUl2GJ5qcs6+3kj+Hb2gERjZSI9ot18Fvx9qvXCu6vHVB1uuOHbjh
 ErOucUUCWt+iAD0bdskEnnJZ4yy1berMkYxJ6M0L3suVNKE/ihQ1N7TzgjkvXz9b+7qu
 RWYQ==
X-Gm-Message-State: AOAM531/QDTwuLEnIk3yDb0MB+3OXR86F7DHLOWFGGN3XOWlfjOOHkAe
 h9mCkNRZqcfzml1xJoHl4R0yinA6fat5cD/6q4U=
X-Google-Smtp-Source: ABdhPJyk7JZcvMcxLu8SuGPOPUXhqrrN7gRUcpxpxwOgunLb3jrGk4tvxmFwk9qLYgvsbP7Rbl7ZViqo7kzcvIriVKg=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr12287830qtv.360.1613813354517; 
 Sat, 20 Feb 2021 01:29:14 -0800 (PST)
MIME-Version: 1.0
References: <5598a2fc-9b49-ad5e-2265-fbc0593ead1b@flatmax.org>
 <0d9a9459-9cd7-d384-b1ff-72860895ad13@linux.intel.com>
 <73148789-58f7-2228-ae42-465cdafcff4c@flatmax.org>
 <52e1a640-b46f-b494-2047-849c1999eb28@flatmax.org>
 <7607dd99-0d54-2bab-7407-836a42647f4c@metafoo.de>
In-Reply-To: <7607dd99-0d54-2bab-7407-836a42647f4c@metafoo.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sat, 20 Feb 2021 17:29:03 +0800
Message-ID: <CAA+D8ANpWEggM4128p7=wzFNLdn6YF4JWQpm0fMbk_WWZGKBTA@mail.gmail.com>
Subject: Re: ASoc: soc_core.c stream direction from snd_soc_dai
To: Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matt Flax <flatmax@flatmax.org>
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

On Fri, Mar 13, 2020 at 6:01 PM Lars-Peter Clausen <lars@metafoo.de> wrote:
>
> On 3/13/20 4:56 AM, Matt Flax wrote:
> >
> > On 13/3/20 10:19 am, Matt Flax wrote:
> >>
> >> On 13/3/20 9:55 am, Pierre-Louis Bossart wrote:
> >>>
> >>>
> >>> On 3/11/20 5:54 PM, Matt Flax wrote:
> >>>> Hi there,
> >>>>
> >>>> A large number of audio codecs allow different formats for playback
> >>>> and capture. This becomes very useful when there are different
> >>>> latencies between playback and capture hardware data lines. For
> >>>> example digital isolation chips typically have a 1 bit delay in
> >>>> propagation as the bit clock rate gets faster for higher sample
> >>>> rates. By setting the capture and playback formats to differ by one
> >>>> or two bit clock cycles, the delay problem is solved.
> >>>>
> >>>> There doesn't seem to be a simple way to detect stream direction in
> >>>> the codec driver's set_fmt function.
> >>>>
> >>>> The snd_soc_runtime_set_dai_fmt function :
> >>>>
> >>>> https://github.com/torvalds/linux/blob/master/sound/soc/soc-core.c#L1480
> >>>>
> >>>>
> >>>> calls the snd_soc_dai_set_fmt function :
> >>>>
> >>>> https://github.com/torvalds/linux/blob/master/sound/soc/soc-dai.c#L101
> >>>>
> >>>> which calls the set_fmt function :
> >>>>
> >>>> https://github.com/torvalds/linux/blob/master/include/sound/soc-dai.h#L189
> >>>>
> >>>>
> >>>>
> >>>> The snd_soc_dai_ops set_fmt function is defined as :
> >>>>
> >>>>      int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
> >>>>
> >>>>
> >>>> Is there a simple way to find the stream direction from a
> >>>> snd_soc_dai ?
> >>>>
> >>>> If the stream direction can be detected then the playback and
> >>>> capture formats can be set independently for the codec.
> >>>>
> >>>> It there a different way to set the playback and capture formats
> >>>> for the codec independently at runtime, depending on the sample rate ?
> >>>
> >>> FWIW I remember a discussion in the past on how to deal with
> >>> interfaces that may have different clocks sources for capture and
> >>> playback (typically with the 6-pin version of I2S/TDM), and the
> >>> answer was: use two dais, with one dealing with capture and the
> >>> other with playback.
> >>>
> >>> I would bet this applies for the format as well. If you use a DAI
> >>> that can do both directions, then indeed there's no obvious way to
> >>> specify that formats or clock ownership could be different between
> >>> the two directions.
> >>>
> >>> It would probably make sense anyway to have a representation with
> >>> two dais, e.g. the codec capture dai receives data from somewhere
> >>> and the codec playback dai forwards it to another destination.
> >>>
> >> I think I get it ...
> >>
> >> This approach would keep extra stream selective functionality out of
> >> soc-dai.c. That is probably a good thing for the simplicity of the core.
> >>
> >> A machine driver could then call snd_soc_dai_set_fmt passing in the
> >> correct codec_dai from the codec_dais array for the stream they want
> >> to operate on.
> >>
> > In an example case, cs4271 ... how do we enforce symmetric rates ?
>
> You'd have to do this manually in your driver. The core itself does not
> support synchronizing streams on different DAIs.
>
> You can do this by saving the rate when it is set on the first stream
> and then apply a constraint to the second stream using
> snd_pcm_hw_constraint_single() it the driver's startup() callback.
>
> Have a look at the uda134x.c or twl4030.c driver as an example.
>
> But I think Pierre was mainly talking about the case where there are
> separate clocks for each direction and the rates don't have to be the
> same. I believe long term it might make sense to extend the core to
> allow different formats for input and output direction on the same DAI.
>

Sorry for resuming this old thread. I have the same requirement for
supporting different formats for input and output on the same DAI.

One of the suggestions is to use two DAIs.  but sometimes the
CPU/CODEC may have the same format for playback and capture,
then one DAI is enough.  it means that we need to define 3 DAIs
for the CPU/CODEC,  one supports playback and capture, another
two support capture and playback separately, is it some kind of
duplicate?

So I'd like to extend the set_fmt() interface, but this impacts all
the drivers.

Best regards
Wang shengjiu
