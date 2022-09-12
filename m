Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BA35B569F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 10:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5EE168D;
	Mon, 12 Sep 2022 10:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5EE168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662972590;
	bh=eakuS3F40dlkkj505qfFDtUhxqE37ITqb2CO4A5QAis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAJp4B0KCQLLyy5U3kNxtm25MoiuEp0V72U6ae+sk7LYPluQG6WzenisSUOsmD+D8
	 W4r3crP4hhinA22nWh1z13zXqV+PqvzFAtind+vHBMOQJyiDMFlTXf5ezw8cV9f+0S
	 ULzgcG639eMuvfnGqm2FF6Hq5e/DbQYteMyAP5A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED36AF80095;
	Mon, 12 Sep 2022 10:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01435F800EC; Mon, 12 Sep 2022 10:48:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BD53F800EC
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 10:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BD53F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Phx26Sw0"
Received: by mail-ot1-x332.google.com with SMTP id
 v2-20020a056830090200b006397457afecso5359685ott.13
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=oIPlj77S7TL3EFKkzdGb3gdQ5LXHDMLWke3cCptq+uM=;
 b=Phx26Sw0C0/q7KiFz7tbZrU15U/bIg1itlUhlajdilKJCe+ZEn0BY9dMFemw/JaFlM
 D32lZi4+ywqgMBRKDKiKOxWMMgY9qXMhepZ296QYJeLrrPDBY6I/JBRtqcXRk46omA2l
 dZQdUMgmJyDFxq4HLMQK3/dJzOtxq0jT+RSlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oIPlj77S7TL3EFKkzdGb3gdQ5LXHDMLWke3cCptq+uM=;
 b=mYKHo9CkudVC78iJqcc7fMAc40U6UgyycHTQEUukjM3pcTglYrGDvRcYsisalxfl+D
 uP8O7DhkaMgeEYjpLcJG2J25e9p2q8Zwdr+7siRAjy4owVZqzc5wNZAIR3HEalyQW/tE
 zqcyuXKpMYE+A43EUo1fSin8tMuHxvOdONhB+voDtOAKbjdz3MADMiODgOW55S9XnMeG
 ONu5aProdL0yOn3ASktE8HZHtD7zX068FnUhvf7iHHJmeZXUkU3AVtuyzBlRM0dSk6Su
 uOxthR+N0ffCZ7RJf4HfgYutdYqBjYrS3vbHgXTUUg4ngRQNazFQ4GmI1UjfPlRF8ItM
 2EBA==
X-Gm-Message-State: ACgBeo13GbsBm/wJ0dNlgtzDydy+vCeBs4UVJpvOD009dRptT3F/vaoy
 QvJUOSgaPrk/cmVQkAou0q6MB9uDQhRNWeyGGFXT7w==
X-Google-Smtp-Source: AA6agR5F+gCZuv+oh+Q6WUp78QErI7l6b0//NlbqS+axSsTAl9dE1LnsxdC4rhb30WDsYV4IXdBdq1EaHGjxO0jgTmM=
X-Received: by 2002:a9d:51cc:0:b0:655:de5c:f2f3 with SMTP id
 d12-20020a9d51cc000000b00655de5cf2f3mr1987188oth.237.1662972519102; Mon, 12
 Sep 2022 01:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220912072945.760949-1-yunjunlee@chromium.org>
 <87pmg1hvw7.wl-tiwai@suse.de>
In-Reply-To: <87pmg1hvw7.wl-tiwai@suse.de>
From: YJ Lee <yunjunlee@chromium.org>
Date: Mon, 12 Sep 2022 16:48:27 +0800
Message-ID: <CAPm_npbzeq8twNavfWfrAi-v8eky1QNivS7PKOocgxax+T4X3Q@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: dummy: Add customizable volume min/max.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, yuhsuan@chromium.org, whalechang@chromium.org
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

On Mon, Sep 12, 2022 at 3:52 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 12 Sep 2022 09:29:45 +0200,
> YJ Lee wrote:
> >
> > Add module parameters to support customized min/max volume leveling,
> > which will be useful to test devices with different volume granularity.
> >
> > Signed-off-by: YJ Lee <yunjunlee@chromium.org>
> > ---
> >  sound/drivers/dummy.c | 34 ++++++++++++++++++++++++----------
> >  1 file changed, 24 insertions(+), 10 deletions(-)
> >
> > diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
> > index 2a7fc49c1a7c5..64fb2778f1e9a 100644
> > --- a/sound/drivers/dummy.c
> > +++ b/sound/drivers/dummy.c
> > @@ -42,6 +42,8 @@ MODULE_LICENSE("GPL");
> >  #define USE_CHANNELS_MAX     2
> >  #define USE_PERIODS_MIN      1
> >  #define USE_PERIODS_MAX      1024
> > +#define USE_MIXER_VOLUME_LEVEL_MIN   -50
> > +#define USE_MIXER_VOLUME_LEVEL_MAX   100
> >
> >  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;   /* Index 0-MAX */
> >  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;    /* ID for this card */
> > @@ -50,6 +52,8 @@ static char *model[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = NULL};
> >  static int pcm_devs[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1};
> >  static int pcm_substreams[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 8};
> >  //static int midi_devs[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
> > +static int mixer_volume_level_min = USE_MIXER_VOLUME_LEVEL_MIN;
> > +static int mixer_volume_level_max = USE_MIXER_VOLUME_LEVEL_MAX;
> >  #ifdef CONFIG_HIGH_RES_TIMERS
> >  static bool hrtimer = 1;
> >  #endif
> > @@ -69,6 +73,10 @@ module_param_array(pcm_substreams, int, NULL, 0444);
> >  MODULE_PARM_DESC(pcm_substreams, "PCM substreams # (1-128) for dummy driver.");
> >  //module_param_array(midi_devs, int, NULL, 0444);
> >  //MODULE_PARM_DESC(midi_devs, "MIDI devices # (0-2) for dummy driver.");
> > +module_param(mixer_volume_level_min, int, 0444);
>
> I can imagine that the permission could be 0644, so that the
> parameters can be changed dynamically via sysfs, too.  But it may skip
> the sanity check at probe, hence more code would be needed, OTOH.
>
> So I applied the patch as is now.
>
>
> thanks,
>
> Takashi

Thanks for the insight! Learned a lot from your kind explanation and
constant help.

Appreciated,
YJ
