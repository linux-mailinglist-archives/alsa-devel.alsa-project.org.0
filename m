Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45873901B83
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 09:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE98982A;
	Mon, 10 Jun 2024 09:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE98982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718003038;
	bh=gwdQdEZwjnQ0JoGv4TLYWLz46bwaclyliE7k0+RKgSs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmBI/iPZ7MAfFOSKNVygrqB9CEiDOWLF7z9Hj6LyXWnIEaEJXj6W85+9j1msvKYdJ
	 Zw6BBn9a2A0OhdjiYZWeUoQ+smJSs1lLXqFxXjtbvJg2BpPP6winqNmCq68vKnLTFN
	 ldsgSz4YWmb48BCDa7JE7CVCK4fKreksPYfovcTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31365F80589; Mon, 10 Jun 2024 09:03:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 008A7F8028D;
	Mon, 10 Jun 2024 09:03:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44E01F8028D; Mon, 10 Jun 2024 09:00:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3403CF800D0
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 09:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3403CF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e2Cerzvs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718002842; x=1749538842;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gwdQdEZwjnQ0JoGv4TLYWLz46bwaclyliE7k0+RKgSs=;
  b=e2CerzvsFtiyFzdVpEShv2PFkstW0GvGnfqAh509GABhgxdmopDP2YqF
   AyqwH5t/7pNjAxohf9cbtXTuchs1nWLvzZaXedDNPSZYvvkeoFS7YOFK1
   iUmZ0BiCGODdl7J5JXsb53ho3tOySCAfTIQCDncuXpwkoaLq3BR81RZ65
   DG30vKZ6Ghb+aFQqhScPMsDTo6BZ2pFWYOReZDBp8pZPDQy04gLzbsMoW
   VV0KxloTvVOj1pqhAaEoAk10nc1YspJCEh3FJcIZ6plAthW55MBiQZQk8
   f+caIFHZuyuYPk/xxjgpbrePA40lvMvDtHYBqb6ztCddSCw/4qib6RUp7
   Q==;
X-CSE-ConnectionGUID: oA9bsLUTTl2Cfpqxi3yL1A==
X-CSE-MsgGUID: Oj7kJ0PYTsWrRF1PkvWQQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26061546"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000";
   d="scan'208";a="26061546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 00:00:37 -0700
X-CSE-ConnectionGUID: ozKUn+xHQ8mv5ZmuRy+2iA==
X-CSE-MsgGUID: kvMLhfN6Tnqlr7oKU2A8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000";
   d="scan'208";a="70142631"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.162])
 ([10.245.246.162])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 00:00:33 -0700
Message-ID: <1e983aa4-8855-41d7-8f95-34930efadefb@linux.intel.com>
Date: Mon, 10 Jun 2024 09:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bytcr_rt5640 : inverse jack detect for Archos 101 cesium
To: Thomas GENTY <tomlohave@gmail.com>, broonie@kernel.org
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, Hans de Goede <hdegoede@redhat.com>
References: <20240608170251.99936-1-tomlohave@gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240608170251.99936-1-tomlohave@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W3G6ASN2S5AFXUXLMCRBMHJ33LOQDVPL
X-Message-ID-Hash: W3G6ASN2S5AFXUXLMCRBMHJ33LOQDVPL
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W3G6ASN2S5AFXUXLMCRBMHJ33LOQDVPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/8/24 19:02, Thomas GENTY wrote:
> When headphones are plugged in, they appear absent; when they are removed,
> they appear present.
> Add a specific entry in bytcr_rt5640 for this device
> 
> Signed-off-by: Thomas GENTY <tomlohave@gmail.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index b41a1147f1c3..a64d1989e28a 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -610,6 +610,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_SSP0_AIF1 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ARCHOS 101 CESIUM"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_JD_NOT_INV |
> +					BYT_RT5640_DIFF_MIC |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ARCHOS"),
