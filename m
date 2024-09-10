Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B867C973830
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 15:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29AFFE7F;
	Tue, 10 Sep 2024 15:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29AFFE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725973397;
	bh=nOKLnXy/12xJXPE117m27o4YsYnM7APsdPBMXFqYyfc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FQAVy00IoPh0xYS4lbHYnXNMeSD3fnnuagkrfKWW4Ygauue7+oACCaW/fcs7NJMyz
	 rVtSeoi5egksHDrMw4twfJ8IlY2/gxYH9xU9nptp0FStRX7UtzD+iHD3ezpR48sH9p
	 LicsNJy2a+Q68IQn940TqWSqF6mE2b6JC7uIsJWM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D674EF805B4; Tue, 10 Sep 2024 15:02:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA15F805AD;
	Tue, 10 Sep 2024 15:02:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00903F801F5; Tue, 10 Sep 2024 15:02:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9089DF80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 15:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9089DF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bjjtiw1G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725973359; x=1757509359;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=nOKLnXy/12xJXPE117m27o4YsYnM7APsdPBMXFqYyfc=;
  b=Bjjtiw1GS+1SC4MrjAh4zE1xBDdCybGsmMVusR3d/SaXKKxcRA50OBGk
   piKR+1nnknvH9NuDkKjUQe+ZZqEl5vLKHIs9YOz0vVYvXNU9Ph1XjpibO
   p5FBf05kOrOn6o2iSuDFe3gy0rgA9B8r9X3Sv6dTlVcHsRiRd19CW4WUa
   AgE/n/PIAwI6iNbO6cxKi5FyU0+ZGdbD7VJE4XX/IA8k7W2yTUOq/ptq2
   cG9ArsArxnw+hz7KQb3K//cYlSCHiK9jxurR0HpISsB1lTKbi/nsehE6p
   3iM4EbNyIRKFu2zbnZdoKJYsHqZobCeAn+OjaGvwaLtqfbepPhDy4Eloy
   A==;
X-CSE-ConnectionGUID: uwLnVsQ5QPSZTfBrFixR1A==
X-CSE-MsgGUID: UYszfDgjT0+yUlN5Pc/53A==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24875800"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="24875800"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:02:34 -0700
X-CSE-ConnectionGUID: p6uZ63ssRYC6RLYXfUtKeA==
X-CSE-MsgGUID: TCV1IGEEQ7KFYH0evY94gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="67070218"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.155])
 ([10.245.245.155])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:02:32 -0700
Message-ID: <febaa630-7bf4-4bb8-8bcf-a185f1b2ed65@linux.intel.com>
Date: Tue, 10 Sep 2024 16:02:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable-6.10 regression] Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, krzysztof.kozlowski@linaro.org
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, gregkh@linuxfoundation.org
References: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20240910124009.10183-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MUXPNXXT5JGTUDPA4X5INAEOJYW6V5JY
X-Message-ID-Hash: MUXPNXXT5JGTUDPA4X5INAEOJYW6V5JY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUXPNXXT5JGTUDPA4X5INAEOJYW6V5JY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 10/09/2024 15:40, Peter Ujfalusi wrote:
> The prop->src_dpn_prop and prop.sink_dpn_prop is allocated for the _number_
> of ports and it is forced as 0 index based.
> 
> The original code was correct while the change to walk the bits and use
> their position as index into the arrays is not correct.
> 
> For exmple we can have the prop.source_ports=0x2, which means we have one
> port, but the prop.src_dpn_prop[1] is accessing outside of the allocated
> memory.
> 
> This reverts commit 6fa78e9c41471fe43052cd6feba6eae1b0277ae3.

I just noticed that Krzysztof already sent the revert patch but it is
not picked up for stable-6.10.y

https://lore.kernel.org/lkml/20240909164746.136629-1-krzysztof.kozlowski@linaro.org/

> 
> Cc: stable@vger.kernel.org # 6.10.y
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi,
> 
> The reverted patch causes major regression on soundwire causing all audio
> to fail.
> Interestingly the patch is only in 6.10.8 and 6.10.9, not in mainline or linux-next.
> 
> soundwire sdw-master-0-1: Program transport params failed: -22
> soundwire sdw-master-0-1: Program params failed: -22
> SDW1-Playback: ASoC: error at snd_soc_link_prepare on SDW1-Playback: -22
> 
> Regards,
> Peter 
> 
>  drivers/soundwire/stream.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 00191b1d2260..4e9e7d2a942d 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1286,18 +1286,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
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
