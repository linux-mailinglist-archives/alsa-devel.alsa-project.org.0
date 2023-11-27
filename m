Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95A7FA324
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 15:41:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBF583E;
	Mon, 27 Nov 2023 15:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBF583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701096073;
	bh=GTkUfYkRYLDgVoLX+kaz2jbVT+PMZwjTicaJ0mKNCB4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FjVb7srRwQc/wDdbTXJmYfO69xAFd8xGrt+GlxrXMH+jZUQDAoXVGeT+LDdUpc2SE
	 njizWsXLVHCo5Gv0XeQbclXT7iu4dccI9SSqDEsXcgL7RGGU/+kBTB/cTsMZfNTARs
	 lX85KeAmH0dKFl/jv2AiJmVWLSUVTdpSs4/qsVXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C00E1F80567; Mon, 27 Nov 2023 15:40:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F3B6F80579;
	Mon, 27 Nov 2023 15:40:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80EFAF801D5; Mon, 27 Nov 2023 15:40:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 971CFF8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 15:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 971CFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=epMn+3ql
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AR9uWst002549;
	Mon, 27 Nov 2023 08:40:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=0s8Y5Yt9NDwm5kv7YhMcjG9KbosgGmr0+RQWDzytH+Y=; b=
	epMn+3qlFvlyadPh3FvKEp4yAWZnsE02jvZSBaNYeCjv1sa5boQjdu1oqTKTjSUw
	tiTSr1khG+UzYl0K0Y/rGutS4Er2FBlGOPrTHhLHYx9sGgpodiBFMB/SBX0NpcQ+
	t31q5hqdF/Lm7m7q4bnbbNxN/SjovI7JBIJDgKIv5sInGnJpArXwYzJY/fmKN8bE
	suQZkPOpBeRD3k7LmOd18VZCfjoV+YWPkhXbYujkQuYmh69i/QDaWBimBvTNwKtO
	z9e6Y8JCyNOdduVzrUzq05kpDJPezL2+XMkLTC0jdkoZdoWynNtXJhuSFg9yVXHp
	yGf3Ekat9CbP830jBH9DEQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uke7pj146-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:40:34 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 27 Nov
 2023 14:40:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 27 Nov 2023 14:40:32 +0000
Received: from [198.90.251.82] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 102D615A5;
	Mon, 27 Nov 2023 14:40:31 +0000 (UTC)
Message-ID: <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
Date: Mon, 27 Nov 2023 14:40:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <pierre-louis.bossart@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <cezary.rojewski@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <ckeepax@opensource.cirrus.com>,
        <yong.zhi@intel.com>, <chao.song@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RaAjJM9BQooL7NFLL1q0vXgQP04P3zOr
X-Proofpoint-ORIG-GUID: RaAjJM9BQooL7NFLL1q0vXgQP04P3zOr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QNDWGT54H5WJCBJUQQ3XZVUOGXTKLQVH
X-Message-ID-Hash: QNDWGT54H5WJCBJUQQ3XZVUOGXTKLQVH
X-MailFrom: prvs=6695834767=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QNDWGT54H5WJCBJUQQ3XZVUOGXTKLQVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/11/2023 13:34, Peter Ujfalusi wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> This is a test configuration for UpExtreme.
> 
> The codec layout is configured as:
>      - Link3: CS42L43 Jack
>      - Link0: 2x CS35L56 Speaker
>      - Link1: 2x CS35L56 Speaker
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>   .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++++++
>   1 file changed, 78 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> index 5804926c8b56..49834bffa50c 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> @@ -41,6 +41,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
>   	.group_id = 1,
>   };
>   
> +static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
> +	.num = 0,
> +	.aggregated = 1,
> +	.group_position = 2,
> +	.group_id = 1,
> +};
> +
> +static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
> +	.num = 0,
> +	.aggregated = 1,
> +	.group_position = 3,
> +	.group_id = 1,
> +};
> +
>   static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
>   	{
>   		.num = 0,
> @@ -400,6 +414,64 @@ static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
>   	{}
>   };
>   
> +static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
> +	{
> +		.adr = 0x00033001FA424301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &single_endpoint,
> +		.name_prefix = "cs42l43"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
> +	{
> +		.adr = 0x00003301FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,

Assigning CS35L56 to "left" or "right" endpoints might be confusing.
All CS35L56 in a system receive both left and right channels and by
default they output a mono-mix of left+right.

The left/right of an amp is determined by the firmware file (.bin) that
is loaded and the current settings of the "Posture" ALSA control. So
this amp might be the left channel after a .bin is loaded.

It would be better to have generic names for the endpoint that don't
imply position, for example:

group1_spk1_endpoint
group1_spk2_endpoint
group1_spk3_endpoint
group1_spk4_endpoint.

> +		.name_prefix = "cs35l56-8"

Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
CS35L56-hda driver? This prefix is used to find the matching firmware
files and our naming convention for these has been cs35lxx-xxxx-ampn

Is there anything that depends on the prefixes being "cs35l56-n" ?

> +	},
> +	{
> +		.adr = 0x00003201FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_3_endpoint,
> +		.name_prefix = "cs35l56-7"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
> +	{
> +		.adr = 0x00013701FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "cs35l56-1"
> +	},
> +	{
> +		.adr = 0x00013601FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_2_endpoint,
> +		.name_prefix = "cs35l56-2"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
> +	{
> +		.mask = BIT(3),
> +		.num_adr = ARRAY_SIZE(cs42l43_3_adr),
> +		.adr_d = cs42l43_3_adr,
> +	},
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs35l56_0_adr),
> +		.adr_d = cs35l56_0_adr,
> +	},
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs35l56_1_adr),
> +		.adr_d = cs35l56_1_adr,
> +	},
> +	{}
> +};
> +
