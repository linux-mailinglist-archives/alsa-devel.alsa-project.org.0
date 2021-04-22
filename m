Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FFF368196
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 15:39:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54B0E167F;
	Thu, 22 Apr 2021 15:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54B0E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619098745;
	bh=q5rlpVmfF/TXc2r/Qmyk7mcFMFJcIEf5yN0P3nCPGV4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ep7DXxRePTfE+GEwdZzI6LpC3sEMole4pVIuWJp027hQBO6CTuFRg/HE4XsFMdkoI
	 WgOEo4waCgt8aFWbQ7QzUC6oCxkU1GWDC5jKc1xBiHFGhQLgZ/RSYlqog4p+mkrZvx
	 FAzFzteSJDplVSS4BSKtmEHymxlhQi4bapO0B014=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E21FCF80168;
	Thu, 22 Apr 2021 15:37:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFBD3F80253; Thu, 22 Apr 2021 15:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85113F80134
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 15:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85113F80134
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 582761F4343A
Subject: Re: broonie-sound/for-next bisection:
 baseline.bootrr.asoc-simple-card-probed on kontron-sl28-var3-ads2
To: Mark Brown <broonie@kernel.org>, kernelci-results@groups.io,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <6080e82c.1c69fb81.cd60c.2a13@mx.google.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <3ca62063-41b4-c25b-a7bc-8a8160e7b684@collabora.com>
Date: Thu, 22 Apr 2021 14:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <6080e82c.1c69fb81.cd60c.2a13@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <treding@nvidia.com>
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

Hi Morimoto-san,

Please see the bisection report below about the asoc-simple-card
driver failing to probe on kontron-sl28-var3-ads2 in today's
broonie-sound tree.  I believe this has not reached linux-next
yet.

Reports aren't automatically sent to the public while we're
trialing new bisection features on kernelci.org but this one
looks valid.

Here's the full boot log:

  https://storage.kernelci.org/broonie-sound/for-next/v5.12-rc8-542-g80e0ab4291498/arm64/defconfig/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html

More details can be found here:

  https://linux.kernelci.org/test/case/id/608089974135ccea439b779c/

Please let us know if you need any help debugging the issue or to
try a fix.

Best wishes,
Guillaume


On 22/04/2021 04:06, KernelCI bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> broonie-sound/for-next bisection: baseline.bootrr.asoc-simple-card-probed on kontron-sl28-var3-ads2
> 
> Summary:
>   Start:      80e0ab429149 Merge remote-tracking branch 'asoc/for-5.13' into asoc-next
>   Plain log:  https://storage.kernelci.org/broonie-sound/for-next/v5.12-rc8-542-g80e0ab4291498/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
>   HTML log:   https://storage.kernelci.org/broonie-sound/for-next/v5.12-rc8-542-g80e0ab4291498/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-kontron/baseline-kontron-sl28-var3-ads2.html
>   Result:     59c35c44a9cf ASoC: simple-card: add simple_parse_node()
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       broonie-sound
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>   Branch:     for-next
>   Target:     kontron-sl28-var3-ads2
>   CPU arch:   arm64
>   Lab:        lab-kontron
>   Compiler:   gcc-8
>   Config:     defconfig+CONFIG_RANDOMIZE_BASE=y
>   Test case:  baseline.bootrr.asoc-simple-card-probed
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 59c35c44a9cf89a83a92a8d26749e59497d0317d
> Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Date:   Wed Apr 21 14:45:48 2021 +0900
> 
>     ASoC: simple-card: add simple_parse_node()
>     
>     Parse dai/tdm/clk are common for both CPU/Codec node.
>     This patch creates simple_parse_node() for it and share the code.
>     
>     Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>     Link: https://lore.kernel.org/r/87czuoi41f.wl-kuninori.morimoto.gx@renesas.com
>     Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index a1373be4558f..91af4eca9c86 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -93,12 +93,11 @@ static void simple_parse_convert(struct device *dev,
>  }
>  
>  static void simple_parse_mclk_fs(struct device_node *top,
> -				 struct device_node *cpu,
> -				 struct device_node *codec,
> +				 struct device_node *np,
>  				 struct simple_dai_props *props,
>  				 char *prefix)
>  {
> -	struct device_node *node = of_get_parent(cpu);
> +	struct device_node *node = of_get_parent(np);
>  	char prop[128];
>  
>  	snprintf(prop, sizeof(prop), "%smclk-fs", PREFIX);
> @@ -106,12 +105,57 @@ static void simple_parse_mclk_fs(struct device_node *top,
>  
>  	snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
>  	of_property_read_u32(node,	prop, &props->mclk_fs);
> -	of_property_read_u32(cpu,	prop, &props->mclk_fs);
> -	of_property_read_u32(codec,	prop, &props->mclk_fs);
> +	of_property_read_u32(np,	prop, &props->mclk_fs);
>  
>  	of_node_put(node);
>  }
>  
> +static int simple_parse_node(struct asoc_simple_priv *priv,
> +			     struct device_node *np,
> +			     struct link_info *li,
> +			     char *prefix,
> +			     int is_cpu)
> +{
> +	struct device *dev = simple_priv_to_dev(priv);
> +	struct device_node *top = dev->of_node;
> +	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
> +	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
> +	struct snd_soc_dai_link_component *dlc;
> +	struct asoc_simple_dai *dai;
> +	int ret, single = 0;
> +
> +	if (is_cpu) {
> +		dlc = asoc_link_to_cpu(dai_link, 0);
> +		dai = simple_props_to_dai_cpu(dai_props, 0);
> +	} else {
> +		dlc = asoc_link_to_codec(dai_link, 0);
> +		dai = simple_props_to_dai_codec(dai_props, 0);
> +	}
> +
> +	simple_parse_mclk_fs(top, np, dai_props, prefix);
> +
> +	ret = asoc_simple_parse_dai(np, dlc, &single);
> +	if (ret)
> +		return ret;
> +
> +	ret = asoc_simple_parse_clk(dev, np, dai, dlc);
> +	if (ret)
> +		return ret;
> +
> +	ret = asoc_simple_parse_tdm(np, dai);
> +	if (ret)
> +		return ret;
> +
> +	if (is_cpu) {
> +		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
> +
> +		asoc_simple_canonicalize_cpu(dlc, single);
> +		asoc_simple_canonicalize_platform(platforms, dlc);
> +	}
> +
> +	return 0;
> +}
> +
>  static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  				   struct device_node *np,
>  				   struct device_node *codec,
> @@ -121,10 +165,8 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  	struct device *dev = simple_priv_to_dev(priv);
>  	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
>  	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
> -	struct asoc_simple_dai *dai;
>  	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
>  	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
> -	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
>  	struct device_node *top = dev->of_node;
>  	struct device_node *node = of_get_parent(np);
>  	char *prefix = "";
> @@ -132,28 +174,18 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  
>  	dev_dbg(dev, "link_of DPCM (%pOF)\n", np);
>  
> -	li->link++;
> -
>  	/* For single DAI link & old style of DT node */
>  	if (is_top)
>  		prefix = PREFIX;
>  
>  	if (li->cpu) {
> -		int is_single_links = 0;
> -
>  		/* Codec is dummy */
>  
>  		/* FE settings */
>  		dai_link->dynamic		= 1;
>  		dai_link->dpcm_merged_format	= 1;
>  
> -		dai = simple_props_to_dai_cpu(dai_props, 0);
> -
> -		ret = asoc_simple_parse_dai(np, cpus, &is_single_links);
> -		if (ret)
> -			goto out_put_node;
> -
> -		ret = asoc_simple_parse_clk(dev, np, dai, cpus);
> +		ret = simple_parse_node(priv, np, li, prefix, 1);
>  		if (ret < 0)
>  			goto out_put_node;
>  
> @@ -162,9 +194,6 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  						   cpus->dai_name);
>  		if (ret < 0)
>  			goto out_put_node;
> -
> -		asoc_simple_canonicalize_cpu(cpus, is_single_links);
> -		asoc_simple_canonicalize_platform(platforms, cpus);
>  	} else {
>  		struct snd_soc_codec_conf *cconf;
>  
> @@ -174,14 +203,9 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  		dai_link->no_pcm		= 1;
>  		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
>  
> -		dai	= simple_props_to_dai_codec(dai_props, 0);
>  		cconf	= simple_props_to_codec_conf(dai_props, 0);
>  
> -		ret = asoc_simple_parse_dai(np, codecs, NULL);
> -		if (ret < 0)
> -			goto out_put_node;
> -
> -		ret = asoc_simple_parse_clk(dev, np, dai, codecs);
> +		ret = simple_parse_node(priv, np, li, prefix, 0);
>  		if (ret < 0)
>  			goto out_put_node;
>  
> @@ -201,11 +225,6 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  	}
>  
>  	simple_parse_convert(dev, np, &dai_props->adata);
> -	simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
> -
> -	ret = asoc_simple_parse_tdm(np, dai);
> -	if (ret)
> -		goto out_put_node;
>  
>  	ret = asoc_simple_parse_daifmt(dev, node, codec,
>  				       prefix, &dai_link->dai_fmt);
> @@ -218,6 +237,8 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
>  	dai_link->init			= asoc_simple_dai_init;
>  
>  out_put_node:
> +	li->link++;
> +
>  	of_node_put(node);
>  	return ret;
>  }
> @@ -230,23 +251,18 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
>  {
>  	struct device *dev = simple_priv_to_dev(priv);
>  	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
> -	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
> -	struct asoc_simple_dai *cpu_dai	= simple_props_to_dai_cpu(dai_props, 0);
> -	struct asoc_simple_dai *codec_dai = simple_props_to_dai_codec(dai_props, 0);
>  	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
>  	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
>  	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
> -	struct device_node *top = dev->of_node;
>  	struct device_node *cpu = NULL;
>  	struct device_node *node = NULL;
>  	struct device_node *plat = NULL;
>  	char prop[128];
>  	char *prefix = "";
> -	int ret, single_cpu = 0;
> +	int ret;
>  
>  	cpu  = np;
>  	node = of_get_parent(np);
> -	li->link++;
>  
>  	dev_dbg(dev, "link_of (%pOF)\n", node);
>  
> @@ -262,13 +278,11 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
>  	if (ret < 0)
>  		goto dai_link_of_err;
>  
> -	simple_parse_mclk_fs(top, cpu, codec, dai_props, prefix);
> -
> -	ret = asoc_simple_parse_dai(cpu, cpus, &single_cpu);
> +	ret = simple_parse_node(priv, cpu, li, prefix, 1);
>  	if (ret < 0)
>  		goto dai_link_of_err;
>  
> -	ret = asoc_simple_parse_dai(codec, codecs, NULL);
> +	ret = simple_parse_node(priv, codec, li, prefix, 0);
>  	if (ret < 0)
>  		goto dai_link_of_err;
>  
> @@ -276,22 +290,6 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
>  	if (ret < 0)
>  		goto dai_link_of_err;
>  
> -	ret = asoc_simple_parse_tdm(cpu, cpu_dai);
> -	if (ret < 0)
> -		goto dai_link_of_err;
> -
> -	ret = asoc_simple_parse_tdm(codec, codec_dai);
> -	if (ret < 0)
> -		goto dai_link_of_err;
> -
> -	ret = asoc_simple_parse_clk(dev, cpu, cpu_dai, cpus);
> -	if (ret < 0)
> -		goto dai_link_of_err;
> -
> -	ret = asoc_simple_parse_clk(dev, codec, codec_dai, codecs);
> -	if (ret < 0)
> -		goto dai_link_of_err;
> -
>  	ret = asoc_simple_set_dailink_name(dev, dai_link,
>  					   "%s-%s",
>  					   cpus->dai_name,
> @@ -302,13 +300,12 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
>  	dai_link->ops = &simple_ops;
>  	dai_link->init = asoc_simple_dai_init;
>  
> -	asoc_simple_canonicalize_cpu(cpus, single_cpu);
> -	asoc_simple_canonicalize_platform(platforms, cpus);
> -
>  dai_link_of_err:
>  	of_node_put(plat);
>  	of_node_put(node);
>  
> +	li->link++;
> +
>  	return ret;
>  }
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [bf05bf16c76bb44ab5156223e1e58e26dfe30a88] Linux 5.12-rc8
> git bisect good bf05bf16c76bb44ab5156223e1e58e26dfe30a88
> # bad: [80e0ab4291498248157d2801c994dfaa09ef3082] Merge remote-tracking branch 'asoc/for-5.13' into asoc-next
> git bisect bad 80e0ab4291498248157d2801c994dfaa09ef3082
> # good: [d479f00b795ac62b24ef90f4ec421e65c3178ca7] ASoC: soc-pcm: indicate error message at dpcm_path_get()
> git bisect good d479f00b795ac62b24ef90f4ec421e65c3178ca7
> # good: [a96d2ba2d8248d5e8170f2f44f98d4a33329b08a] ASoC: codecs: tlv320aic3x: move I2C to separated file
> git bisect good a96d2ba2d8248d5e8170f2f44f98d4a33329b08a
> # good: [8577bf61a6359bf2387f85a2fda713a4f05185c3] Merge series "ASoC: rsnd: tidyup Renesas sound" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
> git bisect good 8577bf61a6359bf2387f85a2fda713a4f05185c3
> # good: [87143bfdb9f7ddc14b129fda610e114d29077596] Merge series "ASoC: remove more cppcheck warnings" from Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>:
> git bisect good 87143bfdb9f7ddc14b129fda610e114d29077596
> # good: [23b16df6c9c91f70df070be43c5b13ef4016c1e7] Merge series "ASoC: audio-graph: cleanups" from Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>:
> git bisect good 23b16df6c9c91f70df070be43c5b13ef4016c1e7
> # good: [1fa27f35ee23b52e0bd708d00c272c5df805afc8] Merge series "ASoC: rt286/rt298: Fixes for DMIC2 config and combo jack" from David Ward <david.ward@gatech.edu>:
> git bisect good 1fa27f35ee23b52e0bd708d00c272c5df805afc8
> # bad: [434392271afcff350fe11730f12b831fffaf33eb] ASoC: simple-card: add simple_link_init()
> git bisect bad 434392271afcff350fe11730f12b831fffaf33eb
> # good: [e51237b8d3052251421770468903fa6e4446d158] ASoC: audio-graph: add graph_link_init()
> git bisect good e51237b8d3052251421770468903fa6e4446d158
> # bad: [59c35c44a9cf89a83a92a8d26749e59497d0317d] ASoC: simple-card: add simple_parse_node()
> git bisect bad 59c35c44a9cf89a83a92a8d26749e59497d0317d
> # first bad commit: [59c35c44a9cf89a83a92a8d26749e59497d0317d] ASoC: simple-card: add simple_parse_node()
> -------------------------------------------------------------------------------
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#10236): https://groups.io/g/kernelci-results/message/10236
> Mute This Topic: https://groups.io/mt/82277947/924702
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [guillaume.tucker@collabora.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

