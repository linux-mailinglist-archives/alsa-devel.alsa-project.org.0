Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B920D64EFD8
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A8D16F5;
	Fri, 16 Dec 2022 17:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A8D16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671209801;
	bh=0GbXpxWgxfTsCOePJZ4P4SKgMAlqlGnse3uLNH7TN78=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S9jdESPxpzmD70RFsITAZjeK6qmfwy3/TRN8lVfLNb5DheXiOvHGSu6iVO4hSuF9w
	 ZIKNW5j2L4hS5gC5EDMMlAjzFCpgs7YNzJdJVBSzBkAhGHmytHhtRLs3uVKG71nE9T
	 4JNAM5HUovJco9zMsxQEu66ERvCuCPE9jLstHF7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA220F804D0;
	Fri, 16 Dec 2022 17:55:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76136F804E2; Fri, 16 Dec 2022 17:55:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E3FF804D0
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E3FF804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=jPIEGmH8
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3e78d07ab4fso40891767b3.9
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NSh2mHS3a/WVKWmgpBdkSxEC5BZvHlzqieLbmOlJd+Y=;
 b=jPIEGmH8jpNZDIgiwhpHedHCuvgD/xiLEsQj7JjOYWxHvRcT5bFDWmAZGlGulCZ7Yf
 yLX5VhQl1TxisuUXdhJZJUywsPwDnFgfRErlWrg4RoZZg4oDqiWRF6n1UhrrTKefItXX
 FNz52MXjhlFczjR7lctHlYMMXFczCLhXmg0tA+h061lH31MHeoBZV8HxM5WIb4IhdIAz
 qhV7PuTAkHyUFHaD/qXJB0AHZi/v02lNtUnZ/j1+u6JdU9tmkLdfFpXagOv8DVrpj39s
 e0XkIx0NlryEqokhmpl0cZMxa/lKL/HU/63HHE9YpsizvCQmWoMOkEjZlOK/HPweMFu2
 m5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSh2mHS3a/WVKWmgpBdkSxEC5BZvHlzqieLbmOlJd+Y=;
 b=ivxjUqGA7nfvkSP8S+/N3EfGufkZHaWlwxnYqC8VdaGaB7ibHvEkzdA88HsvPH7yFL
 NrdfJmBf6La5skhar9owYXc7uQZXsgiO74ldt7l+ZEBgStgCewkzJKkEIc7SL7vDyHuA
 1Jy7vwe/cmMX3nApoQbGByEVPy8aHiofrR3iZT2nILbiXAa9Lb/skpq9OqbSy9SRspC0
 P4a9IQ2eMgo5A28euriGrbJCGDgVn0xsopweDGyW6GVdiNjEQsEWOj90dP31MBNwGqLU
 kmwMDsLforZfyDjI6Xmoy5XjFen8knspmobqBlLo3g7TTNOyqk35FqNld0PyA2FUBpRn
 XkaQ==
X-Gm-Message-State: ANoB5pkScE3Nvm4vNVXzTnFFCCJ+ibgWhtTdQC1gDSxZMAM0mBzr1v6u
 l4KKJA0ajOgn6H7WnDsziVTfQKxE8mjp0uQ6AFqOaw==
X-Google-Smtp-Source: AA0mqf4p4beqjNrpgW68N/JzW8JqSmKkOyTxSo9B+R/HRFFITRAUI6xDN7EmgwOD/ufKLHLpGNkd2mS0tcHcTGmjuX0=
X-Received: by 2002:a81:9945:0:b0:370:4fa5:7077 with SMTP id
 q66-20020a819945000000b003704fa57077mr11009315ywg.360.1671209737775; Fri, 16
 Dec 2022 08:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
In-Reply-To: <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 17 Dec 2022 00:55:26 +0800
Message-ID: <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre

On Sat, Dec 17, 2022 at 12:03 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:

> On 12/16/22 09:49, Ajye Huang wrote:
> > This patch adds the driver data for two nau8318 speaker amplifiers on
> > SSP1 and nau8825 on SSP0 for ADL platform.
>
> So here you are making reference to two amplifiers...
>
> > +static struct snd_soc_dai_link_component nau8318_components[] = {
> > +     {
> > +             .name = "NVTN2012:00",
> > +             .dai_name = "nau8315-hifi",
> > +     }
> > +};
>
> but here there's only one? I was expecting something like what we've
> used for Maxim amplifiers with a codec configuration and dailink
> components that list the two amplifiers.
>
> static struct snd_soc_codec_conf max_98373_codec_conf[] = {
>         {
>                 .dlc = COMP_CODEC_CONF(MAX_98373_DEV0_NAME),
>                 .name_prefix = "Right",
>         },
>         {
>                 .dlc = COMP_CODEC_CONF(MAX_98373_DEV1_NAME),
>                 .name_prefix = "Left",
>         },
> };
>
> struct snd_soc_dai_link_component max_98373_components[] = {
>         {  /* For Right */
>                 .name = MAX_98373_DEV0_NAME,
>                 .dai_name = MAX_98373_CODEC_DAI,
>         },
>         {  /* For Left */
>                 .name = MAX_98373_DEV1_NAME,
>                 .dai_name = MAX_98373_CODEC_DAI,
>         },
> };
>
> Or is this a commit message problem and there's really only one amplifier?

Really , it has two speakers.  The nau8318 is an auto mode Amplifier
chip, similar to the max98360a amp chip.
EX: Sof_maxim_common.c (sound\soc\intel\boards):
static struct snd_soc_dai_link_component max_98360a_components[] = {
    {
        .name = MAX_98360A_DEV0_NAME,
        .dai_name = MAX_98357A_CODEC_DAI,
    }
};
It is not an i2c interface,  from the nau8318 data sheet, there are
five pins used mainly. one for enable, others for I2S.
EN-- enable pin
FSR-- Frame Sync, Right
FSL--  Frame Sync, Left
BCLK--  bit clock
DACIN-- Input i2s data

The FSR and FSL pins are for Left and Right channels used.
thanks
