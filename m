Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8916F31C2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 16:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A3917E6;
	Mon,  1 May 2023 16:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A3917E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682949790;
	bh=fInRQWGxctGVhRQ0CaJ96OQfLd21GfZ1Dr3xA0g9AUE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mr6y3GRcUEojvhtDUgppvnySc+XNgg7k4/lbhgunSexWRA87J0wKfyd/WQRbGaNQW
	 mWWBb/vxNY6UHt2vEaUqA0gHV/hm+TN5qlTmBA2/gnhGf9jvXf6aVsZT36FtLV3itU
	 gSGnVJZzObGZeuQHRL/V/sPn7pthWJW/Dl+O61ZI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFDD9F8051B;
	Mon,  1 May 2023 16:01:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761C2F8049E; Mon,  1 May 2023 16:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EB3AF80087
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 16:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB3AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gHy6IbyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682949670; x=1714485670;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fInRQWGxctGVhRQ0CaJ96OQfLd21GfZ1Dr3xA0g9AUE=;
  b=gHy6IbyWgiXLxs5uuVPbAR2bGjDLqD+FRnrLqHkEhYMt5YqpIm2pWTmx
   K+lgN1F3tQEDrSCG9poJFymQhpHPmzbFQTujTks/Nh6NG40AUaLqWtq0S
   iUwGNOHp9x05LBPQmW7GtsLhPJfZvW2Mx71/lbeMFFJIkUExbAEev1vJ2
   hu+AOcDRSl/NyKiyubRnwfVgBVL40saMtyoT0gfYa42ZDIsD//9ulUcy7
   zQzIShKT3YjChXb/V8NrRAWwb9aWYxwO6nPgrWZXQLxzmSKzPUYWaYR1r
   Az7MzXpksftcmQb2dOMCspEkwdAw1/+64LEA+SIfgdfNzVmWv1oXZAK10
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="434464608"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200";
   d="scan'208";a="434464608"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 07:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="870186693"
X-IronPort-AV: E=Sophos;i="5.99,241,1677571200";
   d="scan'208";a="870186693"
Received: from blele-mobl.amr.corp.intel.com (HELO [10.212.170.95])
 ([10.212.170.95])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 07:00:59 -0700
Message-ID: <c09e9c5e-ddb4-4f92-d573-04b8b2d42349@linux.intel.com>
Date: Mon, 1 May 2023 08:19:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-cht: Add quirk for Nextbook Ares 8A
 tablet
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230429104721.7176-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230429104721.7176-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GOCMXKPEQHU7S6XTJAWEIEYPGB5YMLSJ
X-Message-ID-Hash: GOCMXKPEQHU7S6XTJAWEIEYPGB5YMLSJ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOCMXKPEQHU7S6XTJAWEIEYPGB5YMLSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/29/23 05:47, Hans de Goede wrote:
> The Nextbook Ares 8A tablet which has Android as factory OS, has a buggy
> DSDT with both ESSX8316 and 10EC5651 ACPI devices.
> 
> This tablet actually uses an rt5651 codec, but the matching code ends up
> picking the ESSX8316 device, add a quirk to ignote the ESSX8316 device
> on this tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

It took me a while to understand the logic: the ES8316 device is ignored
so the matching code keeps going until it finds the rt5651 later in the
table

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  .../intel/common/soc-acpi-intel-cht-match.c   | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 6beb00858c33..cdcbf04b8832 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -50,6 +50,31 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
>  		return mach;
>  }
>  
> +/*
> + * Some tablets with Android factory OS have buggy DSDTs with an ESSX8316 device
> + * in the ACPI tables. While they are not using an ESS8316 codec. These DSDTs
> + * also have an ACPI device for the correct codec, ignore the ESSX8316.
> + */
> +static const struct dmi_system_id cht_ess8316_not_present_table[] = {
> +	{
> +		/* Nextbook Ares 8A */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CherryTrail"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "M882"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static struct snd_soc_acpi_mach *cht_ess8316_quirk(void *arg)
> +{
> +	if (dmi_check_system(cht_ess8316_not_present_table))
> +		return NULL;
> +
> +	return arg;
> +}
> +
>  static const struct snd_soc_acpi_codecs rt5640_comp_ids = {
>  	.num_codecs = 2,
>  	.codecs = { "10EC5640", "10EC3276" },
> @@ -113,6 +138,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>  		.drv_name = "bytcht_es8316",
>  		.fw_filename = "intel/fw_sst_22a8.bin",
>  		.board = "bytcht_es8316",
> +		.machine_quirk = cht_ess8316_quirk,
>  		.sof_tplg_filename = "sof-cht-es8316.tplg",
>  	},
>  	/* some CHT-T platforms rely on RT5640, use Baytrail machine driver */
