Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 774353797D3
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 21:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEFC41773;
	Mon, 10 May 2021 21:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEFC41773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620675674;
	bh=fRjwfABVTLfGrpzEOu1WRuSX61ca36JTu1A9cjlnHxQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l2U6E9IgedHYrMjGeJEk3JUe1d2pmbkEtAYwEphml3gd/cWcJqA3w9BSMxWe+kKdB
	 MT+YYPgvTQH5KX0CZ5YFKj8qq0apCuLqdZrjBN8HUYGf9TXHHfwumcKJ2eSH9VgKoe
	 2OTV4LMJyndeRLNPpDaX7Rm2Q32diXLR6a6dUYhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1B0F8027D;
	Mon, 10 May 2021 21:39:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13145F80240; Mon, 10 May 2021 21:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A88F8020C
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 21:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A88F8020C
IronPort-SDR: oMpX5XAgdvi5gDeH03gNDmcQ/eAgttmSg1ZmAdnML582thRzY1Od/toWRWvcWNElWmPqYc+fLk
 PmVwLBo16N7w==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="263202406"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="263202406"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 12:38:54 -0700
IronPort-SDR: b3LIgZEQTy2TZoDKiUwgdTeNsKZBjB3oafOzgxEDg/K1UrVP4aTTSI8/0GegiNSXC8EV0kj550
 D0xnfbnYE6eQ==
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="436274464"
Received: from tcjohnst-mobl1.amr.corp.intel.com (HELO [10.255.67.148])
 ([10.255.67.148])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 12:38:53 -0700
Subject: Re: [PATCH 1/2] ASoC: Intel: bytcr_rt5640: Add quirk for the Glavey
 TM800A550L tablet
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210508150146.28403-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7b246566-e9ad-28f5-c13c-efa39ecc8177@linux.intel.com>
Date: Mon, 10 May 2021 09:39:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508150146.28403-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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



On 5/8/21 10:01 AM, Hans de Goede wrote:
> Add a quirk for the Glavey TM800A550L tablet, this BYTCR tablet has no CHAN
> package in its ACPI tables and uses SSP0-AIF1 rather then SSP0-AIF2 which
> is the default for BYTCR devices.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

For the series,

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index df2f5d55e8ff..b42fa292d408 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -574,6 +574,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_SSP0_AIF1 |
>   					BYT_RT5640_MCLK_EN),
>   	},
> +	{	/* Glavey TM800A550L */
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
> +			/* Above strings are too generic, also match on BIOS version */
> +			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>   	{
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> 
