Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FECF4001A8
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 17:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CC318A6;
	Fri,  3 Sep 2021 17:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CC318A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630681401;
	bh=N/k0kyuhHSo296e4IYB5Y6W+LacXayCeiAMUjr9S+tY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ry3cm1py9adEHeuyX0+xFG+gY0acHaDj95vchSCHkeWsQukfrQI0uU3TdiDV5zInw
	 9w+fEDQdsQ2w6p/LvFpBLlhNuxjfA5WdOrwwb66uT7PdnjkceV+lZn+ByBRs0VV+P7
	 +DlVsCTlY02UEWzeiMXFPoZHORMo9xI59is8sdOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F843F80088;
	Fri,  3 Sep 2021 17:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53D16F80256; Fri,  3 Sep 2021 17:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1DAF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 17:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1DAF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="DVxEpa0Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 183CxG8g019091; 
 Fri, 3 Sep 2021 10:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=oPOvKUR2zukskM/++Z4x/uCryb2rsyHKiiCZR3lNKFs=;
 b=DVxEpa0Zg5Zy0D04Dge6y+CGKJmkPoJgB27TddI6+Suq26B1aXJi4OKt3r9xBqPdF227
 wIv0EsOR8NQa+yeZOHRXE7YfREC3VN/DBia3TlMIMtGjRnBDY8oZ1TfKvnwQ0V7fihzE
 b7fvPcodFhUmnoQWVUFFwcB1nnXyvkOAkTNr7VM6rr4pxDIO6mQ2oZJ0qFsbuGarMdXE
 i5Eefq6tK5NrMohYxapjY7LxwBKAC2NcMPMJxEN/n/JZJNtFRSq7y1l7hoXaeZ1Jv/g2
 VBvDf2zJap2mR8FG/PbPEFK4tzTF1RoJPUGvSAuDRCYsxyWgGcIYT/eCUViLuc4edyHj 9g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3aum6pg4br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 03 Sep 2021 10:02:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 3 Sep
 2021 16:02:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 3 Sep 2021 16:02:17 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.197])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 73DC7B13;
 Fri,  3 Sep 2021 15:02:17 +0000 (UTC)
Subject: Re: [PATCH v5 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <drhodes@opensource.cirrus.com>, <broonie@kernel.org>,
 <robh@kernel.org>, <ckeepax@opensource.cirrus.com>,
 <brian.austin@cirrus.com>, <patches@opensource.cirrus.com>,
 <alsa-devel@alsa-project.org>, <david.rhodes@cirrus.com>
References: <20210816224310.344931-1-drhodes@opensource.cirrus.com>
 <20210816224310.344931-2-drhodes@opensource.cirrus.com>
 <a0be6858-0d98-7f26-9ba5-f290c9809b5c@linux.intel.com>
 <cdabe1e9-5411-d2b6-d629-8ec87aa4c764@opensource.cirrus.com>
 <7c38ddb4-9ccc-130d-e977-4f39b01e2c9e@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <3061c9c7-24fb-4ba2-ee2a-d3af9ce10447@opensource.cirrus.com>
Date: Fri, 3 Sep 2021 16:02:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7c38ddb4-9ccc-130d-e977-4f39b01e2c9e@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N0N0byZzitHNSPgD_oTNxF_qsFDgDr35
X-Proofpoint-ORIG-GUID: N0N0byZzitHNSPgD_oTNxF_qsFDgDr35
X-Proofpoint-Spam-Reason: safe
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

On 03/09/2021 14:58, Pierre-Louis Bossart wrote:
> 
> 
>>> Is the ACPI probe smart enough to deal with two different drivers
>>> registering for the *same* HID?
>>>
>>> I haven't seen any precedent, e.g. the RT6777 uses a different ACPI HID
>>> for its I2C and SPI modes.
>>>
>>>
>>
>> I2C and SPI buses, when they are looking for a driver with an ID that
>> matches a device declared in ACPI, will iterate over drivers that belong
>> to the bus only (bus_for_each_drv()). It is not possible for an I2C
>> driver to be matched during SPI device enumeration or vice versa.
> 
> That's good but that use of the same HID for two different solutions is
> still be problematic. On ACPI solutions, we use the HID as a key to
> identify what machine driver to load, see e.g. snd_soc_acpi_find_machine().

We know that HIDs are required to setup machine-specific stuff, but that
doesn't prevent having a generic ID string. We still allocate a generic
ACPI ID for the part. As machine-specific HIDs are likely, there's no
strong reason to allocate two generic IDs for the same part.

Unfortunately we don't have a crystal ball to be able to include now all
the machine-unique HIDs that will be allocated in the future, so they
will have to be added when they exist.

> By using the *same* HID, you will prevent that machine detection from
> uniquely identifying what mode is used, and force the machine detection
> to be expanded with e.g. DMI-based quirks. It's really far from ideal
> for integrators. The only case where this would work with impacts on the
> machine selection would be if the choice of the SPI and I2C modes had no
> impact on the functionality of the device, but is this really the case?
> 

I can't think what you'd need to setup differently in a machine driver
for I2C versus SPI control. Do you have the bus ID hardcoded into your
machine drivers for some reason?
