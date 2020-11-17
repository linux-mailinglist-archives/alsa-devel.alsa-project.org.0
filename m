Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA472B71D9
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 23:55:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B5317C6;
	Tue, 17 Nov 2020 23:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B5317C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605653719;
	bh=OPkHCSEBLYCZW+XlpHzEZsWpFoTFK/4I0I5BptM8jBk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JVh2aXhJ1gAX6oFA0jcdMUL1Nsi12+JgVCq5wr3i4iZEV5H+XOOy6K/JKBpe2Ck5V
	 BvVrnINRsmdZIQHSO53ldVgLnATPkgvIq5mv3ceuju66yQyMl+q7f6+3RIvfPkDesF
	 8DR+jirLQuxqWtNuQwlRlLOLGA2zFeZm8hMzYFlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8593F800E2;
	Tue, 17 Nov 2020 23:53:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 274C6F800E2; Tue, 17 Nov 2020 23:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_65,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C298FF800E2
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 23:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C298FF800E2
IronPort-SDR: 3oFLDuSRbhA4dSZnLpPatBLUCEOaJKmvAURoncHryWlVsSamLT6+727KmVdt0yXyxzvkxC4sj+
 a9aRCTtYnEdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="189092282"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="189092282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 14:53:31 -0800
IronPort-SDR: l9Vu1sp4D0ihQL/ZSivllqXt3zBmAxMI2c/EfazWYSPuv3a2MfvNd2sn6WV4jQIXnNOHA3mLQF
 uJEjgzOUzUBw==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="533993210"
Received: from timmcdon-mobl1.amr.corp.intel.com (HELO [10.209.69.233])
 ([10.209.69.233])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 14:53:30 -0800
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.de>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
 <20201113164946.GD4828@sirena.org.uk>
 <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
 <d462c890495e4dda8698b5ba5eb50066@intel.com>
 <f62abcd8-b67f-774b-61b5-e08cfc3d2cc7@linux.intel.com>
 <s5h1rgst6z4.wl-tiwai@suse.de> <0286c6975f24432082f609d45adaa14c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
Date: Tue, 17 Nov 2020 16:53:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0286c6975f24432082f609d45adaa14c@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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



On 11/17/20 4:13 PM, Rojewski, Cezary wrote:
> On 2020-11-17 3:04 PM, Takashi Iwai wrote:
>> On Mon, 16 Nov 2020 18:47:22 +0100,
>> Pierre-Louis Bossart wrote:
>>>
>>>> Explicit 'ifs' asking whether we're dealing with SOF or other solution
>>>> is at best a code smell. I believe this is unnecessary complexity added
>>>> to the code especially once you realize user needs to play with module
>>>> parameters to switch between solutions. If we assume user is able to
>>>> play with module parameters then why not simply make use of blacklist
>>>> mechanism?
>>>
>>> Been there, done that. We don't want to use either denylist of kernel
>>> parameters.
>>>
>>> denylists create confusion for users, it's an endless stream of false
>>> errors and time lost in bug reports.
>>>
>>> The use of the kernel parameter is ONLY for expert users who want to
>>> tinker with the system or debug issues, the average user should not
>>> have to play with either denylists or kernel parameters.
>>
>> I guess Cezary mean the modprobe blacklist?  This was used in the
>> early stage of ASoC Skylake driver development, but in the end, it's
>> more cumbersome because user needs to change multiple places.  The
>> single module parameter was easier to handle.
>>
> 
> Thanks for joining the discussion, Takashi.
> 
> If the switch of solution for atom-based products is imminent, why add
> code which becomes redundant soon after?

To be clear: there is *no plan* to *remove* the Atom/sst code any time 
'soon', only to *deprecate* it.

In the best case distributions would transition in 2021. Some distros 
are faster than others, neither you nor I have any control over this.

Removing code from the kernel is not something we can do unless there is 
demonstrated evidence that the number of impacted users is close to zero 
and distributions no longer support that code. The case of Baytrail 
legacy is telling, you removed it earlier this Fall but after a 
recommended alternative was provided for more than 3 years.

Again, there is no planned 'switch' but a gradual transition, and that 
patchset helps with the transition.

