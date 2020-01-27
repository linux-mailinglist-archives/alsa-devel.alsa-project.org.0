Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93014A9DF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 19:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4534B83E;
	Mon, 27 Jan 2020 19:35:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4534B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580150198;
	bh=Kw3OufkOkcMaH6kCfu0esSVPR+zMt/jTmuP3RB4rx9I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kVLw7bQZU7j8N7mlqeUiqQDYuuVQLSW9gFmFGD1L8ixey3/COaBVztM1BlaxXwgNk
	 kCV7F57CgZmvB/U/SpvF2y+tdvu+K6NPzlVy5TZCgzd7Ldc40ewa7wO6CHYjBisYZK
	 Klgajbtka46nLzePnwTC+KDlOzeOwNSaHEybtF70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34723F80082;
	Mon, 27 Jan 2020 19:34:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507CDF8021E; Mon, 27 Jan 2020 19:34:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C3CDF80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 19:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C3CDF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="E1W7t4sP"
Received: by mail-il1-x144.google.com with SMTP id f70so3312099ill.6
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 10:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ypz+NUtpbYS2ggVSJLhA8JF3h3rmKzRu9BWaDcNV4qA=;
 b=E1W7t4sPQK417tDD3gTB0SHVcAHo7RPGlvCcWXX6ABeZdb08Wyaz9GZ/leZ7MUaCIp
 lDgawr9SsWuri07j4JrqWt6+jc8au8utAoH4rdH3hC1AyE3RmruZgvdGjbompRRbPP/g
 PSfZ+Xk3YBTHwVUHXlXIrYZz1GmZ1nUf+TH7vKMLUCBxndp2XPdBld7fTBrCqpa24E2s
 ULdJ6iF9kTXZtWmbwu1Snd/rpgkDhUVNokUiNW1fiRxIFPTllFz9xVFL2MCJL4pqH3Yy
 Th48SCo8UuuWpGkRPh9hj0Or6irZKIed4/Avju8gYjFymYSGKB3dZlBZnZgJvIPAMA0C
 Ia+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ypz+NUtpbYS2ggVSJLhA8JF3h3rmKzRu9BWaDcNV4qA=;
 b=HxKlxq6d/DDhzIJ5oxJ2B9VARz08tdluGyPK4I0UkR1yXCtjoeF7A61kk5i7Dl4LE8
 B0HNBQt5ygcH9ZXGWwJSIwS1H3vv3bLLo0HcQX7yuJCCL4TBNUj9Ds9AttmBxbURTrZo
 Z4t3IO1gyl4KnEHfBcWLCACjCScDZ3vIEtRkWlWklM81yw0ySQc+nIBNZY60ODy+TmYG
 zkqiF0uvvSDp3oJVmaTI4eoCmHpDVGka7Eb/nlqyBIB3L5lvSqKz50VfwmCMmEWLHnJd
 TrIWZFPWi4EOlpOU+oidloi0ukCmHVxWjkVK/f5nxrHTDz6/WO9sKgeENxgahvHvnJeG
 415Q==
X-Gm-Message-State: APjAAAVbECEVMAlaOoDpveWO0B1W+xFOIp+bfd+3fRjqNwwriEGjuZUT
 D+1cq2dAjRQxWW7ORm0WIEqeEG7UKhOopt8Ajdv3Uw==
X-Google-Smtp-Source: APXvYqzFXxkcbBSBlz0TpDHPeNldGhwWv9IEDsUqmirKDciCwspyciAqEYaRUHhqgJHOvHPivfJpErqiAJNWl8epeeg=
X-Received: by 2002:a92:911b:: with SMTP id t27mr16006926ild.142.1580150086953; 
 Mon, 27 Jan 2020 10:34:46 -0800 (PST)
MIME-Version: 1.0
References: <877e1doeis.wl-kuninori.morimoto.gx@renesas.com>
 <87zhe9mzx3.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhe9mzx3.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 27 Jan 2020 10:34:36 -0800
Message-ID: <CAFQqKeUjcgXQv8HdyMyefER+1A3awY3u0wabzeEYp2z5UGF4nQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 5/7] ASoC: soc-pcm: goto error after trying
 all component open
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

On Sun, Jan 26, 2020 at 5:54 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> soc_pcm_components_open() might goto error process *during* opening
> component loop.
> In such case, fallback process need to care about operated/non-operated
> component.
>
> But, if it goto error process *after* loop even though error happen
> during loop, it don't need to care about operated/non-operated.
> In such case code can be more simple.
> This patch do it. And this is prepare for soc_snd_open() cleanup
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 41 +++++++++++++----------------------------
>  1 file changed, 13 insertions(+), 28 deletions(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 57d2f00..1e370ef 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -463,47 +463,32 @@ static void soc_pcm_init_runtime_hw(struct
> snd_pcm_substream *substream)
>         hw->rate_max = min_not_zero(hw->rate_max, rate_max);
>  }
>
> -static int soc_pcm_components_open(struct snd_pcm_substream *substream,
> -                                  struct snd_soc_component **last)
> +static int soc_pcm_components_open(struct snd_pcm_substream *substream)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
>         struct snd_soc_component *component;
>         int i, ret = 0;
>
>         for_each_rtd_components(rtd, i, component) {
> -               *last = component;
> +               ret |= snd_soc_component_module_get_when_open(component);
> +               ret |= snd_soc_component_open(component, substream);
> +       }
>
> -               ret = snd_soc_component_module_get_when_open(component);
> -               if (ret < 0) {
> -                       dev_err(component->dev,
> -                               "ASoC: can't get module %s\n",
> -                               component->name);
> -                       return ret;
> -               }
> +       if (ret < 0)
> +               dev_err(component->dev,
> +                       "ASoC: error happen during open component %s:
> %d\n",
> +                       component->name, ret);
>
Hi Morimoto-san,

Wouldn't the component here always be the last component in the list of rtd
components? Should this error log be moved inside
the for_each_rtd_components() {} above?

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
