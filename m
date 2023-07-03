Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF88745C2D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 14:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82412210;
	Mon,  3 Jul 2023 14:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82412210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688387174;
	bh=knEiekDoDMRBXHzPAQUGIkkhywQJrFd99liMFkBUie4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dI0IuD92XzRRWYnhoa0UFSZqj4lHMvjBJu4lMmE/R7w1wwvzY2JfEFqNHHiU9hWnX
	 iM4QunDCTF5FMMSVgdVqpkj59JUgJ1uXTRB9wLynIpfwzw0kCwIezEetZ1ZjLcwVHw
	 bgCEgFagEdxl5IdCy+CyZEKyyCjsBkKkVlOdm2TU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2398F80124; Mon,  3 Jul 2023 14:25:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80D2FF80124;
	Mon,  3 Jul 2023 14:25:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ECD2F80125; Mon,  3 Jul 2023 14:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 622C8F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 14:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 622C8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kFQkX9jl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688387118; x=1719923118;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=knEiekDoDMRBXHzPAQUGIkkhywQJrFd99liMFkBUie4=;
  b=kFQkX9jlQqoP8UW1dzK2fS1lHL5wzxvxVKbjqt795ONgiwMLwJz16h1v
   MSboBrn5eLmAAnNST6wnRx5HHnE0sqGZjrAWeNXJOM3X/1anBctbLEo3O
   bwpoAiz/OeTMiavP1jk+fWGfZc5ESTC2KTMkpkFhQoxcc3AigFHhN8jAm
   dvlc6oqR/XRx0/+Et/m4Ck0noXVIcyX+tBQ1wOqHAAZdPORCHWbAeUgK9
   SqkEcGuRGRNcaqNMOeKG0Ms/CRGubN2HwjQN3hOLh0XEM6YEQ287KKFte
   P6gswhDtm3WglKjaiGtH7lGghwBoU/sxf0ZaX7iK9Id1qLc47FljJ9mc0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="360346917"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="360346917"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 05:25:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="892537605"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="892537605"
Received: from agherasi-mobl.ger.corp.intel.com (HELO [10.251.218.180])
 ([10.251.218.180])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 05:25:10 -0700
Message-ID: <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
Date: Mon, 3 Jul 2023 14:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Content-Language: en-US
To: =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WJWOLMI2LCI5FYVY6V3SICDRWUUKW6K4
X-Message-ID-Hash: WJWOLMI2LCI5FYVY6V3SICDRWUUKW6K4
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJWOLMI2LCI5FYVY6V3SICDRWUUKW6K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/3/23 13:11, Shuming [范書銘] wrote:
>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>
>> I can see that the interrupts are disabled in rt5682_dev_system_suspend(),
>> which is NOT a mode where the clock stop is used... I don't think this commit
>> message is correct.
>>
>> The IMPL_DEF interrupt which is used for jack detection is not disabled at all
>> during any clock stop mode, and it shouldn't otherwise that would break the
>> jack detection.
> 
> You are right. The commit message is wrong and not clear.
> The situation is that the manager driver uses the clock stop mode0 to do system suspension.

No it does not. The clock stop is ONLY used for pm_runtime, never for
system suspend. We cannot go to system suspend with the link in
clock-stop mode, that will create lots of issues, that's why we perform
a full pm_runtime resume in the .prepare stage.

> The SdW device will not be re-attached when the system resume.

it will re-attach, and in addition it will lose context because the
manager performs a complete reset of the bus.

So what's needed is to enable the interrupt, no matter what happened in
the suspend transition.

