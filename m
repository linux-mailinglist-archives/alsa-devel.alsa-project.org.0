Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4557C25221E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CDD16DF;
	Tue, 25 Aug 2020 22:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CDD16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598388339;
	bh=dr4J+3ztzYwNN3nftuI0Xw1YA5ryPYYKUL1XLkozwXg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlsuWvozl0Rs3kNqmvy4a6kzd6StIXnm7KNtAs2nEFtKRPDkkt8nX0LUorAIWpUG4
	 ECF+z3W8mpUdfhDOKPRdVbzv8jUtbDPloPH59rkK8UsfAWP40Rr3GKm5gPsKbqzD/Z
	 ng0aUF8VyZi18n9hKpDYopKsqJOHyE0D/AQKWuKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE2CCF800D1;
	Tue, 25 Aug 2020 22:43:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2273F8025A; Tue, 25 Aug 2020 22:43:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF87EF800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF87EF800EB
IronPort-SDR: c+RC8sRUPiqz2RueAJMUuFbYDpWrwqpklU03z3WC7ZAK/CCsuX1pzv2GEu+/1e18n5FAjHpaZn
 Dg+3NbwGDFfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157236385"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157236385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 13:43:47 -0700
IronPort-SDR: BVg4CSlGw04HDacBOMGSokcmGRs1rz19bK+WlHZg1bMxq/CoU/3DSbY7MXa01Y+3xLk9uohwPO
 URA06i9qp0cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="338924902"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.19.243])
 ([10.213.19.243])
 by orsmga007.jf.intel.com with ESMTP; 25 Aug 2020 13:43:43 -0700
Subject: Re: [PATCH v4 01/13] ASoC: Intel: Add catpt device
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200812205753.29115-1-cezary.rojewski@intel.com>
 <20200812205753.29115-2-cezary.rojewski@intel.com>
 <20200813182908.GA1891694@smile.fi.intel.com>
 <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
Message-ID: <fc5ef897-50e6-c9c2-e25e-5f6946e80ae1@intel.com>
Date: Tue, 25 Aug 2020 22:43:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3280b1a6-81f3-9f3f-d496-2bbf570c82d1@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

On 2020-08-17 12:02 PM, Cezary Rojewski wrote:
> On 2020-08-13 8:29 PM, Andy Shevchenko wrote:
>> On Wed, Aug 12, 2020 at 10:57:41PM +0200, Cezary Rojewski wrote:

...

>>> +#define CATPT_CS_DEFAULT    0x8480040E
>>> +#define CATPT_IMC_DEFAULT    0x7FFF0003
>>> +#define CATPT_IMD_DEFAULT    0x7FFF0003
>>> +#define CATPT_CLKCTL_DEFAULT    0x7FF
>>
>> These looks like set of bit fields, can we describe them either in 
>> comments
>> or in the values like GENMASK(x, y) | BIT(z) ?
>>
> 
> Let's go with the latter. As explained below, I don't have much info in 
> regard to re-setting registers to their defaults. This knowldge might 
> come in time (and a ton of testing) but certainly, won't be part of this 
> release.
> 
> One issue might arise when describing the "reserved" regions as some 
> bits should not be modified by sw normally, but are part of "recommended 
> sequence" anyway. I'll see if there are any among '1's.
> 

In regard to your comment related to defaults, I've provided WPT ADSP 
Cspec within previously shared location:

	\\10.237.149.136\AudioDspShare\crojewsk\acpi\bdw-y
Note: Chapter 50.7 describes the register map.

What I've said in the last paragraph proved true - many (in some cases 
most..) bits are of 'Reserved' type. Because of spaghetti generated when 
attempting to mask this, I'd stick with existing, explicit default 
values which are frankly more readable.
I've added single comment above each _DEFAULT block instead:
	/* defaults to reset SSP|SHIM registers to after each power cycle */

Thanks once again for your input during 'catpt' upstream process.
Please note I'll remove the Cspec from linked location as soon as I read 
your response to this e-mail (probably tomorrow morning).

Czarek
