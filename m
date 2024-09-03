Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45D9695B5
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 09:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1E4C86F;
	Tue,  3 Sep 2024 09:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1E4C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725348937;
	bh=4AJT32GBtfUx0n4zgp7GIkKvAN6ljEoZ5TCSEJ6nLVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RpgHJ8Kb0+y03me+q87/EQazHuig27yJPtuJmkjZVQK4NXtRo2SRYTp76BUNBcbxj
	 I889grjRhuDzmoEsz9ZT9tade9kyIgFH9sJbelBYtlvjiicdEW7HqSjpCh72VYO/Yx
	 PBl+ysYBJPb8SIjX3cXjaOhM+j41mPv18t2OxNYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF578F805AE; Tue,  3 Sep 2024 09:35:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB79F805B2;
	Tue,  3 Sep 2024 09:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFF09F800E9; Tue,  3 Sep 2024 09:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FD4CF80107
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 09:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD4CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kXpNPX8c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725348899; x=1756884899;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4AJT32GBtfUx0n4zgp7GIkKvAN6ljEoZ5TCSEJ6nLVE=;
  b=kXpNPX8cptcMBIQRWwU2Zfa6SY0xBvELgmJvDy82MNibdH3O2kW7jXTG
   m46NW7BukZkffnR6yG7O+oEtBwdUdukOq3TkXIjITP7owdwxGZiyewRWB
   rVzjtpAWV82KE0KmgnCprxvbSHVhvFiZw642WnRUyJe7k22aK2kRkuBlw
   u6++Q7J5A1intnaaAxR+pnCUmobJEhtwM48MupGXNzc4cwf30eRHKCjAP
   A4mULMekrRlUgWRc1KjYrBcyyrVtexQhs/0H5RCneqsAGkurjCVHF3VQY
   l7fnaLPNaUVFge1e70iO3RSf+roMclzSv8rGvPeFIWnpIjJxPJonzfmS7
   A==;
X-CSE-ConnectionGUID: mj3cbFk4R8+p92V1Oxa4SQ==
X-CSE-MsgGUID: SfVLXL+pRCSIW2yG6liZ9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23444569"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600";
   d="scan'208";a="23444569"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:34:54 -0700
X-CSE-ConnectionGUID: +XoVRmVvSsWR30tLGOqOMg==
X-CSE-MsgGUID: UBzXbGaXRDqEI5fW6GMADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600";
   d="scan'208";a="95623507"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.246.104.225])
 ([10.246.104.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 00:34:51 -0700
Message-ID: <b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com>
Date: Tue, 3 Sep 2024 15:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
To: Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, bard.liao@intel.com
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
 <ZqngD56bXkx6vGma@matsya>
Content-Language: en-US
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <ZqngD56bXkx6vGma@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BDR53AZ4MSUZ2VYH3Y2EBM4FPRJB5USC
X-Message-ID-Hash: BDR53AZ4MSUZ2VYH3Y2EBM4FPRJB5USC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDR53AZ4MSUZ2VYH3Y2EBM4FPRJB5USC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/31/2024 2:56 PM, Vinod Koul wrote:
> On 29-07-24, 16:25, Pierre-Louis Bossart wrote:
>>
>> On 7/29/24 16:01, Krzysztof Kozlowski wrote:
>>> Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
>>> 'sink_ports' - define which ports to program in
>>> sdw_program_slave_port_params().  The masks are used to get the
>>> appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
>>> an array.
>>>
>>> Bitmasks can be non-continuous or can start from index different than 0,
>>> thus when looking for matching port property for given port, we must
>>> iterate over mask bits, not from 0 up to number of ports.
>>>
>>> This fixes allocation and programming slave ports, when a source or sink
>>> masks start from further index.
>>>
>>> Fixes: f8101c74aa54 ("soundwire: Add Master and Slave port programming")
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> This is a valid change to optimize how the port are accessed.
>>
>> But the commit message is not completely clear, the allocation in
>> mipi_disco.c is not modified and I don't think there's anything that
>> would crash. If there are non-contiguous ports, we will still allocate
>> space that will not be initialized/used.
>>
>> 	/* Allocate memory for set bits in port lists */
>> 	nval = hweight32(prop->source_ports);
>> 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
>> 					  sizeof(*prop->src_dpn_prop),
>> 					  GFP_KERNEL);
>> 	if (!prop->src_dpn_prop)
>> 		return -ENOMEM;
>>
>> 	/* Read dpn properties for source port(s) */
>> 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
>> 			   prop->source_ports, "source");
>>
>> IOW, this is a valid change, but it's an optimization, not a fix in the
>> usual sense of 'kernel oops otherwise'.
>>
>> Am I missing something?
>>
>> BTW, the notion of DPn is that n > 0. DP0 is a special case with
>> different properties, BIT(0) cannot be set for either of the sink/source
>> port bitmask.
> The fix seems right to me, we cannot have assumption that ports are
> contagious, so we need to iterate over all valid ports and not to N
> ports which code does now!


Sorry to jump in after the commit was applied. But, it breaks my test.

The point is that dpn_prop[i].num where the i is the array index, and

num is the port number. So, `for (i = 0; i < num_ports; i++)` will iterate

over all valid ports.

We can see in below drivers/soundwire/mipi_disco.c

         nval = hweight32(prop->sink_ports);

         prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,

sizeof(*prop->sink_dpn_prop),

                                            GFP_KERNEL);

And sdw_slave_read_dpn() set data port properties one by one.

`for_each_set_bit(i, &mask, 32)` will break the system when port numbers

are not continuous. For example, a codec has source port number = 1 and 3,

then dpn_prop[0].num = 1 and dpn_prop[1].num = 3. And we need to go

throuth dpn_prop[0] and dpn_prop[1] instead of dpn_prop[1] and dpn_prop[3].


>
>>
>>> ---
>>>   drivers/soundwire/stream.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>>> index 7aa4900dcf31..f275143d7b18 100644
>>> --- a/drivers/soundwire/stream.c
>>> +++ b/drivers/soundwire/stream.c
>>> @@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
>>>   					    unsigned int port_num)
>>>   {
>>>   	struct sdw_dpn_prop *dpn_prop;
>>> -	u8 num_ports;
>>> +	unsigned long mask;
>>>   	int i;
>>>   
>>>   	if (direction == SDW_DATA_DIR_TX) {
>>> -		num_ports = hweight32(slave->prop.source_ports);
>>> +		mask = slave->prop.source_ports;
>>>   		dpn_prop = slave->prop.src_dpn_prop;
>>>   	} else {
>>> -		num_ports = hweight32(slave->prop.sink_ports);
>>> +		mask = slave->prop.sink_ports;
>>>   		dpn_prop = slave->prop.sink_dpn_prop;
>>>   	}
>>>   
>>> -	for (i = 0; i < num_ports; i++) {
>>> +	for_each_set_bit(i, &mask, 32) {
>>>   		if (dpn_prop[i].num == port_num)
>>>   			return &dpn_prop[i];
>>>   	}
