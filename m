Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE7973916
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 15:50:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31DEE9A;
	Tue, 10 Sep 2024 15:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31DEE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725976231;
	bh=sB67UM2Zr/q7FoL8u4RtQFupw/SD6hgP282y93A+VVc=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j/ZygVBgMKTgIXdVGtTJwmKGZ78nhpm92DGO5M5MiBrGGiVhBOvSEH2jg9oDYrV62
	 n8kPZ0+uE4KtDN6Inu5Dl1jqo6EXnpiUriuIKQ6fm6ZXePep7F8EC530NeZQ10aZN4
	 HnWWAGUMtpiym1jC1aIk96YjtJ2CtMKoL/gV7Vws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F912F805B2; Tue, 10 Sep 2024 15:50:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBABF805B1;
	Tue, 10 Sep 2024 15:50:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7763F801F5; Tue, 10 Sep 2024 15:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39781F80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 15:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39781F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lKqFcj0N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725976194; x=1757512194;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=sB67UM2Zr/q7FoL8u4RtQFupw/SD6hgP282y93A+VVc=;
  b=lKqFcj0Nfl2R8Ef3X4LEnc6cklkSfqgR6wWbE/SIPhkG0em8Sp4FajIu
   I5Zlz6UOHqItDWu34uV5a63kXHVGRmpSqbZzBMFmZkeWHUNBPoheT9NQO
   8/1qX4oQlRToCRyuWY83GlsHhO5JygYMAlXSkwBs2jAXiTwBQ/jOfGKhM
   fJMRNoFfFXzAp07Vaoyn/Z0nc3EArMktcOF2X0b+aEvek9mXR4ZnhXh2B
   G38wGauu9kwdoBtcr4KA1BYoTLFdkY5jK1mdjYhHpd5I+zGIKrdcMM2pl
   rm0np0pmnU6lfSzYII0wmbk/AvOdL1gzCpDp5dOTrqxiId5nobbvuRleH
   A==;
X-CSE-ConnectionGUID: ZbBWKvueROCS1uNxciTOAA==
X-CSE-MsgGUID: FTW/AFZ9QlaF38cpuCnkvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42240469"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="42240469"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:49:48 -0700
X-CSE-ConnectionGUID: re10FFAzQcigLzN/JNyLIQ==
X-CSE-MsgGUID: eGchYnd+QDWW4DIT/4hATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600";
   d="scan'208";a="66652238"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.155])
 ([10.245.245.155])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:49:46 -0700
Message-ID: <a7a4bb04-de90-4637-b9e4-81c3138347d3@linux.intel.com>
Date: Tue, 10 Sep 2024 16:49:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, stable@vger.kernel.org
References: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
 <568137f5-4e4f-4df7-8054-011977077098@linux.intel.com>
Content-Language: en-US
In-Reply-To: <568137f5-4e4f-4df7-8054-011977077098@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EIJPIJ5MDNTLD34ZU56O4HEEL5TNIVPK
X-Message-ID-Hash: EIJPIJ5MDNTLD34ZU56O4HEEL5TNIVPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIJPIJ5MDNTLD34ZU56O4HEEL5TNIVPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/09/2024 16:05, Péter Ujfalusi wrote:
> 
> 
> On 09/09/2024 19:47, Krzysztof Kozlowski wrote:
>> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
>> breaks codecs using non-continuous masks in source and sink ports.  The
>> commit missed the point that port numbers are not used as indices for
>> iterating over prop.sink_ports or prop.source_ports.
>>
>> Soundwire core and existing codecs expect that the array passed as
>> prop.sink_ports and prop.source_ports is continuous.  The port mask still
>> might be non-continuous, but that's unrelated.
>>
>> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
>> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
>> Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Tested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Vinod: can you pick this patch for 6.11 if there is still time since
upstream is also broken since 6.11-rc6


> 
>>
>> ---
>>
>> Resending with Ack/Rb tags and missing Cc-stable.
>> ---
>>  drivers/soundwire/stream.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index f275143d7b18..7aa4900dcf31 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
>>  					    unsigned int port_num)
>>  {
>>  	struct sdw_dpn_prop *dpn_prop;
>> -	unsigned long mask;
>> +	u8 num_ports;
>>  	int i;
>>  
>>  	if (direction == SDW_DATA_DIR_TX) {
>> -		mask = slave->prop.source_ports;
>> +		num_ports = hweight32(slave->prop.source_ports);
>>  		dpn_prop = slave->prop.src_dpn_prop;
>>  	} else {
>> -		mask = slave->prop.sink_ports;
>> +		num_ports = hweight32(slave->prop.sink_ports);
>>  		dpn_prop = slave->prop.sink_dpn_prop;
>>  	}
>>  
>> -	for_each_set_bit(i, &mask, 32) {
>> +	for (i = 0; i < num_ports; i++) {
>>  		if (dpn_prop[i].num == port_num)
>>  			return &dpn_prop[i];
>>  	}
> 

-- 
Péter
