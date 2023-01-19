Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A89673A59
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:34:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C698085;
	Thu, 19 Jan 2023 14:33:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C698085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674135252;
	bh=jG9mDEQ09g2z3G7urdjCPOunzciZmP9L8hgRlvc6Egw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GEARD9Lh2lS0nwiKhGeaV66jLlBB/Tz+lsEO5LFXIGDWwb0KHbqwRkVGvWrdvzShg
	 AYLDP0ll1KJCamK3YzY5GEu8JS6LTb/3QFsAwNB3tSIFbA+rUwqFclW84b7VtZlMNA
	 tYywgc5Lh5qxKEJxGGKSueRZhtmgrvTmnX/GTZJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A49F80083;
	Thu, 19 Jan 2023 14:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6391F8047B; Thu, 19 Jan 2023 14:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A0CF80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A0CF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mkxbCxhj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30J6b7EP026436; Thu, 19 Jan 2023 07:33:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=Qdj5yJCTH6YPwOqPKaexQVYsrtIuqnvBl15sgQXVvOA=;
 b=mkxbCxhjOSZwYmYC9S9WNF207S1PSOAJlwg/4DjcojmCf1PoP8euiBET1ePiVgKl48UY
 6F0lVHqzv2cFYtAxKlyPgnqnUXp2wLk/zoRXc2f2mvKvua8HWJazC679YBQahbpyIXpW
 RvYsqd+2MmO3yDf0RK3RE1y/tCTHiwsXh3hHS0EKPjgCDxmsOlIeACxo3YPHkwbBS2TT
 b5njEeF0ExPMRiRQ1fBoukyrtYD0NZB8kTWDNU2s+cL8OVCcKRmN/Cwfa1GLD//v6p7V
 xTUp8tvShCNyZzc4RbHatFniYCW9imXNSXZEt60fL/p3qbscQp1ZpAJcHZIydMqxrGK3 sg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3n3tp6fxe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 07:33:05 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 19 Jan
 2023 07:33:03 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Thu, 19 Jan 2023 07:33:03 -0600
Received: from [198.61.64.248] (EDIN4L06LR3.ad.cirrus.com [198.61.64.248])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 032F1B12;
 Thu, 19 Jan 2023 13:33:02 +0000 (UTC)
Message-ID: <c19f2890-3c0f-5f72-d9fb-b59fe67205e8@opensource.cirrus.com>
Date: Thu, 19 Jan 2023 13:33:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/8] ASoC: cs42l42: Add SOFT_RESET_REBOOT register
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-3-sbinding@opensource.cirrus.com>
 <eb9fe53e-013b-e477-1d14-8d0c1c7514fc@linux.intel.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <eb9fe53e-013b-e477-1d14-8d0c1c7514fc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cUza3pSPXLNPOIesvK996hdxD_dFE0Qx
X-Proofpoint-GUID: cUza3pSPXLNPOIesvK996hdxD_dFE0Qx
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 18/1/23 16:41, Pierre-Louis Bossart wrote:
> 
> 
> On 1/18/23 10:04, Stefan Binding wrote:
>> From: Richard Fitzgerald <rf@opensource.cirrus.com>
>>
>> The SOFT_RESET_REBOOT register is needed to recover CS42L42 state after
>> a Soundwire bus reset.
> 
> Humm, you probably want to clarify the terminology, the 'soft reset' is

SOFT_RESET is what the register is called.

> defined in the SoundWire spec as the case where the peripheral device
> loses sync. Bus reset is a Severe Reset, but there's also a Hard Reset.
>
> does this 'SOFT_RESET_REBOOT' need to be accessed when there's a soft
> reset, or only after a Severe/Hard Reset?
> 

After a bus(severe)-reset or a forced(hard)-reset, but the code in
driver/soundwire doesn't issue FORCE_RESET so there's no need to handle
that. If there was some reason to have the core SoundWire code issue
FORCE_RESET it would also need to add a callback to all clients so they
can do any special handling.

 From the datasheet:

"After a FORCE_RESET, the master must issue a reboot command (set 
SFT_RST_REBOOT; see
p. 162) and wait for 2.5 ms.

After a bus reset, the master must issue a reboot command (set
SFT_RST_REBOOT; see p. 162) and wait for 2.5 ms."

SFT_RESET_REBOOT is in the SOFT_RESET_REBOOT register.

>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>> ---
>>   include/sound/cs42l42.h    | 5 +++++
>>   sound/soc/codecs/cs42l42.c | 2 ++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
>> index 1d1c24fdd0cae..3994e933db195 100644
>> --- a/include/sound/cs42l42.h
>> +++ b/include/sound/cs42l42.h
>> @@ -34,6 +34,7 @@
>>   #define CS42L42_PAGE_24		0x2400
>>   #define CS42L42_PAGE_25		0x2500
>>   #define CS42L42_PAGE_26		0x2600
>> +#define CS42L42_PAGE_27		0x2700
>>   #define CS42L42_PAGE_28		0x2800
>>   #define CS42L42_PAGE_29		0x2900
>>   #define CS42L42_PAGE_2A		0x2A00
>> @@ -720,6 +721,10 @@
>>   
>>   #define CS42L42_SRC_SDOUT_FS		(CS42L42_PAGE_26 + 0x09)
>>   
>> +/* Page 0x27 DMA */
>> +#define CS42L42_SOFT_RESET_REBOOT	(CS42L42_PAGE_27 + 0x01)
>> +#define CS42L42_SFT_RST_REBOOT_MASK	BIT(1)
>> +
>>   /* Page 0x28 S/PDIF Registers */
>>   #define CS42L42_SPDIF_CTL1		(CS42L42_PAGE_28 + 0x01)
>>   #define CS42L42_SPDIF_CTL2		(CS42L42_PAGE_28 + 0x02)
>> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
>> index 2fefbcf7bd130..82aa11d6937be 100644
>> --- a/sound/soc/codecs/cs42l42.c
>> +++ b/sound/soc/codecs/cs42l42.c
>> @@ -293,6 +293,7 @@ bool cs42l42_readable_register(struct device *dev, unsigned int reg)
>>   	case CS42L42_SPDIF_SW_CTL1:
>>   	case CS42L42_SRC_SDIN_FS:
>>   	case CS42L42_SRC_SDOUT_FS:
>> +	case CS42L42_SOFT_RESET_REBOOT:
>>   	case CS42L42_SPDIF_CTL1:
>>   	case CS42L42_SPDIF_CTL2:
>>   	case CS42L42_SPDIF_CTL3:
>> @@ -358,6 +359,7 @@ bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
>>   	case CS42L42_LOAD_DET_DONE:
>>   	case CS42L42_DET_STATUS1:
>>   	case CS42L42_DET_STATUS2:
>> +	case CS42L42_SOFT_RESET_REBOOT:
>>   		return true;
>>   	default:
>>   		return false;
