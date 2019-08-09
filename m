Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4741875E6
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 11:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74AC715E0;
	Fri,  9 Aug 2019 11:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74AC715E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565342894;
	bh=FqQF2agwi7mm+tJ5gynVyepRck8Kj/NSPALxnKOs4zU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XbyEx5zLR3r/xVbEszl16pCEPHOoLr7g5WLQLW6ZQEmX8yFOxxm0lTsgHHElERHcy
	 IPxcG/S3LyqytBSwzAILW0vjI84bHODrmY9toQ0f/TZ9RKHA29Z4r9jEXORGlEQWko
	 FmPjRxwtWo3xgtwR3B+C+eShzgGRjk2nATzXIcF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E76F800E4;
	Fri,  9 Aug 2019 11:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69D95F803F3; Fri,  9 Aug 2019 11:26:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34284F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 11:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34284F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t54jQT8W"
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93B9121743
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 09:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565342399;
 bh=9nJQ4BNeasDh8e09lYr+XRzokMZvyxBOgBGvLZlNhiM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t54jQT8WUvndZ/9MdsLpf67pvwDfLNZM5Ylab4YnD04IxkvxVDhPLqxhBhneKBDrm
 5habu76Djrceqi5KhETf1vPBrH0hPVZsuoQRN2GspiBGouh9eUWlEeVrV19FBRTiLN
 0PpEOUofGWeQclPSjth5q0qtMMWSbRoM86M2Pnmw=
Received: by mail-lj1-f177.google.com with SMTP id y17so66898235ljk.10
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 02:19:59 -0700 (PDT)
X-Gm-Message-State: APjAAAWIZJFR9z+naEaiKbbHgWs5KJ6umo3TpMRuLHzaxNCdIHXl/rjV
 O/UmotNnBcgFi9mjxZScRQVeOI1dafsisUt2dz0=
X-Google-Smtp-Source: APXvYqzIuAlgMya7/nz5YuNqR8Dngznyq4wvGd/IhWYVDqZEc7HXNRFKJOb2/C7lxHfXBImyb8Xa1+VLn/E3dSLgh+A=
X-Received: by 2002:a2e:3008:: with SMTP id w8mr10953017ljw.13.1565342397863; 
 Fri, 09 Aug 2019 02:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87lfw46w9g.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfw46w9g.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 9 Aug 2019 11:19:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeZcx-yGvCNr=yyB+BW4A_RD+PBp=ofbhy6Nwj1hYw96Q@mail.gmail.com>
Message-ID: <CAJKOXPeZcx-yGvCNr=yyB+BW4A_RD+PBp=ofbhy6Nwj1hYw96Q@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Chen-Yu Tsai <wens@csie.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Alexios Zavras <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hans de Goede <hdegoede@redhat.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH 10/15] ASoC: samsung: tm2_wm5110: use
 snd_soc_dai_link_component for aux_dev
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

On Thu, 8 Aug 2019 at 07:54, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> We can use snd_soc_dai_link_component to specify aux_dev.
> Let's use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/samsung/tm2_wm5110.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
