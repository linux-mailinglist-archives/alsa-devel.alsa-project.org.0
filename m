Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF425BC83
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 10:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A592118DB;
	Thu,  3 Sep 2020 10:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A592118DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599120733;
	bh=DUGScyonryixrR5BgyfL3/KNqvJPno+uN+SVz0BYKhc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oaHDLl63cX+E636J4wCmw8dxi/WPvDk/FI/tnJQizZC1bcu39ICxvTzL2UUH5VuaQ
	 hW9Lp+AbTKMQDMwdBOX0QQ5Q+8X60dxr/pxlV8t2oyOxacsDexTNEl903QciRalhAi
	 Ar/fuOuEzWSCzE6TaJi0Xvy1D+bCfefzRVjybWLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B226EF800F0;
	Thu,  3 Sep 2020 10:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0FB0F80217; Thu,  3 Sep 2020 10:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48736F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 10:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48736F800BA
IronPort-SDR: AIADevs19m651L6KTaL+4YvZZREaMCpIIH4tSwNrKrWwA+9v6evIy0OZZvucWKKu63KqjbQ7E8
 L9iBbbwrDtKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="158522011"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; d="scan'208";a="158522011"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 01:10:22 -0700
IronPort-SDR: 91jHze/bLEe7QXkMZCFIrrTfP1tXo/E6ld8F7egmaPOLpLJ3JRb34DAJ/4noXinmthyLMx9Rar
 fW5FyW/XrN1g==
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; d="scan'208";a="477961295"
Received: from pmaziarx-mobl.ger.corp.intel.com (HELO [10.249.128.129])
 ([10.249.128.129])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 01:10:20 -0700
Subject: Re: [PATCH v4 00/10] topology: decode: Various fixes
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <1598864943-22883-1-git-send-email-piotrx.maziarz@linux.intel.com>
 <7f62aba5-1a74-ce3e-9c0c-796e56f1cea0@perex.cz>
 <6335bfeb-8631-a392-fee3-8f244643bbeb@perex.cz>
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Message-ID: <922e0204-1213-7671-5fd0-20d1e3d40113@linux.intel.com>
Date: Thu, 3 Sep 2020 10:10:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6335bfeb-8631-a392-fee3-8f244643bbeb@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

On 2020-08-31 19:57, Jaroslav Kysela wrote:
> Dne 31. 08. 20 v 13:11 Jaroslav Kysela napsal(a):
>> Dne 31. 08. 20 v 11:08 Piotr Maziarz napsal(a):
>>> This series fixes various problems with topology decoding mechanism.
>>> Some of the problems were critical like improper memory management or
>>> infinite loops that were causing undefined behaviour or program crashes,
>>> while other resulted in losing some data during conversion.
>>>
>>> Bugs found while testing with Intel SST topologies.
>>
>> Thank you for this work. I applied all patches to the alsa-lib repository. I
>> dislike the last one - dynamic allocation for each printf(), but I applied it
>> until we found a better solution.
>>
>> We may use the dynamic allocation only when the printf is bigger than the 1024
>> bytes threshold (and keep the small buffer on stack otherwise) or create 'dst'
>> structure which will carry the output buffer point and the temporary buffer
>> pointer which will be freed when the output is finished.
> 
> I implemented the later suggestion in:
> 
> https://github.com/alsa-project/alsa-lib/commit/472ab5db67a0ed04de634214773e7b17d10b5415
> 
> There are also other fixes in the topology library. It would be nice, if you
> can give a test.
> 
> 			Thank you,
> 				Jaroslav
> 
I've tested your changes on a bunch of our topologies, everything works 
fine.
Thanks for merge and update.

Best Regards,
Piotr
