Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A414DDF3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 16:35:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D531677;
	Thu, 30 Jan 2020 16:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D531677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580398510;
	bh=WeL+lDV1WbY4GJvELs0WwHCMhMa9KoeM1FXrdqNywvo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYg2PHO9LrU+7vxx7yGsb7ztzjJ5OUCX/s8nv1XyjGEJUhtuXAUf2x7jnfGakbFpm
	 7UskqjixbTQjMPJ7HSexWMVQR14M9/fwaJgUD/4OI9h5ZAS0/yzZ3cjpW9G+EDJxTg
	 sk70yDjX0Omg8oGL8ZdzmKfi67tt5RlEktL1idEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B124F801EB;
	Thu, 30 Jan 2020 16:33:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E3BEF80150; Thu, 30 Jan 2020 16:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46768F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 16:33:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46768F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Y7/IQyc5"
Received: by mail-il1-x141.google.com with SMTP id i7so3397659ilr.7
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bV6ERLPLN+Nz5imIf2CI9p4nZIM3FMkmC+9vLhbbY+E=;
 b=Y7/IQyc5l3CYGlJX4usrdf3hPUmJ17iSnfKn6dyrD3arDCe1U6L9/TGjB+LPdO43J8
 +nLBqDlYn8D534c5wi79hQ+Y0xHXL1n7Kt8JvLHSDGR74+Acg4eN0w+wlTtvrca6BqI9
 P4fsw88V5Te2bP7bpJleV6UcvnFTdnuFkSoT6AjGBd7yI0oiiHm9Y+XtHrVeMywGQId1
 2Q8EvURThmFzE5cy/gZnRRGpGsYOTVYettN1n+ToPbUajHQaWAe503YyVSv4CURvOpP8
 gVAJfnhamHZaLJ3lqjUwv39sODzhwNFISewprt9+Z2dCsIdJYK64pyh51nBlAq4Ta694
 Wn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bV6ERLPLN+Nz5imIf2CI9p4nZIM3FMkmC+9vLhbbY+E=;
 b=Lhy/SleQZpaBZDyKCdar7JOww8ISWB3NHRauiJvJwwG2/BS/y6sE92OArtXr1MN62W
 bT0A7mDhK44VqHvMd+buwDW3oJN90gRdv6SLiApSMwpXrlKOR6d31N5PBr1fCmJ4q+33
 K2+pZHUbOVK2H04FMo9LQPbVFjC8iDEQEAVHc8GdDTQR0RTy+oXqSnTDRQS8Rt/VuWeo
 RqPhu1h3fxo0/Aipd1JhNtgFdtTupDypT+ntBSUFPWai/2azTJNdd9kr+Eff7Qu3cIFM
 SCryBYrwVv9pqypOReDgWnRddAYYmaWLj1kfyP2RMiGRm3bDrIhneetcl489IV+YESEX
 sSTA==
X-Gm-Message-State: APjAAAUYrQhFQAF+IJVZ5GRIYlYcuVA2jv5AhroWqvnbWEwR2wkWkMhl
 dpSsxHxRrw4khE3Q+rRIU0JGhfVGXv9G1VvJS6AdfA==
X-Google-Smtp-Source: APXvYqyjpdf1DHByicNDllhahEn4Bd8DJDyOtQrL8eU0W0cuuKSn3osKTCZACn15YN3XiuU38cRo8HJgkH7khGV7y4A=
X-Received: by 2002:a05:6e02:685:: with SMTP id
 o5mr4772578ils.209.1580398397902; 
 Thu, 30 Jan 2020 07:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
 <20200129220726.31792-6-pierre-louis.bossart@linux.intel.com>
 <2c982980-32f2-60a4-a384-7b767fafab66@linux.intel.com>
 <615262ec-2515-ef6f-1ed4-8c42170490c4@linux.intel.com>
In-Reply-To: <615262ec-2515-ef6f-1ed4-8c42170490c4@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 30 Jan 2020 07:33:07 -0800
Message-ID: <CAFQqKeV5grgKvObGf-9vYb-9M4ddq+vK=VCrPjbV9kKc1s_-Cg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: SOF: Move DSP power state
 transitions to platform-specific ops
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

On Thu, Jan 30, 2020 at 7:07 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
> >> @@ -495,13 +645,27 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
> >>       }
> >>       /* init hda controller. DSP cores will be powered up during fw
> >> boot */
> >> -    return hda_resume(sdev, false);
> >> +    ret = hda_resume(sdev, false);
> >> +    if (ret < 0)
> >> +        return ret;
> >> +
> >> +    hda_dsp_set_power_state(sdev, &target_state);
> >
> > Return value  of hda_dsp_set_power_state() seems to be checked or
> > directly returned in other functions, any reason to not do it here?
>
> Good point Amadeusz, not sure why. And looking at the code, I am not
> sure either why we don't use the abstraction w/ .set_power_state() ?
>
> intel/apl.c:    .set_power_state        = hda_dsp_set_power_state,
> intel/cnl.c:    .set_power_state        = hda_dsp_set_power_state,
>
>
> git grep snd_sof_dsp_set_power_state
> sof/ipc.c:      ret = snd_sof_dsp_set_power_state(ipc->sdev,
> &target_state);
> sof/ops.h:snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
>
> If the code can be platform-specific, we shouldn't make a direct call
> but go through the platform indirection. it's fine for now since the
> same routine is used in all cases but it's not scalable/future-proof.
>
> Ranjani?
>
Hi Amadeusz/Pierre,

This seems like a miss. We should have returned the value of
hda_set_power_state() directly here.

And to address your point, Pierre. This is the platform-specific code, so
the use of hda_dsp_set_power_state() should be permitted no? Whereas, the
part that uses this function in ipc.c is not platform-specific.
Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
