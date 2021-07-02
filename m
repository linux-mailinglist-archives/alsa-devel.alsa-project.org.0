Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5653BA2BB
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 17:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48CF01682;
	Fri,  2 Jul 2021 17:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48CF01682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625239537;
	bh=6qJpFFoG4oy4tecJKvVP6F6GdyUWpEDH+dv+dPIRVxI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahD38rHruVbfdsOEPY9ekTFQWE+AJREsr9VuA03PrEk1E22VU4bjruvEiwrPqRCZ7
	 JTB1cc6VCEarEHbYC5c2eUJRWXIqbIeAayYSjbxhbwzwJy7BXi4MMKDfDVKxgHiXrL
	 tjbEfmfSnYTIWR1DqnorwSvzSmaGDnaFPAUtapzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BABB6F800BA;
	Fri,  2 Jul 2021 17:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECBC8F80229; Fri,  2 Jul 2021 17:24:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC40F800BA
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 17:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC40F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="XKxIw0YN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162F7JMa029971; Fri, 2 Jul 2021 10:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=nCl11Ztxy9lJZIC4M1uuENnOv4aXAQxt6+sQE32XdaI=;
 b=XKxIw0YNtQdl7oVhC8BA/CIz37SD5PcuimRRIWB8DbyiO6RjYWT9IpyKHtD/aGMWTrvs
 QvLC0hi1BSPxSf+ogwX2QLJvJvPLC1Yz0is1uZvJDVAnxHaTUMnXE6RMHhaXZSRoY8eP
 ijpo4a1nkWKGmrcUdX18uSe+jfv6WVaN5s6iQ+OhPZxd+GAmk8QiAfuxjRDB9Frt5pe9
 nhYrOVtgKK5UTTmUqlAugFzUsiQbDEgIcgOnkSJzLG3EIudkUaSXxx2NITRwgyAzix+A
 6H3Dzb/crws2UEF9yInHZlJJJrEYsxv10kEA5Xy2piWhP0QO3+v60MUyHH1DeoQkfoBh fw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39j40rr4cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 02 Jul 2021 10:23:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 2 Jul 2021
 16:23:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 2 Jul 2021 16:23:54 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com [141.131.64.84])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 508C3448;
 Fri,  2 Jul 2021 15:23:53 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Mark Brown <broonie@kernel.org>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
 <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
 <20210702120810.GA4416@sirena.org.uk>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <2a795a56-0b3d-069b-b31d-b8cee0b89f4f@opensource.cirrus.com>
Date: Fri, 2 Jul 2021 10:23:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210702120810.GA4416@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nrb_rR-cH4IxPJnRI8yfh-kvr3TOacfF
X-Proofpoint-GUID: nrb_rR-cH4IxPJnRI8yfh-kvr3TOacfF
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107020085
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On 7/2/21 7:08 AM, Mark Brown wrote:
> On Thu, Jul 01, 2021 at 03:22:53PM -0500, David Rhodes wrote:
>> On 6/29/21 6:51 PM, Pierre-Louis Bossart wrote:
>>>> +static irqreturn_t cs35l41_irq(int irq, void *data)
>>>> +{
>>>> +	struct cs35l41_private *cs35l41 = data;
>>>> +	unsigned int status[4] = {0, 0, 0, 0};
>>>> +	unsigned int masks[4] = {0, 0, 0, 0};
> 
>>> are those inits necessary, you override them below with the regmap reads?
> 
>> This one gets flagged by static analyzers so I'd like to keep the inits
> 
> That sounds like you have an actual issue and you're just shutting up
> the static analysers, not fixing whatever they were telling you.
> 

On 6/29/21 5:27 PM, David Rhodes wrote:
 > +	unsigned int status[4] = {0, 0, 0, 0};
 > +	unsigned int masks[4] = {0, 0, 0, 0};
 > +	unsigned int i;
 > +
 > +	for (i = 0; i < ARRAY_SIZE(status); i++) {
 > +		regmap_read(cs35l41->regmap,
 > +			    CS35L41_IRQ1_STATUS1 + (i * CS35L41_REGSTRIDE),
 > +			    &status[i]);
 > +		regmap_read(cs35l41->regmap,
 > +			    CS35L41_IRQ1_MASK1 + (i * CS35L41_REGSTRIDE),
 > +			    &masks[i]);
 > +	}

Pierre is correct that both arrays will always be fully initialized with 
regmap reads in the loop before any other access.
Without the explicit initialization, an analyzer that is not as smart as 
Pierre will tell me that the array values can be used uninitialized 
later on.
Presumably the tool does not unroll the loop to see that every array 
value is assigned.

So I don't think I have an actual issue, but I am just shutting up the 
static analyzers, although I do think I fixed what they were telling me.
