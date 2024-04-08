Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6689BAC7
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 10:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F9882235;
	Mon,  8 Apr 2024 10:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F9882235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712566144;
	bh=nIn/zPewsG9q+wrG7O743ZFUtC6bgOwv5+buBPM+YFQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z6qNMDrWA/tbdxaKjir+KnhiGJQFMbyGipLLkrV/bjnubaj0n/3s0U9AjRDSxGlMF
	 v5bB78FbOlaODyW1KXiCsnmFgOON++lSPuH7ArAdhtoc3+Io5R0tKUJXuUsO1HVf8s
	 KzgG0Y+r586waVtjfizqVQZ2siBOuC8WtVzv1szc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90AE0F805A8; Mon,  8 Apr 2024 10:48:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A615DF8059F;
	Mon,  8 Apr 2024 10:48:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F2DF8026D; Mon,  8 Apr 2024 10:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6E1EF80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 10:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E1EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=UAVjRcBe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4386dMxB009177;
	Mon, 8 Apr 2024 08:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wkPa/yuRBAbkzPtrxt9b+AV06OSilI8lIKaafg+mXV0=; b=UA
	VjRcBeGe437/rmaw+JYZDjRpTQO7nPJVgLvp+NP1YzoZ5OVLk1UiFl25iTbAOKsc
	fSY+kCxaBQ0iaNug+r+R2xrbzHTGfmBun4B6TKYnWk6SvFohYiSf/3TS8grLQDgo
	941tT7rgXjCGFPtpe9dgtkfskgEZSlY0eKmsWnjsTisxGsgLKusNkznxdzRzTpry
	J7LH4UF54xRxlpKGnx7h5mhuEfahR+xtF0QacxU+I2BUVjKOB7m16mnbITPbeOw8
	pU/8uqyD2LXj8Z3/dQ7ShwY///bJ1UimqIF0xwWI/Yvb93o6CFZR+2a/OhiZDRHM
	SO3VQofAdYgP54lEey1w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg307e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 08:45:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 4388j4fo010728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 08:45:04 GMT
Received: from [10.216.2.95] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 01:44:58 -0700
Message-ID: <c2708201-64ae-0e5a-edcc-08b8ad0e999d@quicinc.com>
Date: Mon, 8 Apr 2024 14:14:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND v3 0/2] Add support for QCM6490 and QCS6490
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
 <67ca18b4-0904-41e4-8218-ecb2016d532d@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <67ca18b4-0904-41e4-8218-ecb2016d532d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 4T7kCvwu9m1rGFpH5T2dTAgYnEKoJnZb
X-Proofpoint-GUID: 4T7kCvwu9m1rGFpH5T2dTAgYnEKoJnZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 mlxlogscore=772 impostorscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080067
Message-ID-Hash: LVZXOUKFBB6FG35WUQL3LYASLMNEMVDM
X-Message-ID-Hash: LVZXOUKFBB6FG35WUQL3LYASLMNEMVDM
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVZXOUKFBB6FG35WUQL3LYASLMNEMVDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/8/2024 11:26 AM, Krzysztof Kozlowski wrote:
> On 08/04/2024 06:23, Mohammad Rafi Shaik wrote:
>> This patchset adds support for sound card on Qualcomm QCM6490 IDP and
>> QCS6490 RB3Gen2 boards.
>>
>> Changes since v2:
>> 	- Modify qcm6490 compatible name as qcm6490-idp. Suggested by Dmitry
>>
>> Changes since v1:
>> 	- Use existing sc8280xp machine driver instead of separate driver.
>> 	- Modify qcs6490 compatible name as qcs6490-rb3gen2.
>>
> 
> Why are you resending 15 minutes after previous round?
> 
> Best regards,
> Krzysztof
> 
Found one mistake in cover-letter.
Instead of qcm6490-idp given qcs6490-idp.

Modified the cover-letter and reposted.

Thanks & Regards,
Rafi.
