Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2748C460
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 14:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD211B1E;
	Wed, 12 Jan 2022 14:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD211B1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641992792;
	bh=2MH7UM27geGzynYUnQwvuGnXtGE6rlKIkSswmv6Fno0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyLNFqjGssdJjPUeJ42Gnuw2GWwojj8DP/KzCiITovgvj8nLUGtdGsAD6UArjSjbT
	 SgFtHiV9QYwHBF4rRp11IW+w/zEVxnhIJVJLL2dRl+W+KyQ8gCALy5WDko2bwtsweY
	 0SJEOXebFMYu50C2yd75pOFVKYT6gXzm61hwII4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2498BF80054;
	Wed, 12 Jan 2022 14:05:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 350F6F800B9; Wed, 12 Jan 2022 14:05:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54116F800B9
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 14:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54116F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RTcH2yqL"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C3aG3Y027128;
 Wed, 12 Jan 2022 07:05:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=6qEp7FIsfc2aS94Jjc56bNCIgPLbqWS3T1SvLIBjUzE=;
 b=RTcH2yqLWjxmklKE8NQMJ03l4vdJ07C+B4M6+eItgrJlND5bx7kfEJXNeANW09ELlMQ3
 JBam2b0z6Md05j+RIxYAX99ZFN7cNjnrd4k6+EZx29CLzFTAlrT1FJGUYM/FYWjm2JB0
 QP/6fSppab5gblhCXq5pHNklrUAL0RTTXSLpaVOXMOmQCv/Tj4I5ekc6x81ebpwrwrqj
 Nsj44n9P6GAe/ed17yTm19U8gYjsi45Gcah2LDNrdeGVSW2RXcknQ5zE4C2e5XXx7H5U
 EefrdFEGdY/eQ8MBDoSAdpZF0exoRGWnbn9d4NPWck+LZFsLVGFwzm55OP8gt2CdG5JN fw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dhmc30ja9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 12 Jan 2022 07:05:11 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 12 Jan
 2022 13:05:09 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 12 Jan 2022 13:05:09 +0000
Received: from [198.61.65.50] (unknown [198.61.65.50])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EB8BCB10;
 Wed, 12 Jan 2022 13:05:02 +0000 (UTC)
Message-ID: <e2d39d52-c139-a94a-94cc-88841d3638e3@opensource.cirrus.com>
Date: Wed, 12 Jan 2022 13:05:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 08/10] ACPI / scan: Create platform device for CLSA0100
 and CSC3551 ACPI nodes
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>, 'Hans de Goede'
 <hdegoede@redhat.com>, "'Rafael J. Wysocki'" <rafael@kernel.org>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-9-tanureal@opensource.cirrus.com>
 <CAJZ5v0jTELqFeO6q6w_mYNo_yf1R9SX66RrEz0ZSe27w7E6kog@mail.gmail.com>
 <4b5506b1-20c6-3983-d541-86dc2388b2a7@redhat.com>
 <004001d7f5c6$7329d4d0$597d7e70$@opensource.cirrus.com>
From: Lucas tanure <tanureal@opensource.cirrus.com>
In-Reply-To: <004001d7f5c6$7329d4d0$597d7e70$@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ajAjh2HRcUl_MYpVwTUQ65XDdiVlIFiQ
X-Proofpoint-GUID: ajAjh2HRcUl_MYpVwTUQ65XDdiVlIFiQ
X-Proofpoint-Spam-Reason: safe
Cc: "'moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...'"
 <alsa-devel@alsa-project.org>, 'Liam Girdwood' <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, 'Takashi Iwai' <tiwai@suse.com>,
 'Mark Gross' <markgross@kernel.org>,
 'ACPI Devel Maling List' <linux-acpi@vger.kernel.org>,
 'Mark Brown' <broonie@kernel.org>,
 'Platform Driver' <platform-driver-x86@vger.kernel.org>,
 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
 'Len Brown' <lenb@kernel.org>
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

On 12/20/21 17:24, Stefan Binding wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: 17 December 2021 18:27
>> To: Rafael J. Wysocki <rafael@kernel.org>; Lucas Tanure
>> <tanureal@opensource.cirrus.com>; Stefan Binding
>> <sbinding@opensource.cirrus.com>
>> Cc: Len Brown <lenb@kernel.org>; Mark Gross <markgross@kernel.org>;
>> Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>;
>> Mark Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>;
>> moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...
>> <alsa-devel@alsa-project.org>; ACPI Devel Maling List <linux-
>> acpi@vger.kernel.org>; patches@opensource.cirrus.com; Platform Driver
>> <platform-driver-x86@vger.kernel.org>; Linux Kernel Mailing List <linux-
>> kernel@vger.kernel.org>
>> Subject: Re: [PATCH v6 08/10] ACPI / scan: Create platform device for
>> CLSA0100 and CSC3551 ACPI nodes
>>
>> Hi,
>>
>> On 12/17/21 18:19, Rafael J. Wysocki wrote:
>>> On Fri, Dec 17, 2021 at 12:57 PM Lucas Tanure
>>> <tanureal@opensource.cirrus.com> wrote:
>>>>
>>>> The ACPI device with CLSA0100 or CSC3551 is a sound card
>>>> with multiple instances of CS35L41 connectec by I2C to
>>>
>>> "connected" I suppose?
>>>
>>>> the main CPU.
>>>>
>>>> We add an ID to the i2c_multi_instantiate_ids list to enumerate
>>>> all I2C slaves correctly.
>>>>
>>>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>
>>> This requires an ACK from Hans.
>>>
>>> If you receive one, please feel free to add my ACK to it too.
>>
>> One problem which I see here is that this change conflicts with
>> this series:
>>
>> https://lore.kernel.org/all/20211210154050.3713-1-
>> sbinding@opensource.cirrus.com/
>>
>> I have reviewing that series on my todo list.
>>
>> One interesting question for you (Rafael) about that series is
>> that i2c-multi-instantiate.c, which after the series also handles
>> spi devices,is being moved to drivers/acpi .
>>
>> This is fine with me, but I wonder if it would not be better
>> to keep it under drivers/platform/x86 ? Since the new SPI
>> use-cases are also all on x86 laptops AFAICT.
>>
>> But back to this series, as said the 2 series conflict, since
>> both are being submitted by @opensource.cirrus.com people,
>> it would be good if the Cirrus folks can decide in which
>> order these series should be merged.
>>
>> It might be best to just move this one patch to the other series?
>> Thus removing the conflict between the 2 series.
>>
>> Regards,
>>
>> Hans
>>
> 
> We don’t really have a preference which order these two chains
> should be merged in. We would rebase the other chain if one
> got merged first.
> If pushed for an answer, maybe:
> https://lore.kernel.org/all/20211210154050.3713-1-sbinding@opensource.cirrus.com/
> should be merged first?
> 
> Thanks,
> Stefan
> 
>>
>>
>>>> ---
>>>>   drivers/acpi/scan.c                          |  3 +++
>>>>   drivers/platform/x86/i2c-multi-instantiate.c | 11 +++++++++++
>>>>   2 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>>> index b7a6b982226e..8740cfa11f59 100644
>>>> --- a/drivers/acpi/scan.c
>>>> +++ b/drivers/acpi/scan.c
>>>> @@ -1712,8 +1712,11 @@ static bool
>> acpi_device_enumeration_by_parent(struct acpi_device *device)
>>>>          static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
>>>>                  {"BSG1160", },
>>>>                  {"BSG2150", },
>>>> +               {"CSC3551", },
>>>>                  {"INT33FE", },
>>>>                  {"INT3515", },
>>>> +               /* Non-conforming _HID for Cirrus Logic already released */
>>>> +               {"CLSA0100", },
>>>>                  {}
>>>>          };
>>>>
>>>> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c
>> b/drivers/platform/x86/i2c-multi-instantiate.c
>>>> index 4956a1df5b90..a889789b966c 100644
>>>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>>>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>>>> @@ -147,6 +147,14 @@ static const struct i2c_inst_data int3515_data[]  =
>> {
>>>>          {}
>>>>   };
>>>>
>>>> +static const struct i2c_inst_data cs35l41_hda[] = {
>>>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>>> +       {}
>>>> +};
>>>> +
>>>>   /*
>>>>    * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>>>>    * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>>>> @@ -154,7 +162,10 @@ static const struct i2c_inst_data int3515_data[]  =
>> {
>>>>   static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>>>>          { "BSG1160", (unsigned long)bsg1160_data },
>>>>          { "BSG2150", (unsigned long)bsg2150_data },
>>>> +       { "CSC3551", (unsigned long)cs35l41_hda },
>>>>          { "INT3515", (unsigned long)int3515_data },
>>>> +       /* Non-conforming _HID for Cirrus Logic already released */
>>>> +       { "CLSA0100", (unsigned long)cs35l41_hda },
>>>>          { }
>>>>   };
>>>>   MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
>>>> --
>>>> 2.34.1
>>>>
>>>
> 
> 
As the ic2-multi-instantiate patch chain is still being worked out, we 
would like to submit a new chain for CLSA0100 id and a few fixes for the 
HDA cs35l41 driver.
And to avoid conflicts the ic2-multi-instantiate patch chain will wait 
for this new patch chain to be merged.

Thanks,
Lucas Tanure
