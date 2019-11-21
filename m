Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30073105A50
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 20:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8433179E;
	Thu, 21 Nov 2019 20:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8433179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574364151;
	bh=xeSOrVJU3fszj1yx4iR8IBv5GSUVZsa5wNcgctZLl3I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2r21z8rja7o/AER3CHIUCeCBCo6YMtNbJehFxvKDAJajThOSlYN2bAMM3vAsOe4v
	 JKYw3XVl24lFRFwyL5TJkFtcssAvgYhITlbDWvjO+SDDNMSnmslzwdw3lxYxzMU23s
	 Km7ustbJZwPybQQLVt7khJfHx6Qn8b9tUBjgjVtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0C32F80146;
	Thu, 21 Nov 2019 20:20:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FD99F80146; Thu, 21 Nov 2019 20:20:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2505F800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 20:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2505F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 11:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,226,1571727600"; d="scan'208";a="259465489"
Received: from rpousson-mobl1.amr.corp.intel.com (HELO [10.255.88.8])
 ([10.255.88.8])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2019 11:20:37 -0800
To: Tzung-Bi Shih <tzungbi@google.com>
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-4-tzungbi@google.com>
 <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
 <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
 <7f055263-01a6-e1cd-8085-1790222bb808@linux.intel.com>
 <CA+Px+wX2UtU3As-3Bf4rWn1kzqDMPw60xk508gDDaOPk6Q5dgw@mail.gmail.com>
 <d97b9724-27d0-f157-ce5d-ed6c75bafae8@linux.intel.com>
 <CA+Px+wUSpYibKbOdj-XCXCnH9QN8=OtbeYMkhbj4ZREMj7V6Sg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <942ddeb1-762b-1e76-64cd-6450c6adc722@linux.intel.com>
Date: Thu, 21 Nov 2019 11:20:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUSpYibKbOdj-XCXCnH9QN8=OtbeYMkhbj4ZREMj7V6Sg@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
 conditions
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



>> if your interrupt sees an ULK status, it will schedule the pll_work.
>> You only test the status again *after* switching the device on/off, so
>> what is the side effect?
> 
> Both interrupt thread and pll_work thread access the status register.
> The side effect is: interrupt thread could read the status register
> right before pll_work thread's read.
> 
>> I am also wondering if you shouldn't sleep first in the loop, then check
>> the status?
> 
> ACK, "sleep first and check the status" makes more sense.
> 
>> And in case you do have a side effect due to the clear on read, maybe
>> you could save the status in a context and retest in the workqueue, that
>> way you'd have a trace of the ULK event even if the register was cleared.
> 
> I think cache the status couldn't be a good idea.  We couldn't make
> sure the freshness of the cache.

I was thinking more of treating it as a volatile, but it's ugly indeed.

> Can we suppose CPUs always get ULK=1 if PLL is unlocked so that we can
> simply ignore the case (2)?  Since we know the register is volatile
> and read the register via I2C should be much slower than hardware
> raise the bit.

Your option B with the small change to sleep then retest is probably the 
better solution overall.

BTW did you test this on both Baytrail and BSW chromebooks? In the past 
I saw baytrail devices exposed this error a lot more than BSW.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
