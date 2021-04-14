Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50C35F93D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 18:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E2BC1670;
	Wed, 14 Apr 2021 18:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E2BC1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618419089;
	bh=cJGOg9AiXCnOVXvpmjbeHJ89RF1tVKcMBuQ5kzZ1Njk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gai7hMtORuP6CFHGwZCgjU5w84fT/V9WY8Gj3GqKIAhvWG2XMPXqGTvOY2W6r7XI9
	 kEdyoGEgMDA0ABytzvpk6wfw0pkzsAr0c4LcrRJdglzwIBWflKP/3+zi1XN0QS6eEC
	 hZt1LjKAs0dEnIuD+DbiW14jqMFgm21zQFjEbNSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DBDDF800FF;
	Wed, 14 Apr 2021 18:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81643F80269; Wed, 14 Apr 2021 18:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F88F800FF
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 18:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F88F800FF
IronPort-SDR: TSOUm7USTrRGI8QfLgUHEjvK9BtdK8ekzRDkYohKfRoX1Y915/35XMTBNTLNIDIUTxpbcZ7W+2
 jywDKxkagA3w==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="279996224"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="279996224"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 09:49:49 -0700
IronPort-SDR: igAmzAAo/FJDmriHHUS8QC7V6dn9mRoV5uvgJTZ4aiORgcqQwoaDwAkig4ElpBe7Yb97aRgibk
 CRfIMyOJUBSA==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="532839445"
Received: from abilling-mobl.amr.corp.intel.com (HELO [10.212.79.142])
 ([10.212.79.142])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 09:49:47 -0700
Subject: Re: [PATCH v2 2/3] soundwire: Intel: introduce DMI quirks for HP
 Spectre x360 Convertible
To: Vinod Koul <vkoul@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20210302075105.11515-1-yung-chuan.liao@linux.intel.com>
 <20210302075105.11515-3-yung-chuan.liao@linux.intel.com>
 <de65866a-bb8f-f5c6-2829-42b561f282f7@intel.com>
 <YHZqqjUSJvYxhEw6@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <403e8645-f823-22f6-7003-3b62962dcf01@linux.intel.com>
Date: Wed, 14 Apr 2021 10:21:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHZqqjUSJvYxhEw6@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com, sanyog.r.kale@intel.com,
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



On 4/13/21 11:08 PM, Vinod Koul wrote:
> On 12-04-21, 14:37, Dave Hansen wrote:
>> On 3/1/21 11:51 PM, Bard Liao wrote:
>>> +++ b/drivers/soundwire/dmi-quirks.c
>>> @@ -0,0 +1,66 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>> +// Copyright(c) 2021 Intel Corporation.
>>
>> It looks like this is already in intel-next, so this may be moot.  But,
>> is there a specific reason this is dual licensed?  If so, can you please
>> include information about the license choice in the cover letter of any
>> future version?
> 
> The soundwire module from Intel and core soundwire core was always dual
> licensed, so it kind of followed that..
> 
>> If there is no specific reason for this contribution to be dual
>> licensed, please make it GPL-2.0 only.
> 
> This module, I would say NO. Unless someone from Intel disagree..
> Pierre/Bard..?
> 
> If all agree I dont see a reason why this cant be updated to GPL only.

The initial version of those quirks was contributed as a change to 
drivers/soundwire/slave.c, which is dual-licensed. the code was split to 
a different file and the dual-license followed.

I am personally favorable to keeping the code as is, the quirks are just 
referring to low-level hardware descriptors that are not aligned with 
DevID hardware registers in external SoundWire devices. If enumeration 
was handled at a lower level, e.g. in DSP firmware the same information 
would be quite useful.

That said, it's been agreed with Dave that moving forward all new 
contributions from Intel with a dual-license would include an explicit 
statement in the commit message as to why it was selected over plain 
vanilla GPL-2.0-only.



