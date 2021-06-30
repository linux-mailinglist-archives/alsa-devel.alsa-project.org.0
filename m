Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DC3B8A23
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 23:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F03E1850;
	Wed, 30 Jun 2021 23:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F03E1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625089016;
	bh=X/GwsvBawuMevL9/pcr9YEhKB9lp6MNS/BGqoo2MPqg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFWzBBiifVsq8U5mtRRdnFXGS7Zuj7lDJ9RbQpVZPbb4lKs5oftQeSEIAeQ2jvwU9
	 BbLLpGyLEODXsOJFuQL/+xwXUxVRSBVqc/lV+1KE3hXX981uWlTCAWfHRkjf+ooagM
	 UqbTfkxy9+fdKmPjEfq7p505NTn9V2fXwfxJdcaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1605AF80240;
	Wed, 30 Jun 2021 23:35:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B62F80229; Wed, 30 Jun 2021 23:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A6DFF8020C
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 23:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A6DFF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ic0a0vtC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ULUg1p025646; Wed, 30 Jun 2021 16:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=t3WVrSDESxT6qPLEWoFh8SSANEvuzseNPWesieHFCgk=;
 b=Ic0a0vtCzWZ1NHJnf6KjuBhwpEFZmLPgMGXZYZ1/sjJAZVUDl+T3cIg12X5NM1Fgby55
 MES89rWHTVctg/G+/Oak+/bVBi50CjRgBtsl3UaM8Pdyi0d5p2Z3RbY8GHKJmTt9jDFq
 NFDCoGeYkxRe04ccOkG8yQVoGHPN9Q2gNysE8NH16I6+3f+Tsbail3uQvutT2ckjv6Yp
 L2giIjIL0UAIHaWw9+3vIOeo/FbXdigmq0HOgb/8b/RIpX0sIIH/PzuZk+Fo3s9L6Wmv
 y1g245sy7o+7lrbxlsupgUpXmBWXwgDsh+nzobKBFlq586tAkDPUtiql2m4JPm3NrZMP Cg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 39gg1whajv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Jun 2021 16:35:16 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 30 Jun
 2021 22:35:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 30 Jun 2021 22:35:14 +0100
Received: from [192.168.99.238] (macC02XQ1DJJG5K.ad.cirrus.com
 [141.131.65.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 34CBF448;
 Wed, 30 Jun 2021 21:35:08 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>, <robh@kernel.org>,
 <ckeepax@opensource.cirrus.com>, <brian.austin@cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <david.rhodes@cirrus.com>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <9e432f81-9229-57d3-5231-50d6f935d084@opensource.cirrus.com>
Date: Wed, 30 Jun 2021 16:35:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qyi14v8YMlHa3VIG9mvYp2VWjiTF8neF
X-Proofpoint-ORIG-GUID: Qyi14v8YMlHa3VIG9mvYp2VWjiTF8neF
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300119
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

On 6/29/21 6:51 PM, Pierre-Louis Bossart wrote:
> 
>> +#ifdef CONFIG_ACPI
>> +static const struct acpi_device_id cs35l41_acpi_match[] = {
>> +	{ "CSC3541", 0 }, /* Cirrus Logic PCI ID + part ID */
> 
> Wrong comment or wrong ID, "CSC" is clearly not a PCI ID?
> 

CSC is a PnP ID, not a PCI ID. I will change the comment to reflect this.

Thanks for the review. I will fix the license headers, NULL checks, 
includes, dev_crit, and inits in the next revision as well.
