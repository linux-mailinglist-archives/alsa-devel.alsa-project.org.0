Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C962D257C14
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Aug 2020 17:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707881769;
	Mon, 31 Aug 2020 17:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707881769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598887058;
	bh=MEMd8TObfbYcwnF80376xgFjo5ScuXiaiIOT9RO6hQQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RkkZvVaCS7tWNE08VcjavyTN11q/oRLdau+D0tMsbttUXaCEvKVCVeimrNxNCh2kO
	 OUYJ2wreeG9TPTImgzKmHzcsMyGTcySeYLJyoBISU4FObl07F1kLiKPFzkz6f1Jqo6
	 /72USPGUaCPv1cuHuzCChhUeGUGqzsqkg7ZIGnxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FD4DF8024A;
	Mon, 31 Aug 2020 17:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A346F80212; Mon, 31 Aug 2020 17:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B244F80146
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 17:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B244F80146
IronPort-SDR: aTDRWglonb5aCdisCO7o7uwmMOhmn2m9GNVgksVzBH8nSG1KcvHkDuU5xWQW86zfS5+vzqzIqQ
 Ug6jrY3vpmJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="136520676"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="136520676"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 08:15:41 -0700
IronPort-SDR: v+uBZj2yz55phQgP83igUTAsDBunmkJ9f49VrBbrIS3NM4KS8+6pGtYENeFcFdHxEM6jugM9Bv
 4kF0z8JH/H9A==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="501376518"
Received: from jaeikcho-mobl.amr.corp.intel.com (HELO [10.213.165.6])
 ([10.213.165.6])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 08:15:38 -0700
Subject: Re: [PATCH 09/11] soundwire: intel: add dynamic debug trace for
 clock-stop invalid configs
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20200829110047.GC2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <051afb2d-dd2e-0ea4-d8a9-980f5df136b7@linux.intel.com>
Date: Mon, 31 Aug 2020 10:15:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200829110047.GC2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


>>>>>> Detect cases where the clock is assumed to be stopped but the IP is
>>>>>> not in the relevant state, and add a dynamic debug trace.
>>>>>
>>>>> you meant a debug print..and it looks like error print below (also in title).
>>>>
>>>> I don't understand the comment. Is the 'trace' confusing and are you asking
>>>> to e.g. change the commit message to 'add dynamic debug log'?
>>>
>>> Question is what is dynamic about this?
>> dev_dbg() is part of the kernel dynamic debug capability...
>>
>> https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html
>>
>> Not sure what you are asking here?
> 
> :-| where is dev_dbg() ?
> 
> See [1]

> 
> [1]
> 
>> +			dev_err(dev, "%s invalid configuration, clock was not stopped", __func__);
> 
>                          ^^^^^^^

it's still a log using the "dynamic debug" framework.

Again, what are you asking us to fix?

