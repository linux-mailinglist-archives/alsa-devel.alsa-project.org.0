Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F00640BD9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 18:12:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E37BB185C;
	Fri,  2 Dec 2022 18:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E37BB185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670001128;
	bh=PTM4jMqtGOe4MZYpr8xDoOQAr18vNvgRXmZGINsD4lQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9bF0PGSorZCi/ETQMHTh+/wI7+1YTy5iaytfCBFuDhuiZr+0stuteJN4IDPewEZa
	 oje7BCcCD6KRoXWthLTUfQi7YoUtAToqOrw02wF8ykSB2Nm37BXzqzUE+D1VAPfabt
	 QsVk2n9nzsLgl9yv69kp0GmdtNJuXGQk6EGyR4ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7126BF800BD;
	Fri,  2 Dec 2022 18:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD8F1F804B3; Fri,  2 Dec 2022 18:11:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_72,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61CDCF800BD
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 18:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61CDCF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GaPCxVYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670001065; x=1701537065;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PTM4jMqtGOe4MZYpr8xDoOQAr18vNvgRXmZGINsD4lQ=;
 b=GaPCxVYX0Azxkka7/GpILYNQOlSp7FsoX88B9uMqxIDndlbqP5LlED+V
 Q/0c8ECy08dJM0xYMJ748nFvS+RxI+cSwfDOi6ugYpAdl2Zlri8Z6zvnQ
 AwNjRw/ohIg++xySTik7xMF30xa7THaSr4UA+43xMyT/s5aUSBnJ8tvaU
 oafHp1KznGxQdymAjzXj6j5eFcdxuOszWD3jT9qWQNh1Jdp5Apztmydad
 Wh7fV9E78XmMgJkkwWvqzXnU3ndoQKWhd84BFhHmdmzR2sstQYOYPJiTs
 0kEZQGKxYxCYpSzp1ZHk3DqNd6EmoLZ8m3+Ia5ePxzL602CTP6yJoiysp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380286122"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="380286122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 09:11:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="645091211"
X-IronPort-AV: E=Sophos;i="5.96,213,1665471600"; d="scan'208";a="645091211"
Received: from ofaiz-mobl1.amr.corp.intel.com (HELO [10.212.59.186])
 ([10.212.59.186])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 09:11:00 -0800
Message-ID: <08b9871d-54fa-bbef-a5ca-0be888312645@linux.intel.com>
Date: Fri, 2 Dec 2022 10:45:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] soundwire: Remove redundant zeroing of page registers
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org
References: <20221201140813.4062146-1-rf@opensource.cirrus.com>
 <002826da-f22f-9ce2-1688-345fe4e3c7ed@linux.intel.com>
 <266bf397-4395-873b-c933-73a9e28f463c@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <266bf397-4395-873b-c933-73a9e28f463c@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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



On 12/2/22 05:26, Richard Fitzgerald wrote:
> On 01/12/2022 18:31, Pierre-Louis Bossart wrote:
>>
>>
>> On 12/1/22 08:08, Richard Fitzgerald wrote:
>>> Writing zero to the page registers after each message transaction can
>>> add
>>> up to a lot of overhead for codecs that need to transfer large amount of
>>> data - for example a firmware download.
>>>
>>> There's no spec reason I can see for this zeroing. The page registers
>>> are
>>> only used for a paged address. The bus code uses a non-paged address for
>>> registers in page 0. It always writes the page registers at the start of
>>> a paged transaction.
>>>
>>> If this zeroing was a workaround for anything, let me know and I will
>>> re-implement the zeroing as a quirk that can be enabled only when it is
>>> necessary.
>>
>> It's a feature, not a bug :-)
>>
>> The page registers have to be zeroed out so that any bus-management
>> command hits the page0 instead of using a value that was set by codec
>> driver for vendor-specific configurations.
>>
> 
> Why would these bus management commands set bit 15 to indicate a paged
> access? If they don't set bit 15 the page registers are not used and
> bits 15..31 of the register address must be 0. Table 78 in the Soundwire
> 1.2 spec. Table 71 in the 1.0 spec. Table 43 in the 0.6 draft spec.

I forgot about this magic BIT(15) and indeed the Addr_page1/2 values are
ignored when issuing non-paged register access. There's really no need
to zero-out the page registers, it's completely unnecessary. Nice catch!

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>



>> The implementation is far from optimal though, and indeed if we have
>> long transactions that are not interrupted by anything else we could
>> avoid resetting the page registers.
>>
>> I tried to implement a 'lazy approach' some time back, but at the time I
>> didn't see any benefits due to the limited number of configurations.
>>
>> I can't remember where the code is, but the initial enhancement was
>> listed here: https://github.com/thesofproject/linux/issues/2881
>>
>>>
>>> Richard Fitzgerald (2):
>>>    soundwire: bus: Don't zero page registers after every transaction
>>>    soundwire: bus: Remove unused reset_page_addr() callback
>>>
>>>   drivers/soundwire/bus.c             | 23 -----------------------
>>>   drivers/soundwire/cadence_master.c  | 14 --------------
>>>   drivers/soundwire/cadence_master.h  |  3 ---
>>>   drivers/soundwire/intel_auxdevice.c |  1 -
>>>   include/linux/soundwire/sdw.h       |  3 ---
>>>   5 files changed, 44 deletions(-)
>>>
