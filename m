Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF7351B5C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 20:09:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F42116BB;
	Thu,  1 Apr 2021 20:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F42116BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617300571;
	bh=UwbgALK/w9oDOgEVcLsM8k18btW30Q6S0apNnH+cJQI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opgt+k6diZbQ+ZJfZHHChHlLpDJ191y76/1l2PTqk+znydWWFvT1UX8f7F8CJY/nI
	 sTkUaHHE3p7WFBkgPs9IgGTo1NyVkBrvaziKUiHlRuJdiCCjUfDQtPLcXiYimpQJUk
	 glEnY8Rldi2TbQpwwABaadr9fIAG1ZTCtivHyC7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 932BFF80117;
	Thu,  1 Apr 2021 20:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE3E5F8026B; Thu,  1 Apr 2021 20:08:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827E7F8013F
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 20:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827E7F8013F
IronPort-SDR: kODLkNiQPF+S5GXliA5M8fQZzdMWeW7PAzpFpBWhSoaU+5rVu3cuR6+2yeJzC3Li3Xi3lJ1rgS
 EfLJX0QwFhFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="192407614"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="192407614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 11:07:53 -0700
IronPort-SDR: hUv0QhRJR3t6yfi6jtJlSG5VCcsu/iRVnVk3Au/B+buJVyvvTkXfW/+6kHGR7P2kCaOwB2ItTw
 Kuhyy/IAV1eA==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="439311460"
Received: from vhsalasl-mobl.amr.corp.intel.com (HELO [10.255.229.235])
 ([10.255.229.235])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 11:07:51 -0700
Subject: Re: [PATCH 1/2] soundwire: add macro to selectively change error
 levels
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210331011355.14313-1-yung-chuan.liao@linux.intel.com>
 <20210331011355.14313-2-yung-chuan.liao@linux.intel.com>
 <YGV1HYL+XcVmxfQG@vkoul-mobl.Dlink>
 <0834b9fc-9b3a-1184-fed2-6f9c7e66c6fb@linux.intel.com>
 <YGX5AUQi41z52xk8@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <81c6b53b-e3fb-32d0-1e99-365d87ab6524@linux.intel.com>
Date: Thu, 1 Apr 2021 13:07:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YGX5AUQi41z52xk8@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Vinod Koul <vkoul@kernel.org>, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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


>>>> +#define sdw_dev_dbg_or_err(dev, is_err, fmt, ...)			\
>>>> +	do {								\
>>>> +		if (is_err)						\
>>>> +			dev_err(dev, fmt, __VA_ARGS__);			\
>>>> +		else							\
>>>> +			dev_dbg(dev, fmt, __VA_ARGS__);			\
>>>> +	} while (0)
>>>
>>> I see a variant in sof code and now here, why not add in a
>>> dev_dbg_or_err() and use everywhere?
>>
>> Good point, I hesitated back and forth on specific v. generic macro.
>>
>> The main reason why I added this macro for SoundWire is that quite a few
>> subsystems have their own debug functions (DRM, ACPI, etc), and I wasn't
>> sure if there was any appetite to add more options in
>> include/linux/dev_printk.h. SOF also uses a different format due to history.
> 
> It is better if those other subsystems move to using the common kernel
> debug functions.  Historically they were all separate, there is no good
> reason for them to be that way today.
> 
> So please do not create custom subsystem debug macros like this just for
> this tiny set of drivers.
> 
> My bigger issue with this is that this macro is crazy.  Why do you need
> debugging here at all for this type of thing?  That's what ftrace is
> for, do not sprinkle code with "we got this return value from here!" all
> over the place like what this does.

We are not sprinkling the code all over the place with any new logs, 
they exist already in the SoundWire code and this patch helps filter 
them out. See e.g. patch 2/2

-			dev_err(&slave->dev,
-				"Clk Stop type =%d failed: %d\n", type, ret);
+			sdw_dev_dbg_or_err(&slave->dev, ret != -ENODATA,
+					   "Clk Stop mode %d type =%d failed: %d\n",
+					   mode, type, ret);

If you see all my recent patches they were precisely trying to avoid 
polluting the console logs with too much information that is irrelevant 
from most users, and making sure that when a log is provided it's 
uniquely identifiable.

There are similar macros where -EPROBE_DEFER is ignored.

This addresses a very SoundWire-specific case where if we see a -ENODATA 
error code (Command Ignored), we ignore it and don't report it by 
default. We still have a rare set of cases where this -ENODATA code 
shows up unexpectedly, possibly due to problematic reset sequences, and 
we want developers to help track them down what causes this sequence 
using dynamic debug.

I am not arguing about ftrace v. dynamic debug, and that's also partly 
why I didn't feel comfortable expanding the generic set of debug functions.


