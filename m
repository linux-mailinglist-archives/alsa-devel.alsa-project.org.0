Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14F22121D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 18:20:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC4D942;
	Wed, 15 Jul 2020 18:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC4D942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594830017;
	bh=KZdcjMRnARqzunUlskyQFhwJQva279LhRbYoOWiC4G4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUEYZ6DwYUxZpRSJwCRBA/qLQ90Jr8h+95RHp/9cVaHeOYssEWFOfwPKdahjIow1Y
	 146+V51qBmsbXij4ar5QGTyOZWk0OrvnlRyWPrNJL8LB7M7J2yIvzyOxbnhfjwtkMW
	 du2L/ld6jNCWDZ2XBwLRI3jT0CAHwQ/W3KJ2rANo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C55F80113;
	Wed, 15 Jul 2020 18:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4787F8021D; Wed, 15 Jul 2020 18:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B9D2F80113
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 18:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9D2F80113
IronPort-SDR: uOToo446Gfu94moEFUTN22QHFdKaL/cJi+BHcCYfF7iZrca1SqRgM2TSjikIO7bqL/D1Oa4sl7
 x545mKr4IgBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="137323119"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="137323119"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 09:18:14 -0700
IronPort-SDR: 9ekOsRwYTBZChqxXTmFjZbcO1iGanHBPiFP5oGwaGO4kMoJDNHHyRLlsc4Yf5QVrs3FXleQQix
 KmS9P6w99m+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="282148401"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.3.67])
 ([10.213.3.67])
 by orsmga003.jf.intel.com with ESMTP; 15 Jul 2020 09:18:13 -0700
Subject: Re: [PATCH v3 07/10] topology: decode: Fix decoding PCM formats and
 rates
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1594725911-14308-1-git-send-email-piotrx.maziarz@linux.intel.com>
 <1594725911-14308-8-git-send-email-piotrx.maziarz@linux.intel.com>
 <bca4e102-f734-df31-17aa-686bc1463819@linux.intel.com>
 <37b724ff-e485-8b7a-f16d-8cf8f8ac7c9b@linux.intel.com>
 <13ec204b-78f3-2d5d-30bc-c099a58fd789@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <163efa56-6144-30e3-98e8-e286e605937c@intel.com>
Date: Wed, 15 Jul 2020 18:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <13ec204b-78f3-2d5d-30bc-c099a58fd789@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: amadeuszx.slawinski@intel.com
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

On 2020-07-15 4:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 7/15/20 4:37 AM, Piotr Maziarz wrote:
>> On 2020-07-14 17:40, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 7/14/20 6:25 AM, Piotr Maziarz wrote:
>>>> Not checking _LAST format and rate, which are valid indexes in arrays,
>>>> makes data loss while converting binary to standard ALSA configuration
>>>> file.
>>>
>>> I must be really thick on this one.
>>>
>>> alsatplg converts from alsa-conf format to binary topology file.
>>> The binary topology file is used by drivers.
>>>
>>> In which cases would you convert from binary to alsa-conf files? And 
>>> what tool would you use?
>>>
>> ./alsatplg --decode topology.bin --output decoded_topology.conf,
>> This feature was added around the end of 2019. And why to use it? For 
>> binary topologies to which conf files are lost for example. It's 
>> easier to analyze and edit it in conf than directly in binary.
> 
> I must admit I completely missed this feature, thanks for the 
> clarification.

In general, the idea is to be able to validate or debug (if necessary) 
topology binaries provided by users when access to FE file e.g. conf, or 
XML in our case, is not possible.

In perfect world one can do the following and receive the exact same 
results on each iteration:


(assume FE file in XML format and FE tool e.g. itt which allows for
converting XML into conf)

XML -> itt -> UCM
UCM -> alsatplg -> bin

bin -> alsatplg -> UCM
UCM -> itt -> XML

Ability to compile and decompile was very handy in the Android world. We 
developed a simplified approach quite a while ago and finally decided to 
upstream the solution. Turned out Jaroslav pushed few commits lately 
that make a stub for the idea itself. Unfortunately, as you see in the 
series, there are several problems with the existing code rendering 
--decode unusable. Next step, after the fixes, is to allow for custom 
handlers to be provided (decompiling vendor's private data).

Czarek
