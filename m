Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F164FAA55D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2019 16:02:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7211697;
	Thu,  5 Sep 2019 16:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7211697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567692174;
	bh=ngVF0jZ83hMaeO+xSBAegPcCSMkzk8WLcw0ypFXaHvQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPEN2Wzcd5NHGqf8/bt06uKYujuzait+O0blDCkuUUW4SeIjvHyWDsVRlvlTG3Lwz
	 ZB9H8y8YKhGdOMSND7v6LHov9czNucAKLDGd/1D4pHmkqHx48fiMRyoghNwhsY/6IX
	 keUMURMgOlJ28+8EKqvI8rkN09hRtYO0NZRj1//s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2B2F8049B;
	Thu,  5 Sep 2019 16:01:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5609F80448; Thu,  5 Sep 2019 16:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE071F80227;
 Thu,  5 Sep 2019 16:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE071F80227
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 07:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="334564133"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 05 Sep 2019 07:00:52 -0700
Received: from ravisha1-mobl1.amr.corp.intel.com (unknown [10.255.36.89])
 by linux.intel.com (Postfix) with ESMTP id 2FE8D580417;
 Thu,  5 Sep 2019 07:00:52 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190905053302.9262-1-pawel.harlozinski@linux.intel.com>
 <20190905053302.9262-2-pawel.harlozinski@linux.intel.com>
 <s5ha7bjgup9.wl-tiwai@suse.de>
 <9b997691-a609-e7b5-94a6-d42e26dfa080@linux.intel.com>
 <s5h8sr2rihf.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7c3b8568-0d22-c1b4-47c7-3332e93bda53@linux.intel.com>
Date: Thu, 5 Sep 2019 09:00:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5h8sr2rihf.wl-tiwai@suse.de>
Content-Language: en-US
Cc: cezary.rojewski@intel.com, patch@alsa-project.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, broonie@kernel.org,
 Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/3] ALSA:core: Add rate 24kHz
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>>> Adds SNDRV_PCM_RATE_24000 at the bottom to keep backward compability
>>>> with alsa library.
>>>>
>>>> Signed-off-by: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
>>>
>>> No.  Such a fancy rate has to be handled inside the driver locally
>>> instead of adding to the common rate.
>>
>> It's not that crazy, this is supported in the HDaudio spec:
>>
>> Sample Base Rate Divisor (DIV):
>> 000 = Divide by 1 (48 kHz, 44.1 kHz)
>> 001 = Divide by 2 (24 kHz, 22.05 kHz)
>>
>> I am not sure why 22.05 made the cut and not 24 kHz, they are both
>> derived from common clocks with the same divider... Same for 11.025
>> and 12...
> 
> I'm not against supporting it.  It'd be fine if it were the changes
> that are applied only to HD-audio driver side.  What I'm against is to
> change the ALSA PCM core.  It's not necessarily done there at all.

Humm, out of curiosity what is the issue here? Would this addition break 
anything? I don't personally care too much but I've never quite 
understood why the ALSA core only defined a subset of 'common' rates.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
