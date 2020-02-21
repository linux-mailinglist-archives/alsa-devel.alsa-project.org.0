Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EADB168820
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 21:12:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E875716D1;
	Fri, 21 Feb 2020 21:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E875716D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582315932;
	bh=/kkaUoUjnRm6aAkmVtZq86ZDnc8ucRmrg2R3pVgrs3c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1pNo6pRih8CA3Ca2rBM49UKKrINERemYlRfk94I75rPyyVLXdzP1+GP3CxdftXk7
	 FYkHWZjLfvGumbmOOv98/r2BRHP/ccScLEmw29T4c5UR76U7uO/5my7Bq7sibkCq7H
	 E89wZobt/u+2ZdgmgFxAGvMEfEa7vU+elCi10sUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5122F80240;
	Fri, 21 Feb 2020 21:10:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A5BF8025F; Fri, 21 Feb 2020 21:10:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SURBL_BLOCKED,TRACKER_ID,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D295F8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 21:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D295F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Pih+rqaX"
Received: by mail-io1-xd41.google.com with SMTP id z8so3734218ioh.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 12:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kqhf14ORdhtLwZDXvOmen7dqtOH1ysivZxm3bgiCm8A=;
 b=Pih+rqaX88eYHRJi1/yLazgVXyuQ++oGqJp0VPpkiUujAFJMGAOaHvNDiBFMuX3J9A
 JDB0Fp4DJ3kc7dIx0e3naWlup0gZal+jHlBcTtTn4z+VjXsWcgYBsCYAN9P1NqZ0U0My
 TIUYeRWaxBnuBgu3/lCm2iZ/lDd0p6Stm/E0OWSf6v4XLF+xmBoaNwOSIaKod49lZucs
 sxuoWeg7NBbjVhXgT2pPOm1QT8eUG1zC2z2uP4wWpzeEgQTc4F9S7tON1B0Aqh6dHDWl
 l78JrBy9LFN45I2DpTncAEQmSRsULvAa+bzLEXHUqjLNhJygK07d73SGwbPbFwuCHwxs
 9Lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kqhf14ORdhtLwZDXvOmen7dqtOH1ysivZxm3bgiCm8A=;
 b=GbBIlIeksHCRu8PBiQrwZOUiWSdqWON1OhIU34mRC9hzhOSm3wj/EI+ATXkWKPBXzd
 okzInO7KkGE4ORROvyS4HGGCqp6qXj8YLo9IzznMGMF57GbB5iKuSUoiyiukni0kO18J
 hrFU9S7KuzDiTXvUXEdFDUduZgDUAxuEb8V+ggLokcVLCaEoUT5fWMifTF01+gcfoXVq
 J/woewg+csCwlzgm+Lk5HrIhBV3sLgZDIrFJFWy4+0Ta7j0HSxlfXDJtGaO3MlSM4mIb
 U+EIcdenXN5U1SqHwGBh0+qbvB9IOAh1beZ2IAZtoUiwmiklEMK5ML+NcXsylYos6/MR
 DXtw==
X-Gm-Message-State: APjAAAWZEYYaUKFYPpA/26gdjHH7mJrkSm3lYqJunSHaVqSz7BSF090m
 /HvkkIGrVJPsyH/H+uwVZvrN4pQww2gLGJL5MZbT1A==
X-Google-Smtp-Source: APXvYqw6lPa0Ax6klw2iYJaogrfimuLJsW0P3x07+h2NPdoccU5gp+nkv/B9mPNtYiqETQemMdHvkFNyyozXw34Ve3U=
X-Received: by 2002:a5e:da42:: with SMTP id o2mr32141056iop.125.1582315803934; 
 Fri, 21 Feb 2020 12:10:03 -0800 (PST)
MIME-Version: 1.0
References: <20200221100739.3883842-1-perex@perex.cz>
 <alpine.DEB.2.21.2002211510050.2957@eliteleevi.tm.intel.com>
 <3901b16e-372e-4839-0e97-929115ea130a@perex.cz>
In-Reply-To: <3901b16e-372e-4839-0e97-929115ea130a@perex.cz>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Fri, 21 Feb 2020 12:09:53 -0800
Message-ID: <CAFQqKeXAejSGvL-z9EHNHOEAEOz73qF6xZk0-xXJnXcSTjG-Fg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF - topology - do not change the link trigger
 order for pre-1.4 firmware
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Fri, Feb 21, 2020 at 10:41 AM Jaroslav Kysela <perex@perex.cz> wrote:

> Dne 21. 02. 20 v 15:44 Kai Vehmanen napsal(a):
> > Hi,
> >
> > +Ranjani who did the link reorder patch
> >
> > On Fri, 21 Feb 2020, Jaroslav Kysela wrote:
> >
> >> This patch is for SOF v1.3 firmware. The DSP firmware will crash (DSP
> oops)
> >> without this patch. The 1.4.1 firmare has this issue fixed.
> >>
> >> The ABI version is used for the comparison, because the firmware version
> >> for the firmware files before 1.4.2 was not set properly (git hash was
> >> used).
> >
> > build fails when this is applied on broonie/for-next. You need an
> > additional
> >
> > --- a/sound/soc/sof/topology.c
> > +++ b/sound/soc/sof/topology.c
> > @@ -3108,6 +3108,7 @@ static int sof_link_load(struct snd_soc_component
> > *scomp, int index,
> >                           struct snd_soc_dai_link *link,
> >                           struct snd_soc_tplg_link_config *cfg)
> >   {
> > +       struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
> >          struct snd_soc_tplg_private *private = &cfg->priv;
> >
> >
> >> -             /* set trigger order */
> >> -             link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> >> -             link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> >> +             /* this causes DSP panic on firmware v1.3 */
> >> +             if (v->abi_version > SOF_ABI_VER(3, 7, 0)) {
> >> +                     /* set trigger order */
> >> +                     link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
> >> +                     link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
> >
> > My results with older firmwares and this patch are a bit mixed. When I
> > apply this patch and boot with v1.3 FW on a CFL platform (ABI 3.7.0,
> > version 1:1:0-5dd9a), I get a DSP panic at stream stop with this patch,
> > but _without_ it, playback is fine. :P
> >
> > I tested both v1.3.1 and v1.3, and I get a DSP panic at stream stop with
> > your patch (ABI 3:7:0 on both of these so trigger order is not changed).
> > With v1.4 and all newer, streaming works as expected.
>
> Ok, then I wonder how the pre-5.5 kernel worked (because it's just revert
> of
> 5eee2b3f60065a2530d13f28e771be48b989eb4c for older firmware versions which
> should be tested with the old code).
>
Hi Jaorslav/Kai,

The patch that switch the trigger order in SOF was preceded by another one
which mirrored the actions in the trigger callback based on the trigger
order.
My guess would be that to avoid the DSP panic for the 1.3 FW, you'll likely
need to revert the below as well.

acbf27746ecfa96b290b54cc7f05273482ea128a
ASoC: pcm: update FE/BE trigger order based on the command

Thanks,
Ranjani
