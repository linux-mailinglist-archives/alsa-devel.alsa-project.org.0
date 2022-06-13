Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0739549D84
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 21:22:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECC9174E;
	Mon, 13 Jun 2022 21:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECC9174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655148169;
	bh=pVQTfp5IU2YdV+5jfNxCHCOaYYaOvPBvgBMV8BSutKI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T1sahTHDYb7xlXVQhiCRw91p2OudCeXO1+D7c8od/6d3+qwWRac6K61m5pTd/fi/0
	 Ltp7/XAX+XDMp+APznyzYYpMk2+ysKH175XzEIiMLOy6G7TVzJhvE0BG6+0iOJIt6k
	 lfpLLiE1MXSOOavWeIivJnNiWyd0UIqdad6Yy9U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8A37F80107;
	Mon, 13 Jun 2022 21:21:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DEE7F804C1; Mon, 13 Jun 2022 21:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BD87F800D8
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 21:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD87F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VMak0Jzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655148102; x=1686684102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pVQTfp5IU2YdV+5jfNxCHCOaYYaOvPBvgBMV8BSutKI=;
 b=VMak0JzhNWmVOlxNt8XZO6LWD4e7rXdhhdYwRc+wKyQZm+0vNgoge49v
 +XpHqLwWHyNfWfhH6PgXsr7VHnOwoBKN46b7ue1XJ+Fh8knYEacV2Mahq
 D3Y9ZLzX3L0LhcqWTJbMyg+0+p2pCW1jtMFFnG4PNiJkr/vQ6WSxOEWlc
 LVSLvb+wbDnD88vp/o+SYbgFcUUMOGocf1PjEs/Tlse4+3j06E6WhY8oF
 w213ldpo2F2SK4DkyRa1dWkV5q2kFd1IlXn7t8DvCTek5tJE+LWMNVjA3
 FHtVJVNJsoPQaY6XDm37kL1AJw5puzQUiB8Tl7tuLtW5jIdGRtWgBQNZ1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="277162580"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="277162580"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 12:21:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="726419999"
Received: from kyogendr-mobl.amr.corp.intel.com (HELO [10.212.95.68])
 ([10.212.95.68])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 12:21:31 -0700
Message-ID: <15ef4ec4-14ae-27fc-919d-b0933454455f@linux.intel.com>
Date: Mon, 13 Jun 2022 14:21:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] soundwire: intel: uniquify debug message
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
 <20220610023537.27223-2-yung-chuan.liao@linux.intel.com>
 <YqLVwqx9/Pos8T06@kroah.com>
 <b86e6cbd-3488-a239-d765-cf01bf0d4f70@linux.intel.com>
 <YqRCKtLGYlRQQ+DU@kroah.com>
 <7328fbb2-06af-99c8-5e7f-9d22f8c4e4f6@linux.intel.com>
 <YqdyErIYYk85NV41@kroah.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YqdyErIYYk85NV41@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org, tiwai@suse.de,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
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


>>>>>> @@ -1549,8 +1549,8 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
>>>>>>  	int ret;
>>>>>>  
>>>>>>  	if (bus->prop.hw_disabled || !sdw->startup_done) {
>>>>>> -		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>>>>>> -			bus->link_id);
>>>>>> +		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
>>>>>> +			__func__, bus->link_id);
>>>>>
>>>>> Not needed, it is provided automatically if you ask the kernel for this.
>>>>> Same for all other instances in this patch.
>>>>
>>>> provided how? Your comment is a bit cryptic here.
>>>
>>> the dynamic debug code in the kernel already adds the function name
>>> where the message was sent from, if you want to know this in userspace.
>>> Please read the documentation for details (I think the key is the 'f'
>>> flag to be enabled in userspace).
>>>
>>> So adding __func__ to dev_dbg() calls are redundant and never needed.
>>
>> Oh wow, I had no idea - and I am not the only one :-)
>>
>> Here's what I get with a grep on the kernel code
>>
>> git grep __func__ | grep dev_dbg | wc -l
>>
>> 3122
>>
>>
>> Doing this for sound/ gives me 356, and that's for single-line logs only.
>>
>> There's clearly something that was missed by tons of people.
> 
> Yes, it's not commonly known so cleanups are always welcome.  Perhaps
> some of those usages predate the feature being added as well.

Yep, looks like no one in our team knew about this. We've changed our
scripts and I started cleaning this up, changes will be posted upstream
soon.

https://github.com/thesofproject/linux/pull/3695

This patch will be reverted in our tree, completely unnecessary indeed.
