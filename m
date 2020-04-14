Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EECA1A8037
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:47:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8FFB16A5;
	Tue, 14 Apr 2020 16:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8FFB16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586875631;
	bh=CFyx2jlgch7SVqn9pfr9H+vVrWh9pK1WZvkRuAqAD4U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IMG3lU2AXWN3N9UEKqhhX1pLiraYs/2Lo0KjZRVqz+q/RYQ1Gdv/TshYKvJEoZJjH
	 04l8R8HIbfb14KlrJEJGhe47jicrziZNOaIP0w38wCfrA9ARI6mQ8Ea2f2iHW6W9bS
	 pw8jjg92RfrsR5H7TFZwqPlgHxZrXw6JrQIWpT0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED0EDF800B9;
	Tue, 14 Apr 2020 16:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D04C0F8013D; Tue, 14 Apr 2020 16:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D489F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D489F800F5
IronPort-SDR: Lj61EX4RbPCDfFZwncrjiarsSl4iPYy3GPMf5zQKCgs7WtUgiA/qvlzyK60aut93ATMm/KuPl1
 tpG90chuXO0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 07:45:19 -0700
IronPort-SDR: Lpqgqpuu8dkosUXnpShP+Se6gy09TW2I5uYsHkAFKYCyD2U13pjPC11BnEM3LP4Io2ww7omEDk
 ZE0E8zyZ7Sbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="288236775"
Received: from bjkulkar-mobl.amr.corp.intel.com (HELO [10.212.152.71])
 ([10.212.152.71])
 by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2020 07:45:18 -0700
Subject: Re: Regression on Intel Atom/SST/Baytrail devices w/ v5.7-rc1
To: Hans de Goede <hdegoede@redhat.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
References: <4d9d2c14-4db7-1a98-9b3d-e9193333e1b9@linux.intel.com>
 <c863319e-51bf-37e9-e550-5f1af1267408@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e75d7390-7375-a8b2-90f0-7041c8618bd3@linux.intel.com>
Date: Tue, 14 Apr 2020 09:45:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c863319e-51bf-37e9-e550-5f1af1267408@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


>>
>> Both 5.5 and 5.6 work though, as if we are missing a set of 
>> dependencies? I am running out of time this evening, but I'd be good 
>> to see if anyone else reproduces my findings.
> 
> I saw the same thing yesterday, also when testing UCM changes :)
> 
> I was planning to bisect this myself today. But given your findings I'm 
> not sure
> if that is useful.  I would count the intermediate errors as also being 
> bad I guess
> and try to find the first bad commit and see from there.
> 
> Can you send me your git bisect log ?

I didn't keep it but it pointed to v5.6-rc1 as the first bad commit - 
rather useless.

I'll try to spend more time on this later today.

The good thing is that it's not an isolated hardware problem, so we will 
likely reproduce this and converge to a solution faster. I only have 2 
devices that work reliably.

