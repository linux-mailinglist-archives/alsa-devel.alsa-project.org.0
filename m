Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB82490640F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 08:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D3DBE64;
	Thu, 13 Jun 2024 08:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D3DBE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718260216;
	bh=mEaeeil3cCE8Lyqx9jY6Tj4nxbwiA0TLyAoqgrnn/SE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=maFexOjFPP2reVkyVSFeYE1W/0g9sxoMECLnj8jLft24JkfIOEOHOJnG9VXeB1h1+
	 rNROTyxxtoCJNGHlW3uGD/PH7NDEFyvpsBKqUP27dbNt1nTqfJFDBdKSKKBeTvR+JW
	 2wYu48h0vVE24XSxLajAcL22mu5rTxDfDMq5Kv2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37139F805B3; Thu, 13 Jun 2024 08:29:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD72F805B3;
	Thu, 13 Jun 2024 08:29:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3338DF8057A; Thu, 13 Jun 2024 08:29:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EFD81F80448
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 08:29:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD81F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KVkj3ll+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260176; x=1749796176;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=mEaeeil3cCE8Lyqx9jY6Tj4nxbwiA0TLyAoqgrnn/SE=;
  b=KVkj3ll+3C1+OMDNtX00nnn6BJlMGjpZdBXRv4eber7bfzxihSDJ4oIU
   P4xH1bzbyaiUxgfsuQQMabVgdUMZ7Oc5VGrtDYYBOlCwKoBMwZOHTgghh
   OBoGCNoZ1S9P0Se9eZD8Y5/swL7OV6YGRkFBjgPjpSH0aBk8Sh9VD4dFM
   mOiTrkNUdr8Pg6Bso1ceBN8YZ9lDBJwEa463cT08jg8MCfEpr+xWNH9Cc
   O/KWMOSti16N1knPsaq2TsJtjsiafuPtB9ZixXYXOKifKpwA90bKnJxpU
   pZlH4QxwRo7F4fcYQZaEZnVZGVYRDLjKqrUVFrfykBoKfBNWtBtPXIvhZ
   Q==;
X-CSE-ConnectionGUID: ryrtSqZMQSy2mP/ShpiRjQ==
X-CSE-MsgGUID: YPdphS2cTPWBbwGLdKpPdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18914606"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="18914606"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:29:32 -0700
X-CSE-ConnectionGUID: 8XNtO4wdSq+lFDth2sIfkg==
X-CSE-MsgGUID: mk/pL3n6Q36i22nlukWr4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="44420900"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:29:30 -0700
Message-ID: <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
Date: Thu, 13 Jun 2024 09:29:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: topology: Fix references to freed memory
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
 <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <5bdae438-a976-44c0-b6d3-1aab5167a68e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XFYL5XYBACA7DXMWULDOFHJUN6SDEUSE
X-Message-ID-Hash: XFYL5XYBACA7DXMWULDOFHJUN6SDEUSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFYL5XYBACA7DXMWULDOFHJUN6SDEUSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 13/06/2024 09:27, Péter Ujfalusi wrote:
> 
> 
> On 13/06/2024 08:58, Pierre-Louis Bossart wrote:
>>
>>
>> On 6/3/24 12:28, Amadeusz Sławiński wrote:
>>> Most users after parsing a topology file, release memory used by it, so
>>> having pointer references directly into topology file contents is wrong.
>>> Use devm_kmemdup(), to allocate memory as needed.
>>>
>>> Reported-by: Jason Montleon <jmontleo@redhat.com>
>>> Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
>>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>> ---
>>
>> This patch breaks the Intel SOF CI in spectacular ways, with the widgets
>> names completely garbled with noise such as
>>
>> host-copier.5.playbackpid.socket
>> host-copier.5.playbackrt@linux.intel.com>
>> dai-copier.HDA.iDisp3.playbackrun_t:s0
>> host-copier.31.playback\xff`\x86\xba\x034\x89\xff\xff@N\x83\xb83\x89\xff\xff\x10\x84\xe9\x8b\xff\xff\xff\xffS\x81ی\xff\xff\xff\xff\x0f
>>
>> https://github.com/thesofproject/linux/pull/5057#issuecomment-2164470192
>>
>> I am going to revert this patchset in the SOF tree.
>>
>>>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>>> index 90ca37e008b32..75d9395a18ed4 100644
>>> --- a/sound/soc/soc-topology.c
>>> +++ b/sound/soc/soc-topology.c
>>> @@ -1060,15 +1060,32 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>>  			break;
>>>  		}
>>>  
>>> -		route->source = elem->source;
>>> -		route->sink = elem->sink;
>>> +		route->source = devm_kmemdup(tplg->dev, elem->source,
>>> +					     min(strlen(elem->source),
>>> +						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>> +					     GFP_KERNEL);
>>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
> 
> Initially I did not see why this breaks, but then:
> 
> The strlen() function calculates the length of the string pointed to by
> s, excluding the terminating null byte ('\0').
> 
> Likely the fix is as simple as:
> min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)

or better yet:
route->sink = devm_kasprintf(tplg->dev, GFP_KERNEL, "%s", elem->sink);

> 
>>> +					   GFP_KERNEL);
>>> +		if (!route->source || !route->sink) {
>>> +			ret = -ENOMEM;
>>> +			break;
>>> +		}
>>>  
>>>  		/* set to NULL atm for tplg users */
>>>  		route->connected = NULL;
>>> -		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0)
>>> +		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) == 0) {
>>>  			route->control = NULL;
>>> -		else
>>> -			route->control = elem->control;
>>> +		} else {
>>> +			route->control = devm_kmemdup(tplg->dev, elem->control,
>>> +						      min(strlen(elem->control),
>>> +							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>> +						      GFP_KERNEL);
>>> +			if (!route->control) {
>>> +				ret = -ENOMEM;
>>> +				break;
>>> +			}
>>> +		}
>>>  
>>>  		/* add route dobj to dobj_list */
>>>  		route->dobj.type = SND_SOC_DOBJ_GRAPH;
>>
>> 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1 is the first bad commit
>> commit 97ab304ecd95c0b1703ff8c8c3956dc6e2afe8e1
>> Author: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Date:   Mon Jun 3 12:28:15 2024 +0200
>>
>>     ASoC: topology: Fix references to freed memory
>>
>>     Most users after parsing a topology file, release memory used by it, so
>>     having pointer references directly into topology file contents is wrong.
>>     Use devm_kmemdup(), to allocate memory as needed.
>>
>>     Reported-by: Jason Montleon <jmontleo@redhat.com>
>>     Link:
>> https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
>>     Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>     Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>     Link:
>> https://lore.kernel.org/r/20240603102818.36165-2-amadeuszx.slawinski@linux.intel.com
>>     Signed-off-by: Mark Brown <broonie@kernel.org>
>>
>>  sound/soc/soc-topology.c | 27 ++++++++++++++++++++++-----
>>  1 file changed, 22 insertions(+), 5 deletions(-)
>>
>>
> 

-- 
Péter
