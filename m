Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A621A2443
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 16:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9351316B4;
	Wed,  8 Apr 2020 16:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9351316B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586357310;
	bh=etejCAiaACV4+l890S/2DsIJu2yoQDtZu+UdaaoFSdA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7/pt6JKh+x2fV7+ooQ92uwBpWfMcUJ4O/9G0in0rRxLaFzpaUi4wdnyMVv0crG1D
	 tYb3zakw1ALnXg+xa19Sbb1lUApf4XqrQXsKZfMSjDMA4s6oMuJuaT+vC+8U6cfclB
	 OKw8OPRH16Ln2nIkN7bhlfzvqprITCGzHk60ztgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE6AF80107;
	Wed,  8 Apr 2020 16:46:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E2AF80143; Wed,  8 Apr 2020 16:46:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0187F8011B
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 16:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0187F8011B
IronPort-SDR: gE9ady0N70fIeOLPoJDWodSU1B2gfEZHVZKkMlptdX2fUY7CYTqumPolZw0szcsnHXy56YsnFB
 cUKlO/JN8OhQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 07:46:37 -0700
IronPort-SDR: l1wjYLSPzmxrD+eqUzxQstE+BetCi5U/02xfg1ys7z5BX30uFe5riAEHZ/f+fHkQWqizLU6b6Z
 Bq0MaiwCdQsw==
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; d="scan'208";a="451626037"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.156.141])
 ([10.249.156.141])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 07:46:35 -0700
Subject: Re: [PATCH v2 0/6] ASoC: topology: Propagate error appropriately
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20200327204729.397-1-amadeuszx.slawinski@linux.intel.com>
 <e345ffe1-1593-49c0-32bd-4637bc1764da@linux.intel.com>
 <a7b5e659-01c9-f966-2d26-cac8d10b96bb@linux.intel.com>
 <f924fe56-0395-11af-244f-7074b7a704e5@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <2022e6f2-e3d0-746d-1d98-be4ea8e5d8f1@linux.intel.com>
Date: Wed, 8 Apr 2020 16:46:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f924fe56-0395-11af-244f-7074b7a704e5@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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



On 4/8/2020 4:20 PM, Pierre-Louis Bossart wrote:
> 
>>> Looks good to me
>>>
>>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>
>>> We probably want Ranjani to double-check this series though.
>>>
>>
>> Hi Ranjani, can you take another look, I would like for this to get 
>> merged before I forget about it ;)
> 
> Ranjani provided her Reviewed-by tag on March 30 - likely our emails 
> crossed.

That's probably what happened, I only asked, because "double-check" 
comment above caused me to think it may need another look. Thanks, for 
confirming it's good.
