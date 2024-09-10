Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13097383D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 15:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF565E97;
	Tue, 10 Sep 2024 15:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF565E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725973558;
	bh=e5dl7rhTvT8U88gO91GvPckWYrls1EUDpHm65XSFRHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hW+6sN+4IjgTHEbKbb+KuTlxelDD7U2AlkwudEwijneKJwRXaltJICKsGw8nWunzx
	 y70XQOeFM3R8WUfE+U4GYep7fzHn9S2MMpiaxPuUrUfDyIA/58e9pNN3ynp3Y8cyIa
	 LlYD18F06Nhq0kAl1s+JPrKiY+iPbk3QQBhgmYSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93AEAF8019B; Tue, 10 Sep 2024 15:05:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03133F805A0;
	Tue, 10 Sep 2024 15:05:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97414F801F5; Tue, 10 Sep 2024 15:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD328F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 15:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD328F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BZzh9oqT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725973521; x=1757509521;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=e5dl7rhTvT8U88gO91GvPckWYrls1EUDpHm65XSFRHE=;
  b=BZzh9oqTU/Zf2+tXUDhQck0nCFXxs4K4DeWoHaTvCvWpTB//itg11O/1
   Wn31E2vGGkn7ppwt83noC8wIEdP71Xju1HB2WfDSgE4UALcfSsorM0IAf
   /J8uY9Hu8VwMH0aWzhpFn0PAkdT+rg2RtzG1VwGFcPMbR7Hs2kXdYuMKB
   rtrGrbi3jDmqrwQyRKIdGYCYKTGWEih5NUu4bg8/OKoc4tOxCb5qOcMME
   w/WqEA8VM/ianeZWIYvdIEafgATB1TA6W0i2TBIEvEPQ1v8vlZWOwH26S
   b+663MUZoTJsbzTnB+IPryI7NNacvS8BQU05V3aPJPNlCDgQHU2/JrI5C
   A==;
X-CSE-ConnectionGUID: JZAZj8WLQcCUAx1o2gh78A==
X-CSE-MsgGUID: afKCgUsWTx2TZzJtJQKk5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42191320"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="42191320"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:05:16 -0700
X-CSE-ConnectionGUID: Xd9L7Gp2RNCKe72KRzKOpA==
X-CSE-MsgGUID: 5TgIvzSPQWua0RSpn/N0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="67547864"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.155])
 ([10.245.245.155])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:05:13 -0700
Message-ID: <568137f5-4e4f-4df7-8054-011977077098@linux.intel.com>
Date: Tue, 10 Sep 2024 16:05:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, stable@vger.kernel.org
References: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DXZLX5NRM3WIP3L6OST7LSDOIMWXUROD
X-Message-ID-Hash: DXZLX5NRM3WIP3L6OST7LSDOIMWXUROD
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXZLX5NRM3WIP3L6OST7LSDOIMWXUROD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/09/2024 19:47, Krzysztof Kozlowski wrote:
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
> Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> 
> ---
> 
> Resending with Ack/Rb tags and missing Cc-stable.
> ---
>  drivers/soundwire/stream.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index f275143d7b18..7aa4900dcf31 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
>  					    unsigned int port_num)
>  {
>  	struct sdw_dpn_prop *dpn_prop;
> -	unsigned long mask;
> +	u8 num_ports;
>  	int i;
>  
>  	if (direction == SDW_DATA_DIR_TX) {
> -		mask = slave->prop.source_ports;
> +		num_ports = hweight32(slave->prop.source_ports);
>  		dpn_prop = slave->prop.src_dpn_prop;
>  	} else {
> -		mask = slave->prop.sink_ports;
> +		num_ports = hweight32(slave->prop.sink_ports);
>  		dpn_prop = slave->prop.sink_dpn_prop;
>  	}
>  
> -	for_each_set_bit(i, &mask, 32) {
> +	for (i = 0; i < num_ports; i++) {
>  		if (dpn_prop[i].num == port_num)
>  			return &dpn_prop[i];
>  	}

-- 
Péter
