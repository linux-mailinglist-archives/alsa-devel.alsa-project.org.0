Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517448170A5
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 14:40:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80480E11;
	Mon, 18 Dec 2023 14:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80480E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702906821;
	bh=vmsLSRBTT54/ZoE0Gd5mmHXnPv8UTZ2Uoyyx7a2t1VQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M47rr8W5q5IPDy2L2Xre7QOaJ7NC9u16S4Qyw8vsA2x0flJkc3NXDKp/Df9MU2viI
	 nG6rh1dt718OnaIXaK9NcsqOT7QBvP1ZQFRuk2CIpZBu6+cuEJi0VZUNR6CisW2UDe
	 cZOHPMsjgG6azYE/EaH34yJ2qeA2uYUya2j3k+b8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DFD2F805ED; Mon, 18 Dec 2023 14:39:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A6EF805C9;
	Mon, 18 Dec 2023 14:39:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3830F805AA; Mon, 18 Dec 2023 14:39:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43A3CF8055B
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 14:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A3CF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h51w+IL0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906757; x=1734442757;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vmsLSRBTT54/ZoE0Gd5mmHXnPv8UTZ2Uoyyx7a2t1VQ=;
  b=h51w+IL0jIB1T6H0eiiEshVyfkW1N+Orpgc4Hg0Gbb9zGuWbNebTo4Ex
   1ck0Md34JaQE0JsflmnIu1qSX9oCLcy893QjaqhvQCDKzqG3q2uL674I7
   YM1VMMOPXwNRd4UyChj0FUuwXS27YASAf+3cqpHNK0IQ5/X7AkZNhcgKc
   mtMQ07W1M73j/+3b3G5OAyXRkhqsuBJ0ri8GcSmoCmI2LtjI+JNxbC6ls
   OwzSbV6KXUYKnZDoYiWcnh6ppbBbhjheXz8mjy8x+VuAV176FyMX3dgfQ
   4tm2RGCN8mN/nlb2OyRkeLCFVZOIKh7WT+dKbi+LjxtArQoUtxdnacEAh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868683"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="8868683"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753602"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="1022753602"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197])
 ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:10 -0800
Message-ID: <87b3fc89-f967-4251-b709-0d439c6f1cf7@linux.intel.com>
Date: Mon, 18 Dec 2023 14:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/16] soundwire: bus: add bpt_stream pointer
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-9-pierre-louis.bossart@linux.intel.com>
 <ZYAzS3tggqQg8_PW@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYAzS3tggqQg8_PW@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: U2YWI5OCNFJEUZUKIUZXNXWQNXAUFZ4Y
X-Message-ID-Hash: U2YWI5OCNFJEUZUKIUZXNXWQNXAUFZ4Y
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2YWI5OCNFJEUZUKIUZXNXWQNXAUFZ4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/18/23 05:55, Vinod Koul wrote:
> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>> Add a convenience pointer to the 'sdw_bus' structure. BPT is a
>> dedicated stream which will typically not be handled by DAIs or
>> dailinks. Since there's only one BPT stream per link, storing the
>> pointer at the link level seems rather natural.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>  include/linux/soundwire/sdw.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
>> index e54c5bbd2b91..8db0cd7d0d89 100644
>> --- a/include/linux/soundwire/sdw.h
>> +++ b/include/linux/soundwire/sdw.h
>> @@ -965,6 +965,7 @@ struct sdw_master_ops {
>>   * @stream_refcount: number of streams currently using this bus
>>   * @btp_stream_refcount: number of BTP streams currently using this bus (should
>>   * be zero or one, multiple streams per link is not supported).
>> + * @bpt_stream: pointer stored for convenience.
>>   */
>>  struct sdw_bus {
>>  	struct device *dev;
>> @@ -996,6 +997,7 @@ struct sdw_bus {
>>  	int hw_sync_min_links;
>>  	int stream_refcount;
>>  	int bpt_stream_refcount;
>> +	struct sdw_stream_runtime *bpt_stream;
> 
> So we are limiting to single stream? Can we have multiple transfers
> queued up, which I guess might imply multiple streams?


Yes for now there is a BTP/BRA single stream active when there are no
audio transfers taking place. This is the only way to guarantee
predictable download/resume times.

There is no mechanism to queue up transfers, be it from the same
peripheral device or different ones. It would be up to the peripheral
driver to wait for the BTP stream to be available.

Adding a queuing mechanism is a bridge too far for now, most platforms
only have 1 or 2 devices only, and a peripheral driver may or may not be
ok with delayed downloads. For now the main ask is to reduce download
times, a single stream is already a good start. There are other
refinements we need to add as well, such as changing clocks to use the
fastest gear. I'd like to proceed with baby steps...
