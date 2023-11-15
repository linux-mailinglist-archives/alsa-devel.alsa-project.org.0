Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6697EC8A1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 17:31:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D05B984B;
	Wed, 15 Nov 2023 17:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D05B984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700065887;
	bh=XSWLyJxFTqyYvobQOApnn9qgzueYzqYkv2eVyB9iQuM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gu8PQFQvJ/noyJY+D84sHzukCxTbB2byIIQwe1puRXfeNa9ZWvk4gFkQOVy+y+U/g
	 Eaf0HTOsEQ3fJ0irFwDUeE+WGJvZpV4YEj7lQHlwvdBaIIdR500QWN8UKUkdCmiCDP
	 rxTtCvtjS0DcCY8nVIGHk0Za+VIzZSqc54hRp41s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59DE4F80093; Wed, 15 Nov 2023 17:30:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5EF2F8016E;
	Wed, 15 Nov 2023 17:30:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0DE6F801D5; Wed, 15 Nov 2023 17:28:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EA50F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 17:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA50F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TTEp7dkh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700065688; x=1731601688;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XSWLyJxFTqyYvobQOApnn9qgzueYzqYkv2eVyB9iQuM=;
  b=TTEp7dkhQlQ5Ph61lxzxhDlBf8RhktZQWqmPJ12rbkuKtRouDw/gJb7q
   1C4/2ftAsljj6mU2qZAshq2oy0Aytm9vVPxtofBWW41H93EsM93seYlFS
   SA2eabDLP+ASlWnX7gvMH7Zh0to/srbLvlutaQ5xM7CAhHRTqNCnhS2p5
   95vq8xoJVvpjs32HiR67rRH2jXmcybQ62hF/r7QLdUgBX+fkfvAy7qgJz
   0giNUSKLtRcuMa1AIWUVCgrod46kLfm6DWLa9jO3SM3wvINz9dzq2I6ll
   JJeNz90zB/FY8rW0Di6Di48BxPvRc6EXkSiAEMn0+3HUBGj477UdVEIlc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="370252757"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200";
   d="scan'208";a="370252757"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855690652"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200";
   d="scan'208";a="855690652"
Received: from ipaliych-mobl2.amr.corp.intel.com (HELO [10.212.183.137])
 ([10.212.183.137])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:27:56 -0800
Message-ID: <3e461bb5-fa6b-4729-8ff5-ccc1d2887066@linux.intel.com>
Date: Wed, 15 Nov 2023 08:44:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: add an error code check in
 amd_sdw_clock_stop_exit
To: Su Hui <suhui@nfschina.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <20231115095407.1059704-1-suhui@nfschina.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231115095407.1059704-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YSZHNZRABRE4BNRXB6WO66PCZQX7PYMV
X-Message-ID-Hash: YSZHNZRABRE4BNRXB6WO66PCZQX7PYMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSZHNZRABRE4BNRXB6WO66PCZQX7PYMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/15/23 03:54, Su Hui wrote:
> Clang static analyzer complains that value stored to 'ret' is never read.
> Add an error code check and print an error message if 'readl_poll_timeout'
> failed.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/soundwire/amd_manager.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 3a99f6dcdfaf..f391b541f4b7 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1029,6 +1029,10 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
>  		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
>  					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
>  					 AMD_SDW_TIMEOUT);
> +		if (ret)
> +			dev_err(amd_manager->dev, "%s: timed out: %pe\n", __func__,
> +				ERR_PTR(ret));

Is this really the desired behavior?

This patch fixes the static analysis issue by logging the error code,
but does it make sense to continue resuming here and trying to exit from
the clock stop mode?

At this point a bus reset might be a more relevant behavior...

>  		if (val & AMD_SDW_CLK_RESUME_DONE) {
>  			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>  			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
