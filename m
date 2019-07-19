Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 168196EA9A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 20:22:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A19716E3;
	Fri, 19 Jul 2019 20:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A19716E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563560575;
	bh=PDLvxJTlsEddzPLTGtPvAnsyAG9WIJbGZ8W61ighkwI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cnlo9tcCCK1CSgCiWn6iSoNQ6O/owuzeeRDs6PMzyZq7rY89KCugP3oBQtrofFb/A
	 oTdSuEyEhLiLogdvRfdND7StVH5hRJ5YGhTm3UuJ98Tl5k1Kby8P87aqYIIMdyPza0
	 tOm5cJ+0iKj2KjOf7166uCaUfHN5g98Ba74zeuMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3966F80272;
	Fri, 19 Jul 2019 20:21:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68B46F80272; Fri, 19 Jul 2019 20:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2437BF8015B
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 20:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2437BF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 11:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,283,1559545200"; d="scan'208";a="176362374"
Received: from cvrozas-mobl1.amr.corp.intel.com (HELO [10.254.190.38])
 ([10.254.190.38])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2019 11:20:58 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190719170610.17610-1-pierre-louis.bossart@linux.intel.com>
 <20190719170610.17610-4-pierre-louis.bossart@linux.intel.com>
 <s5hmuh9zyjv.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ea75a45-94f2-e6f7-a374-4317467f4612@linux.intel.com>
Date: Fri, 19 Jul 2019 13:20:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hmuh9zyjv.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH 3/6] ALSA: hda: intel-nhlt: remove useless
 OR operation
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

Thanks for the quick review Takashi, much appreciated.

On 7/19/19 1:09 PM, Takashi Iwai wrote:
> On Fri, 19 Jul 2019 19:06:07 +0200,
> Pierre-Louis Bossart wrote:
>>
>> Each assignment is final so there's no point in doing an OR.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Please fold into the patch 2.  There is no reason to split.

Sure. I just wanted to keep this separate since patch2 is mostly about 
moving code. No problem to squash it.

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>   sound/hda/intel-nhlt.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
>> index b9d00c1b25d5..7ba871e470f2 100644
>> --- a/sound/hda/intel-nhlt.c
>> +++ b/sound/hda/intel-nhlt.c
>> @@ -73,13 +73,13 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
>>   			switch (cfg->array_type) {
>>   			case NHLT_MIC_ARRAY_2CH_SMALL:
>>   			case NHLT_MIC_ARRAY_2CH_BIG:
>> -				dmic_geo |= MIC_ARRAY_2CH;
>> +				dmic_geo = MIC_ARRAY_2CH;
>>   				break;
>>   
>>   			case NHLT_MIC_ARRAY_4CH_1ST_GEOM:
>>   			case NHLT_MIC_ARRAY_4CH_L_SHAPED:
>>   			case NHLT_MIC_ARRAY_4CH_2ND_GEOM:
>> -				dmic_geo |= MIC_ARRAY_4CH;
>> +				dmic_geo = MIC_ARRAY_4CH;
>>   				break;
>>   
>>   			default:
>> -- 
>> 2.20.1
>>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
