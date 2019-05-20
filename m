Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F4238C7
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 15:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B39E822;
	Mon, 20 May 2019 15:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B39E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558360305;
	bh=7pRYPxdWc6WROJHz1RXG+FVCM9eXJDOZC2Zh8aAr63U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2+D3A8uDQkXNwv3JBrbGrzKeLuzZuvaPOBWOfTfKQOdn5krs/8F1KRGE8cWQDO0l
	 eu3a+3q/9E2zrjNPQjeU/Pt5CLAIV9BU/vM6y3lV8/vD8rxXFtKFBynS9wvx31L/jg
	 KyCB8s/jnuKNBJ71yAxcntM7toWlLPayw58R8KM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F78F89725;
	Mon, 20 May 2019 15:50:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2C18F896E9; Mon, 20 May 2019 15:49:38 +0200 (CEST)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55BA8F80726
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 15:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55BA8F80726
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 06:39:25 -0700
X-ExtLoop1: 1
Received: from ejleta-mobl.amr.corp.intel.com (HELO [10.254.104.211])
 ([10.254.104.211])
 by orsmga006.jf.intel.com with ESMTP; 20 May 2019 06:39:24 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190518183009.13359-1-pierre-louis.bossart@linux.intel.com>
 <20190518183009.13359-2-pierre-louis.bossart@linux.intel.com>
 <20190520123114.GA10827@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bc2f98be-6eb7-b668-8d6e-2be7e8ecc929@linux.intel.com>
Date: Mon, 20 May 2019 08:39:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520123114.GA10827@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Intel: sof-rt5682: Few minor
 fixes for AMP SSP and codec button
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



On 5/20/19 7:31 AM, Mark Brown wrote:
> On Sat, May 18, 2019 at 01:30:07PM -0500, Pierre-Louis Bossart wrote:
>> From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
>>
>>      This fixes:
>>      1. BIT mask for AMP SSP was incorrect.
>>      2. The RT5682 codec button mapping is corrected.
> 
> Indentation is a bit weird here, and these are really two changes that
> should be split.
> 
>> @@ -519,6 +520,7 @@ static int sof_audio_probe(struct platform_device *pdev)
>>   
>>   	/* compute number of dai links */
>>   	sof_audio_card_rt5682.num_links = 1 + dmic_num + hdmi_num;
>> +
>>   	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
>>   		sof_audio_card_rt5682.num_links++;
>>   
> 
> and this is an unrelated indentation change.

ok, I'll send a v2.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
