Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F47321D58
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF55F167F;
	Mon, 22 Feb 2021 17:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF55F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614012425;
	bh=bPwV1DafXau/tpDD6NPETwn3+8jL+wEn3aMjuHBEBk4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SuM4VoGPq7YCKHGpiCZjnfsYuofEGEH3kSz0a61v/6ev+/HGPowaXMnYHvZPoROC1
	 Y56x9L6AjPE5YmXKiZs9reld5/z5xtfyMbfS+ssnII47NwjJjtXKINP+vdoIVqhXNZ
	 B5DRisHdfCTEqctNXrhCYsY/cggTy1c4jJNXnF98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0F25F8025E;
	Mon, 22 Feb 2021 17:45:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 524B4F8025E; Mon, 22 Feb 2021 17:45:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 714D1F800CE
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 714D1F800CE
IronPort-SDR: cK9V4HpEoMxUhEQLWJ8uwXy1ETO2I7qwNxJ7zMDTXRphz5C+iovkXdI0s7r9WlQc3DQurPpH9q
 TC2egt/ZEjoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="184619478"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="184619478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:45:11 -0800
IronPort-SDR: BklHK+cBNr3Prsngztc5XKjmGT+sqG4iEy4X/nPRRM3kwTuZI9ITgzzYzxYJjKgjV+IaKDx9MS
 NYa61uGEytxg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="364072169"
Received: from cjmerril-mobl1.amr.corp.intel.com (HELO [10.212.252.139])
 ([10.212.252.139])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:45:10 -0800
Subject: Re: [PATCH 5/6] ASoC: samsung: tm2_wm5110: check of_parse return value
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
 <20210219230918.5058-6-pierre-louis.bossart@linux.intel.com>
 <20210221111055.nfzr5nzvskdc3jyq@kozik-lap>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ac9fd25e-d5dd-6c47-07fc-ba05e33f60dd@linux.intel.com>
Date: Mon, 22 Feb 2021 09:35:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221111055.nfzr5nzvskdc3jyq@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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


>> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
>> index 9300fef9bf26..da6204248f82 100644
>> --- a/sound/soc/samsung/tm2_wm5110.c
>> +++ b/sound/soc/samsung/tm2_wm5110.c
>> @@ -553,7 +553,7 @@ static int tm2_probe(struct platform_device *pdev)
>>   
>>   		ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
>>   						 cells_name, i, &args);
>> -		if (!args.np) {
>> +		if (ret || !args.np) {
> 
> Only "if (ret)" because args.np won't be initialized on errors.

Thanks Krzysztof for the review, I will make that change in a v2.
But just to be clear, there's no need to test args.np then?
