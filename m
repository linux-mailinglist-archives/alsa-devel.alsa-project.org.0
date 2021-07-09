Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B33C2B95
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 01:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DF3A1661;
	Sat, 10 Jul 2021 01:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DF3A1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625872390;
	bh=sl8h5GewnO0Yu9c/Y/sParjyz1hsTPYc4nOOL45SxBA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U7xSSe6cjpsW8dcQVOOPcTQlHEFIP5Pu+YcviCbRaLvG6Yg/mLz7hrc7v+fU+2Nxd
	 IQ3wE69PU6iF7L1Bxzjh9irLaimODMVHaL/LBjkA4nlJ4pBMeMn9SDlmNvLAHpdOqs
	 KWkSjyS9E7EKRcW8oPHHIEiRfmFH9X4oEV0exRJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4F10F80059;
	Sat, 10 Jul 2021 01:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D13EAF80224; Sat, 10 Jul 2021 01:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F35EF80059
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 01:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F35EF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bsL1u6IF"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169N7E5G023023; Fri, 9 Jul 2021 18:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=iO6332SrD2TsxTYtarF250moqEzacNYe/3J28HdgVHA=;
 b=bsL1u6IFr/FTHMd0HVjHUbwU+zR88FtV+Kw4wTM5VLD3QFKfWdpb4ugAwUKsGDdWBtMy
 8+pPNMAFx50eg61ize8DgXS3BOQ5jD3fSeftu5/ci9qo+q9HtzCmnmUXgX2jAjIDYSV9
 IuBHUSnoBmw/JHGb76zWNtdGd4IKt7oFjy7y7n9IAt3z7dDfckan2JYMhsdEcjGMkCVK
 XdIbmSjMgxwLyXuYjfbqdWV2KdlAe9dH8j5ptSlAgKrY5I+Q31cQL97kmDofBo3sl0TV
 gJsg+ME6n51sVECUODh+SQzIBmtnFQuNhMxGDap2LEqQyoLtC9WGqDPwnOVsOeXfaBP7 ww== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39nkxaat2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 09 Jul 2021 18:11:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 10 Jul
 2021 00:11:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 10 Jul 2021 00:11:35 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com [141.131.65.88])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9118945D;
 Fri,  9 Jul 2021 23:11:28 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Mark Brown <broonie@kernel.org>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
Date: Fri, 9 Jul 2021 18:11:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210705192054.GG4574@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AXf3CqzFZGWVX7RfSStWMwvjuqjwy2iU
X-Proofpoint-GUID: AXf3CqzFZGWVX7RfSStWMwvjuqjwy2iU
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 mlxlogscore=942 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107090119
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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

On 7/5/21 2:20 PM, Mark Brown wrote:

Thanks for the review. I believe I can fix all of these in the next 
revision.

> On Fri, Jul 02, 2021 at 03:51:26PM -0500, David Rhodes wrote:

>> +	struct regulator_bulk_data supplies[2];
>> +	int num_supplies;
> 
> Why might the number of supplies vary?
> 

Good point. This is set by the size of a const array so I will replace 
this with a #define.

> 
>> +	/* Check to see if unmasked bits are active */
>> +	if (!(status[0] & ~masks[0]) && !(status[1] & ~masks[1]) &&
>> +		!(status[2] & ~masks[2]) && !(status[3] & ~masks[3]))
>> +		return IRQ_NONE;
> 
> 
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> This seems to handle any asserted interrupt, is it clear on read?
> 

Theoretically every unmasked interrupt source should have a handler 
here, so the function should have exited early if there was nothing handled.
I think it's easier to read and more explicitly enforced if I change it 
so that the return code is only set to IRQ_HANDLED inside the conditions 
where the bits are actually cleared.

>> +	case SND_SOC_DAPM_POST_PMD:
>> +		regmap_read(cs35l41->regmap, CS35L41_PWR_CTRL1, &val);
>> +		if (val & CS35L41_GLOBAL_EN_MASK) {
>> +			regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
>> +					CS35L41_GLOBAL_EN_MASK, 0);
> 
> I can't see any references to GLOBAL_EN outside this function, why might
> it not be set?
> 

This check prevents an incorrect 'PDN Failed' message if DAPM 
initializes and turns the widget off at boot (with no prior power-up).


>> +	ret = devm_request_threaded_irq(cs35l41->dev, cs35l41->irq, NULL,
>> +			cs35l41_irq, IRQF_ONESHOT | IRQF_SHARED | irq_pol,
>> +			"cs35l41", cs35l41);
>> +
>> +	/* CS35L41 needs INT for PDN_DONE */
>> +	if (ret != 0) {
>> +		dev_err(cs35l41->dev, "Failed to request IRQ: %d\n", ret);
>> +		ret = -ENODEV;
>> +		goto err;
>> +	}
>> +
>> +	/* Set interrupt masks for critical errors */
>> +	regmap_write(cs35l41->regmap, CS35L41_IRQ1_MASK1,
>> +			CS35L41_INT1_MASK_DEFAULT);
> 
> Shouldn't this be configured prior to requesting interrupts or might
> there be a race?
> 

Should not be any problems with unmasking before the request as long as 
the pin configuration is also done beforehand.


Thanks,
David
