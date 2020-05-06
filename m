Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F311C7C1A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 23:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D7C17CB;
	Wed,  6 May 2020 23:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D7C17CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588799723;
	bh=YmolbI8aFprLKrM8upqgzckqLDQTesXm8XcP0dHuxXI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WdKA335rcNudzPUrlP05XULli7Y9y+nd9G0LaDiSaXk/uH981dlNUANYBrD5io7ZW
	 9KHJjvqeL/08/PAOyweprKI7P6fJcrZ1LcznnzI/EW0MZioH0z0xECZ0oJAmWcUP8w
	 9EkABSMNQNxSCGTlxSDr6G4bopGikVGFuQy7i4hY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B11C4F800AD;
	Wed,  6 May 2020 23:13:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A5F9F80249; Wed,  6 May 2020 23:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEE5AF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 23:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE5AF800DF
IronPort-SDR: h1pnpgeYmzJDPnSr9ECarQ+ZElvDkXRZQLnHnysp/RolNmHE3/l2TjB9Y22sLKiV3jyZWzXj8B
 kC48R6kuVkRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 14:13:29 -0700
IronPort-SDR: 12fpvGWkf7lVVtJvSmTrMmpXoJBU702RoS7ILf+F20oZU3hlfmggWnAsWTTC5qwrWaLOqcmgBm
 W6LMwP4yts5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="249054992"
Received: from gfhellma-mobl1.amr.corp.intel.com (HELO [10.255.228.157])
 ([10.255.228.157])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2020 14:13:29 -0700
Subject: Re: [PATCH] ASoC: Intel: Skylake: Update description for HDaudio
 kconfig
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <20200506205224.7577-1-cezary.rojewski@intel.com>
 <41c6fa62-d489-32ba-5575-6fc4548ebf18@linux.intel.com>
 <7f1c7582-9c47-06dc-2f7e-b5d7cbd42557@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91391a10-99f6-0b20-3852-d3ba585c696e@linux.intel.com>
Date: Wed, 6 May 2020 16:13:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7f1c7582-9c47-06dc-2f7e-b5d7cbd42557@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com
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


>>> +      If you have Intel Skylake or Kabylake with HDaudio codec
>>
>> I would have added HDaudio codec + dmic but that's good enough, the 
>> selection based on DMIC presence will be done by your other patch so
>>
>> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> Thanks Cezary.
>>
>>
>>> +      then enable this option by saying Y or m.
>>>   config SND_SOC_INTEL_SKYLAKE_COMMON
>>>       tristate
>>>
> 
> Do you want me to spin v3? While copying desc from other kconfgs, I 
> added 'or m' by mistake. Don't mind to update once more if you want me to.

That would be nicer indeed if you don't mind, thanks!
