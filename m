Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E3F33937A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 17:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC611723;
	Fri, 12 Mar 2021 17:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC611723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615566851;
	bh=7ZBuZZPVrPMAVAG7414ujMQVJvAftjrTR/2NNJJOzYY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULR22PTRbnP4J4mAZQhRAJY7rp6267l/SMKB7fEczhrq1fsaf6T1PpZSS2x7AHDYF
	 Wro19YS9UNByFr6v5PorvGlFbEeL+WShGccI234E3RXniJvp8A/Qs8HwH9xu6lNiUF
	 DsusZAVQXFvJLjPBWKHUE/fgyc3UlpQxZYfRPMXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B11F801D8;
	Fri, 12 Mar 2021 17:32:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D6FDF8012A; Fri, 12 Mar 2021 17:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2655AF8016C
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 17:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2655AF8016C
IronPort-SDR: q03TGqLc4WxblQNSePc3vbjPTOkxxcmjDZKIaaIetUkrGHNstQbyTkzBlq0bkijzBSCoxjATSe
 UlIk/fHw4sMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="252871067"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="252871067"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:32:18 -0800
IronPort-SDR: 4nqTKbfU3+ak+nIu+kvLt/EF8ORR3pjTDWT7r7iH5Xo/GvZ3tgl4ZUhpZH0coQSmjkH+4c+M+h
 0DRiYZkfFTMQ==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="411057688"
Received: from akharche-mobl2.ccr.corp.intel.com (HELO [10.212.135.254])
 ([10.212.135.254])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 08:32:18 -0800
Subject: Re: [PATCH v3 2/2] ASoC: samsung: tm2_wm5110: remove shadowing
 variable
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 alsa-devel@alsa-project.org
References: <20210311003516.120003-1-pierre-louis.bossart@linux.intel.com>
 <20210311003516.120003-3-pierre-louis.bossart@linux.intel.com>
 <2be5ca0b-2b72-d1fd-7322-5b672c9ebede@canonical.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ac2ddf8-49c3-3dca-8575-f023c1518a98@linux.intel.com>
Date: Fri, 12 Mar 2021 10:32:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2be5ca0b-2b72-d1fd-7322-5b672c9ebede@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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



On 3/12/21 4:45 AM, Krzysztof Kozlowski wrote:
> On 11/03/2021 01:35, Pierre-Louis Bossart wrote:
>> cppcheck warning:
>>
>> sound/soc/samsung/tm2_wm5110.c:552:26: style: Local variable 'args'
>> shadows outer variable [shadowVariable]
>>    struct of_phandle_args args;
>>                           ^
>> sound/soc/samsung/tm2_wm5110.c:504:25: note: Shadowed declaration
>>   struct of_phandle_args args;
>>                          ^
>> sound/soc/samsung/tm2_wm5110.c:552:26: note: Shadow variable
>>    struct of_phandle_args args;
>>                           ^
>>
>> it's not clear why there was a need for a local variable at a lower
>> scope, remove it and share the same variable between scopes.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>   sound/soc/samsung/tm2_wm5110.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
>> index 125e07f65d2b..c1ab6c3afd0e 100644
>> --- a/sound/soc/samsung/tm2_wm5110.c
>> +++ b/sound/soc/samsung/tm2_wm5110.c
>> @@ -549,7 +549,6 @@ static int tm2_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	for (i = 0; i < num_codecs; i++) {
>> -		struct of_phandle_args args;
>>   
>>   		ret = of_parse_phandle_with_args(dev->of_node, "i2s-controller",
>>   						 cells_name, i, &args);
>>
> 
> The agreement was to keep it as in v2, so to have two local variables
> instead of bigger scope.

Ack, I misunderstood the feedback, will resend.
