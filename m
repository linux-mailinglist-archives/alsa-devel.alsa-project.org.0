Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1BA77C414
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:55:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A61D828;
	Tue, 15 Aug 2023 01:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A61D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692057314;
	bh=XhS8H62m+wCzqeCsNsnFQeHQq0SQ1dnGrFqrF0zYln8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sk9hWt80YVYiL2jEzDWV9YIxFa/N/lW6LmYw4bqQXGC+A4KoBM6pbkVMrA7j/WBgR
	 TvVC7RGqzOdG+nCg4a7lv+kOWENdgadmBWEU9QeOLK7UyF5c+HoXsN1fJr6Sb4UNlu
	 no8yYFgRN91OPVui4qcl3oCazcEuis99NtbxbTzY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1E09F80510; Tue, 15 Aug 2023 01:54:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E5ADF801EB;
	Tue, 15 Aug 2023 01:54:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA42F80254; Tue, 15 Aug 2023 01:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8FD1F80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FD1F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S8ck+Kz8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692057256; x=1723593256;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XhS8H62m+wCzqeCsNsnFQeHQq0SQ1dnGrFqrF0zYln8=;
  b=S8ck+Kz8UMCXtSrls0Td0L0e0wOzdQG4DzmMxzcnxnhUJX8fYz5NhQmv
   zU17dGXx99wjgnnoflZ028nNKwmsXI0LlqyEJYcHZBW4PX3Zr00L6ywLs
   HBVYmmGapV1rmPT2AnxNOkFAXmpgmVsnLt5KbUgy1zsADJ7oarrFTzUKC
   ZjueflmLQ+Cgy9/aLRb7+IloCRzxTM9U4tx96Lr+gFa8a2zZeBzKjsOtw
   mxxkowmRd0djqOqvr1yi/M/hgV6tAHjpavfnx7y5mucyt6f0FF+prvMqk
   Tnaae7ZDmfkTSujjzODDm2HUL3KBJfbVwUjPbGz2JdSxapqsUHDeXknay
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="362312589"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="362312589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683474590"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="683474590"
Received: from dishasur-mobl.amr.corp.intel.com (HELO [10.212.104.139])
 ([10.212.104.139])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:54:05 -0700
Message-ID: <b5fcf342-dd26-2cad-26dc-f6774f627668@linux.intel.com>
Date: Mon, 14 Aug 2023 18:54:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
Content-Language: en-US
To: Brady Norander <bradynorander@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@linux.intel.com,
 perex@perex.cz, tiwai@suse.de
References: <20230814012637.487602-1-bradynorander@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230814012637.487602-1-bradynorander@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IT4FS53T736FALZRERCOGMRSSOBZIZBW
X-Message-ID-Hash: IT4FS53T736FALZRERCOGMRSSOBZIZBW
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IT4FS53T736FALZRERCOGMRSSOBZIZBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/13/23 20:26, Brady Norander wrote:
> AlderLake and RaptorLake Chromebooks currently use the HDA driver by
> default. Add a quirk to use the SOF driver on these platforms, which is
> needed for functional internal audio.

After checking, here's a list of known Chromebooks.

Do you mind sending an updated v2?

Thanks!

> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},

> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},

> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},

> +	{
> +		.flags = FLAG_SOF,
> +		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
> +		.dmi_table = (const struct dmi_system_id []) {
> +			{
> +				.ident = "Google Chromebooks",
> +				.matches = {
> +					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> +				}
> +			},
> +			{}
> +		}
> +	},
