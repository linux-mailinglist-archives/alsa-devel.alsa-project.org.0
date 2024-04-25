Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAF18B20AE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 13:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D5DB93A;
	Thu, 25 Apr 2024 13:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D5DB93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714045732;
	bh=HwCUhii1v+UVg/w9fnfv1IVtkJsyAJk/WRu0RrIN9fg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sMq4+/TUA/eSzXjpRDXAOhhvfUcDDRHDKMVPG0rNMD1zWfF2QmxiQBVdR6B5ufg7P
	 cOOKj7Lw0kQHl4uB/o89WCenLojNQBOG2glDSn7JWSQbDOeF/ww1tLBus5CBMl3INA
	 vQ6DYADlkaVTNPO85XQESvTl0u8mlWVZaISU6ZQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AC3BF805A1; Thu, 25 Apr 2024 13:48:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 051D0F8057C;
	Thu, 25 Apr 2024 13:48:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 012BBF80423; Thu, 25 Apr 2024 13:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E91CDF800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 13:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E91CDF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=aW501Lv9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43P9wuFT032483;
	Thu, 25 Apr 2024 11:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lU20Dpc0Wn36bS3HRI03h5cXxSl5AqSMPuJYeo3zz2Q=; b=aW
	501Lv9eGYZN6Q/nqLPxyBLz9jiqiR2OSSF3ajSYhm7Biw23Idog4oiBm9iz05+vJ
	mjY6KgQthlPSJ16rJQfMTrCyaHxrXb0beoTT5mKa/BhnZ3a256Rhf4uSGOfc4SLV
	ebM53eqD/RM93G4NbRVt9/lFSp4bv22WGUvWRmpu0uLl2hSZL17aQP9SJv71ntIt
	X7IOpSxBdVY3RhyY1jquzS2uaNAM5MLMQcPsLvfoWbISvzHub+qAHLngSLa/UZtz
	aLHgOXHCslUu5qXvhLMQxPv3ixNuZj4bJ3qNGMwGsFnQi373DYuQMqBvebWPUEPL
	8BnW20qWpKaGWFtmbuGQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqn0wgfx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 11:47:56 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 43PBluGN004162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 11:47:56 GMT
Received: from [10.216.8.145] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 04:47:50 -0700
Message-ID: <89c29d6c-173d-5b19-ce7d-9c2b7cec40f2@quicinc.com>
Date: Thu, 25 Apr 2024 17:17:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: document wcd937x Audio Codec
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
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>
References: <20240425091857.2161088-1-quic_mohs@quicinc.com>
 <20240425091857.2161088-2-quic_mohs@quicinc.com>
 <3f961aca-6dff-4d51-bb0b-c974ed80b646@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <3f961aca-6dff-4d51-bb0b-c974ed80b646@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WAC75izVg2jaJXu22yxmMqVvbJbvqI1R
X-Proofpoint-GUID: WAC75izVg2jaJXu22yxmMqVvbJbvqI1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_11,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250085
Message-ID-Hash: IAPMLPUM5OK7VRMAZFNYKX2EAW5NM22R
X-Message-ID-Hash: IAPMLPUM5OK7VRMAZFNYKX2EAW5NM22R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAPMLPUM5OK7VRMAZFNYKX2EAW5NM22R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/25/2024 4:31 PM, Krzysztof Kozlowski wrote:
> On 25/04/2024 11:18, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>
>> Document the Qualcomm WCD9370/WCD9375 Audio Codec and the soundwire
>> devices can be found on Qualcomm QCM6490 based platforms.
>>
>> The Qualcomm WCD9370/WCD9375 Audio Codec communicates
>> with the host SoC over 2 Soundwire links to provide:
>> - 3 TX ADC paths with 4 differential AMIC inputs
>> - 6 DMIC inputs that are shared with AMIC input
>> - 4 Microphone BIAS
>> - RX paths with 4 PAs – HPHL/R, EAR and AUX
>> - Stereo Headphone output
>> - MBHC engine for Headset Detection
>>
>> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> 1. That's odd order of tags. Who created the first patch?

    First patch is created by : Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> 2. Last time you received report that this was not tested. Now there is
> again report.
> Are you sure you test patches before sending?
> 
   Yes i have tested patches multiple times before sending.

   In my setup the "make dt_binding_check"  became success, there is no 
errors.

   log:

   DTC     Documentation/devicetree/bindings/sound/zl38060.example.dtb
   DTEX 
Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.example.dts
   DTC 
Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.example.dtb
   DTEX    Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dts
   DTC     Documentation/devicetree/bindings/sound/qcom,wcd937x.example.dtb
   DTEX 
Documentation/devicetree/bindings/soundwire/qcom,soundwire.example.dts
   DTC 
Documentation/devicetree/bindings/soundwire/qcom,soundwire.example.dtb

   Not sure why errors not coming in my setup,
   Will check in different Machine.

> Best regards,
> Krzysztof

Thanks and regards,
Rafi
> 


