Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D29BE2FEE2E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 16:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595F817E2;
	Thu, 21 Jan 2021 16:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595F817E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611242034;
	bh=J2auZW+TpKg1RD8QhEgPRVQWaYruGhNPh4WNEzQuJ3U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Df2/HjmfICKrcoLYO8sX1FJxr64+p3umQPOPnnV/EHCGKCW/pjezJtuaT8cVeZbqp
	 uLPxiDQ5fCRDKcTrcQapwvPyO13Nql8C86hXQx+Q668fGSkEPVsmx1CED/AGlHUg/q
	 KPRZmrWBdk4bzbAHNYL5HppTss8S6UG8HseqopiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EEFCF8026A;
	Thu, 21 Jan 2021 16:12:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF700F80257; Thu, 21 Jan 2021 16:12:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CC83F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 16:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CC83F80125
IronPort-SDR: eQayEnwtD95PljrYmX4Nl2AagzJjEtdV/vcTu5/6rF6bU1WHmTW1i7giQXg5SD87atRz+gh+JK
 co98elcUJnVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="198019863"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="198019863"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 07:12:10 -0800
IronPort-SDR: uvl/vASwHb9vG36fjwe1hn1nUqwvmJlHIMSFo4lPfYi9eoE+QSkFkO5MHuFANedL7NvyO+bejX
 Ku/y+SnOLpXA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; d="scan'208";a="427390633"
Received: from rjstacey-mobl2.amr.corp.intel.com (HELO [10.212.160.37])
 ([10.212.160.37])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 07:12:09 -0800
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
 <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
Date: Thu, 21 Jan 2021 09:12:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
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



On 1/21/21 6:03 AM, Srinivas Kandagatla wrote:
> 
> 
> On 19/01/2021 19:09, Pierre-Louis Bossart wrote:
>>
>>> currently we have
>>> /sys/kernel/debug/soundwire/master-*
>>>
>>> Are you suggesting that we have something like this:
>>>
>>> /sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID> ??
>>
>> Yes this is what I was thinking about.
> 
> Vinod/Pierre,
> 
> One Question here,
> 
> Why is link_id part of "struct sdw_bus", should it not be part of 
> "struct sdw_master_device " ?
> 
> Given that "There is one Link per each Master"

it's true that link == master == bus at the concept level.

but we have an existing code base with different structures and we can't 
break too many things at once.

In the existing flow, the 'bus' is created and setup first, the 
sdw_bus_master_add() routine takes a 'bus' argument, and the link_id is 
already set. This routine only creates a device and in the rest of the 
code we keep using the 'bus' pointer, so there's no real short-term 
scope for moving the information into the 'sdw_master_device' structure 
- that would be a lot of surgery when nothing is really broken.
