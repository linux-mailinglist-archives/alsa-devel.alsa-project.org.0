Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966D2DB230
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:08:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B19171800;
	Tue, 15 Dec 2020 18:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B19171800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608052106;
	bh=M40QAVRmFcKND3WCJfO8rHtKW49Y4T2DJip5dTXUaBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eOxZA8DdetnHp1vl2nO1WEQwNS0noeAUjdCJ45mzXNTb+bvFq8U9V0AwhZ/rVRDhN
	 DBEZNp9r3NmMJ/1Rj2lsIYEKTVaR5dOyyGVI2iASWwxLN8+Y3CZIewtdezSg1C8wLF
	 Qtz3gFc0R0g340zaVy7LBfZ2vwiC0TTPtg6el6CA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3734FF80129;
	Tue, 15 Dec 2020 18:07:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E01EF8027B; Tue, 15 Dec 2020 18:07:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9C4F80259
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 18:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9C4F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="X9/+MsjV"
Received: by mail-io1-xd43.google.com with SMTP id o6so8080510iob.10
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXcMQVRxxLeMuWVGiYndN3AoNdrpmXXu+WgZDK7JSOo=;
 b=X9/+MsjVJxTdVVNIAwOOKGLUTMl8i8t1w540FOTNJZdpRIu+fEb7R0GFZFLXb3mXaI
 0bRf60k0ipOiwqbhslK9jb/x4G0IT61oUFPqqfOyzs2V1Q+sY/WR6AsCvFZvl9Cq6YMf
 88lj99hVSdMj7Dt1zOj6Hl8R27Wu7AqXx04eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXcMQVRxxLeMuWVGiYndN3AoNdrpmXXu+WgZDK7JSOo=;
 b=Sl2Wjdht6GrxcxVWA8BfcmGyShIwtHrzNfDJA4n/xYqCwL22OTXmjp2gsPU+SI8hSe
 3HTavXXIu6VgaFMyVz4I5ygEYoz7fr6Q5HGQP9O0RUmndxj596fJCeFpaY6JjzxgiVds
 4/fneQPXbjOVBr/K9A8ee5nMqMmAun8OfbTCtUIGBcDiqihQbJtfw2l06XiryiUa/ocq
 TJ2mUlzZZqZCLWTryCDJ8zfzYNeaRAShZLF9FZ3P2nGgBIhO7dSoQHoJZor20QZKUVsV
 iBg9ZWIdqWXo1/quPzSniZAA5Z+VpXlrELzicu6S6c2AyfrClvOvlFYBqvYhCuvDRNZP
 +h2g==
X-Gm-Message-State: AOAM5339TL4rdZm44Y4sS5IB3pv6Ez1IlxMemU+ilcSyMVTqJ/wENmVs
 ElgsBGGpChJuyXv+pFpyVyFP/BwcHrDVPexO
X-Google-Smtp-Source: ABdhPJzyukOinoNwgu8rnNPWKRqMM5945I5FuIB2ZVH+9dZcDFYk+vrkX7cUFQp2ENeZfb6WDUrvmw==
X-Received: by 2002:a5d:9252:: with SMTP id e18mr38567645iol.146.1608052041221; 
 Tue, 15 Dec 2020 09:07:21 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id x5sm13521501ilm.22.2020.12.15.09.07.19
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 09:07:19 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id q1so19911394ilt.6
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 09:07:19 -0800 (PST)
X-Received: by 2002:a92:c112:: with SMTP id p18mr43613680ile.89.1608052038827; 
 Tue, 15 Dec 2020 09:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20201211170629.871085-1-ribalda@chromium.org>
 <6b933ad0-2b54-33de-4d74-c176efd4d110@linux.intel.com>
In-Reply-To: <6b933ad0-2b54-33de-4d74-c176efd4d110@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 15 Dec 2020 18:07:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCsEXhwQhbpOup3DdM1v6GcvrreOopp+pzcZHsdkNAZPWQ@mail.gmail.com>
Message-ID: <CANiDSCsEXhwQhbpOup3DdM1v6GcvrreOopp+pzcZHsdkNAZPWQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
To: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Hi Mateusz

On Mon, Dec 14, 2020 at 6:07 PM Gorski, Mateusz
<mateusz.gorski@linux.intel.com> wrote:
>
>
> > If dobj->control is not initialized we end up in an OOPs during
> > skl_tplg_complete:
> >
> > [   26.553358] BUG: kernel NULL pointer dereference, address:
> > 0000000000000078
> > [   26.561151] #PF: supervisor read access in kernel mode
> > [   26.566897] #PF: error_code(0x0000) - not-present page
> > [   26.572642] PGD 0 P4D 0
> > [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> > [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> > 5.4.81 #4
> > [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> > Google_Soraka.10431.106.0 12/03/2019
> > [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]
> >
> > Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHL")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >   sound/soc/intel/skylake/skl-topology.c | 15 ++++++++-------
> >   1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> > index 40bee10b0c65..0955cbb4e918 100644
> > --- a/sound/soc/intel/skylake/skl-topology.c
> > +++ b/sound/soc/intel/skylake/skl-topology.c
> > @@ -3619,19 +3619,20 @@ static void skl_tplg_complete(struct snd_soc_component *component)
> >
> >       list_for_each_entry(dobj, &component->dobj_list, list) {
> >               struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
> > -             struct soc_enum *se =
> > -                     (struct soc_enum *)kcontrol->private_value;
> > -             char **texts = dobj->control.dtexts;
> > +             struct soc_enum *se;
> > +             char **texts;
> >               char chan_text[4];
> >
> > -             if (dobj->type != SND_SOC_DOBJ_ENUM ||
> > -                 dobj->control.kcontrol->put !=
> > -                 skl_tplg_multi_config_set_dmic)
> > +             if (dobj->type != SND_SOC_DOBJ_ENUM || !kcontrol ||
> > +                 kcontrol->put != skl_tplg_multi_config_set_dmic)
> >                       continue;
> > +
> > +             se = (struct soc_enum *)kcontrol->private_value;
> > +             texts = dobj->control.dtexts;
> >               sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
> >
> >               for (i = 0; i < se->items; i++) {
> > -                     struct snd_ctl_elem_value val;
> > +                     struct snd_ctl_elem_value val = {};
> >
> >                       if (strstr(texts[i], chan_text)) {
> >                               val.value.enumerated.item[0] = i;
>
>
> Hi Ricardo,
>
> there is another thread regarding this issue (with fix provided by
> Lukasz Majczak), you can find it here:
>
>      https://www.spinics.net/lists/stable/msg431524.html

I saw it just after I sent it :(. The most embarrassing thing is that
we are working in the same project ;)

Sorry for the noise

>
>
> Thanks,
> Mateusz
>


-- 
Ricardo Ribalda
