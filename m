Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E952D60D8
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 17:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36955166D;
	Thu, 10 Dec 2020 17:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36955166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607616216;
	bh=rVP5dWvFhihZr5uVZ1OfwNd38p+eS0Y8fwHGWJriTdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osDpwmKL7TERaI+IVaKzA8Og8B4ii5waVbNUkC4h/xoq9Rm+cRdjhmXB/nSRnMMXB
	 V0Ra3o75h27FAmWvS5qxvvuceLhhDSrktkevNKZGJZWYa3UvbZRDLC/Bdkvcf5TaxX
	 WIl4R0JKCQhO0DXhwSz9qs8z2K4FquX+beWzIq6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83493F8019D;
	Thu, 10 Dec 2020 17:02:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A5CF8016E; Thu, 10 Dec 2020 17:01:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 905B2F80105
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 17:01:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905B2F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="me6poT4G"
Received: by mail-ed1-x541.google.com with SMTP id dk8so6079510edb.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/hAbek9SmACLwdP7GP84o44u/lw+bpS/J+bDNBr/PAw=;
 b=me6poT4GAMbFYNf+wgy+hhe345F4Dqp6E0Js3vwKSAofOEs70KYPaSjNJ4waM62FnU
 kdP4A7/N3gtPAZXohHNYR0Cn+SoErMbW+U+vh5n61CGe2KrRe/9WpwIFVroaWe8K9qy/
 4he9KyrruyQ8B7SVxjgAzhA7EGMGrp6Y1Kj2m5u7HLMJbfnMWx3RXpe0mz+4JDKsnrTi
 Gh/mSriR8T0HaO+vufACFL25CfP/nSB5uJVM7EBPs86UdBSQQB5BzWve18IJ+J8ruzOk
 lGlZC91zI2y7hB78ZKEYvrv1ZU4tXNuiqc806TrNKZv9SZBFMCqkdL/UBJd3ub8RwGRl
 +HMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/hAbek9SmACLwdP7GP84o44u/lw+bpS/J+bDNBr/PAw=;
 b=FU2xc/tTC/Xk8UacToqi8i3Uwi1wWO3K3cHpL5E0i5f1GNWCVJZCr+1FNnAkTSMD1H
 5fLYUg30+1b5r5lt4etIYtorcUn2ht4L12VoikfRbDB42PQobwQb6QF47Iwc/6P67KP9
 UQ8j924smpBE1hl0dercW2bCoMDIpfXReFdal9PE/UZIIc7Q735qIrBv/70b+gbLFT8x
 fVoVm/rllbeOXT2L7Xl35N6opJ0n7cKh2ZZuIb9chypZTYQ+WBGgKQsRFRdNTT+xDqYm
 2zEVY3vvgPgwQza2G0qhwNlpDbs5e1YxzVKvW5MxRZpKLEKPALKAk8yIaCyghkavt/Wz
 G8Rw==
X-Gm-Message-State: AOAM530/1JdMgew2oAivnNuaETnORDvHVkbsHASbOPeIBuBe7D1GOLxT
 vu8OVCKtW/drejR75SKHVavyb0scYJL+uLrV2AllUw==
X-Google-Smtp-Source: ABdhPJxCiGtt5LIjyna61aLEt0GFk3800Y5QwJH1w+WXvUywpdOsx7dWPPsnnQPIloB2Kn7I9d0WRGdHkUMedgMf1Po=
X-Received: by 2002:a05:6402:a53:: with SMTP id
 bt19mr7595978edb.104.1607616107143; 
 Thu, 10 Dec 2020 08:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20201210121438.7718-1-lma@semihalf.com>
 <43ecc9e6-3a86-6e7c-bb88-f87fbce0f51d@linux.intel.com>
In-Reply-To: <43ecc9e6-3a86-6e7c-bb88-f87fbce0f51d@linux.intel.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 10 Dec 2020 08:01:34 -0800
Message-ID: <CABXOdTdj6BGUK5uhU6h56YHqT-GUgbqoCx-5ft4pTnO=FxWSow@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Check the kcontrol against NULL
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "# v4 . 10+" <stable@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Marcin Wojtas <mw@semihalf.com>, Lukasz Majczak <lma@semihalf.com>,
 Alex Levin <levinale@google.com>
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

On Thu, Dec 10, 2020 at 7:55 AM Gorski, Mateusz <
mateusz.gorski@linux.intel.com> wrote:

>
> > There is no check for the kcontrol against NULL and in some cases
> > it causes kernel to crash.
> >
> > Fixes: 2d744ecf2b984 ("ASoC: Intel: Skylake: Automatic DMIC format
> configuration according to information from NHLT")
> > Cc: <stable@vger.kernel.org> # 5.4+
> > Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> > ---
> >   sound/soc/intel/skylake/skl-topology.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/intel/skylake/skl-topology.c
> b/sound/soc/intel/skylake/skl-topology.c
> > index ae466cd592922..c9abbe4ff0ba3 100644
> > --- a/sound/soc/intel/skylake/skl-topology.c
> > +++ b/sound/soc/intel/skylake/skl-topology.c
> > @@ -3618,12 +3618,18 @@ static void skl_tplg_complete(struct
> snd_soc_component *component)
> >       int i;
> >
> >       list_for_each_entry(dobj, &component->dobj_list, list) {
> > -             struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
> > -             struct soc_enum *se =
> > -                     (struct soc_enum *)kcontrol->private_value;
> > -             char **texts = dobj->control.dtexts;
> > +             struct snd_kcontrol *kcontrol;
> > +             struct soc_enum *se;
> > +             char **texts;
> >               char chan_text[4];
> >
> > +             kcontrol = dobj->control.kcontrol;
> > +             if(!kcontrol)
> > +                     continue;
> > +
> > +             se = (struct soc_enum *)kcontrol->private_value;
> > +             texts = dobj->control.dtexts;
> > +
> >               if (dobj->type != SND_SOC_DOBJ_ENUM ||
> >                   dobj->control.kcontrol->put !=
> >                   skl_tplg_multi_config_set_dmic)
> >
> > base-commit: 69fe63aa100220c8fd1f451dd54dd0895df1441d
>
>
> Thanks for pointing out and fixing this. This check was obviously
> missing there. I did a quick verification on few of our platforms,
> encountered no issues, so:
>
>      Reviewed-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
>
>
> Also, could you please:
>
> - describe the affected configuration (used machine driver or audio card
> name, device name),
>

Primarily Google Pixelbook. However, this can happen whenever
dobj->type != SND_SOC_DOBJ_ENUM. For many of those other types,
kcontrol is not set. It is pure luck that the problem is not seen
everywhere,
and it seems to be compiler dependent. [Some compilers or compiler
versions only assign se when needed, ie after the if() statement].

Guenter


> - share full dmesg logs from one of said crashes,
> - copy the output of "amixer -c0 controls" command executed on affected
> device.
>
> These would be useful information for us to further improve our
> validation and help us with debugging.
>
>
> Thanks,
>
> Mateusz
>
>
>
