Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE07E96CEEA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 08:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3010E0F;
	Thu,  5 Sep 2024 08:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3010E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725516762;
	bh=1/SCPb2qKEEJMQdohSBCrjDKgVJtEb+/O7GI3pZW21Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n71cBgzcrIl3Ix8tSW5UgfjbA/EumkvjMKhsjvlznHf2XeIJ2zSfgrt2pHqAFsjBU
	 xqs2tBiDz134CXYbZDWBYWV5QRE6kxEwc6/iAYG6UgMaBEKw3Tf86nV3Iq9QyfTpbP
	 dWvGHx1hv3XWP7ydboJ1ZcdNZt6ml7OU72WuE6ko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFAEEF804FC; Thu,  5 Sep 2024 08:12:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8DDF804FC;
	Thu,  5 Sep 2024 08:12:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C1B2F8016C; Thu,  5 Sep 2024 08:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 354C3F800E9
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 08:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 354C3F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DLq7bhZT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725516723; x=1757052723;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=1/SCPb2qKEEJMQdohSBCrjDKgVJtEb+/O7GI3pZW21Y=;
  b=DLq7bhZTqGDKfk8kq6uZfxvb/fyO1U84m55UUfvKo+UCasG3wI4x8t8M
   h4lZgzKwCgiQ5cdglBOUqcXEQy3rJPwXiYXGXEwLMW1S2zKnh2YDvmE/7
   dkLi0+3Yy/syhJ/8CZUMEuawkMV4FDy8Ai7Ou1uKd0QbNR7EVyatvhbAF
   p9oZthU8U3waV8rvQC2e76yYAkCYYTvQZ1nGHXJWKI31I7WnWTN9IKASV
   qiRbiggmuHmY1xh5e3xzscQ5XBH+nBAXXWWIgAM5rP+8Iye9YT7lCh6P0
   HYB5Y4TL3EHIFVtH6Yx/t6rUQbBa0MtOg2U71I4lnsEyAVXx4rogHmGzQ
   g==;
X-CSE-ConnectionGUID: s/VvV+n+SveuKdMq4wXRKg==
X-CSE-MsgGUID: eODzUGaISUeint4zTq4Otw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27963189"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600";
   d="scan'208";a="27963189"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 23:11:58 -0700
X-CSE-ConnectionGUID: gz9d9Tf5Q12hYSYVsGRczA==
X-CSE-MsgGUID: 7kVQcwKHQ/iFc9x/uaeu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600";
   d="scan'208";a="69652967"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.225])
 ([10.246.104.225])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 23:11:57 -0700
Message-ID: <0780217b-1b92-4c22-bb5a-5b290c66dfe9@linux.intel.com>
Date: Thu, 5 Sep 2024 14:11:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7FS4EGKPCUE5VHFEYXYHMLZUAVHY2535
X-Message-ID-Hash: 7FS4EGKPCUE5VHFEYXYHMLZUAVHY2535
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FS4EGKPCUE5VHFEYXYHMLZUAVHY2535/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 9/4/2024 10:52 PM, Krzysztof Kozlowski wrote:
> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
> breaks codecs using non-continuous masks in source and sink ports.  The
> commit missed the point that port numbers are not used as indices for
> iterating over prop.sink_ports or prop.source_ports.
>
> Soundwire core and existing codecs expect that the array passed as
> prop.sink_ports and prop.source_ports is continuous.  The port mask still
> might be non-continuous, but that's unrelated.
>
> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>

> ---
>
> I will need to fix my codec drivers, but that's independent.
> ---
>   drivers/soundwire/stream.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index f275143d7b18..7aa4900dcf31 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
>   					    unsigned int port_num)
>   {
>   	struct sdw_dpn_prop *dpn_prop;
> -	unsigned long mask;
> +	u8 num_ports;
>   	int i;
>   
>   	if (direction == SDW_DATA_DIR_TX) {
> -		mask = slave->prop.source_ports;
> +		num_ports = hweight32(slave->prop.source_ports);
>   		dpn_prop = slave->prop.src_dpn_prop;
>   	} else {
> -		mask = slave->prop.sink_ports;
> +		num_ports = hweight32(slave->prop.sink_ports);
>   		dpn_prop = slave->prop.sink_dpn_prop;
>   	}
>   
> -	for_each_set_bit(i, &mask, 32) {
> +	for (i = 0; i < num_ports; i++) {
>   		if (dpn_prop[i].num == port_num)
>   			return &dpn_prop[i];
>   	}
