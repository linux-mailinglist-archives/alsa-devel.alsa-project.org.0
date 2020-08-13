Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A85243EB2
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 20:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0DCC166D;
	Thu, 13 Aug 2020 20:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0DCC166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597342395;
	bh=8wXfnPCSKLYnko8h5/nwUksq2pfuP43aoka6mw0rAKU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCsxxZ+e+S5EQHNLWwoELu7NnB1fz0pS0zMBxxrd98UKek+NRv28HTosgtxl0d5Ys
	 d5LJziMoCsgKfETeyOb6+zBD9kbYvGFtrqbsoHNdNbMfX7k/SZhwqskN3zAiMGUPfs
	 pKFyptY+lIgQuRA9A5y1xUKPcdSU8TbMjjOcxpIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2B5F800D3;
	Thu, 13 Aug 2020 20:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A4DF8015B; Thu, 13 Aug 2020 20:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD066F800D3
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 20:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD066F800D3
IronPort-SDR: G/juiyWEtOT1x0nAm9Nqu1zSL6KXMyuxEA2NkXTk+dCFE2KGQvT7iaRVvkp3Y4iD1nzp89iSXD
 xQXYarALoE9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="239129496"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="239129496"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 11:11:25 -0700
IronPort-SDR: noM8lILL/AXcjeBwYYvutTscMz1Q0MSIJkHtjGKdiDlbR2Okf+9Sg5lvWsBnQAsOh59SjvQhUS
 haSfgegyZ03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="318615710"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.3.111])
 ([10.213.3.111])
 by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2020 11:11:19 -0700
Subject: Re: [PATCH v4 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <7f6f652f36d8654560f038326f841624ffeb649a.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <7eb3dd69-d45e-2915-c18f-de286b5d630e@intel.com>
Date: Thu, 13 Aug 2020 20:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7f6f652f36d8654560f038326f841624ffeb649a.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2020-08-13 6:00 PM, Liam Girdwood wrote:
> On Wed, 2020-08-12 at 22:57 +0200, Cezary Rojewski wrote:
>> Implement support for Lynxpoint and Wildcat Point AudioDSP. Catpt
>>
>> solution deprecates existing sound/soc/intel/haswell which is removed
>> in
>>
>> the following series. This cover-letter is followed by 'Developer's
>> deep
>>
>> dive' message schedding light on catpt's key concepts and areas
>>
>> addressed.
> 
> Whilst I applaud removing the old driver I do NOT support adding yet
> *another* Intel audio DSP driver. Our goal is to remove DSP drivers and
> unify under one codebase (and this was discussed in Lyon last year at
> the audio Miniconf).
> 
> Please take all these good improvements and add them into the SOF
> driver.
> 
> Please also remember that we are adding an IPC abstraction layer into
> the SOF driver so it can cope with multiple IPC versions. You are most
> welcome to help in this effort.
> 
Presented catpt is created as a solution to existing problems reported 
by clients and users for WPT platforms. It is not "yet another" DSP 
driver but an update to an existing one - due to high range of problems 
found when testing it, catpt came as a lower-cost solution and /haswell/ 
is being removed soon after. So, the status quo is maintained - single 
driver for LPT/WPT architecture.

Please don't use 'our goal' term, it's misplaced: it was agreed on 
several occasions that older DSP platforms remain with closed firmware 
and are to be supported with existing DSP drivers.
SOF FW does not support BDW and instead is tasked with support of newer 
platforms. Neither SOF FW team nor Chrome support team agreed with WPT 
being moved out of closed firmware. Please, speak with management first 
before writing statements saying otherwise.

I don't see your input for any of the patches. Internal heads-up has 
been given. No review for either internal or upstream patchsets. 
Afterall, you were the author of original /haswell/ and your input could 
have proved important in speeding the progress and yielding even better 
results to our clients.

As you've given no technical points for denying LPT/WPT improvements and 
your statement disagrees with management's decision, message shall be 
discarded and ignored for the rest of the upstream process. Further 
discussion will be taken off this list.

Mark, Takashi and others,
I'm sorry for this inconvenience, such actions do not represent One 
Intel and Truth & Transparency which Intel is committed to stand by.

Czarek
