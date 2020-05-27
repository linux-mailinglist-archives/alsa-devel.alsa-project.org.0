Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B821E3469
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 03:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E59C7177E;
	Wed, 27 May 2020 03:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E59C7177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590541669;
	bh=BC8ptv/vEdPN0UqUAbvA9yHOqU6ZJNz6KqrCQ8FCxnw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kML6A93lAy03YDeI5TOcj3ti4Dnsh3WUzCLSoNz8WF8Sz3GBoFXH9R0R3XOkM6Lix
	 Df73rKIT57NqmPlKpKrl8ZdmrP1vp5Vr9YJhGyas8V82MUpJg6LHeBVAW5KgStmM33
	 m210FTEOqyqfz57V5ZHcJTzMvBr6C0Hv7IwVBA3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03BF4F80100;
	Wed, 27 May 2020 03:06:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 350D9F80150; Wed, 27 May 2020 03:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD587F80146
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 03:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD587F80146
IronPort-SDR: iYXtNQCe2BT7hO/+RIHmCU4dCcez7uvU9hInIIAeqzQdCMHSGiY9R4nG65s4JDqfhkO1BdMJyZ
 UBD6v4ethuXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 18:05:49 -0700
IronPort-SDR: S/mcQUygiuf+vPV3ktb5nM26m1P/lgg2ZilE6VzPGtNO/grl3gJIE1yfm+vuF7BDw5FFyZNXJB
 H6wZhYY4068w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; d="scan'208";a="345361056"
Received: from xgu17-mobl.ccr.corp.intel.com (HELO [10.254.210.123])
 ([10.254.210.123])
 by orsmga001.jf.intel.com with ESMTP; 26 May 2020 18:05:47 -0700
Subject: Re: [PATCH v2 0/2] ASoC topology header parsing refinement
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200521074847.71406-1-yang.jie@linux.intel.com>
 <32df1cf8-8a57-7fc8-c694-6ddcc03fffca@intel.com>
 <00e9e16f-87be-5585-3751-d605a2ceb326@linux.intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <2bea8103-1587-f337-3350-2d88297094ce@linux.intel.com>
Date: Wed, 27 May 2020 09:05:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <00e9e16f-87be-5585-3751-d605a2ceb326@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 vamshi.krishna.gopal@intel.com
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



On 5/26/20 9:29 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/26/20 7:40 AM, Cezary Rojewski wrote:
>> On 2020-05-21 9:48 AM, Keyon Jie wrote:
>>> This small series is to optimize the header logging during the topology
>>> parsing. This is verified work fine on both SOF and SST drivers
>>> (bxt_rt298 with dfw_sst.bin).
>>>
>>> Change History:
>>> v2:
>>> - Change the internal used array to be 'static' to fix the issue
>>>    reported by: kbuild test robot <lkp@intel.com>
>>> - Add testing coverage including Intel SST driver also.
>>>
>>> v1:
>>> - Initial version.
>>>
>>> Keyon Jie (2):
>>>    ASoC: topology: refine and log the header in the correct pass
>>>    ASoC: topology: remove the redundant pass checks
>>>
>>>   sound/soc/soc-topology.c | 99 ++++++++++++++++++----------------------
>>>   1 file changed, 44 insertions(+), 55 deletions(-)
>>>
>>
>> No regression after applying these and running through SST CI on cAVS 
>> 1.5+ (GLK) and 1.8 (CNL).
> 
> Can the tests be run on SKL/KBL? That's where the cAVS driver will be 
> used and where this patchset will have an impact.
> Thanks!

Yes, they were just tested on KBL Chrome book with cAVS driver by Vamshi 
and Sathya.

Tested-by: Vamshi Kerishna Gopal <vamshi.krishna.gopal@intel.com>

Thanks,
~Keyon

> 
>> Given some comments on 1/2 though, believe it could be simplified.
>>
>> Czarek
