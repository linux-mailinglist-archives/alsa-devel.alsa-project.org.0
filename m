Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122788A3F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 11:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9121679;
	Sat, 10 Aug 2019 11:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9121679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565428972;
	bh=Hw47bxoSUYI0UZDZG5BT/RJVm5RoAFblmWbpbEakYrA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9ni0JT69j8YoW3/yWLWr427mr62bU1EFhnDCnAvemyi6RQQc1FjYuUd16faRN/Vw
	 +/DuHaPjvGyiY1DOoIC1Pk07smOMhI08EU0BACbH9uPJcQjscl+PzR170YgQg3sUTc
	 9izpzXdX+iyYb1bAs+tRvCQ9kFHa50JNeSd43DZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6175FF8053B;
	Sat, 10 Aug 2019 11:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6953F80535; Sat, 10 Aug 2019 11:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (50-87-157-213.static.tentacle.fi [213.157.87.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6058DF800E4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 11:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6058DF800E4
Received: from dsl-hkibng31-54fae9-19.dhcp.inet.fi ([84.250.233.19]
 helo=[192.168.1.42])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1hwNYD-0004iF-BI; Sat, 10 Aug 2019 12:20:37 +0300
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87h86s6w8x.wl-kuninori.morimoto.gx@renesas.com>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <0b60fbc7-61ad-af8d-50c5-5953e0c7a9d4@bitmer.com>
Date: Sat, 10 Aug 2019 12:20:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87h86s6w8x.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Richard Fontana <rfontana@redhat.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Georgii Staroselski i <georgii.staroselskii@emlid.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Hans de Goede <hdegoede@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH 13/15] ASoC: soc-core: remove legacy style
	of aux_dev
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

On 8/8/19 8:54 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Now all drivers are using snd_soc_dai_link_component for aux_dev.
> Let's remove legacy style
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h  | 9 ---------
>  sound/soc/soc-core.c | 6 ------
>  2 files changed, 15 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 9dad2bf..ebc0645 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -963,19 +963,10 @@ struct snd_soc_codec_conf {
>  };
>  
>  struct snd_soc_aux_dev {
> -	const char *name;		/* Codec name */
> -
>  	/*
>  	 * specify multi-codec either by device name, or by
>  	 * DT/OF node, but not both.
>  	 */
> -	const char *codec_name;
> -	struct device_node *codec_of_node;
> -
> -	/*
> -	 * name, codec_name, codec_of_node will be replaced
> -	 * into dlc. don't use both in the same time
> -	 */
>  	struct snd_soc_dai_link_component dlc;
>  
>  	/* codec/machine specific init - e.g. add machine controls */
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index ecaea88..8bfe421 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
