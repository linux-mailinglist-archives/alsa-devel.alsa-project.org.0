Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DA0C8F16
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 18:57:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D61FB167B;
	Wed,  2 Oct 2019 18:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D61FB167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570035437;
	bh=gCBGf6oAHQa3kFPCT17dD2lehJwpCLAVS1S51ogAKtA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhuDECALAN5JT9jo9wuroTkGfaARqGBDQn5cTGnXYY5Ci2H7VQUP0LculXh4ovyHQ
	 xoHDk6TO6WbB9vMMRMDUCKdSqS+U4Byx81yhapyM9NGWTIYrKpKWFa16GYZakaEZc1
	 oHbBN9utmJsBCh2b3TbXOEtcBvQXXqgZgU8jwwEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33021F803F3;
	Wed,  2 Oct 2019 18:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D1C0F80391; Wed,  2 Oct 2019 18:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EABB9F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 18:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EABB9F8016F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 09:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; d="scan'208";a="182102688"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 02 Oct 2019 09:55:24 -0700
Received: from abapat-mobl1.amr.corp.intel.com (unknown [10.251.1.101])
 by linux.intel.com (Postfix) with ESMTP id AFF035803E4;
 Wed,  2 Oct 2019 09:55:23 -0700 (PDT)
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191002113545.13500-1-perex@perex.cz>
 <28b45461-cb0e-0e1f-5007-98c4b15565d1@linux.intel.com>
 <3f7aabee-afac-c83e-e529-29e6abc8c104@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a3ffaba6-30ea-32f4-8ca6-68ca91d9d138@linux.intel.com>
Date: Wed, 2 Oct 2019 11:55:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3f7aabee-afac-c83e-e529-29e6abc8c104@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: add Intel DSP configuration /
 probe code
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


>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
>>> +	0x02c8,	/* Cometlake-LP */
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
>>> +	0x06c8,	/* Cometlake-H */
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>>> +	0x3198,	/* Geminilake */
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>>> +	0x5a98,	/* Broxton-P (Appololake) */
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_CANNONLAKE)
>>> +	0x9dc8, /* Cannonlake */
>>> +#endif
>>> +#if IS_ENABLED(CONFIG_SND_SOC_SOF_COFFEELAKE)
>>> +	0xa348, /* Coffelake */
>>> +#endif
>>
>> What about all the other PCI IDs that SOF handles, e.g. TigerLake, etc?
> 
> There is no PCI ID clash, only one driver will call the DSP probe and
> SND_INTEL_DSP_DRIVER_ANY will be returned in this case.

If we are talking about conflicts between the HDaudio legacy driver and 
SOF, I think all PCI IDs should be there. Not every OEM, or even all 
skews from a single OEM, will transition to DMICs and DSP enabled, and 
the legacy driver will still be required for many years.

> 
>> Also how do you deal with SKL/KBL cases with DMICs? They would need to
>> use the SST driver (for Chromebooks mainly)
> 
> As I noted in the comment, we can add dmi quirks on top. I just do not have
> enough information - can I take the hints from the pull request (your code)
> you already mentioned?

Sure. They should cover the main conflicts.

>> Even for APL, the 'official' driver is still SST for Chromebooks. SOF
>> should work but there will probably be missing firmware/topology files.
> 
> I can rework this part of course. I'll send v2 patch.

I see it now, will comment on the v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
