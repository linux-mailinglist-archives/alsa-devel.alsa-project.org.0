Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7064EE7A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDF2916BB;
	Fri, 16 Dec 2022 17:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDF2916BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671206651;
	bh=lF4vw7e9EdXWDJLOD83gO5PEMesX68FvheF+irKVV2g=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JyDIPc6rrXlGFRXBiA6rp1doyqfn5+M+oqyFq5vvgg7ynE2RkrVRuVDmXlWpyyGfI
	 Hc+rHXzbWmeDuBDSHYGVhHsckTJoTapnZSIg4CS7wyGvLH/v2QDDaatJKdVFsktzUk
	 2UNAsCbOeKXJW2I6oKK+NjmGZQSoB7ok8BT3B0k8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A837BF804D0;
	Fri, 16 Dec 2022 17:03:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96245F804E2; Fri, 16 Dec 2022 17:03:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80FF0F804D0
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FF0F804D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Eaww+J4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206590; x=1702742590;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lF4vw7e9EdXWDJLOD83gO5PEMesX68FvheF+irKVV2g=;
 b=Eaww+J4WlYA8wLtMCe1P0VnltX6FsVswgZr4Kesaw+Mu/NP0tY2ss76L
 G5ergcUPHskHb/glb5xynhev6SiRtwGFk1jxQmLTiUxXHhkcyKOvHL/0h
 TZjS0uNiPeV1Ktq7VNTCizFeM0Iovmhl9G7Pibnhu9BUJz3z2EF7z2TjY
 JB2yNnQ14h1bNxje82ygis9uot/VCRmv2ucQnU7m7zi6tmWP5sLOTYlVU
 zBK/fc98IcjDZ0d8zOz25shjRZzxP+HS5QJjZonCd8sX/jc1smnY6VRve
 ccbaa0m30malibipc0ww2eSkOJzk8hCo7U0RiNoTdmopxddygWv/OKNje g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="383327929"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="383327929"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:03:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="824148061"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="824148061"
Received: from krojasle-mobl.amr.corp.intel.com (HELO [10.209.187.31])
 ([10.209.187.31])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:03:04 -0800
Message-ID: <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
Date: Fri, 16 Dec 2022 10:03:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/16/22 09:49, Ajye Huang wrote:
> This patch adds the driver data for two nau8318 speaker amplifiers on
> SSP1 and nau8825 on SSP0 for ADL platform.

So here you are making reference to two amplifiers...

> +static struct snd_soc_dai_link_component nau8318_components[] = {
> +	{
> +		.name = "NVTN2012:00",
> +		.dai_name = "nau8315-hifi",
> +	}
> +};

but here there's only one? I was expecting something like what we've
used for Maxim amplifiers with a codec configuration and dailink
components that list the two amplifiers.

static struct snd_soc_codec_conf max_98373_codec_conf[] = {
	{
		.dlc = COMP_CODEC_CONF(MAX_98373_DEV0_NAME),
		.name_prefix = "Right",
	},
	{
		.dlc = COMP_CODEC_CONF(MAX_98373_DEV1_NAME),
		.name_prefix = "Left",
	},
};

struct snd_soc_dai_link_component max_98373_components[] = {
	{  /* For Right */
		.name = MAX_98373_DEV0_NAME,
		.dai_name = MAX_98373_CODEC_DAI,
	},
	{  /* For Left */
		.name = MAX_98373_DEV1_NAME,
		.dai_name = MAX_98373_CODEC_DAI,
	},
};

Or is this a commit message problem and there's really only one amplifier?

> +
>  static struct snd_soc_dai_link_component dummy_component[] = {
>  	{
>  		.name = "snd-soc-dummy",
> @@ -486,6 +494,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
>  			max_98360a_dai_link(&links[id]);
>  		} else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
>  			sof_rt1015p_dai_link(&links[id]);
> +		} else if (sof_nau8825_quirk &
> +				SOF_NAU8318_SPEAKER_AMP_PRESENT) {
> +			links[id].codecs = nau8318_components;
> +			links[id].num_codecs = ARRAY_SIZE(nau8318_components);
> +			links[id].init = speaker_codec_init;

The rest looks fine, I only have this one/two amplifier question.
