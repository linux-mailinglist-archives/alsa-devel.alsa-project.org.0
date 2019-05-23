Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21B727BE9
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 13:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC891688;
	Thu, 23 May 2019 13:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC891688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558611419;
	bh=5hZBLdthuusYioflivZbbHLI7/D99Jf3/C11PaTB4Lk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQrNubzKn7uqMAJg6Zz/N1v0RIQqkdEUzcVx+9kXQgCSLCbfyAQc/oDRqQTWN2gYk
	 R5RUcgrosN5sKW9TgUk0L5pucutGA0qzSOacaJs3dC3x4aVgG3a5VAgxNsRWp3oZdo
	 cnEfhdCLO5XuENRKFGKHagA37iqgzXyXHSMdkFN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3400F89709;
	Thu, 23 May 2019 13:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29640F89674; Thu, 23 May 2019 13:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A840EF89625
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 13:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A840EF89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 04:35:06 -0700
X-ExtLoop1: 1
Received: from tthravex-mobl.amr.corp.intel.com (HELO [10.254.190.8])
 ([10.254.190.8])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2019 04:35:05 -0700
To: "Yang, Libin" <libin.yang@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-13-pierre-louis.bossart@linux.intel.com>
 <96A12704CE18D347B625EE2D4A099D195284169B@SHSMSX103.ccr.corp.intel.com>
 <s5hr28pfux1.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D19528416F0@SHSMSX103.ccr.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <31702c41-aef4-712a-d11b-ee44e446a6cb@linux.intel.com>
Date: Thu, 23 May 2019 06:35:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <96A12704CE18D347B625EE2D4A099D19528416F0@SHSMSX103.ccr.corp.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec: fix
 memory allocation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/23/19 3:24 AM, Yang, Libin wrote:
> Hi Takashi,
> 
> 
>>> -----Original Message-----
>>> From: Takashi Iwai [mailto:tiwai@suse.de]
>>> Sent: Thursday, May 23, 2019 4:16 PM
>>> To: Yang, Libin <libin.yang@intel.com>
>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>; alsa-
>>> devel@alsa-project.org; broonie@kernel.org
>>> Subject: Re: [alsa-devel] [PATCH v2 12/12] ASoC: SOF: Intel: hda-codec:
>>> fix memory allocation
>>>
>>> On Thu, 23 May 2019 10:03:03 +0200,
>>> Yang, Libin wrote:
>>>>
>>>> Please let me describe the issue here.
>>>>
>>>> The test case is:
>>>> 1) Unload module with script "sudo ./sof_remove.sh" ,
>>>> 2) reload module with script "sudo ./sof_insert.sh"
>>>>
>>>> After several rounds of removing and inserting kernel modules, system
>>>> will complain like below:
>>>> "BUG: unable to handle kernel paging request at 000000292a282031"
>>>
>>> Did you try some kernel debug options?  It might show what went wrong.
>>
>> No, I haven't. I'm not sure which options I can use for this case. Could you
>> please give me some suggestions?
> 
> BTW: I have enabled DEBUG_DEVRES. Are there any other options I can try?

There are already a set of kconfig fragments for debug, see 
https://github.com/thesofproject/kconfig and select memory-debug-defconfig.

I guess I will need to require this test in the SOF CI, I really don't 
get how this issue was not seen earlier. Gah.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
