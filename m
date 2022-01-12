Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D048C084
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 09:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2E41918;
	Wed, 12 Jan 2022 09:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2E41918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641977841;
	bh=NCfBUwdRkZAw6vaOmgb+f9rqJiopfU1LVulH+Zq8MEQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxduysV1lApC7HC7C/upG4Xh548y40N+gJsZmbYuetFoMGLOwC7+c02wJdJ+ASNr4
	 eu1tfG6UyXCbIGocU4fu3ci3Ais3aANk/ODRg2EGbk++1p4ioFfMsKjYTKyk5q7SzZ
	 M3lx5AC4uQtpK0xeMiVcTm1t+jVApSnmMxOBfyW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3972EF8026D;
	Wed, 12 Jan 2022 09:56:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E26F3F8026A; Wed, 12 Jan 2022 09:56:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76383F80054
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 09:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76383F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hiyOW9yR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641977765; x=1673513765;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NCfBUwdRkZAw6vaOmgb+f9rqJiopfU1LVulH+Zq8MEQ=;
 b=hiyOW9yRZ8NiT+cxScBP9LHP0NIRlb47RixJbpinILXSgcJydXrHVFKa
 HaMD5/k2oH/PG1t1Y7/oaWlLLB6FgBg/ngSUVtWcpQ1xAXH0hl9ODjk24
 k0cKZaM+JukgmtuT/UtGlF8aEki5Z7T3fCym2W1U3XiAR1Ko912yjmTx1
 OSR8xNxPaCh3Uo6aK24xD80ZOVa9q+L/XHyPGY5s9cwmN+CvGDoOK0uZp
 lwH4aJmT1daMPvvYrQYkgN2hddiTTzKt4+rgjinIxdsNG1HS8gjWhqPoL
 1GBM76qYOVfIaewAHMle9jUTAXelM6FS3Sn2btMw9r74VaFa5QdUF1pNb Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="307043091"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="307043091"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 00:55:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="529091183"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.73])
 ([10.237.12.73])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 00:55:57 -0800
Message-ID: <17365845-c21b-bca7-bec6-b6ddeee41472@linux.intel.com>
Date: Wed, 12 Jan 2022 09:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/3] ASoC: topology: Allow TLV control to be either read
 or write
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20220111190528.445248-1-amadeuszx.slawinski@linux.intel.com>
 <20220111190528.445248-3-amadeuszx.slawinski@linux.intel.com>
 <b4e04b4d-147a-5dd1-d54e-429a61f7f84d@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <b4e04b4d-147a-5dd1-d54e-429a61f7f84d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
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

On 1/11/2022 5:48 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 1/11/22 1:05 PM, Amadeusz Sławiński wrote:
>> There is no reason to force readwrite access on TLV controls. It can be
>> either read, write or both. This is further evidenced in code where it
>> performs following checks:
>>                  if ((k->access & SNDRV_CTL_ELEM_ACCESS_TLV_READ) && !sbe->get)
>>                          return -EINVAL;
>>                  if ((k->access & SNDRV_CTL_ELEM_ACCESS_TLV_WRITE) && !sbe->put)
>>                          return -EINVAL;
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Should there be a Fixes tag
> 
> Fixes: 1a3232d2f61d ("ASoC: topology: Add support for TLV bytes controls")
> 
> ?

I guess it won't hurt, will add and send v2, thanks!
