Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1320D586E62
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:15:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97C584A;
	Mon,  1 Aug 2022 18:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97C584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659370557;
	bh=Y8Ios2pZ9qLf0wK9KahJsDuQ6Dyzgc57OUm0m3fCS5Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=svIh4moQZoWT0eb+0U45bBXH3FlVZYxon/JXQNjxjsrsKVGcpvTYMrDpq6IglMHdy
	 Vm8UAcEU4qOpZ2c8KZ3wJFfDM/9unRWOx9ia7o6ywtlKBufMawoc/+ONTVgfxWWoGV
	 QxwAaE0zTOPe4IXj6ub7roHv+TI/AgYWviSrJdqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40EA2F80139;
	Mon,  1 Aug 2022 18:15:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0829EF80139; Mon,  1 Aug 2022 18:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C59DF80139
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C59DF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q//wh+/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659370493; x=1690906493;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y8Ios2pZ9qLf0wK9KahJsDuQ6Dyzgc57OUm0m3fCS5Y=;
 b=Q//wh+/kFRPI+ZyMhjtQ+TxENrkD8gkM7F6ydR4J3NYs7ww8iepdEgh5
 Sfx71xf79NgpLu9h2TWipVSXyz5uQmoGQOwFl6i3KNs812o7W73u92Arv
 eZUk4rMktwC2V9yd+NJwQHkwYO4iRqNctuaLf0lLFvnk4uDuWMFNVk+u1
 xrHMns+bQ5NmeTVNr4uGZbj3vn8g0y7Wnut+04j89It3+WY87OAHpxrUF
 V41IMja6DwXoOzfj2uQAaOpdunmyBinnijAK6LI0DDq5+qtZwkRO2FudQ
 xjAVMUr8fR8QTmvvP2zV6skK4uEbB1XHCSjOgJEYlC0GdG+96SWxfwphc Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="289958111"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="289958111"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 09:14:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; d="scan'208";a="605708771"
Received: from yuanbowa-mobl.amr.corp.intel.com (HELO [10.212.86.5])
 ([10.212.86.5])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2022 09:14:47 -0700
Message-ID: <1e2c7dd9-0c28-17eb-b166-3bfaf65bbfe4@linux.intel.com>
Date: Mon, 1 Aug 2022 10:25:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v3] ASoC: Intel: cirrus-common: Use UID to map correct amp
 to prefix
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Brent Lu <brent.lu@intel.com>, xliu <xiang.liu@cirrus.com>
References: <20220801094034.3927841-1-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220801094034.3927841-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 8/1/22 04:40, Stefan Binding wrote:
> Since the order of the amps in the ACPI determines the device name,
> and the ACPI order may change depending on hardware configuration,
> use UID to dynamically compute the dai links, allowing dynamic
> assignment of the name_prefix.
> 
> The UIDs for these amps in ACPI are fixed, and map to a name_prefix,
> where:
> UID 0x0 -> WL
> UID 0x1 -> WR
> UID 0x2 -> TL
> UID 0x3 -> TR
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Thanks for the updates, LGTM

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/sof_cirrus_common.c | 92 ++++++++++++----------
>  1 file changed, 49 insertions(+), 43 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
> index f4192df962d6..6e39eda77385 100644
> --- a/sound/soc/intel/boards/sof_cirrus_common.c
> +++ b/sound/soc/intel/boards/sof_cirrus_common.c
> @@ -10,6 +10,9 @@
>  #include "../../codecs/cs35l41.h"
>  #include "sof_cirrus_common.h"
>  
> +#define CS35L41_HID "CSC3541"
> +#define CS35L41_MAX_AMPS 4
> +
>  /*
>   * Cirrus Logic CS35L41/CS35L53
>   */
> @@ -35,50 +38,12 @@ static const struct snd_soc_dapm_route cs35l41_dapm_routes[] = {
>  	{"TR Spk", NULL, "TR SPK"},
>  };
>  
> -static struct snd_soc_dai_link_component cs35l41_components[] = {
> -	{
> -		.name = CS35L41_DEV0_NAME,
> -		.dai_name = CS35L41_CODEC_DAI,
> -	},
> -	{
> -		.name = CS35L41_DEV1_NAME,
> -		.dai_name = CS35L41_CODEC_DAI,
> -	},
> -	{
> -		.name = CS35L41_DEV2_NAME,
> -		.dai_name = CS35L41_CODEC_DAI,
> -	},
> -	{
> -		.name = CS35L41_DEV3_NAME,
> -		.dai_name = CS35L41_CODEC_DAI,
> -	},
> -};
> +static struct snd_soc_dai_link_component cs35l41_components[CS35L41_MAX_AMPS];
>  
>  /*
>   * Mapping between ACPI instance id and speaker position.
> - *
> - * Four speakers:
> - *         0: Tweeter left, 1: Woofer left
> - *         2: Tweeter right, 3: Woofer right
>   */
> -static struct snd_soc_codec_conf cs35l41_codec_conf[] = {
> -	{
> -		.dlc = COMP_CODEC_CONF(CS35L41_DEV0_NAME),
> -		.name_prefix = "TL",
> -	},
> -	{
> -		.dlc = COMP_CODEC_CONF(CS35L41_DEV1_NAME),
> -		.name_prefix = "WL",
> -	},
> -	{
> -		.dlc = COMP_CODEC_CONF(CS35L41_DEV2_NAME),
> -		.name_prefix = "TR",
> -	},
> -	{
> -		.dlc = COMP_CODEC_CONF(CS35L41_DEV3_NAME),
> -		.name_prefix = "WR",
> -	},
> -};
> +static struct snd_soc_codec_conf cs35l41_codec_conf[CS35L41_MAX_AMPS];
>  
>  static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
>  {
> @@ -117,10 +82,10 @@ static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
>  static const struct {
>  	unsigned int rx[2];
>  } cs35l41_channel_map[] = {
> -	{.rx = {0, 1}}, /* TL */
>  	{.rx = {0, 1}}, /* WL */
> -	{.rx = {1, 0}}, /* TR */
>  	{.rx = {1, 0}}, /* WR */
> +	{.rx = {0, 1}}, /* TL */
> +	{.rx = {1, 0}}, /* TR */
>  };
>  
>  static int cs35l41_hw_params(struct snd_pcm_substream *substream,
> @@ -175,10 +140,51 @@ static const struct snd_soc_ops cs35l41_ops = {
>  	.hw_params = cs35l41_hw_params,
>  };
>  
> +static const char * const cs35l41_name_prefixes[] = { "WL", "WR", "TL", "TR" };
> +
> +/*
> + * Expected UIDs are integers (stored as strings).
> + * UID Mapping is fixed:
> + * UID 0x0 -> WL
> + * UID 0x1 -> WR
> + * UID 0x2 -> TL
> + * UID 0x3 -> TR
> + * Note: If there are less than 4 Amps, UIDs still map to WL/WR/TL/TR. Dynamic code will only create
> + * dai links for UIDs which exist, and ignore non-existant ones. Only 2 or 4 amps are expected.
> + * Return number of codecs found.
> + */
> +static int cs35l41_compute_codec_conf(void)
> +{
> +	const char * const uid_strings[] = { "0", "1", "2", "3" };
> +	unsigned int uid, sz = 0;
> +	struct acpi_device *adev;
> +	struct device *physdev;
> +
> +	for (uid = 0; uid < CS35L41_MAX_AMPS; uid++) {
> +		adev = acpi_dev_get_first_match_dev(CS35L41_HID, uid_strings[uid], -1);
> +		if (!adev) {
> +			pr_devel("Cannot find match for HID %s UID %u (%s)\n", CS35L41_HID, uid,
> +				 cs35l41_name_prefixes[uid]);
> +			continue;
> +		}
> +		physdev = get_device(acpi_get_first_physical_node(adev));
> +		cs35l41_components[sz].name = dev_name(physdev);
> +		cs35l41_components[sz].dai_name = CS35L41_CODEC_DAI;
> +		cs35l41_codec_conf[sz].dlc.name = dev_name(physdev);
> +		cs35l41_codec_conf[sz].name_prefix = cs35l41_name_prefixes[uid];
> +		acpi_dev_put(adev);
> +		sz++;
> +	}
> +
> +	if (sz != 2 && sz != 4)
> +		pr_warn("Invalid number of cs35l41 amps found: %d, expected 2 or 4\n", sz);
> +	return sz;
> +}
> +
>  void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
>  {
> +	link->num_codecs = cs35l41_compute_codec_conf();
>  	link->codecs = cs35l41_components;
> -	link->num_codecs = ARRAY_SIZE(cs35l41_components);
>  	link->init = cs35l41_init;
>  	link->ops = &cs35l41_ops;
>  }
