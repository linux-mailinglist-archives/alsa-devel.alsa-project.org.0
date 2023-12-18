Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D15816B7F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 11:47:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E4CE10;
	Mon, 18 Dec 2023 11:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E4CE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702896475;
	bh=mcPSUOAGjfY08Qx2cmJ9a57p94qEa9iM9JCFVofj1Ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QQwH8aJf5aQrsJcKbwW+leCGPMbX0m0hOj4alxs0CdGaSqGjoelzqHfHrvnUnJ1Km
	 ddaPgM2+XSrovIywFiCRzwzHerpcpVW4KAqjBa/Wv5x3Tc66iX/P6OSNJogZ19+X6E
	 SpCVxj2Z39edtOHyzExG1XVy75+dg5nCG/QJqy/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAEBBF80600; Mon, 18 Dec 2023 11:46:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E7C5F80609;
	Mon, 18 Dec 2023 11:46:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0545EF805C0; Mon, 18 Dec 2023 11:46:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18CB2F80587
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 11:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18CB2F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Dk7nNbTZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702896405; x=1734432405;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mcPSUOAGjfY08Qx2cmJ9a57p94qEa9iM9JCFVofj1Ck=;
  b=Dk7nNbTZ6bUdxrGlvZ2IG0R5LEJXdYy024TACbMKB656DyfRvp/Zxmpv
   MKrtmraVD6SQ1UtkV5mrlLIcw+yJZFdHIpFc5SSlKAhUwjBeO7wFG86rL
   +wanUuQd+ps9pMoVgcsIHNzY/cf55HhVwaBl6C+G0Rdtmr8nL2lVQ69kr
   l0MNv9TCmQfZHM6FfsKa/XWGIUzCZ+G7C6mPGpSslJTxRNmL8KEYRRO69
   aS+g5GemJCZTeo0TuDLwejjQtl5XVjHjcwn9ybZTt4uxs6Rr1b+TAPGOa
   58t5tqT1q+S5RUTFCpMvHXssH2OC5/fuxP9WQpMWLeIDpr4E9J+TTbxhM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8851379"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="8851379"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 02:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="779048192"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="779048192"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197])
 ([10.249.34.197])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 02:46:37 -0800
Message-ID: <d4e93e28-2b7b-48e8-a7bc-698916446b60@linux.intel.com>
Date: Mon, 18 Dec 2023 11:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/16] soundwire: stream: reuse existing code for BPT
 stream
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-7-pierre-louis.bossart@linux.intel.com>
 <20231212123045.GY14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231212123045.GY14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CUSWGWQCHHXN2AM46EYIB2Z75JA2CSYM
X-Message-ID-Hash: CUSWGWQCHHXN2AM46EYIB2Z75JA2CSYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUSWGWQCHHXN2AM46EYIB2Z75JA2CSYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/12/23 06:30, Charles Keepax wrote:
> On Thu, Dec 07, 2023 at 04:29:34PM -0600, Pierre-Louis Bossart wrote:
>> DP0 (Data Port 0) is very similar to regular data ports, with minor
>> tweaks we can reuse the same code.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>> -	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
>> -					  s_rt->direction,
>> -					  t_params->port_num);
>> -	if (!dpn_prop)
>> -		return -EINVAL;
>> +	if (t_params->port_num) {
>> +		struct sdw_dpn_prop *dpn_prop;
>> +
>> +		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
>> +						  s_rt->direction,
>> +						  t_params->port_num);
>> +		if (!dpn_prop)
>> +			return -EINVAL;
>> +
>> +		read_only_wordlength = dpn_prop->read_only_wordlength;
>> +		port_type = dpn_prop->type;
>> +	} else {
>> +		read_only_wordlength = false;
>> +		port_type = SDW_DPN_FULL;
>> +	}
> 
> Would it be nicer to just add a special case sdw_get_slave_dpn_prop
> to return dp0_prop and avoid all this special casing in the rest
> of the code?

There are multiple cases in the same function where we need to check for
DP0. We could move the read_only_wordlength and port_type to the
sdw_get_slave_dpn_prop() helper, but then we would spread the special
cases in multiple locations. It's not pretty either way.


