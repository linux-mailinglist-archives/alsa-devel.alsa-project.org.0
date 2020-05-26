Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F21E2595
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 17:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E51E1757;
	Tue, 26 May 2020 17:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E51E1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590507459;
	bh=13yozKs4fkr1khrYCFz/6acH8xiHLt4YNeX3MoEbEv4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GQKA/rtlXfW8yz5cZ+2WAuB/5AaQyhpwtpNdrwsMl4JMT+sb2BKrVT3Bq12l9QnE7
	 xwvwqXAEtrj9BjDa+qqmQhEfBBo/YTrII44OiozAVxdJkshwrCf3EJxvKgpNxOJNg0
	 r6caMcF3BL3a6e1+E8BtC33Ln5IqKN9C98b3HIeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 557EAF8028C;
	Tue, 26 May 2020 17:35:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87BFFF8015C; Tue, 26 May 2020 17:35:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27C99F80146
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 17:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C99F80146
IronPort-SDR: JmMRg6i+/fDz7cHRBOgYycD+NXAfiob/j7Bx5ypTbvszQTKgTiIVYqFBBCW6NxNqqTDO0eT80m
 GnM6XO5jeSZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 08:34:59 -0700
IronPort-SDR: EpfK93zYIqkHW+IzTlQzYrYr6z2Rj+/eStk4ucL7m3V39F2ZQ4ljs2gkAPB6qIKyXHL3UWjXK2
 QrgdTHhfCxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; d="scan'208";a="291234620"
Received: from unknown (HELO [10.254.102.121]) ([10.254.102.121])
 by fmsmga004.fm.intel.com with ESMTP; 26 May 2020 08:34:58 -0700
Subject: Re: [PATCH v2 0/2] ASoC topology header parsing refinement
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200521074847.71406-1-yang.jie@linux.intel.com>
 <32df1cf8-8a57-7fc8-c694-6ddcc03fffca@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00e9e16f-87be-5585-3751-d605a2ceb326@linux.intel.com>
Date: Tue, 26 May 2020 08:29:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <32df1cf8-8a57-7fc8-c694-6ddcc03fffca@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, ranjani.sridharan@linux.intel.com
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



On 5/26/20 7:40 AM, Cezary Rojewski wrote:
> On 2020-05-21 9:48 AM, Keyon Jie wrote:
>> This small series is to optimize the header logging during the topology
>> parsing. This is verified work fine on both SOF and SST drivers
>> (bxt_rt298 with dfw_sst.bin).
>>
>> Change History:
>> v2:
>> - Change the internal used array to be 'static' to fix the issue
>>    reported by: kbuild test robot <lkp@intel.com>
>> - Add testing coverage including Intel SST driver also.
>>
>> v1:
>> - Initial version.
>>
>> Keyon Jie (2):
>>    ASoC: topology: refine and log the header in the correct pass
>>    ASoC: topology: remove the redundant pass checks
>>
>>   sound/soc/soc-topology.c | 99 ++++++++++++++++++----------------------
>>   1 file changed, 44 insertions(+), 55 deletions(-)
>>
> 
> No regression after applying these and running through SST CI on cAVS 
> 1.5+ (GLK) and 1.8 (CNL).

Can the tests be run on SKL/KBL? That's where the cAVS driver will be 
used and where this patchset will have an impact.
Thanks!

> Given some comments on 1/2 though, believe it could be simplified.
> 
> Czarek
