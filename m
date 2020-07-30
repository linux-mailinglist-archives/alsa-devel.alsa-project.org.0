Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452B233888
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 20:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D7611689;
	Thu, 30 Jul 2020 20:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D7611689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596134404;
	bh=E717SwRHsGqKCohIWUBC+84xWPs3I2o8nnpLIfn2Tl4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2xsIeIrImsdZy4WQNcAK3gFUq2t0i5v/FhFTNdNZecsCJHiTnyZaWZYfQg3ClKsJ
	 l8UOtcAze8UhsFYNuxKjd4DEb9wDKqXR/hgN4SEfIj3wRzj8l/mmgLIkO7qqxT+eAs
	 R+Mi/G/aRmsVLePOEShoWlaUIaEVHUcGY3yypFHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACBC0F8012F;
	Thu, 30 Jul 2020 20:38:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D087F8021E; Thu, 30 Jul 2020 20:38:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8881F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 20:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8881F800C9
IronPort-SDR: oPtR655JIsxRdtYPJe0HKtkN3Fa23u64J/+vGtEhtni6MFD+cLtLiRKyFr1ys8HEn2qmt43LHi
 R8RO8AKheUxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169787303"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="169787303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 11:38:05 -0700
IronPort-SDR: FPjYbb1TW3L4whhMsOLH1TLxUEGzNdWJopA/HFLO/I0RyfO1Vhws99iWGBeMkouYm5MIl6f590
 FwqFMTfwztfA==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="286946371"
Received: from jrwang2-mobl.amr.corp.intel.com (HELO [10.212.82.25])
 ([10.212.82.25])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 11:38:04 -0700
Subject: Re: [PATCH v2] ASoC: Intel: boards: eve: Fix DMIC records zero
To: "N, Harshapriya" <harshapriya.n@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>
References: <1596129988-304-1-git-send-email-harshapriya.n@intel.com>
 <2788f0fd-adaa-c56d-6801-503432ba7ee6@linux.intel.com>
 <BY5PR11MB4307932CDA8DD4C0F594BCA2FD710@BY5PR11MB4307.namprd11.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8cd83872-c6d3-faf2-bd1a-963af90d7d2a@linux.intel.com>
Date: Thu, 30 Jul 2020 13:38:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB4307932CDA8DD4C0F594BCA2FD710@BY5PR11MB4307.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Lu, Brent" <brent.lu@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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




>>>    	case SND_SOC_DAPM_POST_PMD:
>>> -		clk_disable_unprepare(priv->mclk);
>>> -		clk_disable_unprepare(priv->sclk);
>>> +		if (__clk_is_enabled(priv->mclk))
>>> +			clk_disable_unprepare(priv->mclk);
>>> +
>>
>> [1] this seems wrong in case you have two SSPs working, and stop one.
>> This would turn off the mclk while one of the two SSPs is still working.
> For this platform we use either headset or dmic.
> There is no way we can record simultaneously using different devices.
> So disabling mclk might not be harmful here. But this case will always be true too :).

Maybe CRAS prevents you from recording on two inputs, but it looks like 
you have independent front-ends so in theory couldn't you record at the 
alsa hw: device level? Is this really mutually exclusive at the hardware 
level?

Also is the clock only needed for the rt5663 and rt5514, the amplifier 
does not need it?

>>
>>> +		if (__clk_is_enabled(sclk))
>>
>> [2] Again is this test needed since sclk is not shared between SSPs
> Same thought process to check if its enabled or not. Will remove that.
>>
>>> +			clk_disable_unprepare(sclk);
> 
