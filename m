Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB05815B2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 16:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48C481614;
	Tue, 26 Jul 2022 16:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48C481614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658846965;
	bh=AVdLXZczB78wzjYne0LzeumnXgq283J0Ar7FnM/OkOY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eDRl/kGzRTuMbJwVVXhKRuOfxkRRl9wmSzlOuzO8ikjFFjHkEnT5gs/WcRO3h/ZAE
	 QojW3WGJNnKsuhDnFSGhBI9HQ6PhBqmj6llXbJd2qV0fJEykhBaUpZgXfsErlx2cdC
	 RmoYN7pw26kyB7N8KEbpCvNCd6hyHVn5nRfypRMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51813F8053C;
	Tue, 26 Jul 2022 16:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5D7F80153; Tue, 26 Jul 2022 16:48:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E19F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 16:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E19F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A8Kt9q8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658846875; x=1690382875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AVdLXZczB78wzjYne0LzeumnXgq283J0Ar7FnM/OkOY=;
 b=A8Kt9q8uRnWTnOZhNK28y+GPIPFPWgfEXR7A7RxeCtmu16dZvWm/9vFP
 aGUcerk2Z0lcnr2PofOUMCl3upukLbG8bh7ftZEPhhQwcucNi0oJR4ONW
 0KCUR9rAxcIJuO32WJJIP3y0oUrlAV3sUu5OA/k0X7A99TRG2VsUeVVuK
 7tWQRgcKdrwMPsC/v/Dod9NK8iS/7IWe13WSqt6CYsxMIrTQ2Ak6uB0C1
 7qMm5VcqLyUz1ZjlKZUrObsXcHKoGnf5hpCLL+rs0RAK2Pg+rmvB/Oemf
 KdJsSwj25nzAEcAqbcLRkiv+9ipswVELfRYmqWwTqv1+CyDQCl65eEZzU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="289160580"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="289160580"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 07:47:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="597047566"
Received: from adamreed-mobl.amr.corp.intel.com (HELO [10.212.70.145])
 ([10.212.70.145])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2022 07:47:46 -0700
Message-ID: <013c0854-5b8e-6968-1ab2-88f2d0b142a0@linux.intel.com>
Date: Tue, 26 Jul 2022 09:34:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v1] ASoC: Intel: cirrus-common: Use UID to map correct amp
 to prefix
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Brent Lu <brent.lu@intel.com>, xliu <xiang.liu@cirrus.com>
References: <20220726134634.2842185-1-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220726134634.2842185-1-sbinding@opensource.cirrus.com>
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



On 7/26/22 08:46, Stefan Binding wrote:
> Since the order of the amps in the ACPI determines the device name,
> and the ACPI order may change depending on hardware configuration,
> use UID to dynamically compute the dai links, allowing dynamic
> assignment of the name_prefix.

This is interesting, I didn't even know what this _UID thingy could be
used for. ACPI is the gift that keeps on giving after 30 years, eh?

I think you should add an explanation on what this _UID is, nothing says
it actually needs to be an integer, I see e.g. this sort of 'id' in
various DSDT

Name (_UID, Zero)  // _UID: Unique ID
Name (_UID, 0x05)  // _UID: Unique ID
Name (_UID, "SerialIoUart0")  // _UID: Unique ID
Name (_UID, "PCHRESV")  // _UID: Unique ID
Name (_UID, "IoTraps")  // _UID: Unique ID
Name (_UID, "SADDLESTRING")  // _UID: Unique ID

and my favorite

Name (_UID, "TestDev")  // _UID: Unique ID


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
> @@ -175,8 +140,32 @@ static const struct snd_soc_ops cs35l41_ops = {
>  	.hw_params = cs35l41_hw_params,
>  };
>  
> +static const char * const cs35l41_name_prefixes[] = { "WL", "WR", "TL", "TR" };
> +
> +static const char * const cs35l41_uid_strings[] = { "0", "1", "2", "3" };

I must admit not understanding why you changed the order.

I vaguely recall Brent Lu added this on TL, WL, TR, WR order on purpose
and that it matches the order in the SOF topology. Brent, can you please
comment on this?

I don't really care about the order selected, just want to make sure we
don't introduce a channel swap with what the firmware does.

> +static void cs35l41_compute_codec_conf(void)
> +{
> +	int uid;
> +	struct acpi_device *adev;
> +	struct device *physdev;
> +
> +	for (uid = 0; uid < CS35L41_MAX_AMPS; uid++) {
> +		adev = acpi_dev_get_first_match_dev(CS35L41_HID, cs35l41_uid_strings[uid], -1);
> +		if (!adev)
> +			return;

shouldn't you log an error or something telling the user that their DSDT
configuration is incorrect?

If I understand the code above, is the expectation that the UID expected
in the DSDT should be:

Name (_UID, "0")  // _UID: Unique ID for WL
Name (_UID, "1")  // _UID: Unique ID for WR
Name (_UID, "2")  // _UID: Unique ID for TL
Name (_UID, "3")  // _UID: Unique ID for TR

Is yes that's worthy of a comment for future generations.

> +		physdev = get_device(acpi_get_first_physical_node(adev));
> +		cs35l41_components[uid].name = dev_name(physdev);
> +		cs35l41_components[uid].dai_name = CS35L41_CODEC_DAI;
> +		cs35l41_codec_conf[uid].dlc.name = dev_name(physdev);
> +		cs35l41_codec_conf[uid].name_prefix = cs35l41_name_prefixes[uid];
> +		acpi_dev_put(adev);
> +	}
> +}
> +
>  void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
>  {
> +	cs35l41_compute_codec_conf();
>  	link->codecs = cs35l41_components;
>  	link->num_codecs = ARRAY_SIZE(cs35l41_components);
>  	link->init = cs35l41_init;
