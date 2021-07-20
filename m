Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA923D04B3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 00:34:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D64916A8;
	Wed, 21 Jul 2021 00:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D64916A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626820492;
	bh=v/8d4EDL9/mB0KXzOMTfoAPhH9aih2rqZ7fQBdy0HCc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szmUujUMALOPgAmjxx7mMMkkDC5st5WsTqxFu5lnqVEfy9o0B78dtr4bXk06gJc/F
	 b3TxxfA7pLl6lx/fz98I/cpBmTQgWOtsOA88zm60G9dx8txe3HjbeV2nbOJib+Mn5E
	 /SqQqPWNZIHVeEcDWi63VKFUC/nyR0TT4zgo2xKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05877F80227;
	Wed, 21 Jul 2021 00:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F20F80218; Wed, 21 Jul 2021 00:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F177F80104
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 00:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F177F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HKKWlwMK"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16KJZdej016765; 
 Tue, 20 Jul 2021 17:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=tZxtAkd3Qd69siK7e3dHgUTmBpRnVLUgYfm9Xuou/Xo=;
 b=HKKWlwMKHwWO1mMUv4rw7gfwMBv/+ri0tn+bsffeuD2bi9oZJqZ8Q2SI/zFVmJjr6Z+4
 Tw7HjmilP6ENqYBEeJfYkXolfRRfsAZLDR2mM05+YVFQRM00iDvHE+mEvxcsKItGSJ3w
 wT2ABbxo1hjYtUAQxH3dWqOESDw24wOoauW0FiD9HaBJ7UewHjAg6Xp7wqNO2XZn/aU4
 VUFUK2G+sy7FM5weh4CPDM1p81NFZ3O3a3kOHSyKI+nfDKrbFIU9kYWZ1aifF8sUKxT2
 y0AFEbR5mW2PZ50Cn8pH6kSQZIdFkdZpCuXl10P/PCtDcfyONoGmkkceRE2qyg4AOnYS ug== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39wqrm94qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Jul 2021 17:33:14 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 23:18:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 23:18:11 +0100
Received: from [192.168.99.238] (unknown [141.131.79.42])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 096E82BA;
 Tue, 20 Jul 2021 22:18:09 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
To: Mark Brown <broonie@kernel.org>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
 <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
 <20210712150341.GF4435@sirena.org.uk>
From: David Rhodes <drhodes@opensource.cirrus.com>
Message-ID: <5ab8fd33-3164-8bf5-2fb4-4819ef01a815@opensource.cirrus.com>
Date: Tue, 20 Jul 2021 17:18:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210712150341.GF4435@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ueh-YRrDoZIwQaS0wncvyxIkgekhluTu
X-Proofpoint-GUID: Ueh-YRrDoZIwQaS0wncvyxIkgekhluTu
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501
 impostorscore=0 mlxlogscore=818 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107200140
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

On 7/12/21 10:03 AM, Mark Brown wrote:
> On Fri, Jul 09, 2021 at 06:11:28PM -0500, David Rhodes wrote:
>> On 7/5/21 2:20 PM, Mark Brown wrote:
> 
>>> I can't see any references to GLOBAL_EN outside this function, why might
>>> it not be set?
> 
>> This check prevents an incorrect 'PDN Failed' message if DAPM initializes
>> and turns the widget off at boot (with no prior power-up).
> 
> In what way does it prevent this message and why is this a good approach
> to the issue?
> 

There is a better approach that I will include in v4.
The chip has a bit field that indicates if GLOBAL_EN has been asserted.
The 'PDN Failed' message can be skipped if this bit is not set.
