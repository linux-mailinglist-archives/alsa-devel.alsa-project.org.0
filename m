Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0B2335F9
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 17:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3271772;
	Thu, 30 Jul 2020 17:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3271772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596124010;
	bh=HsniolWYhJetipdmNlMOUOtzjd8cNUTXOI2D7ebve44=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vw1oPXgjCapvfOXBGXdeOGDSWYgK2eDk/HuyvlBslL47qJq0rAlSnpbdFM22dqX5H
	 CHGnTbNtvNLy27OUZ2FE3Anab6Bs9Xbqfn4pNKNdVqlW4MWdNZLDgm/QVl7z5BDMq3
	 1USSuygMH1EMRgv2NI2r/OSNCetHdGEUD/WxXcFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 689FCF8021C;
	Thu, 30 Jul 2020 17:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 161A2F8021E; Thu, 30 Jul 2020 17:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BCCAF800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 17:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BCCAF800C9
IronPort-SDR: Dh+RWpBsVdrcR+9HNGuUDUBoaSsX8vK57KUE6aBr5W/GV8YFh+03VCzlpr8g+ooRmg3vU8F4VH
 xICfcDUYfooA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="149086110"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="149086110"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 08:44:53 -0700
IronPort-SDR: BaDDVqq1GqCh5P3//G0SQJkoDZ+wJwOxaBVXR86DpT6KgejRLnM2kmkD5ysie2SG0I1YNg4Dog
 CTWy6xxIrUcw==
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="465284728"
Received: from jrwang2-mobl.amr.corp.intel.com (HELO [10.212.82.25])
 ([10.212.82.25])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 08:44:49 -0700
Subject: Re: [PATCH 2/2] ASoC: Intel: Add period size constraint on strago
 board
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596020585-11517-3-git-send-email-brent.lu@intel.com>
 <4fe97f63-e552-3b2f-803c-53894b196bfd@linux.intel.com>
 <DM6PR11MB36421D9A808D401416B72D2D97710@DM6PR11MB3642.namprd11.prod.outlook.com>
 <f1386a05-8866-9251-c751-21c9109aa35f@linux.intel.com>
Message-ID: <c00c47ad-abd7-d6e7-e3c5-a25a6a4f7f68@linux.intel.com>
Date: Thu, 30 Jul 2020 10:44:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f1386a05-8866-9251-c751-21c9109aa35f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Damian van Soelen <dj.vsoelen@gmail.com>
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



On 7/30/20 10:27 AM, Pierre-Louis Bossart wrote:
> 
> 
>>> Is this patch required if you've already constrained the period sizes 
>>> for the
>>> platform driver in patch1?
>>
>> Yes or alsa will select 320 as default period size for it.
> 
> ok, then that's a miss in your patch1. 320 samples is a multiple of 1ms 

typo: is NOT

> for 48kHz rates. I think it was valid only for the 16kHz VoIP paths used 
> in some versions of Android, but that we don't support in the upstream 
> code.
> 
> To build on Takashi's answer, the real ask here is to require that the 
> period be a multiple of 1ms, because that's the fundamental 
> design/limitation of firmware. It doesn't matter if it's 48, 96, 192, 
> 240, 480, 960 samples.
