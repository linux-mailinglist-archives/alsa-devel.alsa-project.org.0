Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C3888A3A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 11:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE10E15E5;
	Sat, 10 Aug 2019 11:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE10E15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565428770;
	bh=eTKBsGBCg2fa333a+2X9vgPGs5//LjkNiVsbRFcLvoI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAOMcSqnd7la8KqODQiiyt4pNkxQkDmz8drpYgaqqeJokBsktHcbrlMsEFBH5rTcW
	 /TqHNLe7va5wh381/VjIFntjC3lxqUX1JOE7qd1IPfVvyC2mZpohpqnm1btLh0Ruiu
	 Xjb9GoQlFkWTY0eGs8t6fxitiqJZq3q+J/F4xT0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0038AF801A4;
	Sat, 10 Aug 2019 11:17:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 583D1F80506; Sat, 10 Aug 2019 11:17:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (50-87-157-213.static.tentacle.fi [213.157.87.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E85F4F8015B
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 11:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85F4F8015B
Received: from dsl-hkibng31-54fae9-19.dhcp.inet.fi ([84.250.233.19]
 helo=[192.168.1.42])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1hwNUe-0004fn-Kn; Sat, 10 Aug 2019 12:16:56 +0300
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87zhkk6wdy.wl-kuninori.morimoto.gx@renesas.com>
 <87y3046wcf.wl-kuninori.morimoto.gx@renesas.com>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <7ee1cbe3-4d6e-d843-dc2e-75bc9b3b421c@bitmer.com>
Date: Sat, 10 Aug 2019 12:16:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87y3046wcf.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jie Yang <yang.jie@linux.intel.com>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Richard Fontana <"r fontana"@redhat.com>,
 Shunli Wang <shunli.wang@mediatek.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Anders Roxell <anders.roxell@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Georgii Staroselskii <georgii.staroselskii@emlid.com>,
 Danny Milosavljevic <dannym@scratchpost.org>,
 Hans de Goede <hdegoede@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH 01/15] ASoC: soc-core: support
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

Hi

On 8/8/19 8:52 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> To find aux_dev, ASoC is using .name, codec_name, codec_of_node.
> Here, .name is used to fallback in case of no codec.
> 
> But, we already have this kind of component finding method by
> snd_soc_dai_link_component and soc_find_component().
> We shouldn't have duplicated implementation to do same things.
> This patch adds snd_soc_dai_link_component support to finding aux_dev.
> 
> Now, no driver is using only .name.
> All drivers are using codec_name and/or codec_of_node.
> This means no driver is finding component from .name so far.
> (Actually almost all drivers are using .name as just "device name",
>  not for finding component...)
> 
> This patch
> 1) add snd_soc_dai_link_component support for aux_dev. legacy style will
>    be removed if all drivers are switched to new style.
> 2) try to find component via snd_soc_dai_link_component.
>    Then, it doesn't try to find via .name, because no driver is using
>    it so far.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h  |  7 +++++++
>  sound/soc/soc-core.c | 36 ++++++++++--------------------------
>  2 files changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index c92697e..9dad2bf 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -941,6 +941,7 @@ struct snd_soc_dai_link {
>  #define COMP_CPU(_dai)			{ .dai_name = _dai, }
>  #define COMP_CODEC(_name, _dai)		{ .name = _name, .dai_name = _dai, }
>  #define COMP_PLATFORM(_name)		{ .name = _name }
> +#define COMP_AUX(_name)			{ .name = _name }
>  #define COMP_DUMMY()			{ .name = "snd-soc-dummy", .dai_name = "snd-soc-dummy-dai", }
>  
>  extern struct snd_soc_dai_link_component null_dailink_component[0];
> @@ -971,6 +972,12 @@ struct snd_soc_aux_dev {
>  	const char *codec_name;
>  	struct device_node *codec_of_node;
>  
> +	/*
> +	 * name, codec_name, codec_of_node will be replaced
> +	 * into dlc. don't use both in the same time
> +	 */
> +	struct snd_soc_dai_link_component dlc;
> +
>  	/* codec/machine specific init - e.g. add machine controls */
>  	int (*init)(struct snd_soc_component *component);
>  };
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e0d427a..ecaea88 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1531,38 +1531,22 @@ static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
>  {
>  	struct snd_soc_aux_dev *aux_dev = &card->aux_dev[num];
>  	struct snd_soc_component *component;
> -	struct snd_soc_dai_link_component dlc;
>  
> -	if (aux_dev->codec_of_node || aux_dev->codec_name) {
> -		/* codecs, usually analog devices */
> -		dlc.name = aux_dev->codec_name;
> -		dlc.of_node = aux_dev->codec_of_node;
> -		component = soc_find_component(&dlc);
> -		if (!component) {
> -			if (dlc.of_node)
> -				dlc.name = of_node_full_name(dlc.of_node);
> -			goto err_defer;
> -		}
> -	} else if (aux_dev->name) {
> -		/* generic components */
> -		dlc.name = aux_dev->name;
> -		dlc.of_node = NULL;
> -		component = soc_find_component(&dlc);
> -		if (!component)
> -			goto err_defer;
> -	} else {
> -		dev_err(card->dev, "ASoC: Invalid auxiliary device\n");
> -		return -EINVAL;
> -	}
> +	/* remove me */
> +	if (aux_dev->codec_name)
> +		aux_dev->dlc.name = aux_dev->codec_name;
> +	if (aux_dev->codec_of_node)
> +		aux_dev->dlc.of_node = aux_dev->codec_of_node;

Bike-shedding: maybe comment here should say legacy style binding etc? I
know these lines are removed by patch 13/15 but here yet comment is not
valid :-)

-- 
Jarkko
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
