Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BABE6B4880
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 16:03:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B0718C4;
	Fri, 10 Mar 2023 16:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B0718C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678460596;
	bh=FdWrrEiVvcGV5We2oP4cFNJrwxSOXnTFkXSWK6R+KRo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qqF537+cUjzA1tzJOCRRZKLqf6ZCjnGEU7DJoiNoE3ULZw46+Iv5jcVIAZ4Q6/Wzk
	 Ny6Xdlqv51/mEqLtrwCDFiDcGAM5ewGaiYcPk3L0p4EZmexo5lesPPIRfmM9TZvw8D
	 EmS1d2wyDvb3kc1Vu1QvfIbqw834/UQmLmn7PwzM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 946B9F804B1;
	Fri, 10 Mar 2023 16:02:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E794F804FE; Fri, 10 Mar 2023 16:02:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42DE7F80482
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 16:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DE7F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TyUElcZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678460520; x=1709996520;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FdWrrEiVvcGV5We2oP4cFNJrwxSOXnTFkXSWK6R+KRo=;
  b=TyUElcZ8etay55qc2kmbdUiZMkUlryw5EvHkIjCpnRRW+kGYKLz2EpMH
   s5G3u7vISmWkODZliPx9KJgXuGEiDRVvaRDpoa8HnPS0lyaSF7888SGL3
   zI06Bdlnr0TmIgygI/JMuQFJMAQlKAVx+ijxaHNX0+ajdZXSP5oYPtnum
   6aGw4m6zGTEsM0iRHNMutoRu8QcsFOr0CIy/bdrNHf5EFWz91zYwircQN
   iTl8ASFI7/sr93pl9oE7eHpeqaFtgMzzGdZPjqKQmoM+WKVtgjkb+UFFZ
   GpYQgWAkEnprxWGK1EWTOGj9vDuRCFSe/03Scp1DQ0qnT19UqLNP3pYdi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="336764011"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400";
   d="scan'208";a="336764011"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 07:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="788037593"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400";
   d="scan'208";a="788037593"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 07:01:47 -0800
Message-ID: <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
Date: Fri, 10 Mar 2023 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: Use of_property_present() for testing DT property
 presence
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20230310144732.1546328-1-robh@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230310144732.1546328-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PHWYOSUVJ4FUZTDQPVDZC5NYX6YYEHZ7
X-Message-ID-Hash: PHWYOSUVJ4FUZTDQPVDZC5NYX6YYEHZ7
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHWYOSUVJ4FUZTDQPVDZC5NYX6YYEHZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/10/2023 3:47 PM, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   sound/soc/codecs/lpass-macro-common.c | 2 +-
>   sound/soc/generic/audio-graph-card.c  | 2 +-
>   sound/soc/generic/audio-graph-card2.c | 2 +-
>   sound/soc/mxs/mxs-sgtl5000.c          | 2 +-
>   sound/soc/samsung/i2s.c               | 2 +-
>   sound/soc/sh/fsi.c                    | 2 +-
>   sound/soc/stm/stm32_i2s.c             | 2 +-
>   sound/soc/stm/stm32_sai_sub.c         | 4 ++--
>   sound/soc/tegra/tegra_asoc_machine.c  | 2 +-
>   9 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
> index 1b9082d237c1..f54baaad54d4 100644
> --- a/sound/soc/codecs/lpass-macro-common.c
> +++ b/sound/soc/codecs/lpass-macro-common.c
> @@ -16,7 +16,7 @@ struct lpass_macro *lpass_macro_pds_init(struct device *dev)
>   	struct lpass_macro *l_pds;
>   	int ret;
>   
> -	if (!of_find_property(dev->of_node, "power-domains", NULL))
> +	if (!of_property_present(dev->of_node, "power-domains"))
>   		return NULL;
>   
>   	l_pds = devm_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
> diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
> index 5daa824a4ffc..d788f5f23a8a 100644
> --- a/sound/soc/generic/audio-graph-card.c
> +++ b/sound/soc/generic/audio-graph-card.c
> @@ -78,7 +78,7 @@ static int graph_get_dai_id(struct device_node *ep)
>   		 * only of_graph_parse_endpoint().
>   		 * We need to check "reg" property
>   		 */
> -		if (of_get_property(ep,   "reg", NULL))
> +		if (of_property_present(ep,   "reg"))

Bit of nit picking, but any reason, why there are multiple spaces, 
before "reg" here?

>   			return info.id;
>   
>   		node = of_get_parent(ep);
> diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
> index 06609a526b78..259544f64df9 100644
> --- a/sound/soc/generic/audio-graph-card2.c
> +++ b/sound/soc/generic/audio-graph-card2.c
> @@ -376,7 +376,7 @@ static int graph_get_dai_id(struct device_node *ep)
>   		 * only of_graph_parse_endpoint().
>   		 * We need to check "reg" property
>   		 */
> -		if (of_get_property(ep,   "reg", NULL))
> +		if (of_property_present(ep,   "reg"))

And here?


