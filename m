Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796169E572
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 18:02:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49982E80;
	Tue, 21 Feb 2023 18:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49982E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676998965;
	bh=iFyDvz2P2otJwQT54nKL7jYUo8yfpArBbDhv6LjMnWo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YtElAcRVLQ7ova/Q2XwRQaxa61ZybsqAd3XilZp1GCjWVUIA6K5hX8bqk4c2pNB9u
	 Y3TB8cIpDDrcTnW4nNWaDujZMmB9TSXNN/neNANLc1cRjp3BUC850q4jImLjjmX8t7
	 HmTtu4/V0mCePNqY+PWBEQSD47XleRBETjRrRNZc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F00F8057D;
	Tue, 21 Feb 2023 17:59:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19AE5F8053D; Tue, 21 Feb 2023 17:59:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C5A4F80525
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 17:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C5A4F80525
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NUDB4xjA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676998743; x=1708534743;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iFyDvz2P2otJwQT54nKL7jYUo8yfpArBbDhv6LjMnWo=;
  b=NUDB4xjA0Mio43SRytOc8NQOmKOMWyTahBvwA5CkR3gR3UDknQypXO0R
   8/V4hxIr4K36QIbS6+F3nu9ChbuCGs7j5kYXILGB/h8g8MCCYV97Bi6uS
   JYpzulyvF8mLaatEhZ82VsoQ1CgL6qmhiTFO+e3PrlYLvP41hZKabCKev
   RODoBP3v/I7uBqyKT81OrDk6Ey+O5r4zMgl7QuGFqIt7wEv7NpNljZNMy
   g0NpvJwjQK9jNAtuyRK/+eMWNB3661QyXgcwR7hkfmEm6+/4WQlo3HoEZ
   kiVPDL005LwiJi9YvJuMuLqikAnxwzGkUsU1hUcbDR43kEAnc3D592/yZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334884761"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="334884761"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814569146"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000";
   d="scan'208";a="814569146"
Received: from taevough-mobl.amr.corp.intel.com (HELO [10.209.174.213])
 ([10.209.174.213])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 08:58:47 -0800
Message-ID: <20097f1d-a7ef-9932-685c-afb22006076c@linux.intel.com>
Date: Tue, 21 Feb 2023 11:52:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 10/10] ASoC: Intel: soc-acpi: Add CS35L56 Soundwire to TGL
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
 <20230217161410.915202-11-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230217161410.915202-11-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WZB7K5TXIETFQJUA4BL3XFLB2AVFGDPN
X-Message-ID-Hash: WZB7K5TXIETFQJUA4BL3XFLB2AVFGDPN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZB7K5TXIETFQJUA4BL3XFLB2AVFGDPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static const struct snd_soc_acpi_link_adr up_extreme_cs35l56_sdw0_one[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = 1,
> +		.adr_d = cs35l56_sdw0_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr up_extreme_cs35l56_sdw0_four[] = {
> +	{
> +		.mask = BIT(0),
> +		.num_adr = 4,
> +		.adr_d = cs35l56_sdw0_adr,
> +	},
> +	{}
> +};

If the machine driver has support for the 2-amplifier configuration,
shouldn't it be present here as well?

> +
>  /* this table is used when there is no I2S codec present */
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
>  	/* mockup tests need to be first */
> @@ -501,6 +546,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
>  		.drv_name = "sof_sdw",
>  		.sof_tplg_filename = "sof-tgl-rt711.tplg",
>  	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = up_extreme_cs35l56_sdw0_four,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-tgl-cs35l56-sdw0.tplg"
> +	},
> +	{
> +		.link_mask = BIT(0),
> +		.links = up_extreme_cs35l56_sdw0_one,
> +		.drv_name = "sof_sdw",
> +		.sof_tplg_filename = "sof-tgl-cs35l56-sdw0.tplg"
> +	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_sdw_machines);
