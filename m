Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3DE32A51E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 16:59:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A917175C;
	Tue,  2 Mar 2021 16:58:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A917175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614700776;
	bh=fdsA4pngkbZ/2sjhECKWhI/Cr8GWVf8rgHKPWCUy2q8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=up/uxXqi1f1Vn6hQNqOSHEyNpwYr4s0flc1RoIncbfBlTVmgUIXXTQFcRkpvRN4qF
	 LJS1rxnLDkwGhwhmGyYfmnJtmGW9x4Kk+vRzyoCy2saJRRVmCSA8Ur9alUqrgQRlCz
	 M2PpzolpIoNZMwQjsJttwA4HetaNQ7nRPKB6HpXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79AE9F80227;
	Tue,  2 Mar 2021 16:58:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 596A1F80269; Tue,  2 Mar 2021 16:57:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31072F8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 16:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31072F8012D
Received: from [100.112.128.20] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.us-west-2.aws.symcld.net id 13/04-42417-A706E306;
 Tue, 02 Mar 2021 15:57:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRWlGSWpSXmKPExsWS8eIhj25Vgl2
 Cwfn3MhZXLh5ispj68AmbxacP+1ktOnf1s1qs60+3+PX/GZPFy81vmBzYPTZ8bmLzWLznJZPH
 plWdbB7zTgZ67Hu7jM1jU+sSVo/Np6sD2KNYM/OS8isSWDNaHmYXdAtU/FvwlLmB8RhvFyMXh
 5DAf0aJ/kdP2SCc54wST1+sZe1i5OAQFvCQOLHHoouRk0NEwF7iyaztzCA1zAIvGCUuP5/CBN
 HQwygxad8fVpAqNgFtiS1bfrGB2LwCthL//j1gB7FZBFQkpr+dywJiiwqES7ze9JkRokZQ4uT
 MJ2BxTgFniVOdX8AWMwtoSqzfpQ8SZhYQl7j1ZD4ThC0v0bx1NjOILSGgIPG6fzYjhJ0g0fPv
 EdsERsFZSKbOQpg0C8mkWUgmLWBkWcVokVSUmZ5RkpuYmaNraGCga2hopGtoZKlraGyil1ilm
 6hXWqxbnlpcomukl1herFdcmZuck6KXl1qyiREYXykFjW07GGe++aB3iFGSg0lJlLfByy5BiC
 8pP6UyI7E4I76oNCe1+BCjDAeHkgSvbxxQTrAoNT21Ii0zBxjrMGkJDh4lEd6EGKA0b3FBYm5
 xZjpE6hSjopQ47+V4oIQASCKjNA+uDZZeLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v0F
 MoUnM68EbvoroMVMQItnuYEtLklESEk1MMnE9AeYmpzVus7l4r/ddZHyaYGqdKETG+9n/5y2h
 E268dcPhutPrDceW2qem3MqI0BWoDbG5l+SPcPtSZ0nOnf/f8ztZP/cvHRdYtj5Onv2cw07L5
 exTlzJP8eh8gOTh9bchUU+P78dthKfN0fnrKzHqZBM953/Ht9JMXfdcZbPfWpO7ed2zX61UKN
 2yxfrjE9Zf9Sensq5SmNd2oxM+1+d/bXbHjsc91Yoal/md60nw8RNU9g11HU5n6j3tOW7YlOk
 rgS/vmUinLhqv/LHkIaFtodTPPX3tr/ZqVy98YGAdnDoNOFM1oC5PnPUhQ9L93xx0bL5tf+LT
 aNteua6xS7fn83NqQhNv+Q6a6mdEktxRqKhFnNRcSIAoBtHZaoDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-335.messagelabs.com!1614700665!4127!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24434 invoked from network); 2 Mar 2021 15:57:46 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
 by server-15.tower-335.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Mar 2021 15:57:46 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 3F3CEF7B9A4DBD1B2804;
 Tue,  2 Mar 2021 10:57:45 -0500 (EST)
Received: from localhost.localdomain (10.38.104.43) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Tue, 2 Mar 2021
 10:56:43 -0500
Subject: Re: [External] Re: [PATCH] ALSA: hda: ignore invalid NHLT table
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <markpearson@lenovo.com>
 <20210302141003.7342-1-markpearson@lenovo.com>
 <420b9b48-0a80-634b-9a98-973c6bdb544c@linux.intel.com>
From: Mark Pearson <markpearson@lenovo.com>
Message-ID: <55a6f9e6-17ab-6049-d2e2-5dee1941b539@lenovo.com>
Date: Tue, 2 Mar 2021 10:57:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <420b9b48-0a80-634b-9a98-973c6bdb544c@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.104.43]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Philipp Leskovitz <philipp.leskovitz@secunet.com>
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

Hi Pierre-Louis,

On 02/03/2021 09:46, Pierre-Louis Bossart wrote:
> Adding Mark, Takashi, Jaroslav and Cezary in Cc:

Thanks - I wasn't sure who needed to be on this :)
> 
> On 3/2/21 8:10 AM, Mark Pearson wrote:
>> On some Lenovo systems if the microphone is disabled in the BIOS
>> only the NHLT table header is created, with no data. This means
>> the endpoints field is not correctly set to zero - leading to an
>> unintialised variable and hence invalid descriptors are parsed
>> leading to page faults.
>>
>> The Lenovo firmware team is addressing this, but adding a check
>> preventing invalid tables being parsed is worthwhile.
>>
>> Tested on a Lenovo T14.
>>
>> Tested-by: Philipp Leskovitz <philipp.leskovitz@secunet.com>
>> Reported-by: Philipp Leskovitz <philipp.leskovitz@secunet.com>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> 
> The change looks good to me
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Out of curiosity, does this impact Kabylake or CometLake+ systems?

We've seen it on some of our CometLake systems so far. T14 & T15 are
confirmed, but it will take a while to cycle through all the platforms.
We're unlikely to catch any non-Linux certified systems that folk still
put Linux on - I'd like to have this available for them too.

> 
> Thanks!
> 
>> ---
>>   sound/hda/intel-nhlt.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
>> index 059aaf04f..0889f2cc5 100644
>> --- a/sound/hda/intel-nhlt.c
>> +++ b/sound/hda/intel-nhlt.c
>> @@ -37,6 +37,11 @@ int intel_nhlt_get_dmic_geo(struct device *dev,
>> struct nhlt_acpi_table *nhlt)
>>       if (!nhlt)
>>           return 0;
>>   +    if (nhlt->header.length <= sizeof(struct acpi_table_header)) {
>> +        dev_warn(dev, "Invalid DMIC description table\n");
>> +        return 0;
>> +    }
>> +
>>       epnt = (struct nhlt_endpoint *)nhlt->desc;
>>         for (j = 0; j < nhlt->endpoint_count; j++) {
>>
