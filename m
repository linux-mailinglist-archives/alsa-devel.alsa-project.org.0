Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 570912FBFBE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 20:11:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D741816ED;
	Tue, 19 Jan 2021 20:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D741816ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611083485;
	bh=muahRlfQGSlDcXl/A/o/UouCCZpBjnP1V4dgrD+koNQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7qYR+FsBUtxUjBKNCdko7Ch6E7/8os3zxgx9qA+9T2H79qmF4eoLQoKAdpwVd2An
	 3cE/5ioj7BJyib0B7Oo1yNz+8hGmcWWGCKZqIcNXILCqnZ0LV3M4X/5F89CmuxY112
	 s3HZPyA7z5vKsDP3jBIIMjeNTaH5xqS9C0ufY5hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 587CFF80117;
	Tue, 19 Jan 2021 20:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F3FF80257; Tue, 19 Jan 2021 20:09:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14479F80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 20:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14479F80137
IronPort-SDR: +TXizE9APRnfwhAGHwHe3j6mUxO9lVqeHl0OyB482mpcYjn2rA/xphOEDTT1CVRukkx1Wa/N9V
 813mNIFR+2SA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="178203952"
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="178203952"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 11:09:43 -0800
IronPort-SDR: 6NwjqznG8OHinEFNfhklW31CU1SQAGfKOYSCbFYUDylpZmFWv1BJhsqAkX1qv0p0vUDEBvAXQC
 yMUK7CYX3uGA==
X-IronPort-AV: E=Sophos;i="5.79,359,1602572400"; d="scan'208";a="384059682"
Received: from lrstallo-mobl.amr.corp.intel.com (HELO [10.212.39.144])
 ([10.212.39.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 11:09:43 -0800
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
Date: Tue, 19 Jan 2021 13:09:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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


>>>> link_id can be zero and if we have multiple controller instances
>>>> in a system like Qualcomm debugfs will end-up with duplicate namespace
>>>> resulting in incorrect debugfs entries.
>>>>
>>>> Using id should give a unique debugfs directory entry and should fix 
>>>> below
>>>> warning too.
>>>> "debugfs: Directory 'master-0' with parent 'soundwire' already 
>>>> present!"
>>>
>>> Yeah id is guaranteed to be unique so this will work.
>>>
>>> Applied, thanks
>>
>> This patch is a no-op for Intel, but I am not convinced it's the right 
>> fix or the definitions are not consistent.
> 
> It depends if the intention is to represent full Hierarchy in debugfs, 
> then I agree. Its was consistent even before!

Indeed, we don't currently have a notion of controller in debugfs.

> currently we have
> /sys/kernel/debug/soundwire/master-*
> 
> Are you suggesting that we have something like this:
> 
> /sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID> ??

Yes this is what I was thinking about.

> /sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID>/xyz-slave/master-<LINK-ID> 
> ??

This would be for a bridge which to the best of my knowledge hasn't been 
implemented by anyone (clocking and command/control timing issues).

> Or may be something much simpler like:
> 
> /sys/kernel/debug/soundwire/master-<ID>.<LINK_ID>

the bus->id is an IDA, which is useful for to avoid conflicts, but it's 
not really meaningful for debugfs. I remember seeing a case where we had 
links 2 and 4 enabled, and the bus->id were 0 and 1, a completely 
artificial value that doesn't really help in debugging.
