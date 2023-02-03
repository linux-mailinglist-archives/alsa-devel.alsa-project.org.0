Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62F688FBC
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 07:34:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4906D823;
	Fri,  3 Feb 2023 07:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4906D823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675406092;
	bh=UrIFYIXTwfdMZen7X4iFu+uskI5lUUqQhf4wVL182Hs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t+9aLCqkt7y1q+OFqUxQD6MhTUYi5hb2I2UXq7QzZdNmT1Gl7KZya/Cy8PPez+B4I
	 BUy4ienQxKo2AXcosyY83T5pu2gF64QsCHhrDxUvmzg3zP9jVasirS5CmVgiIqaRq6
	 UQMO+gbIlppKwFZATHrrhYtOl6gejVN1mKAkjlCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 996F0F8032B;
	Fri,  3 Feb 2023 07:33:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EFBF8032B; Fri,  3 Feb 2023 07:33:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60F9EF80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 07:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F9EF80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=mZD2JtqJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3135HhfC001674; Fri, 3 Feb 2023 06:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SuTIbaGSUcvGKk8oWpdqXguJe8chLfMFfh4n4U1RKs8=;
 b=mZD2JtqJu+cWl3fP93Br3vKp5cHWzCFhBH9psjywYzvpHDbvZufgS0D3HT3dfQRolSZS
 Y/qyg7ScoyONLFzhk4uWTj0XrsDFh8F4ohXFZq3ONPiY7grkYC9EjkS4teitFzmzzftQ
 sZxJHPux3o72JA6A8JmSb2NnIAa4Q8Wdzi6sjOq7dPunr9+viQL/H42QX9ypt7og0DyH
 xUgOLYwQpYFhYomZqinlkD0IHYcVjn1kDsc6sVZUOYb6x8Jv4EVp5vLsxcbyuKuk4weh
 bX5KacHx+9vucHqWCg7zC6tU3wP0Q8sJ45RUeU5YCu72e2BqVzfHe9vtprgwTe7ymoKF eg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfnyhmx6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 06:33:26 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3136XPV2016299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 06:33:25 GMT
Received: from [10.216.51.161] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 22:33:20 -0800
Message-ID: <de86d4ce-b9a9-9202-c7b9-ea49e9b1d41b@quicinc.com>
Date: Fri, 3 Feb 2023 12:03:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/14] ASoC: qcom: SC7280: audioreach: Add sc7280 hardware
 param fixup callback
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230201134947.1638197-1-quic_mohs@quicinc.com>
 <20230201134947.1638197-3-quic_mohs@quicinc.com>
 <Y9p57qn9+Pig9igE@sirena.org.uk>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <Y9p57qn9+Pig9igE@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FQhYFWnXTTN1IudxQWb0NB1blKm9qU0h
X-Proofpoint-ORIG-GUID: FQhYFWnXTTN1IudxQWb0NB1blKm9qU0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_03,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=630
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030058
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, bgoswami@quicinc.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, lgirdwood@gmail.com,
 konrad.dybcio@linaro.org, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, quic_plai@quicinc.com, swboyd@chromium.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 2/1/2023 8:10 PM, Mark Brown wrote:
> On Wed, Feb 01, 2023 at 07:19:35PM +0530, Mohammad Rafi Shaik wrote:
>
>> +#define DEFAULT_SAMPLE_RATE_48K	48000
> Why are we bothering with a define here given that the define also
> encodes the value and it's only used in once place?
okay, will remove it.
>
>>   	for_each_card_prelinks(card, i, link) {
>>   		link->init = sc7280_init;
>>   		link->ops = &sc7280_ops;
>> +		if (link->no_pcm == 1)
>> +			link->be_hw_params_fixup = sc7280_snd_be_hw_params_fixup;
> We only set the fixup in the case where there's no PCM but we removed
> the constraint in all cases - isn't the constraint needed otherwise?
okay, will add conditional check for constraint and will only do if 
no_pcm is zero.
