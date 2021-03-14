Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734C833A446
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 11:50:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04191174A;
	Sun, 14 Mar 2021 11:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04191174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615719034;
	bh=VUMtUyIaP6kdAEEO7P8iY/LQNIQ2eqweizIN/g6g05I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZkXAhV77jwtbwLXRg7ugb8P5rUtV4QOc8H0UnyTqtJvqtccb71ES0lDMKJO1u/V5
	 q/u3bx5r+OLi4EZEMNxapgiwzENPs9Y8vvjpfy2KbqDz+7N527dmAVAk262Vhf4Ion
	 ScCdMhomTDWSsYS1ZvBK40/I0RR16GWjLXW8Qng8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 713D6F80148;
	Sun, 14 Mar 2021 11:49:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38AC0F80218; Sun, 14 Mar 2021 11:49:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F214CF8010D
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 11:48:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F214CF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L0YG7sqg"
Received: by mail-pj1-x102a.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so12867877pjh.1
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=26KkwIgjg/uTfsjc8TtIq14TTjHPyD1v2KRrAGEx6No=;
 b=L0YG7sqgOD82dycT3zb43+3bV+4KcOUWGTYw3FD9lPQ7CwC30nHoczsu3LpOj1TiBu
 JRmcoezM/701NrahsQsRaqrsxuSFdrmL6Eiuk0Jqg65EHojUFsVKZymhArhYONrem+oZ
 h3vO/08P/Pxvq8PtFewkf6W6qlgUO5uOQnLFHIsCWl7KVWvm22qluaPEDOOBONK+9QWx
 Gt6Xz6fULIqu4q2F+f7tmmaerwEmAXMR/dxZXKwsdoyDgasK8RlHNTwt9yk7GV0Cebaz
 ExU74N7DH2P+La4UvXp+kPrpOVl+Nmf8AFdK7qWKZisN2ugsI8caQzaQi91K6dk2tT8F
 1VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=26KkwIgjg/uTfsjc8TtIq14TTjHPyD1v2KRrAGEx6No=;
 b=IjXKyT8AVX1z36aHD9GKm0v8ZI3Zq1KVnMaje7uEAL0qNi/UqZ34RERYLTJx2DAibm
 Y/dT+h8wnR/0GgjX/wTa8ltZXAEJJgjdR0VuabB2Vq9j2Eb3vRvCrMwDWYZ9jgCe5gq8
 k8g/XEIjWA6t74okhHlWX9yV9kVAtntpT25ccdqCQCYF5rTouky13n17XP0f3JCUDH+U
 BGBgAzY5RgQjaGZmA7zu2Pv8RRppmlsVvru4ejNu7CuBTva/JGx9gtRdzbpPmMRi+cUh
 B9xy7xAQHMoniUqAKm7l5uKCQ70o75UATYP/S2qCAEGt0HtdoFkvC1ctf7drd4DuNwio
 YIWg==
X-Gm-Message-State: AOAM532jAcSA9lmANeq78iUS7IiZHJWhQAorvj76J0G4UgJn+PxgsPi9
 jYwqdRF26/ll0dheJcc+HB3cL18ssZgbISbnnb0=
X-Google-Smtp-Source: ABdhPJwcOKC0tTgmO4LyBTenkqIATxChoULkVUiJEBgBseTebqQ9KZw1DqjyWO76dd6R1sdnM0dc3bg0FXk5EzMMC0Y=
X-Received: by 2002:a17:902:a406:b029:e6:78c4:71c8 with SMTP id
 p6-20020a170902a406b02900e678c471c8mr6915981plq.17.1615718932920; Sun, 14 Mar
 2021 03:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210314074434.164868-1-nick.desaulniers@gmail.com>
 <20210314080613.190663-1-nick.desaulniers@gmail.com>
In-Reply-To: <20210314080613.190663-1-nick.desaulniers@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Mar 2021 12:48:36 +0200
Message-ID: <CAHp75Vdy083+5K=4sViwg8uNJ1_6agECYbjMSFEGXX9VTO85WQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: skl-topology: fix
 -frame-larger-than
To: Nick Desaulniers <nick.desaulniers@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: guennadi.liakhovetski@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 mateusz.gorski@linux.intel.com, Jie Yang <yang.jie@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Mark Brown <broonie@kernel.org>,
 amadeuszx.slawinski@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Sun, Mar 14, 2021 at 10:08 AM Nick Desaulniers
<nick.desaulniers@gmail.com> wrote:
>
> Fixes:
> sound/soc/intel/skylake/skl-topology.c:3613:13: warning: stack frame
> size of 1304 bytes in function 'skl_tplg_complete'
> [-Wframe-larger-than=]
>
> struct snd_ctl_elem_value is 1224 bytes in my configuration.
>
> Heap allocate it, then free it within the current frame.
>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> ---
> Changes V1 -> V2: rebased on mainline.
>
>  sound/soc/intel/skylake/skl-topology.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index b824086203b9..566d07b4b523 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3613,10 +3613,15 @@ static int skl_manifest_load(struct snd_soc_component *cmpnt, int index,
>  static void skl_tplg_complete(struct snd_soc_component *component)
>  {
>         struct snd_soc_dobj *dobj;
> -       struct snd_soc_acpi_mach *mach =
> -               dev_get_platdata(component->card->dev);
> +       struct snd_soc_acpi_mach *mach;
> +       struct snd_ctl_elem_value *val;
>         int i;
>
> +       val = kzalloc(sizeof(*val), GFP_KERNEL);
> +       if (!val)
> +               return;
> +
> +       mach = dev_get_platdata(component->card->dev);
>         list_for_each_entry(dobj, &component->dobj_list, list) {
>                 struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
>                 struct soc_enum *se;
> @@ -3632,14 +3637,13 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>                 sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
>
>                 for (i = 0; i < se->items; i++) {
> -                       struct snd_ctl_elem_value val = {};


Shouldn't you use rather kmalloc() + memset(). Otherwise I don't see
how possible this won't be garbage on the second iteration of the
outer loop.

> -
>                         if (strstr(texts[i], chan_text)) {
> -                               val.value.enumerated.item[0] = i;
> -                               kcontrol->put(kcontrol, &val);
> +                               val->value.enumerated.item[0] = i;
> +                               kcontrol->put(kcontrol, val);
>                         }
>                 }
>         }
> +       kfree(val);
>  }
>
>  static struct snd_soc_tplg_ops skl_tplg_ops  = {
>
> base-commit: 88fe49249c99de14e543c632a46248d85411ab9e
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
