Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067B38676C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 18:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9067E1615;
	Thu,  8 Aug 2019 18:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9067E1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565282852;
	bh=dsO1T7cIBoLR3lYv9kkKynv4vBle6Uiwv/V6OALeEiw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEO947+c2rmJ64hCK14BSx0mCLOcUwHpwS61TTbogAiyt+sTwUwpdmSt5tpKFprF2
	 c9ajRDU4bVM8V6smW2gPvLBWfFGPRoeSFIkIjTddiJV95Ye5ZnYUgI+oPVpDhsuB4j
	 xgVPBcDoeUuk6AM8XjCeiJfK1nUjkjbJzMLqgIo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27EA4F8053A;
	Thu,  8 Aug 2019 18:45:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86D22F80534; Thu,  8 Aug 2019 18:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 757A8F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 18:45:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 757A8F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="RopCZqr3"
Received: by mail-yb1-xb44.google.com with SMTP id s41so12184311ybe.12
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2zgmG9gzttWwZsG4hP7NVAu9zodFNMyNGvJuSB6pFg=;
 b=RopCZqr3Hx+ujkTV3myl7e5T9iVQ5RMc2uL1NFDfJScDY4Wu3efEr1zpw0+Rdqi5jw
 sQdgdvMpXAq498KmF9URiP9tiF+5JMypbvTr3T0/mdlivsKQh7SNAOCBa1vP005DSRuy
 631rtoHfMfSBaB46V7VipM+jdQdCjz/t9X/FQoMMmNa5hZMC5tPhk77LxaGoUi33jb/B
 LZAHHG9kLrjCSThYeuUJ1kkFKmxna/V9t5w6Uyj07hT0W1MCHCe3L1yWKk3lgH9GxNOe
 9VQDWQxSJA6tRFU3yPylyQ0Tiv/ikcGsilwATQxXSJG+FjDipLW95LzfQFUB7YC/WIu1
 FbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2zgmG9gzttWwZsG4hP7NVAu9zodFNMyNGvJuSB6pFg=;
 b=cSI2Nsyv7jZxQ0LwK0yS21OpIhVVz3unaLljbxgN4jjJXDA4kMNsQTrn/grgKIBLNo
 LYPGRvsrHj5dnI1MfqRtQQc9KdieaOIJY3xuXKkX0Dbf8bhdV3SPDI59XW4KSyMM0aWj
 GHKPWOoDwECLBGlL6nTwKufxfpyxGHS6INERqdz7Wbwk0LvLX7HSvA6sQBYVo9gnXqIf
 NNCxGJg828u2SrlPXhvxpkYXx7BOtu6lhGrRwnP1ArdmTWg2WEBF5wzzu2/bD6/7xQsK
 1+6KmCHr85oBCbH7EBYbXTAoMxawKgFqSBjaTpzO2i33MSMVq3N/4qXh0oC7BmZfBVZk
 JykA==
X-Gm-Message-State: APjAAAVp9GNCOd1kPYsh81zXisHnRxBqALVUAs2jPm3zLRKeBp30b9Fh
 Dlm6NgsFX8K8ocY/GbrPedoV6qRQHeUYNd//RnNU1A==
X-Google-Smtp-Source: APXvYqwJySKqlqRk9Wm31sBQl0FRSt0vP2paWJE5qBPm1hl3chY+4pDsStMHvKcJNUwJp977WMDfE3sodvEZyPnhBmE=
X-Received: by 2002:a25:c6cc:: with SMTP id k195mr6270017ybf.142.1565282741605; 
 Thu, 08 Aug 2019 09:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87ef1w6w8o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ef1w6w8o.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 8 Aug 2019 09:45:30 -0700
Message-ID: <CAFQqKeW=ibEs3jN==8DGJ-OvbHcTqKbb1VMTHjWupnsDjm5m5w@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>, Danny Milosavljevic <dannym@scratchpost.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hans de Goede <hdegoede@redhat.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH 15/15] ASoC: soc-core: add
	soc_unbind_aux_dev()
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

On Wed, Aug 7, 2019 at 11:03 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> It is easy to read code if it is cleanly using paired function/naming,
> like start <-> stop, register <-> unregister, etc, etc.
> But, current ALSA SoC code is very random, unbalance, not paired, etc.
> It is easy to create bug at the such code, and it will be difficult to
> debug.
>
> soc-core.c has soc_bind_aux_dev(), but, there is no its paired
> soc_unbind_aux_dev(). This patch adds it.
>
Morimoto-san,
I'm not sure it quite improves readability to just have list_del in
unbind_aux_dev(). bin_aux_dev() does more than just adding to the
card_aux_list(). So in fact, I think  this change makes it look unbalanced.
The existing code for aux_dev looks quite similar to what bind_dai_link()
and remove_dai_link() do and they are quite intuitive.

Thanks,
Ranjani

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index f8a5464..5e3b907 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1527,6 +1527,11 @@ static int soc_probe_link_dais(struct snd_soc_card
> *card,
>         return ret;
>  }
>
> +static void soc_unbind_aux_dev(struct snd_soc_component *component)
> +{
> +       list_del(&component->card_aux_list);
> +}
> +
>  static int soc_bind_aux_dev(struct snd_soc_card *card,
>                             struct snd_soc_aux_dev *aux_dev)
>  {
> @@ -1578,7 +1583,7 @@ static void soc_remove_aux_devices(struct
> snd_soc_card *card)
>                         if (comp->driver->remove_order == order) {
>                                 soc_remove_component(comp);
>                                 /* remove it from the card's aux_comp_list
> */
> -                               list_del(&comp->card_aux_list);
> +                               soc_unbind_aux_dev(comp);
>                         }
>                 }
>         }
> --
> 2.7.4
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
