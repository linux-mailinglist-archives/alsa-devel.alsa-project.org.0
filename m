Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96F9107985
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 21:36:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734071849;
	Fri, 22 Nov 2019 21:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734071849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574454997;
	bh=yLFNSAA1k7kvRkPpv8gvDmxoOpLjqfj7tPk9Lnca+DQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kL8Dhgj3mS6qaAb0q93NUNnNte043sMMQGfGU9t5G6lj53YOji/HBGiNr2cjentod
	 //dHqL1W6nfQjRuhHAYg7rkX3UfWuAotNTf7Rlk4H3B53zMV7AkxXW2gKj9oTd4Gzj
	 zLqhlipRfV8akbOA76Zgm3uDp0Vh7qd22NONxQ88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E80BF8013F;
	Fri, 22 Nov 2019 21:34:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47FACF80140; Fri, 22 Nov 2019 21:34:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 883BCF800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 21:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 883BCF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="eb5jbrmb"
Received: by mail-il1-x131.google.com with SMTP id v17so4309503ilg.7
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 12:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n4M2iQFi8/9fNKG/22sZ1wZmLKer7UepU2UGCkn14t0=;
 b=eb5jbrmbw1v/XU7OE6/0ZAx2RuBBG31fQwkX/Fx1gBddP4Mu36zXnShPNsWLN8MoqH
 Trfo1KsoHIIrPGWdvnaTv9HA0Cy72xZjJaPT1Vv+04dSI6JSCZxvtSDjTO2R+16h7tGI
 RT4irXEuqsxRQDo0hjWiBHrPqJ7FcismWlLFShg28u1YLn+/P/x/JRaDP5iy19lcbGRV
 NJfW5x5WHet3+1BM6fRsV+DHgt06am4ZrVEsp6hlZ/k++B4X6nOprJJ+QXXZpCWjbvs4
 fk0wKzCKBn3qlVFrMMM/LBncXzI63jkOEZZ8hGqmKmrKAFoFE3PULEg4vbi0QQxQdd+j
 SUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n4M2iQFi8/9fNKG/22sZ1wZmLKer7UepU2UGCkn14t0=;
 b=X/bGDsc85+tGfBM0rySRg5mmiB46zh2oT80XXK3J7uBCQGU9HqFfq/Nyk0ytFvuuDW
 9IRmLAay1GzaJtJ6tzpqwYgk3i6rIYqUZnEnRsGjC4x6bPxGUuVaDyrNKGrF+6maO7+z
 2B0QIt6bUJHcMNsnwt+gTq7i8NmC/8L1qks+not8r+nqbBANmzmIcybJT6bo5+aegMDp
 USYkClmxOIL1YSo48irNFp0jmReQxz0Ngs48LyVcJ0cDBtmYdQlPiGbosnuD4hrIb4SR
 YqeB5dqew9lOYmkp8kWlGP4YzsepD6R0ptzRT8Hm8Mj0yNzscWp/jKTlT3GVMPmcR9ms
 ctRA==
X-Gm-Message-State: APjAAAWCFrzNs+74HFqx+ya421kGK3O4OPrKf4GOoimHRYvNxW70ptnO
 odGESsWNJlk64jd6L/w9YkUeO2qTJFkResh2E9i0fg==
X-Google-Smtp-Source: APXvYqxagWPvgvpYeIU8f7TSfwzHT6dwfOeS9ZVsRLisePrzLXsDdoZT0e0w/4vzbTdwKYM8RAZjjy4fcPrMnNEmEoc=
X-Received: by 2002:a92:8108:: with SMTP id e8mr18529121ild.209.1574454885437; 
 Fri, 22 Nov 2019 12:34:45 -0800 (PST)
MIME-Version: 1.0
References: <87r2208o9g.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r2208o9g.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Fri, 22 Nov 2019 12:34:37 -0800
Message-ID: <CAFQqKeWn3GWt6tkNT51keZ6wP3xOAak8ZskK1nNFgovLYnyyQQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 00/14] ASoC: soc-core cleanup step6
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

On Thu, Nov 21, 2019 at 9:39 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Mark
>
> These are soc-core cleanup step6.
> These doesn't add new features.
>
> Kuninori Morimoto (14):
>   ASoC: soc-core: remove dai_link_list
>   ASoC: soc-core: remove snd_soc_disconnect_sync()
>   ASoC: soc-core: remove snd_soc_get_dai_substream()
>   ASoC: soc-core: move snd_soc_get_pcm_runtime()
>   ASoC: soc-core: find rtd via dai_link pointer at
> snd_soc_get_pcm_runtime()
>   ASoC: soc-core: move snd_soc_find_dai_link()
>   ASoC: soc-core: rename snd_soc_add_dai_link() to
> snd_soc_add_pcm_runtime()
>   ASoC: soc-core: rename snd_soc_remove_dai_link() to
> snd_soc_remove_pcm_runtime()
>   ASoC: soc-core: move soc_link_dai_pcm_new()
>   ASoC: soc-core: rename soc_link_dai_pcm_new() to soc_dai_pcm_new()
>   ASoC: soc-core: move soc_link_init()
>   ASoC: soc-core: rename soc_link_init() to soc_init_pcm_runtime()
>   ASoC: soc-core: soc_set_name_prefix(): tidyup loop condition
>   ASoC: soc-core: soc_set_name_prefix(): get component device_node at out
> of loop
>
Looks good to me, Morimoto-san. Thanks for this cleanup!
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

>
>  include/sound/soc.h            |  22 +--
>  sound/soc/fsl/fsl-asoc-card.c  |   2 +-
>  sound/soc/pxa/mioa701_wm9713.c |   2 +-
>  sound/soc/samsung/bells.c      |  12 +-
>  sound/soc/samsung/littlemill.c |  10 +-
>  sound/soc/samsung/snow.c       |   2 +-
>  sound/soc/samsung/speyside.c   |   4 +-
>  sound/soc/samsung/tm2_wm5110.c |   6 +-
>  sound/soc/samsung/tobermory.c  |   6 +-
>  sound/soc/sh/rcar/core.c       |   2 -
>  sound/soc/soc-core.c           | 339
> ++++++++++++++++-------------------------
>  sound/soc/soc-topology.c       |  47 +++++-
>  sound/soc/tegra/tegra_wm8903.c |   2 +-
>  13 files changed, 204 insertions(+), 252 deletions(-)
>
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
