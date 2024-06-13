Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CDB90644A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 08:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10ADF846;
	Thu, 13 Jun 2024 08:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10ADF846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718261082;
	bh=QII0FQ1S2p0/yi3wPnSF0V5lrlhJhtdgmNN5E84gNO8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vR5ylzy2KRW8tpKFdqBvFAaON4+7UyMYz7VVBea8YgrwFthrLdayW6a8h2duaLLOG
	 +hu0zsH22PPMUwcS74nuXwTECtJbIMv4FkBJcv8k+NGqs9FqeYyEq+SoubCtc5CpJZ
	 2N/acojn/CpfJ5k5ya8yXBtTtMHSS1LaQJyq/BUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 088CAF8057A; Thu, 13 Jun 2024 08:44:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E13F805B3;
	Thu, 13 Jun 2024 08:44:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34BBFF8057A; Thu, 13 Jun 2024 08:44:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 33575F80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 08:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33575F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RbBgt56Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718261043; x=1749797043;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=QII0FQ1S2p0/yi3wPnSF0V5lrlhJhtdgmNN5E84gNO8=;
  b=RbBgt56YKsi4W25uVCEQ2eEcAC8lhT1irWwGrV0LDCzbG57qLEDOEW/6
   FfEb8wuzbkl4Wj7+wV58g60sr/euEE7KpZbnE7sjVcJYTSZIv4ls1mu6D
   emvpJGiXLLcdEJ5yiFWFl67Z6L3/W03HBNIZxUnp4hGZiS3O+NwjYB+Vs
   WR+Z3Ishw+lhioozTPOLoWBgoyLv2g4x05Ec49fpNoAzY14MhmSpBi0kW
   lPxd5Ehx5rp+yxSu6AkqgGgW+NSAHDVBLhpo5oJzSCL60vXuYR6p0I+Eh
   cNtzhjUrymz3knWvRXIp3J3/TRUQyqWV5vf8mfHUAMlRmRiu42++H2Jzz
   w==;
X-CSE-ConnectionGUID: eTIV/iU5QbiIU3U6mWM5uw==
X-CSE-MsgGUID: dbH0LSu6QZ+jKkI2gvN3LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18916407"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="18916407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:43:59 -0700
X-CSE-ConnectionGUID: MeyNwwcNTqG9JYIeP2u0Ww==
X-CSE-MsgGUID: F2L/aATNRA2Al5HpJQq4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="44424948"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.34])
 ([10.245.244.34])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:43:57 -0700
Message-ID: <750f8ab4-f283-44e0-9b6c-57176bdbf59e@linux.intel.com>
Date: Thu, 13 Jun 2024 09:44:26 +0300
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
 <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
Content-Language: en-US
In-Reply-To: <38d7b3e2-33cb-4a81-bad8-73c22679f49f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NZT4TX2665FU2ZE4GFHTJQQBU6YD3SJ5
X-Message-ID-Hash: NZT4TX2665FU2ZE4GFHTJQQBU6YD3SJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZT4TX2665FU2ZE4GFHTJQQBU6YD3SJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 13/06/2024 09:29, Péter Ujfalusi wrote:
>>>> +		route->sink = devm_kmemdup(tplg->dev, elem->sink,
>>>> +					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
>>
>> Initially I did not see why this breaks, but then:
>>
>> The strlen() function calculates the length of the string pointed to by
>> s, excluding the terminating null byte ('\0').
>>
>> Likely the fix is as simple as:
>> min(strlen(elem->sink) + 1, SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
> 
> or better yet:
> route->sink = devm_kasprintf(tplg->dev, GFP_KERNEL, "%s", elem->sink);

or even better:
route->sink = devm_kstrdup(tplg->dev, elem->sink, GFP_KERNEL);

-- 
Péter
