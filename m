Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FCC92CDFC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 11:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B4C4A4D;
	Wed, 10 Jul 2024 11:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B4C4A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720602785;
	bh=h754w0AZwBqaW9S+IIdF6AkvgEKM2drXdBzIPZttEuo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A2Fqruc8MGmz4LHNECiOMZo5H+u5/MJv7+4+Fb53lVMLQVeqfXh1J3L6aFi7WEmxl
	 4ZOai2OIs26+enQmEwndh9gWlPo6mKddq26FUS9a5ZgRlwfTbS1IWxbaQQzp6r5hf+
	 asNYCUBCg5UvpJRg+tOoJJkdefLCL1YSEoQMUXZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66EF1F805B6; Wed, 10 Jul 2024 11:12:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E86F805AE;
	Wed, 10 Jul 2024 11:12:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B85B4F801F5; Wed, 10 Jul 2024 11:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A949BF80074
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 11:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A949BF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k0mf0D5X
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46A4s4Cs006601;
	Wed, 10 Jul 2024 04:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=x/iSfhnjQc3v89FNYti7Mzilbr8FM6mdZXiL+wsib0c=; b=
	k0mf0D5XERMViEcaVCJPTU+KI1gRbAxVPVn7lo0j2EAcCIq3kIL8ntrhXuN5TwQq
	XVr4YNGcfF4+hGTAN6XEG+anDUBGw2A18W2BG2zoEan/RfcYSKkNhbYSP1G4NS4t
	gE0ovs1MA0xRtUlqYGy0f32QqSR/g2yJiuFvzRQdC0JG+jw0Vkelwsxo2aZshbhY
	0DaB6AYrSdF5HTQezBkPdmZzsLE/FB4BrOx5T5eaiWFCbzIX0i4vlk0CfuvWt2gw
	hV3/mB7to2lxLOG2Y6HSUurHiwwokmobPvHlwODeRsgaZSrOHEuXJUj8CMwChX9z
	OHDuomzwzFwaA371V8r9cQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 409c9a8f44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 04:09:39 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 10:09:38 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 10:09:38 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2F19D820244;
	Wed, 10 Jul 2024 09:09:38 +0000 (UTC)
Message-ID: <afc1a70b-4ed2-4afe-a506-1ca04d080342@opensource.cirrus.com>
Date: Wed, 10 Jul 2024 10:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: cs_dsp: Merge wmfw format log message into
 INFO message
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>
References: <20240709145156.268074-1-rf@opensource.cirrus.com>
 <20240709145156.268074-4-rf@opensource.cirrus.com>
 <Zo1YZHiE6WK3d8rm@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Zo1YZHiE6WK3d8rm@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b4iguY7-UgafPlxbRoTRuiiD-9X2YqcV
X-Proofpoint-GUID: b4iguY7-UgafPlxbRoTRuiiD-9X2YqcV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DE3BVVKTERKDVVEKFKDPFHU233PUUVQV
X-Message-ID-Hash: DE3BVVKTERKDVVEKFKDPFHU233PUUVQV
X-MailFrom: prvs=4921fba11f=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DE3BVVKTERKDVVEKFKDPFHU233PUUVQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/07/2024 16:33, Charles Keepax wrote:
> On Tue, Jul 09, 2024 at 03:51:55PM +0100, Richard Fitzgerald wrote:
>> Log the WMFW file format version with the INFO_TEST message.
>>
>> The behaviour of firmware controls depends on the WMFW format version,
>> so this is useful information to log for debugging. But there's no
>> need to use a separate log line just for this value.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>>   drivers/firmware/cirrus/cs_dsp.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
>> index 1bc2e0b6d40b..141a6c9d6737 100644
>> --- a/drivers/firmware/cirrus/cs_dsp.c
>> +++ b/drivers/firmware/cirrus/cs_dsp.c
>> @@ -1502,7 +1502,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
>>   		goto out_fw;
>>   	}
>>   
>> -	cs_dsp_info(dsp, "Firmware version: %d\n", header->ver);
>>   	dsp->fw_ver = header->ver;
>>   
>>   	if (header->core != dsp->type) {
>> @@ -1552,7 +1551,7 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
>>   		case WMFW_INFO_TEXT:
>>   		case WMFW_NAME_TEXT:
>>   			region_name = "Info/Name";
>> -			cs_dsp_info(dsp, "%s: %.*s\n", file,
>> +			cs_dsp_info(dsp, "%s (rev %d): %.*s\n", file, dsp->fw_ver,
>>   				    min(le32_to_cpu(region->len), 100), region->data);
> 
> Are we sure on this one? I don't think a WMFW is required to
> include an INFO/NAME block so it is now possible for this to not
> get printed. Granted I have not seen one that doesn't include
> at least one of these blocks but it isn't required. I think I
> would lean towards keening the separate print personally.
> 
> Thanks,
> Charles

The specification says that the first INFO block is mandatory, but
specifications can change so I don't mind leaving it on its own line.

I've just noticed a typo in the commit description (INFO_TEST should be
INFO_TEXT) so I want to send a V2 chain anyway.
