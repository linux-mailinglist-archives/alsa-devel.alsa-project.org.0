Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D9A43219D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 17:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389F517BB;
	Mon, 18 Oct 2021 17:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389F517BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634569388;
	bh=caWGANx8YaX0SuHbSPKIpQTznqFWZEiXM2Nd0fZDSLQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hT/3SJdMk/tl0ET3QEHKzc5qhn9fau2NHU31Wj62E0MXrahplMI3UktNajhdC+6Ae
	 wZFvyfx9Yhv9Vq7MuuwbBphfFaQWTrV61Ed1ELaCX66I8Dh834GWqhA2ik63wGB6/S
	 JYpnhQO5cDF5ygcKhG++89Pr3PnNhxDiNruepBLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAA1F80253;
	Mon, 18 Oct 2021 17:01:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9843EF80224; Mon, 18 Oct 2021 17:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 004EEF80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 17:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 004EEF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JnJZL8br"
Received: by mail-ed1-x52a.google.com with SMTP id r18so295217edv.12
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tnMEOqokmGpTF0hZ3yCzYPnXo4CSB1sMTqH6Lf3QKsE=;
 b=JnJZL8br6Q2nYTjwg5jIu+zhh9Jyt8ILGrDgGFj22JD3RhoVSvIAANwX+nfJL6dphs
 EvEE1rPOB/2P0azICCAdx5YCmt3dmx69YdBZiCOPDeaKmobgpLI4lu3FHIjaG0RfQqLb
 qtgSedIs+R5YVh0vv3NlajJxhGl3TP7g7QDeCwTA4KHnroeS70bUrGAAR660ULgLx0Wj
 wPa1WqPIym7NBzMXcjE9LBYy16t9ZBZaLU+S5K9kqSXfK2vr2KTXgmQRT3fyGbx/y03Y
 vIAResAAty+j4WKPPRUyRHj9mk6QCCL8wEEChgw1xYme9cahIfJVagUFdkRyzYdPXpBw
 UzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnMEOqokmGpTF0hZ3yCzYPnXo4CSB1sMTqH6Lf3QKsE=;
 b=e1vCpF8pnbZeQmXnbnO00UR4YiOA3Qi5aQk/vknZd9h8Wh7OmAi87D5+N798wP9rGI
 ujoCj0xtOvIYnSFzBBU+mDCvo1UEiAAGtNM1dMuxCrO7JpE5bpSCHuJ4DXA6doHaNOPk
 ZtRB3pMnySsk9uQopN9tluI5ZyHMviPlufY8I+pXGeo042mUNjXu4AcsPrAkFERDHJp1
 OTWK2ek8f0fmNlLt//GqxS2ZoaW6ZCcDTziuhFh0GwSUC+9ien+HqmoF26jX5U5QnIbx
 2orm1hUAu6dj1BLPRYL2JBcbPoB7N2PXS0WvnaEkUv7ShABMEzLnJ3y5WRH1Y1MjSnPG
 dVMw==
X-Gm-Message-State: AOAM531OPszqygLwH6zbKfpf0VorIf8ncWaQzlQ5T0pSftxZevakOIEc
 MbkPiZUL/RtbUYHPExKZ5Nm6415eKe2A9YK2WXw=
X-Google-Smtp-Source: ABdhPJynEkPsodXTZDsNXFkWk0EhfjhRKmLVfaw7l3zKUfDj1GIF21oeYL9MALoMrbEbzb3AEcJwTlmPHad02B7diRE=
X-Received: by 2002:a05:6402:10da:: with SMTP id
 p26mr45376484edu.283.1634569291374; 
 Mon, 18 Oct 2021 08:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-2-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-2-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 18:00:39 +0300
Message-ID: <CAHp75VcvBxU=Hx=e+ksVqf5afVUFKKXnt2ZWzgnTypy96wKCfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a
 generic header
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Gross <markgross@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-input <linux-input@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Andy Shevchenko <andy@infradead.org>
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

On Mon, Oct 18, 2021 at 5:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The soc_intel_is_foo() helpers from
> sound/soc/intel/common/soc-intel-quirks.h are useful outside of the
> sound subsystem too.
>
> Move these to include/linux/platform_data/x86/soc.h, so that
> other code can use them too.

A nit-pick below which may be ignored.

> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  include/linux/platform_data/x86/soc.h     | 65 +++++++++++++++++++++++
>  sound/soc/intel/common/soc-intel-quirks.h | 51 ++----------------
>  2 files changed, 68 insertions(+), 48 deletions(-)
>  create mode 100644 include/linux/platform_data/x86/soc.h
>
> diff --git a/include/linux/platform_data/x86/soc.h b/include/linux/platform_data/x86/soc.h
> new file mode 100644
> index 000000000000..8d710834e87a
> --- /dev/null
> +++ b/include/linux/platform_data/x86/soc.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*

> + * soc.h - helpers for Intel SoC model detection

No need of having the filename in the file itself, it even might add a
churn in the future in case of renaming.

> + *
> + * Copyright (c) 2019, Intel Corporation.
> + */
> +
> +#ifndef __PLATFORM_DATA_X86_SOC_H
> +#define __PLATFORM_DATA_X86_SOC_H
> +
> +#if IS_ENABLED(CONFIG_X86)
> +
> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>
> +
> +#define SOC_INTEL_IS_CPU(soc, type)                            \
> +static inline bool soc_intel_is_##soc(void)                    \
> +{                                                              \
> +       static const struct x86_cpu_id soc##_cpu_ids[] = {      \
> +               X86_MATCH_INTEL_FAM6_MODEL(type, NULL),         \
> +               {}                                              \
> +       };                                                      \
> +       const struct x86_cpu_id *id;                            \
> +                                                               \
> +       id = x86_match_cpu(soc##_cpu_ids);                      \
> +       if (id)                                                 \
> +               return true;                                    \
> +       return false;                                           \
> +}
> +
> +SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
> +SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
> +SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
> +SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
> +SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
> +
> +#else /* IS_ENABLED(CONFIG_X86) */
> +
> +static inline bool soc_intel_is_byt(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_cht(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_apl(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_glk(void)
> +{
> +       return false;
> +}
> +
> +static inline bool soc_intel_is_cml(void)
> +{
> +       return false;
> +}
> +#endif /* IS_ENABLED(CONFIG_X86) */
> +
> +#endif /* __PLATFORM_DATA_X86_SOC_H */
> diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
> index a93987ab7f4d..de4e550c5b34 100644
> --- a/sound/soc/intel/common/soc-intel-quirks.h
> +++ b/sound/soc/intel/common/soc-intel-quirks.h
> @@ -9,34 +9,13 @@
>  #ifndef _SND_SOC_INTEL_QUIRKS_H
>  #define _SND_SOC_INTEL_QUIRKS_H
>
> +#include <linux/platform_data/x86/soc.h>
> +
>  #if IS_ENABLED(CONFIG_X86)
>
>  #include <linux/dmi.h>
> -#include <asm/cpu_device_id.h>
> -#include <asm/intel-family.h>
>  #include <asm/iosf_mbi.h>
>
> -#define SOC_INTEL_IS_CPU(soc, type)                            \
> -static inline bool soc_intel_is_##soc(void)                    \
> -{                                                              \
> -       static const struct x86_cpu_id soc##_cpu_ids[] = {      \
> -               X86_MATCH_INTEL_FAM6_MODEL(type, NULL),         \
> -               {}                                              \
> -       };                                                      \
> -       const struct x86_cpu_id *id;                            \
> -                                                               \
> -       id = x86_match_cpu(soc##_cpu_ids);                      \
> -       if (id)                                                 \
> -               return true;                                    \
> -       return false;                                           \
> -}
> -
> -SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
> -SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
> -SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
> -SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
> -SOC_INTEL_IS_CPU(cml, KABYLAKE_L);
> -
>  static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
>  {
>         /*
> @@ -114,30 +93,6 @@ static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
>         return false;
>  }
>
> -static inline bool soc_intel_is_byt(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_cht(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_apl(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_glk(void)
> -{
> -       return false;
> -}
> -
> -static inline bool soc_intel_is_cml(void)
> -{
> -       return false;
> -}
>  #endif
>
> - #endif /* _SND_SOC_INTEL_QUIRKS_H */
> +#endif /* _SND_SOC_INTEL_QUIRKS_H */
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
