Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCF272F01
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 18:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9B3416C1;
	Mon, 21 Sep 2020 18:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9B3416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600707264;
	bh=IQn+yqrHL+AEilk4mqAzjmr2JtB0Gltl+WwJqv/CkxA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlQGkTCRUz6Sb7jF2b5p8Qubv1kf2hr5wpnMAsdViQdJROvnKzJY7sAyLdKoiOX+u
	 pcvdcuMhe1wiYlZ4z2DMXn1l3JRXM6Htk5kJYHGyaFdYFP6S6E1Z5UWcCCItl2mky+
	 dKPcMkGTe4wcP1gBrBgHXZa9I4h7Cn7pza9hY2Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B09F8010A;
	Mon, 21 Sep 2020 18:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3699BF801EC; Mon, 21 Sep 2020 18:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA82FF800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 18:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA82FF800B2
IronPort-SDR: aCzhh8Zx2ciwfgoy5207TRw/LfkZibPvtjGGZ9lOqFYMnG8ws5qu3URqQBD2h/max0Fr8WR3w5
 hVP3VdPzkc+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="160495340"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="160495340"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 09:52:32 -0700
IronPort-SDR: Yj537wcWxqKa6hm3YVno1hHVE1yNyBpDtrielHNhBe3rOmSEhnMIBQ7OY2klZhLuyLNpt9/26H
 +wZjaOjCN1FA==
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="321831247"
Received: from apatwary-mobl.amr.corp.intel.com (HELO [10.212.120.65])
 ([10.212.120.65])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 09:52:31 -0700
Subject: Re: [PATCH v2 2/2] soundwire: sysfs: add slave status and device
 number before probe
To: Vinod Koul <vkoul@kernel.org>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
 <20200918121614.GS2968@vkoul-mobl>
 <c8729c1d-6d36-ad34-34c3-899ba0f5366d@linux.intel.com>
 <20200919111911.GW2968@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ef2e1e8-d7cc-a08f-4176-240750d640a5@linux.intel.com>
Date: Mon, 21 Sep 2020 09:34:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200919111911.GW2968@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 9/19/20 6:19 AM, Vinod Koul wrote:
> On 18-09-20, 09:21, Pierre-Louis Bossart wrote:
>>
>>
>>
>>>>     * Base file is device
>>>>     *	|---- modalias
>>>> + *	|---- dev-status
>>>> + *		|---- status
>>>> + *		|---- device_number
>>>
>>> Any reason why we want this under dev-status.
>>>
>>> Both the status and device_number belong to the device, so we can
>>> put them under device and use device properties
>>
>> We already use directories for device-level and port-level properties, I
>> just thought it be cleaner to continue this model. We might also expand the
>> information later on, e.g. provide interrupt status.
> 
> Right now we have directories for N ports (needs a dir due to nature of
> N ports) and 'properties' derived from Disco/firmware.
> So Nport and properties makes sense. But for generic device level stuff
> like device number, status and future interrupt or anything should be at
> device level.
> 
>> I don't mind if we remove the directory and move everything up one level,
>> but it wouldn't be consistent with the previous work.
> 
> Just because we had directory for a reason, adding a directory to
> conform to that does make it better. IMO device files should be at
> device directory

We have a "dev-properties" directory, which is added after the driver 
probe, and describes MIPI DisCo values at the device level.

Either we remove this dev-properties and move it to the device level - 
to be consistent with your recommendation - or we keep separate 
directories, one which is populated on device registration and the other 
on driver probe.


