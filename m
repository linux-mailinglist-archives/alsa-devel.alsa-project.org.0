Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 233F6909FA2
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2024 22:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B446DEC;
	Sun, 16 Jun 2024 22:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B446DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718568911;
	bh=wf9Fx6JS/4clZSMdADTQm2NJNZorI8+VFz2nDFwiRgk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=irgnRMf1XuHamWrWpWNm+vu5e1aRi5/2MV1Nads1spyycZ6765RgS4ogjx5UJsfEI
	 7+WyQm44SVHZhpPKHad3FqASh0VsX0NVF5VpUnsgpNvkezmC5JfwJt7vbgajTgqT4f
	 S4ZtikdchlgXnVWwbBCW12MD6exvR+Xjn5ykQ5jI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B58FEF805BB; Sun, 16 Jun 2024 22:14:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21960F805AE;
	Sun, 16 Jun 2024 22:14:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4467AF800FA; Sun, 16 Jun 2024 22:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FEA8F800ED
	for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2024 22:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FEA8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=fvhk0JX+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45GJuupE015153;
	Sun, 16 Jun 2024 20:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IKWbW3PBn8pb4z2Zs0fKK5lu0Pq72e8Y63XTL0w61M=; b=fvhk0JX+7zNLyiWZ
	qat2Po91kio3Mv/TT0qA9mFlazv9efUcE6ZdCk8idFwklPeTHRK+vYW4yQ5o5HZW
	CXp4yg9J1O+tc2kHL5s9mL+7bGKEchw+qRPf1uD0uf3y6+N6j2pDSushNnHk9dll
	VYemBmgB5SqqyVzzf/Yr/IrRYzAdsOHaFsiBAji3WNdSwlGAuUvZvUVythWCeZ7f
	qQleJY+KHNSB0ZzPPStWPUPDhj6p64o1pyHt2WhJxYRRMS0g1NXjct8Q8lrbo/Gh
	3+JQVjX3MZYbB+DfYB3Gn57igim9NvoO14jAtPc8Lou2nnglAH2psektK6AOdvap
	fNmGGA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys2hxa7ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jun 2024 20:06:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45GK5gp3022592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jun 2024 20:05:42 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Jun
 2024 13:05:41 -0700
Message-ID: <11db53fa-7ed6-46cb-ac40-859054df91a6@quicinc.com>
Date: Sun, 16 Jun 2024 13:05:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-fiq: add missing MODULE_DESCRIPTION()
 macro
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Shengjiu Wang
	<shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>
CC: <alsa-devel@alsa-project.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-sound@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240615-md-arm-sound-soc-fsl-v1-1-8ed731c2f073@quicinc.com>
 <de75c710-044a-45ff-9477-cf4d57f55ab1@wanadoo.fr>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <de75c710-044a-45ff-9477-cf4d57f55ab1@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: S7O2oa02ygbNOwVLSRTxF8hIw9GaafuT
X-Proofpoint-ORIG-GUID: S7O2oa02ygbNOwVLSRTxF8hIw9GaafuT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406160158
Message-ID-Hash: YJUOQ4LMVYHFGPK45NYEZQ43VFEBBOJ5
X-Message-ID-Hash: YJUOQ4LMVYHFGPK45NYEZQ43VFEBBOJ5
X-MailFrom: quic_jjohnson@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJUOQ4LMVYHFGPK45NYEZQ43VFEBBOJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/16/2024 12:14 AM, Christophe JAILLET wrote:
> Le 16/06/2024 à 08:42, Jeff Johnson a écrit :
>> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-fiq.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>   sound/soc/fsl/imx-pcm-fiq.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
>> index 0d124002678e..5ea6dd4c89a1 100644
>> --- a/sound/soc/fsl/imx-pcm-fiq.c
>> +++ b/sound/soc/fsl/imx-pcm-fiq.c
>> @@ -319,4 +319,5 @@ void imx_pcm_fiq_exit(struct platform_device *pdev)
>>   }
>>   EXPORT_SYMBOL_GPL(imx_pcm_fiq_exit);
>>   
>> +MODULE_DESCRIPTION("Freescle i.MX PCM FIQ handler");
> 
> Freescale? (missing 'a')

thanks for the catch, will send a v2

