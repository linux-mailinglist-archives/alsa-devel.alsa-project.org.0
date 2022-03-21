Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B4E4E4297
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFCDF168D;
	Tue, 22 Mar 2022 16:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFCDF168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647961989;
	bh=kw+oJL8+/opvBM864UPk5C4XJQyDqeuLXUZJjpvCxV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZXnT5husrAxPfUa0I4PLsA5ivq9y8Pb3dmhBtOtoxgpJoy3tFVEXzJPFGt0NFaq/
	 vuEfG4oLuSmZnuJgT2pyckLrxd4kItxXMEpYrHkYS04KuuXf9s66YMWBkDuVyOQLgj
	 MPtFNf/fzXNTd+To1WPJaoT32vv08tdo+RVHRxZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43658F80533;
	Tue, 22 Mar 2022 16:10:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37174F80227; Mon, 21 Mar 2022 09:12:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D42EF800FD
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 09:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D42EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BhteqGXg"
Received: by mail-qt1-x835.google.com with SMTP id j21so11367631qta.0
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8WxpDi03iWCNVX/uFr39maVmxk/vSYYBrdnUfsRbk0=;
 b=BhteqGXg+Pn7xpMyGo516M8LYiHW9USQsdfdHYcgg01Az4565sFCdXsXTkpAXDlwrs
 M4Jpb/zofdtQwxCE3qgmgsTAqF0fYnEz5FeAr4eQZO4H1Y1Rkn44qEdHYX47FpZSK54m
 nq6IcZIJg9NcRCCcieOKukFmRQUvsw4nq7MwVLtHqrRV/KQY3UfaKVoi2kRYP4eBEq32
 uObt0MK8gfYT+pxQQbkAIlGE/rtUhbPt57W0z39r6rAZbp2BKxPd5ss7G37yPQKtu6R+
 HzbxT2vqI4ee3+m7jQ7HbfWA0C3CbPqA8u4fH9QdTWph5mEzP2kKGNZA8kV1q2PSEfai
 3dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8WxpDi03iWCNVX/uFr39maVmxk/vSYYBrdnUfsRbk0=;
 b=vIKpnR+AIVPFB7n/pSfWL5qoQQ4aFUEHepb+naHB3eNghnHIa1phWqDBzeARv/IvGQ
 oB4l+V8AVNnvPMeJ2khs5DCiEPB2w871oBYPljQ02OR8ZouVOgr07V77gmxYNgMw66Zf
 E1MCNvRyXXjU7z/M/xh7vlXbqxvbugX6h7PpjTkYzDfS0s4WHfONJcLdP7y4RLfuASLw
 V9ngI1SAO9oZhu+gizBPsLN+7IrsVvNkPcIqmVuZR5E8uz876kb7BU7xMj1EjFDrjyzM
 U4x3hOLpmCKy4fyg/EKWEZ/pS/ddo9DYqShQ9O8EGWXl8CPei1RP8zoWLTjHkrtnKcUw
 KxiQ==
X-Gm-Message-State: AOAM532MjjfxwALLHGureOsAQTVoapLSyO7XjlYRJf4JInug4Zq+6XTs
 ytKm5vF9wURI7BuGzg4dWo7g+bxTlUiKYIJJmzc=
X-Google-Smtp-Source: ABdhPJxZs050Ub4KULZ6aBWxvddTPid/SWEhORqtQwEbpEyPlqgGXMQLeDI11jwN2qQEtF7PT8eZdU9S6bWV0FXm2OI=
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id
 b22-20020ac85bd6000000b002e1c84135f6mr15379502qtb.120.1647850363792; Mon, 21
 Mar 2022 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220321065754.18307-1-tangmeng@uniontech.com>
In-Reply-To: <20220321065754.18307-1-tangmeng@uniontech.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Mar 2022 16:12:32 +0800
Message-ID: <CAA+D8AME8Ojc-Cfr0VEeqSk6_Jb+EB1S9NtNzTM3JpKR2TySzA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Fix jack_event() always return 0
To: Meng Tang <tangmeng@uniontech.com>
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:02 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Mar 21, 2022 at 2:58 PM Meng Tang <tangmeng@uniontech.com> wrote:

> Today, hp_jack_event and mic_jack_event always return 0. However,
> snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
> non-zero value, this will cause the user who calling hp_jack_event
> and mic_jack_event don't know whether the operation was really
> successfully.
>
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl-asoc-card.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 370bc790c6ba..d9a0d4768c4d 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -462,11 +462,9 @@ static int hp_jack_event(struct notifier_block *nb,
> unsigned long event,
>
>         if (event & SND_JACK_HEADPHONE)
>                 /* Disable speaker if headphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "Ext Spk");
> +               return snd_soc_dapm_disable_pin(dapm, "Ext Spk");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "Ext Spk");
> -
> -       return 0;
> +               return snd_soc_dapm_enable_pin(dapm, "Ext Spk");
>  }
>
>  static struct notifier_block hp_jack_nb = {
> @@ -481,11 +479,9 @@ static int mic_jack_event(struct notifier_block *nb,
> unsigned long event,
>
>         if (event & SND_JACK_MICROPHONE)
>                 /* Disable dmic if microphone is plugged in */
> -               snd_soc_dapm_disable_pin(dapm, "DMIC");
> +               return snd_soc_dapm_disable_pin(dapm, "DMIC");
>         else
> -               snd_soc_dapm_enable_pin(dapm, "DMIC");
> -
> -       return 0;
> +               return snd_soc_dapm_enable_pin(dapm, "DMIC");
>  }
>
>  static struct notifier_block mic_jack_nb = {
> --
> 2.20.1
>
>
>
>
