Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D03216AF0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 13:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A89E6167C;
	Tue,  7 Jul 2020 13:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A89E6167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594119670;
	bh=HgP0jte1uEBp0/EldBW2mmfa/xaCi6WXeXmXNLmIHk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKKglqjgphK289FEnpW0KIR/1PFn/VG3gyOGL56NRrQjc4oRjdo4+Ja6z4KXxWcuX
	 3FfdQ3rbVN1dNl8m35kRVe91qgMMHx4VOa8i3u/X8oxWxFrMRp2hAb5Hk9szAZmQ7C
	 0vpayfU7hQfRs2q+YBjtLWU2ONWTmhQLlyITuOe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FD2F80257;
	Tue,  7 Jul 2020 12:59:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F27A6F800D0; Tue,  7 Jul 2020 12:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6274CF800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6274CF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="dLgZqZOb"
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 067Awmw7012540
 for <alsa-devel@alsa-project.org>; Tue, 7 Jul 2020 19:58:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 067Awmw7012540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1594119529;
 bh=Q7blUsQ9JbN98/2v6PmnTU26WzCTrui/OAXxYYFuhio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dLgZqZOb+1s/K5aLOfNDqded0K4JdophwcRkFTTL4Po8yMixKmG+ezypY5cDyonf4
 2baAVDsHGf9tXnEbJkwAkUxwBjhzElyQYq6jF71BODCtrwzGkQDlhZK+zV5aJ6muWv
 Otb0oPc/nL3cgndiZ0BQSAr/9aeG1Sy5JYzIMpNB/HffKJxL+r+fxAQ4oEfCYwL92T
 LG3UHUJiJIPz3P1f9B/s6n/RGQOyFtSzHitUaiR2rwMA/uy6ZTvGI/rJiRmt5c/B6N
 KHt92Tf5QfGQkq4D9JeqidL8NYp96aajg4loIh+m7/AT8B96bZbBSJemFzbtDhBEqo
 ZmPN9LuYqhm5Q==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id 64so16026723vsl.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:58:49 -0700 (PDT)
X-Gm-Message-State: AOAM5330A+fadRr2GtNwfqJtsuJOjg083zBwgOaIg25ehgGLr5FJ7bsb
 UqNE3wZgwQOtPtVtyrGEHaiIM4VB4P7gkr41Sk8=
X-Google-Smtp-Source: ABdhPJx5C6TC1CTC3ZI4pLzUX4bW+vK98tg3hyw8GkksN3pcaONQiKgWX4RJM4Cxt/R3M5Kza1brZQUcvvb5lnQhBNU=
X-Received: by 2002:a67:6c84:: with SMTP id
 h126mr35660734vsc.181.1594119527826; 
 Tue, 07 Jul 2020 03:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <20200702165901.164100-9-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200702165901.164100-9-pierre-louis.bossart@linux.intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 Jul 2020 19:58:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARV9p=TF+5kPx-MBOsGnE9mafndYTEoaWRAaieqeL5a5A@mail.gmail.com>
Message-ID: <CAK7LNARV9p=TF+5kPx-MBOsGnE9mafndYTEoaWRAaieqeL5a5A@mail.gmail.com>
Subject: Re: [PATCH 8/8] ASoC: uniphier: aio-core: fix kernel-doc
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "moderated list:ARM/UNIPHIER ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Fri, Jul 3, 2020 at 1:59 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> Fix W=1 warning - wrong parameter description and bad format
>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


>  sound/soc/uniphier/aio-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/uniphier/aio-core.c b/sound/soc/uniphier/aio-core.c
> index 9bcba06ba52e..b8195778953e 100644
> --- a/sound/soc/uniphier/aio-core.c
> +++ b/sound/soc/uniphier/aio-core.c
> @@ -93,9 +93,9 @@ void aio_iecout_set_enable(struct uniphier_aio_chip *chip, bool enable)
>
>  /**
>   * aio_chip_set_pll - set frequency to audio PLL
> - * @chip  : the AIO chip pointer
> - * @source: PLL
> - * @freq  : frequency in Hz, 0 is ignored
> + * @chip: the AIO chip pointer
> + * @pll_id: PLL
> + * @freq: frequency in Hz, 0 is ignored
>   *
>   * Sets frequency of audio PLL. This function can be called anytime,
>   * but it takes time till PLL is locked.
> @@ -267,7 +267,6 @@ void aio_port_reset(struct uniphier_aio_sub *sub)
>  /**
>   * aio_port_set_ch - set channels of LPCM
>   * @sub: the AIO substream pointer, PCM substream only
> - * @ch : count of channels
>   *
>   * Set suitable slot selecting to input/output port block of AIO.
>   *
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
