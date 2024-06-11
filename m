Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830D0902F98
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 06:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4122850;
	Tue, 11 Jun 2024 06:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4122850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718080982;
	bh=tdXTvR04YG95vGC2ed5np4cY7vgENhLoagNUvO9j+Qg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nhxHFGeBUhCU4nf5FtSv/dKSt9R6PHKTOkFWGTzTpyOmLBvz0W7KKUvi5c5U7Slca
	 K/HZviTJtKDDNxYBVNwGJ42hWqqTzYtjiyk7TtWcv38LOyaEUNTuLs/lsJjR8S9e10
	 XLKOWhCs88Dg4LCJI7wajM1WB1W9AiVjPg4Biv8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E4A9F8059F; Tue, 11 Jun 2024 06:42:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E9EF805B2;
	Tue, 11 Jun 2024 06:42:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30259F8057A; Tue, 11 Jun 2024 06:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94A0EF8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 06:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94A0EF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=GQ10t7eF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45B3AsR9001377;
	Tue, 11 Jun 2024 04:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R46nk5Y8f5YTvCdl64rWRkPICciSGOAHSIkHk+Ko2+w=; b=GQ10t7eFboebjCCY
	95eg3icGoCg+jlFS6YFrmkgBVzuL43kPhpokmGkI1R0a7S32JNntLmvedCbqJGd0
	hWH5KLsigHU/z6yLVo2XU60m8btu5dNr8+IUlm73tr5l2tZ2lovlwehKqIlAWn8t
	6rmR18NmtwhCD0t0LDUZaZYpc2WqITRRokDiFYFZNCZPA9MvfUYEFV4ZWsLTF+nO
	r9ERzXF7OvWUnB7pbbz1RS4SCC1etngJ1a9xjpa1njCGPq4rG8Dd4IeBoRH02HAi
	czkrV6mVkch4C30crp4usqaUzXh+FIUbOBZN/zBkuc57zoL55lhumTPUI7A+Lmi6
	2KWYhQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rwsxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:40:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45B4e58O005393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 04:40:06 GMT
Received: from [10.216.24.176] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 21:39:54 -0700
Message-ID: <33772eab-74c6-c5c3-fa25-3a643a2f9c57@quicinc.com>
Date: Tue, 11 Jun 2024 10:09:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND v5 6/7] ASoC: codecs: wcd937x: add capture dapm widgets
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240527111956.444425-1-quic_mohs@quicinc.com>
 <20240527111956.444425-7-quic_mohs@quicinc.com>
 <ba911ebd-aef5-46af-ace1-84d13bee6876@linaro.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <ba911ebd-aef5-46af-ace1-84d13bee6876@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KrdaIhs0KhVaQSe_Yq6TEnDlFBkT1WmU
X-Proofpoint-GUID: KrdaIhs0KhVaQSe_Yq6TEnDlFBkT1WmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=775 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110033
Message-ID-Hash: AE7FJCCE7LPXPFHH4K3BS6XDGPBTNRHF
X-Message-ID-Hash: AE7FJCCE7LPXPFHH4K3BS6XDGPBTNRHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AE7FJCCE7LPXPFHH4K3BS6XDGPBTNRHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/10/2024 12:35 PM, Srinivas Kandagatla wrote:
> 
> 
> On 27/05/2024 12:19, Mohammad Rafi Shaik wrote:
>> +static int __wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
>> +                      int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +    int micb_num;
>> +
>> +    if (strnstr(w->name, "MIC BIAS1", sizeof("MIC BIAS1")))
>> +        micb_num = MIC_BIAS_1;
>> +    else if (strnstr(w->name, "MIC BIAS2", sizeof("MIC BIAS2")))
>> +        micb_num = MIC_BIAS_2;
>> +    else if (strnstr(w->name, "MIC BIAS3", sizeof("MIC BIAS3")))
>> +        micb_num = MIC_BIAS_3;
>> +    else
>> +        return -EINVAL;
>> +
> See last comment..
> 
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        wcd937x_micbias_control(component, micb_num,
>> +                    MICB_ENABLE, true);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        usleep_range(1000, 1100);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        wcd937x_micbias_control(component, micb_num,
>> +                    MICB_DISABLE, true);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int wcd937x_codec_enable_micbias(struct snd_soc_dapm_widget *w,
>> +                    struct snd_kcontrol *kcontrol,
>> +                    int event)
>> +{
>> +    return __wcd937x_codec_enable_micbias(w, event);
>> +}
>> +
>> +static int __wcd937x_codec_enable_micbias_pullup(struct 
>> snd_soc_dapm_widget *w,
>> +                         int event)
>> +{
>> +    struct snd_soc_component *component = 
>> snd_soc_dapm_to_component(w->dapm);
>> +    int micb_num;
>> +
>> +    if (strnstr(w->name, "VA MIC BIAS1", sizeof("VA MIC BIAS1")))
>> +        micb_num = MIC_BIAS_1;
>> +    else if (strnstr(w->name, "VA MIC BIAS2", sizeof("VA MIC BIAS2")))
>> +        micb_num = MIC_BIAS_2;
>> +    else if (strnstr(w->name, "VA MIC BIAS3", sizeof("VA MIC BIAS3")))
>> +        micb_num = MIC_BIAS_3;
>> +    else
>> +        return -EINVAL;
>> +
> same..
>> +    switch (event) {
>> +    case SND_SOC_DAPM_PRE_PMU:
>> +        wcd937x_micbias_control(component, micb_num, 
>> MICB_PULLUP_ENABLE, true);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMU:
>> +        usleep_range(1000, 1100);
>> +        break;
>> +    case SND_SOC_DAPM_POST_PMD:
>> +        wcd937x_micbias_control(component, micb_num, 
>> MICB_PULLUP_DISABLE, true);
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
> 
> ...
> 
>>   static const struct snd_soc_dapm_widget wcd937x_dapm_widgets[] = {
> ...> +    /* MIC_BIAS widgets */
>> +    SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, 0, 0,
> Please use shift here like
>          SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
>          SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
> 
> to avoid doing a string compares on wideget name.
> 
> --srini
> 

ACK

Will remove the string compares on widget name and will use the shift here.

Thanks & Regards,
Rafi.

>> +                wcd937x_codec_enable_micbias,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +
>>       SND_SOC_DAPM_SUPPLY("VDD_BUCK", SND_SOC_NOPM, 0, 0,
>>                   wcd937x_codec_enable_vdd_buck,
>>                   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
>> @@ -2007,11 +2312,101 @@ static const struct snd_soc_dapm_widget 
>> wcd937x_dapm_widgets[] = {
>>       SND_SOC_DAPM_MIXER("HPHR_RDAC", SND_SOC_NOPM, 0, 0,
>>                  hphr_rdac_switch, ARRAY_SIZE(hphr_rdac_switch)),
>> +    /* TX output widgets */
>> +    SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
>> +    SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
>> +    SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
>> +    SND_SOC_DAPM_OUTPUT("WCD_TX_OUTPUT"),
>> +
>>       /* RX output widgets */
>>       SND_SOC_DAPM_OUTPUT("EAR"),
>>       SND_SOC_DAPM_OUTPUT("AUX"),
>>       SND_SOC_DAPM_OUTPUT("HPHL"),
>>       SND_SOC_DAPM_OUTPUT("HPHR"),
>> +
>> +    /* MIC_BIAS pull up widgets */
>> +    SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias_pullup,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias_pullup,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),
>> +    SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, 0, 0,
>> +                wcd937x_codec_enable_micbias_pullup,
>> +                SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>> +                SND_SOC_DAPM_POST_PMD),

