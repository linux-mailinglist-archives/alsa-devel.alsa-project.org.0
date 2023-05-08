Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 613AF6FA119
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F225E10AA;
	Mon,  8 May 2023 09:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F225E10AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683531165;
	bh=3nm7aSt0DFMclJqVyDYsQtyYwsSpDIUwMLJXetpid2s=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QNPuyf9Ixbmmmh/nd/+F3UL3EfB0VtdC9yfwTEBbkr8IAMKGgOTt2EQ1Ms2GfIJi9
	 VbCKs+9La19g0+Nb+FrckvuhpVovCB7joqpaoFcwQBgehvAjBmpiUALWAcauvDU2//
	 Lj8mTeQ+5WNSnfmY9Kw8CdnGCL2GrzUfuIZUh7nQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 289AFF802E8;
	Mon,  8 May 2023 09:31:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA702F8032D; Mon,  8 May 2023 09:31:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BECDFF80087
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 09:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BECDFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=enJQD8eY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683531104; x=1715067104;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3nm7aSt0DFMclJqVyDYsQtyYwsSpDIUwMLJXetpid2s=;
  b=enJQD8eY4+6V+XcOyWXBcsO1tu2KO8h8B1QFLRy2wLVetQwypOamtVF4
   soP/VaLoolLBi25TI8FGqR2xsCl8+DByO/nKXZrqV2QPHs6ynRrG7RdyT
   rpAcDfMrdv15Zrf50xOfb+/Ysn0FvWfLltwJ5WtN429V+5Ifk7QfvnrwK
   tEZ1p7jviIKeG0DPt89ChzKV5qBhq8ZKPMeOxKYWgKYbJobL/Oy56A6rG
   WWlHqe1P5m90JuMWPn3Cq24Ck1Sj1CJuhwhWHHwQx1JteQfPeKBBp5fC1
   jd0q0oNM56pU3ume/vIkORYvH/De8E+4aFQH0HLEC6IDW2qL5FUU2XPu3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329200248"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200";
   d="scan'208";a="329200248"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 00:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="767967877"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200";
   d="scan'208";a="767967877"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 00:31:34 -0700
Message-ID: <68205138-a0ae-f6cf-c81b-e94168a01a29@linux.intel.com>
Date: Mon, 8 May 2023 09:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/5] ASoC: tas2781: Add Header file for tas2781 driver
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com
References: <20230508054453.700-1-13916275206@139.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230508054453.700-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4X6FH27DFROLNFRW2U5G5S4Y7RNVFF3Y
X-Message-ID-Hash: 4X6FH27DFROLNFRW2U5G5S4Y7RNVFF3Y
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com,
 gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X6FH27DFROLNFRW2U5G5S4Y7RNVFF3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/8/2023 7:44 AM, Shenghao Ding wrote:
> Create Header file for  tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v2:
>   - fixed issue | Reported-by: kernel test robot <lkp@intel.com>
>     | Link: https://lore.kernel.org/oe-kbuild-all/202305022033.LiI7Ojm4-lkp@intel.com/
>   Changes to be committed:
> 	new file:   include/sound/tas2781-dsp.h
> 	new file:   include/sound/tas2781-tlv.h
> 	new file:   include/sound/tas2781.h
> ---

...

> +enum channel {
> +	top_left_Chn,
> +	top_right_chn,
> +	bottom_left_Chn,
> +	bottom_right_chn,
> +	max_chn,
> +};

Why some enums have capitalized Chn? Just use chn everywhere.



