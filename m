Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198164BB05
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 18:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D99B7182D;
	Tue, 13 Dec 2022 18:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D99B7182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670952649;
	bh=wIH5vLNvx7EU6z3Tt6F7dmxTQln02BgS/AT0+Rxa/4w=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KO32r13w7YrVfQezhRgm61IdcnwnrGBq+BewgBv3YmT1b2YjIbRGMt1ZJJ8Iu/iMd
	 lnJGCCsTMfj99a55f/00W0kXux98UNZT0x3V+MvvWDgAMae/qdx9Oe6MPeB3PewO4x
	 Z5/ZJoV5p4RhbOFV2gh6pvflv4VJHyhlCXMUjLBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F2F4F80073;
	Tue, 13 Dec 2022 18:29:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 035AEF804E2; Tue, 13 Dec 2022 18:29:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD8BEF80073
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 18:29:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD8BEF80073
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h3wylBnG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670952588; x=1702488588;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wIH5vLNvx7EU6z3Tt6F7dmxTQln02BgS/AT0+Rxa/4w=;
 b=h3wylBnG2AZ+pqTxFkWGGKK/dY+M4eWs8Zjw0+nvLLM+DpURjrr67YG5
 FIU/Dsq2phHHfonYfCs7IWcAfUQTM8DBy+s19BmNBHOPVX7g5bU/cOOg4
 4d8S25L98LUWbUfZ1TM3OBJddA0czM66869kiXBIeb7rhcH+/F8xQwI+A
 3OyP9h7Zm0RRIdXe368SmhTy9xzS6kHnZSWpzjZAEd2Ksh9Ha8kQz+nel
 j2hvn4Pm3r4Naa0rOA8cXJvFFGA3TRRomXt+bkEpYzX7JMVZy8wZTw8Ph
 oiWaVxGDqbnmhxAT4kv0YjvtwxC9CR6ZiR2fJQwPagRFaF665+Ep1nUfz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="316893256"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="316893256"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 09:29:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="717301300"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="717301300"
Received: from lvalluri-mobl.amr.corp.intel.com (HELO [10.212.67.174])
 ([10.212.67.174])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 09:29:44 -0800
Message-ID: <bbe559d4-97f9-ffe2-a2ae-9b40f060c072@linux.intel.com>
Date: Tue, 13 Dec 2022 09:42:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech
 MICA-071 tablet
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20221213123246.11226-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221213123246.11226-1-hdegoede@redhat.com>
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
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/13/22 06:32, Hans de Goede wrote:
> The Advantech MICA-071 tablet deviates from the defaults for
> a non CR Bay Trail based tablet in several ways:
> 
> 1. It uses an analog MIC on IN3 rather then using DMIC1
> 2. It only has 1 speaker
> 3. It needs the OVCD current threshold to be set to 1500uA instead of
>    the default 2000uA to reliable differentiate between headphones vs
>    headsets
> 
> Add a quirk with these settings for this tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index fb9d9e271845..ddd2625bed90 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -570,6 +570,21 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_SSP0_AIF1 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{
> +		/* Advantech MICA-071 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
> +		},
> +		/* OVCD Th = 1500uA to reliable detect head-phones vs -set */
> +		.driver_data = (void *)(BYT_RT5640_IN3_MAP |
> +					BYT_RT5640_JD_SRC_JD2_IN4N |
> +					BYT_RT5640_OVCD_TH_1500UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_MONO_SPEAKER |
> +					BYT_RT5640_DIFF_MIC |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
