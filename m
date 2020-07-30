Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B9233741
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 19:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5012C169E;
	Thu, 30 Jul 2020 18:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5012C169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596128429;
	bh=ba64Js+TGODdBRJ87gWH3oWUthMr5N+XQUCz8wmKeDo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gum9S9ioXdPU2upy9XusLMM/tuKyUsiRqh62dzmoCKF8AMARv7A+e7yB4wS2jFyll
	 y9cihCzqGP96xv6dYZaZ/ThUJ+0lCUDIlxYqaesYjVqGzxlh/SzyCySdLy0KSpgn5A
	 2ADZ+WAr9pG75AncIb2MQYxW8Npg/LWW2Z2d7kaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8365EF8012F;
	Thu, 30 Jul 2020 18:58:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A30F80227; Thu, 30 Jul 2020 18:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23FA8F8012F
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 18:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23FA8F8012F
IronPort-SDR: SIDyVXlNis07Y13x7PAxWlFUo/PwD7y35npo1W6W+WOIEJbyzYWlh6ZxPZvRvJmjriWQlU80ic
 BqDLpmzbUTkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="150830485"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="150830485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:58:28 -0700
IronPort-SDR: RdTLHbM04lI9XCLKp6buXkfiRqIwcvCYkZDN/IoSbDurEgxWl2lmfDLb8ingicYmEUvwG7a0B0
 LJuAdC4mAHtw==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="286918281"
Received: from jrwang2-mobl.amr.corp.intel.com (HELO [10.212.82.25])
 ([10.212.82.25])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:58:27 -0700
Subject: Re: [PATCH] ASoC: da7219: Fix general protection fault in
 da7219_register_dai_clks
To: Mark Brown <broonie@kernel.org>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
References: <1596117868-3317-1-git-send-email-yong.zhi@intel.com>
 <AM7PR10MB3640075298BCB15AFB22A9D480710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <MW3PR11MB4665FA01F552E3BCB69EA2F285710@MW3PR11MB4665.namprd11.prod.outlook.com>
 <AM7PR10MB3640C50CDF650A4710E7B65680710@AM7PR10MB3640.EURPRD10.PROD.OUTLOOK.COM>
 <20200730162808.GD5055@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6381232d-8226-fd0a-37bc-6bc42451b5e3@linux.intel.com>
Date: Thu, 30 Jul 2020 11:58:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730162808.GD5055@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Zhi,
 Yong" <yong.zhi@intel.com>
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


>>> When the card was uninstalled with modprobe -r, the da7219 codec was not
>>> removed, only component da7219_remove() is invoked, do you suggest the
>>> component driver probe and remove has to happen with da7219_i2_driver probe
>>> and remove together? Thanks for the code review.
> 
>> Well as far as I understand it the the devm_* allocated resources are tied to
>> the i2c dev. If I'm correct then unless that's removed then those resources
>> won't be freed. If this is a valid scenario then we would probably have to look
>> at avoiding all devm_ calls in the da7219_probe() code as they wouldn't be
>> released when doing what you are here.
> 
>> Mark, what's your take on this? Am I missing something obvious?
> 
> You're not missing anything, you shouldn't be doing devm allocations at
> the CODEC level only at the device model level.  I'm somewhat confused
> why you would be registering clocks at the device model level TBH.

I am afraid we have quite a few codec drivers used in x86/ACPI platforms 
using devm_ clk functions at the component probe level...see e.g.:

da7213, da7218, da7219, es8316, es8328, max98090, max98095, rt5514, 
rt5616, rt5640, rt5682, tlk320aic32x4

some do even worse: nau8825, tlv320aic32x4 call devm_ functions in 
set_sysclk.

The module load/unload tests used for SOF remove all the drivers, so as 
Adam was saying this should not happen if you remove the codec driver.

It already took us quite a bit of effort to make sure all resources are 
properly allocated/released. We still have known issues when removing 
the platform driver only, mainly with HDaudio. I wasn't aware of this 
case for I2C codecs, I guess this just made the list of TODO cleanups 
even longer. D'oh!
