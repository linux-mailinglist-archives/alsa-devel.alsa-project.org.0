Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E424E492D4B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 19:28:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70FB929EA;
	Tue, 18 Jan 2022 19:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70FB929EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642530507;
	bh=orio9DeWKezPvZvhzn4G4cAibVYxDNfeTv3e9co9WeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YmCF0VLQ9gUl5k83VtLJHyu02Q2RNoPqObEJoH51reas2mfCh+tmD9ugcQ6gsQV53
	 mh1ZeDPcCq+gBlEfuwmF9zKyQG4DmXnzNMDQkJZe11RjEJitbGoDepSHvuVO+NTRoa
	 89RszaEtSczUTHSTsS4aK6dQhVZrH7WJwUUIGOZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4202BF80100;
	Tue, 18 Jan 2022 19:27:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EE4F8023B; Tue, 18 Jan 2022 19:27:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9942CF800CE
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 19:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9942CF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kBaY/RYb"
Received: by mail-wm1-x32c.google.com with SMTP id c66so29648295wma.5
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 10:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WgQNd9jvDGSha0ZOEMYIqms6ohSARrZSwqDxbZSH43Y=;
 b=kBaY/RYbdbEQuVsoV59cdNSiYYEv/9+RmudEw6xW7hlLv4mFdmtVkuKSNLjmFUvOzc
 LhMS9vPI5BvRCSoKCUaHMQied6UDI80sIe2M+NMvfM5rVsCBmt4+sF7c0HqZq/t32L8b
 SVd4BOlZthBeWJS7STMIFEPM7BttCoyc71zKfXqB84igRKImCXDZsaiQ4uBvK7t/KXiH
 qzv2PcAYYTILng7EK+AMn/GGN6XX0TiiIP0fods4ChIYz3Toa29XEv/07uJy+4Ht8hQH
 MD+IQEhFDi/MVApmFBMCev09BdH3OiDDxE7JchRS8Vd9cXZdz0wM9v7qd4snLFKtmtO/
 orDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgQNd9jvDGSha0ZOEMYIqms6ohSARrZSwqDxbZSH43Y=;
 b=e1qH/F9ep2UanVl68IFsFCdzkcvojF5Ogiyv3FHJULn4hb3HghkDft7LzItyyguURq
 dGggW+fTDczBoXUC9Nj1taRaE9PLZturzUk10tQMh8RQEsQ7pHM2TRmY8VzJvKRE/MgY
 SuuQIrrzc+hNNH0gMIMITas1/eKF9sHRODeMo2Fm8N726YE+9FR/3aeHRyaKe/8Wwf3x
 tvBwsLCDumwUVzOJCMcOzd7tH7Uc/mp8VsPhUiOGT+dGDe4WzPsBa85sAqRoE2szy2CR
 nNKFO2bPMFQ9NsNsLy3VUkZ3Y64bcZSjX4Y1PRwaZdAxkSZM+7JPs27gHHbA6UDZtpxO
 H0Cw==
X-Gm-Message-State: AOAM533xP/4KBt7oinyzuFALMAEEHhCPdLIOuYhfeR0tOxbc6Avywg2o
 zybboN2eezwax2aCg+PPcvtLhRfvetw41AyGAO0=
X-Google-Smtp-Source: ABdhPJz+Qq6Hg8o9CGDBWKWvXnZqajzRt83pZwriF9mRbH7PQHVCmjFwWz39UQqiwfmkprJbnih58o5swmprfBfSNyU=
X-Received: by 2002:adf:d4c8:: with SMTP id w8mr25603273wrk.137.1642530430846; 
 Tue, 18 Jan 2022 10:27:10 -0800 (PST)
MIME-Version: 1.0
References: <20220113161341.371345-1-daniel.baluta@oss.nxp.com>
 <9b3d28f3-aa2b-ade9-4160-752b349bdeab@linux.intel.com>
In-Reply-To: <9b3d28f3-aa2b-ade9-4160-752b349bdeab@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Jan 2022 20:26:58 +0200
Message-ID: <CAEnQRZBsJbcdx_H9ChcPTGEbe+Ok8mVGG+1wVYe2pDF+9RqbQA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: compr: Add compress ops implementation
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

Thanks Pierre for comments.

On Sat, Jan 15, 2022 at 1:01 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> Thanks for starting this work Daniel.
>
> > +int sof_compr_get_params(struct snd_soc_component *component,
> > +                      struct snd_compr_stream *cstream, struct snd_codec *params)
> > +{
> > +     return 0;
> > +}
>
> You should probably add a statement along the lines of:
>
> /* TODO: we don't query the supported codecs for now, if the application
> asks for an unsupported codec the set_params() will fail
> */
>
> .get_codec_caps is also missing, it should be documented as something we
> want to add.

Will do.

>
> > +static int sof_compr_pointer(struct snd_soc_component *component,
> > +                          struct snd_compr_stream *cstream,
> > +                          struct snd_compr_tstamp *tstamp)
> > +{
> > +     struct snd_compr_runtime *runtime = cstream->runtime;
> > +     struct sof_compr_stream *sstream = runtime->private_data;
> > +
> > +     tstamp->sampling_rate = sstream->sample_rate;
> > +     tstamp->copied_total = sstream->copied_total;
>
> Humm, this doesn't return any information on how many PCM samples were
> generated (pcm_frames) or rendered (pcm_io_frames).

This is on my TODO list. I think there is some more work needed to be
done in FW.

>
> I don't think the existing SOF firmware has this level of detail for
> now, you should at least document it as to be added in the future.
>
> In addition, the .pointer callback can be used at different times, and
> for added precision the information should be queried from the firmware
> via IPC or by looking up counters in the SRAM windows.
>
> I don't think it's good enough to update the information on a fragment
> elapsed event. It will work for sure in terms of reporting compressed
> data transfers, but it's not good enough for an application to report
> time elapsed.

Very good observations here.

>
> > +struct sof_compr_stream {
> > +     unsigned int copied_total;
> > +     unsigned int sample_rate;
> > +     size_t posn_offset;
> > +};
>
> do you need an SOF-specific definition? This looks awfully similar to
> snd_compr_tstamp:
>
> struct snd_compr_tstamp {
>         __u32 byte_offset;
>         __u32 copied_total;
>         __u32 pcm_frames;
>         __u32 pcm_io_frames;
>         __u32 sampling_rate;
> }

There is no need for a SOF specific definition. I think we can use
that for now. We can change it later if we
need new fields.
