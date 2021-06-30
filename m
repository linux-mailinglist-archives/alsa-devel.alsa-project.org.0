Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750973B7DEE
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 09:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39391686;
	Wed, 30 Jun 2021 09:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39391686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625037479;
	bh=PY6GgYdaq2MYoka8HZ9TGL2E7Izo24hZCEOCFmYYsBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aZBpwsdY2YcxFABacWDslnB2R3NzgPGa1NSpPXGEltWc3A4EPhfuWqbC7HFsfazvU
	 RAy2Stf3w0qXogkc5QyrXtEOmjgi8vXEs5dDh361ycSSyi+TztMXRMf6ger+Fztk2t
	 FK1F37T299hUx+GczvVhJkMIXgovHAplEzt3qqZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 458E3F80240;
	Wed, 30 Jun 2021 09:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AAD8F80229; Wed, 30 Jun 2021 09:16:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F8EDF80156
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 09:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F8EDF80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IGdEYV6i"
Received: by mail-vs1-xe30.google.com with SMTP id u10so1091517vsu.12
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 00:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TuH+apv+oCsNlAaVg/wm9SSIEaZ31aCvx1H+A/KchsU=;
 b=IGdEYV6iubpDLMJ5m37PeamgcGglH/0msMCWnvoKR2cBD1N3/JtHZL1wE9KAdHSi3H
 xTvWfW3VmOzaVAhl7Ii0oVmP0EXSE8BIH6ZM0M+ciyJnXN4JsjWPfSHYIuxLKRzev0nx
 fV1gE7pl10g/f8CqwzUpUmUoEvnO25cj1vEnbRKmoifogBgMly3lkbQAU/AhBFtI610G
 GkFjOJhJwnT7+ieWuJK+83HH5LU3Z6NspbkLupjpvsxE5AP/oxfv+wEhtg1A3vLO5Y2z
 Pg3fKMwDqP6oZ/wVIQ9Kun1+Qy/UL/5dReInoEsbi/58arJ9eK0h1oc36jewINxUW/+D
 loLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuH+apv+oCsNlAaVg/wm9SSIEaZ31aCvx1H+A/KchsU=;
 b=Fzqv/HgaLJqAX9PNX59IuoJmnV4jhXLeyEAiQ1BrcpgF/DC3cgNItBhjFmweeEVaIN
 Qu8I7jCVcRHJ4SYadSYYtVGNbnPlLiuzNnwg6axPSVQosDgE/xzq+kUaVttr8B+b54nh
 DRWWd/uUlZ/rmyi229vWHAG5Psr9idfOcEeXsuvkMGJDQccYFge3SQXeTS34M++lKUdK
 hSkqEBFye7RcOBpWshXEmZoeJDRPZUrgB2MjuELKeTQvpGmJvVvmlacXC5Q2qXhst/Xf
 /HFy1SLP4cxX2NP+VbGbO9kDeqTcHD5izEAouvxOSsMDFIQ1a6tF8g4U/XUVIORe65AR
 7voA==
X-Gm-Message-State: AOAM530mNcEBA3DySu3jmIK8BKLFTqnuk0U7lHvrFBkGZiGfyZu0pUqq
 5hITsriWGe+QNbLftbkE0DGYSNt8QiXkdwgR8xw=
X-Google-Smtp-Source: ABdhPJw7g8ho6fKOpvf4aTR7903FLbCsjlynaCr0P8Dos7cRRhdQHQRQLYhXXpH90eWmhbXWXbhuUGYOqhbmNPO9n+U=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr28872305vsp.59.1625037379726; 
 Wed, 30 Jun 2021 00:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <202106292156.mWNAaVQA-lkp@intel.com>
 <20210629132909.GA7935@233d919f385f>
In-Reply-To: <20210629132909.GA7935@233d919f385f>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 30 Jun 2021 12:46:07 +0530
Message-ID: <CAFqt6zZ6V27JK6MtC__T6o2bpT_BJJHcGX0xOURoqTaTQEBc2A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix returnvar.cocci warnings
To: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
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

On Tue, Jun 29, 2021 at 6:59 PM kernel test robot <lkp@intel.com> wrote:
>
> From: kernel test robot <lkp@intel.com>
>
> sound/soc/codecs/wcd938x.c:1628:5-8: Unneeded variable: "ret". Return "0" on line 1656
> sound/soc/codecs/wcd938x.c:1871:5-8: Unneeded variable: "ret". Return "0" on line 1907
>
>
>  Remove unneeded variable used to store return value.
>
> Generated by: scripts/coccinelle/misc/returnvar.cocci
>
> Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
> CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: kernel test robot <lkp@intel.com>

Acked-by: Souptick Joarder <jrdr.linux@gmail.com>

> ---
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   73748627df83aab934c81332ca83a44ab8c7b3e3
> commit: 04544222886881cb0865040dcdf747fe7e025947 [8525/14055] ASoC: codecs: wcd938x: add audio routing and Kconfig
> :::::: branch date: 4 hours ago
> :::::: commit date: 2 weeks ago
>
>  wcd938x.c |    6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -1625,7 +1625,6 @@ static int wcd938x_codec_aux_dac_event(s
>  {
>         struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>         struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
> -       int ret = 0;
>
>         switch (event) {
>         case SND_SOC_DAPM_PRE_PMU:
> @@ -1653,7 +1652,7 @@ static int wcd938x_codec_aux_dac_event(s
>                                 WCD938X_ANA_RX_DIV4_CLK_EN_MASK, 0);
>                 break;
>         }
> -       return ret;
> +       return 0;
>
>  }
>
> @@ -1868,7 +1867,6 @@ static int wcd938x_codec_enable_aux_pa(s
>         struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>         struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>         int hph_mode = wcd938x->hph_mode;
> -       int ret = 0;
>
>         switch (event) {
>         case SND_SOC_DAPM_PRE_PMU:
> @@ -1904,7 +1902,7 @@ static int wcd938x_codec_enable_aux_pa(s
>                                                       WCD938X_EN_CUR_DET_MASK, 1);
>                 break;
>         }
> -       return ret;
> +       return 0;
>  }
>
>  static int wcd938x_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
>
