Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650CE87548
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 11:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65D6857;
	Fri,  9 Aug 2019 11:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65D6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565342227;
	bh=Q2/HU9Kp44wyl4COS7xpXDCMiy0GN96PnECrv57+tSE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f7CEGGZ5l4vTwFtKUwb1HdmscuFliyokYz0FSACjj4XuhD+U7W+jhv5fpHHPpa/W4
	 lATUJEW6qJEU/4WKRUpSfYfpEyUX9xAjugVyhbyr2u3w/awdYd21H65Own7zUMcVj/
	 pbeNRdvksaPJ2HkCKy8LD/+LqXz3AWQpKJ0FHkZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B94F805F5;
	Fri,  9 Aug 2019 11:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9391AF805E1; Fri,  9 Aug 2019 11:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F24CDF80529
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 11:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F24CDF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r7D8VZgM"
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2C692189F
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565342112;
 bh=qDp9ghP8QPbbulOp+PUrOBgKt47QC43OeFX9c5iy7Zg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r7D8VZgMgKUkBAzy+NyLvCbSpOn2UL4+Ud5za4nQDPf5GLcs0yH7R1OEj2nXOnVc/
 FjkFWA4jotGVieMAI1pPcFCjVHb0Ra5IgQ6lHa5k06yrHs6VTHk71vsNMSresH2NnM
 DTV2H9o7iaOObj3J5/m4jUJuTUIYmymUCCuIvRUM=
Received: by mail-lj1-f182.google.com with SMTP id t3so2897182ljj.12
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 02:15:11 -0700 (PDT)
X-Gm-Message-State: APjAAAWgPgPoRiP8glxGWfCs9wC7yGx9980wkmFIEO3p9uWzAzFLwEtS
 rvxIt6LFFt4+zIcdO8PZYs2ZVD3+0X+SVwICZFY=
X-Google-Smtp-Source: APXvYqx2KUFl5qHF/CrRflKijh1MNH5cY4AE22jwFTZ+NnmRQEJOERXHo2ozxH0liMeuttMwc4zS9jv9R3zjKi2cjQU=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr10448227ljc.210.1565342109945; 
 Fri, 09 Aug 2019 02:15:09 -0700 (PDT)
MIME-Version: 1.0
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87mugk6w9l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mugk6w9l.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 9 Aug 2019 11:14:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd05-kqE5Ug7p04M_KDvV-hXaNmpaNq3g4ZSxUgeGJJFw@mail.gmail.com>
Message-ID: <CAJKOXPd05-kqE5Ug7p04M_KDvV-hXaNmpaNq3g4ZSxUgeGJJFw@mail.gmail.com>
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
Subject: Re: [alsa-devel] [PATCH 09/15] ASoC: samsung: speyside: use
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
>  sound/soc/samsung/speyside.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
