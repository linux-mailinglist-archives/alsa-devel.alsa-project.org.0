Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D012F2B8580
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 21:27:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 787EA170D;
	Wed, 18 Nov 2020 21:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 787EA170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605731247;
	bh=89HJvYlqRKUiIthTxD53iVkEAkYEDE6FKvl+JEbZdJg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b57jRSLlNzPUTSpmfASavDArMdSdxkTdoC6lorFoYwWWOI6Axku2g/PjUwRP/o8/q
	 XU7WBvySkpFnV1TyveGTY1030hf1vKXw0KcfVFWGk1RZ5cYOWhH2Q5FBeVi7dEan4u
	 jB77eaW1yNwBfiveO2Q1+MSHaeOhTzXkR5bxf6JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 958C6F8010A;
	Wed, 18 Nov 2020 21:25:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E59B7F8016C; Wed, 18 Nov 2020 21:25:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_65,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75DD4F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 21:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75DD4F8010A
IronPort-SDR: gOWNjwhRKxwRtpF94afWwXUOBdFlgToMgaSTdqjbdtb9AFLeKnllIqMWGdxh3jVhRF3TXu2jCJ
 jy56cZ2NeKAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="170399314"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="170399314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 12:25:41 -0800
IronPort-SDR: nN+GntVSPZKDDuUozuO4HqA+RAe34zGu0qTMTiig5miumtGlOBeclFqv4Co9Jk3Z+3vRBeedqa
 cD9rz2a7JY9A==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="534473410"
Received: from sowmyave-mobl.amr.corp.intel.com (HELO [10.212.131.189])
 ([10.212.131.189])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 12:25:40 -0800
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
 <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
Date: Wed, 18 Nov 2020 14:25:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
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



>>>> I guess Cezary mean the modprobe blacklist?  This was used in the
>>>> early stage of ASoC Skylake driver development, but in the end, it's
>>>> more cumbersome because user needs to change multiple places.  The
>>>> single module parameter was easier to handle.
>>>>
>>>
>>> Thanks for joining the discussion, Takashi.
>>>
>>> If the switch of solution for atom-based products is imminent, why add
>>> code which becomes redundant soon after?
>>
>> To be clear: there is *no plan* to *remove* the Atom/sst code any time
>> 'soon', only to *deprecate* it.
>>
>> In the best case distributions would transition in 2021. Some distros
>> are faster than others, neither you nor I have any control over this.
>>
>> Removing code from the kernel is not something we can do unless there is
>> demonstrated evidence that the number of impacted users is close to zero
>> and distributions no longer support that code. The case of Baytrail
>> legacy is telling, you removed it earlier this Fall but after a
>> recommended alternative was provided for more than 3 years.
>>
>> Again, there is no planned 'switch' but a gradual transition, and that
>> patchset helps with the transition.
> 
> Hmm, then maybe I misunderstood Hans. Given his feedback it seemed like
> Fedora is about to switch to SOF right now.
> 
> Indeed, before I've sent patches removing Baytrail, basically every
> support-team had been asked about its usage and the answers were
> negative. /atom/ was covering basically every case anyway like you
> pointed out so /baytrail/ solution felt more like a duplication.
> 
> As SOF is the desired solution for atom-based products, I can see the
> need for some sort of selection mechanism. The same cannot be said for
> hsw/bdw though. Let's leave catpt out this, shall we?

It helps everyone to have a single build, e.g. 'make allmodconfig' or 
'make allyesconfig' would select all possible drivers and bots can run wild.

