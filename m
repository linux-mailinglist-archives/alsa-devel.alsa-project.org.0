Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FC0906405
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 08:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E5684D;
	Thu, 13 Jun 2024 08:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E5684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718260051;
	bh=AjP64vJsGmImeorLvQ6zIvwCbCJlnsDNMtFc/n4whYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ablcI1pbXjWqFmKCXJqInFCYBS7VjHR7pmKR0N8BWCIO740QEQP6anE4ltXzlygfK
	 hA3W53kTNdhJ6JdyquXB3vSMB6yUzV0bFBRjd7uYxQzD0csAajLyWlfGig/F3Q9hDy
	 Ge5QgcKdbFqOrgi/vQBBqaGrXmH/WiQt2//6RYHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EDFBF805AE; Thu, 13 Jun 2024 08:27:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 315C7F805B3;
	Thu, 13 Jun 2024 08:26:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF8B7F8057A; Thu, 13 Jun 2024 08:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A113F80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 08:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A113F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j/eoSNuE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260011; x=1749796011;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AjP64vJsGmImeorLvQ6zIvwCbCJlnsDNMtFc/n4whYo=;
  b=j/eoSNuEqNhQWQ1P6Rx/JMCUX6y4WQi1CKHgtq/TBxMAYxKSYxA2y55I
   bDPS6yOvta9lXaWPV/H4hRcx7RwHldxVzKtW08EB5e6RxgWWScXEP806Q
   EohXhJAm5umFOFd+br8uWRErfGhwUjD7kprDFDae3UtbOPubMeW/hFbB3
   CaS4yETmd4myBZj5tiQDmx5TEWo/+kDmkjmjzj02D3KCmAd/0rIDNaO9G
   frm3z6KJL9DsoPZ5TAuEs0+rJ8GmoNMU15NVyozVllKb41x80TfeVdIMQ
   pUIAV2mmWo8VqHZqIyfq0MSBikewRda3TnLF07hpsrR8/q7atBoWqQJtB
   Q==;
X-CSE-ConnectionGUID: 9uoeCowgSheIV/VPe17ONg==
X-CSE-MsgGUID: OEEwXehKSwWYZ8ai/EMZvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18914413"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="18914413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:26:48 -0700
X-CSE-ConnectionGUID: oKDd476mReyWh7Jw4j4KpA==
X-CSE-MsgGUID: u5nz3nE/RQKA+y39JW8TVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="44420473"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:26:45 -0700
Message-ID: <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
Date: Thu, 13 Jun 2024 09:27:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jason Montleon <jmontleo@redhat.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
 <20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com>
 <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <507e9f6a-7113-4781-8a6d-27e4b87dbe24@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4DTLPEYJ2V6LDRTXNCM3QFZ2UXKV2AHR
X-Message-ID-Hash: 4DTLPEYJ2V6LDRTXNCM3QFZ2UXKV2AHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DTLPEYJ2V6LDRTXNCM3QFZ2UXKV2AHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 13/06/2024 08:58, Pierre-Louis Bossart wrote:
> 
> 
> On 6/3/24 12:28, Amadeusz Sławiński wrote:
>> Most users after parsing a topology file, release memory used by it, so
>> having pointer references directly into topology file contents is wrong.
>> Use devm_kmemdup(), to allocate memory as needed.
>>
>> Reported-by: Jason Montleon <jmontleo@redhat.com>
>> Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
> 
> This patch breaks the Intel SOF CI in spectacular ways, with the widgets
> names completely garbled with noise such as
> 
> host-copier.5.playbackpid.socket
> host-copier.5.playbackrt@linux.intel.com>
> dai-copier.HDA.iDisp3.playbackrun_t:s0
> host-copier.31.playback\xff`\x86\xba\x034\x89\xff\xff@N\x83\xb83\x89\xff\xff\x10\x84\xe9\x8b\xff\xff\xff\xffS\x81ی\xff\xff\xff\xff\x0f
> 
> https://github.com/thesofproject/linux/pull/5057#issuecomment-2164470192
> 
> I am going to revert this patchset in the SOF tree.
> 
>>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index 90ca37e008b32..75d9395a18ed4 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -1060,15 +1060,32 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>  			break;
>>  		}
>>  
>> -		route->source = elem->source;
>> -		route->sink = elem->sink;
>> +		route->source = devm_kmemdup(tplg->dev, elem->source,
>> +					     min(strlen(elem->source),
>> +						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>> +					     GFP_KERNEL);
>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),

Initially I did not see why this breaks, but then:

The strlen() function calculates the length of the string pointed to by
s, excluding the terminating null byte ('\0').

Likely the fix is as simple as:
min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)

>> +					   GFP_KERNEL);
>> +		if (!route->source || !route->sink) {
>> +			ret = -ENOMEM;
>> +			break;
>> +		}
>>  
>>  		/* set to NULL atm for tplg users */
>>  		route->connected = NULL;
>> -		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
>> +		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
>>  			route->control = NULL;
>> -		else
>> -			route->control = elem->control;
>> +		} else {
>> +			route->control = devm_kmemdup(tplg->dev, elem->control,
>> +						      min(strlen(elem->control),
>> +							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>> +						      GFP_KERNEL);
>> +			if (!route->control) {
>> +				ret = -ENOMEM;
>> +				break;
>> +			}
>> +		}
>>  
>>  		/* add route dobj to dobj_list */
>>  		route->dobj.type = SND_SOC_DOBJ_GRAPH;
> 
> 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1 is the first bad commit
> commit 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
> Author: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Date:   Mon Jun 3 12:28:15 2024 +0200
> 
>     ASoC: topology: Fix references to freed memory
> 
>     Most users after parsing a topology file, release memory used by it, so
>     having pointer references directly into topology file contents is wrong.
>     Use devm_kmemdup(), to allocate memory as needed.
> 
>     Reported-by: Jason Montleon <jmontleo@redhat.com>
>     Link:
> https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
>     Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>     Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>     Link:
> https://lore.kernel.org/r/20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com
>     Signed-off-by: Mark Brown <broonie@kernel.org>
> 
>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> 

-- 
Péter
