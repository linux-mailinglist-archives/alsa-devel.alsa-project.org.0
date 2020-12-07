Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA772D1E9D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 00:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8057315F2;
	Tue,  8 Dec 2020 00:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8057315F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607385387;
	bh=OODRm3cE9z/wyT1WYnHGzPxNBCV50bjoSnsGEU1Ajqo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vSoAH3SsozxjzLU35KvnLKZj2KUs+3rT45947LapwHB9mNCjOXSoQatFZwSsPJQHF
	 RBg0m6NfuUsneV/K4XsqZsru2qpDIEqkApewgU6bK+FX5CbEsBSnJ7RmCSHBOSdRnn
	 mPsIHPJ5erpADDQQ83Q+Y3/ZzgdoErYmBY6objiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD759F8015B;
	Tue,  8 Dec 2020 00:54:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA446F80217; Tue,  8 Dec 2020 00:54:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0524FF8015B
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 00:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0524FF8015B
IronPort-SDR: CUKiXYjgvWdP9HfPTGQYjYImcATfqvxYgAECJfbGHxAY/X5qcJdcD3zp3hAMB88m0sdJLtvERD
 +aEvBa2e3Amw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="171230478"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="171230478"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 15:54:42 -0800
IronPort-SDR: 9dvKWTteYi4Y+47LmWK27eirQ55fIYTl2RuyBWXFrhfZf0g3dE3+hWYS9vjCIYbc3WOLHuVtZE
 8mW1QfQxOefA==
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="483410901"
Received: from cegeorge-mobl.amr.corp.intel.com (HELO [10.212.61.7])
 ([10.212.61.7])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 15:54:41 -0800
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
To: Lars-Peter Clausen <lars@metafoo.de>,
 "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 "Sia, Jee Heng" <jee.heng.sia@intel.com>,
 "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
 <20201117155038.GO4077@smile.fi.intel.com>
 <CO1PR11MB50269CF832CD14BA2D2A883CDAE10@CO1PR11MB5026.namprd11.prod.outlook.com>
 <20201118145055.GW4077@smile.fi.intel.com>
 <CO1PR11MB5026A81C4294BEF4EE5EF923DAFB0@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB30465A81744EA686D2502DB69DF50@BYAPR11MB3046.namprd11.prod.outlook.com>
 <e9bae9eb-6b8b-5a8c-eba0-d7f5da955987@metafoo.de>
 <20201130110915.GI4077@smile.fi.intel.com>
 <74ed61e1-67d9-d7b7-0619-fbe61ad7a583@metafoo.de>
 <CO1PR11MB502600945CC303756DBBC30ADAF40@CO1PR11MB5026.namprd11.prod.outlook.com>
 <BYAPR11MB3046DFC48A045ADA72D0F9369DF00@BYAPR11MB3046.namprd11.prod.outlook.com>
 <17462280-244f-0c1e-61f2-6dd197dbcd2d@metafoo.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2e29264a-a64d-f1f7-8695-ae7463a773a5@linux.intel.com>
Date: Mon, 7 Dec 2020 09:36:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <17462280-244f-0c1e-61f2-6dd197dbcd2d@metafoo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
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




> If you really want to limit your period size you need to install a range 
> constraint on the SNDRV_PCM_HW_PARAM_PERIOD_SIZE parameter.
> 
> But I'd highly recommend against it and just split the transfer into 
> multiple segments in the DMA driver. Needlessly limiting the period size 
> will increase the number of interrupts during audio playback/recording 
> and hurt the power efficiency of your system.

Yes that was also an objection from me, the fix should be in the DMA 
level. The 1024 block limitation would mean restricting the period size 
to be at most 5.3 or 10.6ms (16 and 32-bit cases). That's way to small.
