Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5759074E2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 16:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978DB851;
	Thu, 13 Jun 2024 16:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978DB851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718288092;
	bh=CInWd528BXasi1+5+au2tfhCmdaxQ8gKYmLl+MQTNa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g9arR/aWWLhfzr9w6tgZ+3RaTIxWQCQoquhFVshOUrTefcfIRz7lo1BcG6hrK+eDQ
	 Gp9w5Gp9izzDSsaVHadU7RtcQ1G3sMhSn6LKbqjfYHWiNWSVFtU6lCjhdNGFZOIaoK
	 4/PsBw50sCi0Tl/VrtrB3kBeVpDOd2R86AWeQ5vM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58977F80589; Thu, 13 Jun 2024 16:14:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 762D8F805B1;
	Thu, 13 Jun 2024 16:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E3DAF80448; Thu, 13 Jun 2024 16:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A224BF800FA
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 16:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A224BF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IgrBYvp9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718288048; x=1749824048;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CInWd528BXasi1+5+au2tfhCmdaxQ8gKYmLl+MQTNa4=;
  b=IgrBYvp9YFd/U+1zk08u+KoHlyHI+/+g48dP1R8XaeGHlnA2KmZLzCFO
   /0MjLTgDY/yCyhj1L9lpWhKjcAHgaIKmO99kepqjsJT2/bSa7RZjDLDRk
   Gpn/EeAHb8mlBrfjTLYXt/PFlA9L6JSV9hjmL4mtKZCYYOvkPEUmWwJBP
   naZAJNXa2+uJb25vB3oxreof+SB7bbVjM5r0pzukhX7CB+NsZOieQLzvz
   7Xevschl+U7EDfEWcGHqMsCJAZDArHqROQoG2TCL3Ay+5oa/4sTC99NLW
   XKMhxCZtNMbyMLVp9rpkHB5BKi+H/nwzlKNkj3gO0XEh1CcqMnvsiar3V
   Q==;
X-CSE-ConnectionGUID: /AvQT+0WQsuhZN7KODTssA==
X-CSE-MsgGUID: Yor2vkKQQXeW+h6+qOTRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="40520777"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000";
   d="scan'208";a="40520777"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 07:13:57 -0700
X-CSE-ConnectionGUID: 92SZQ1hBREqie1YlJOFJ5g==
X-CSE-MsgGUID: z7XC62rQQo2U4+p4lRhGpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000";
   d="scan'208";a="40859658"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 07:13:54 -0700
Message-ID: <27668c46-5a44-4e14-8219-5fba6a5c4610@linux.intel.com>
Date: Thu, 13 Jun 2024 16:13:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: topology: Fix route memory corruption
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com>
 <0fdbae0e-e540-4c35-a555-5b2607526115@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <0fdbae0e-e540-4c35-a555-5b2607526115@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LLRYQX36JOOM4CJ55BGMTAIYFNXPCC6I
X-Message-ID-Hash: LLRYQX36JOOM4CJ55BGMTAIYFNXPCC6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLRYQX36JOOM4CJ55BGMTAIYFNXPCC6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/13/24 13:11, Péter Ujfalusi wrote:
> 
> 
> On 13/06/2024 12:01, Amadeusz Sławiński wrote:
>> It was reported that recent fix for memory corruption during topology
>> load, causes corruption in other cases. Instead of being overeager with
>> checking topology, assume that it is properly formatted and just
>> duplicate strings.
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Test results look much better indeed with
https://github.com/thesofproject/linux/pull/5057


Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
>> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Closes: https://lore.kernel.org/linux-sound/171812236450.201359.3019210915105428447.b4-ty@kernel.org/T/#m8c4bd5abf453960fde6f826c4b7f84881da63e9d
>> Suggested-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>  sound/soc/soc-topology.c | 12 +++---------
>>  1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index 0225bc5fc425a..4b166294602fa 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -1052,21 +1052,15 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>  			break;
>>  		}
>>  
>> -		route->source = devm_kmemdup(tplg->dev, elem->source,
>> -					     min(strlen(elem->source), maxlen),
>> -					     GFP_KERNEL);
>> -		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>> -					   min(strlen(elem->sink), maxlen),
>> -					   GFP_KERNEL);
>> +		route->source = devm_kstrdup(tplg->dev, elem->source, GFP_KERNEL);
>> +		route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);
>>  		if (!route->source || !route->sink) {
>>  			ret = -ENOMEM;
>>  			break;
>>  		}
>>  
>>  		if (strnlen(elem->control, maxlen) != 0) {
>> -			route->control = devm_kmemdup(tplg->dev, elem->control,
>> -						      min(strlen(elem->control), maxlen),
>> -						      GFP_KERNEL);
>> +			route->control = devm_kstrdup(tplg->dev, elem->control, GFP_KERNEL);
>>  			if (!route->control) {
>>  				ret = -ENOMEM;
>>  				break;
> 
