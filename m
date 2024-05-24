Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD38CE02B
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 06:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD5F839;
	Fri, 24 May 2024 06:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD5F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716523622;
	bh=AUgE5y8wUm8AHEoy3rloeWlNGWAGdOxfmBQ7siVTi0k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xx8dpnQep3Fw97lKDSfcfOF64K8MzAY2A3MlacAWXxPelS3WngAyiKAxqdwgDnNsj
	 5rkym/cAjJHYBpCfKczqB5VzEurRiBApxoG7FDtvbB15OCD9eUeMESUpKCnJ0/WoRO
	 p9nA5IPtIgU6O2cHC9ENP4SkfJhNNYm5tcbjjVxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C92BF805AE; Fri, 24 May 2024 06:06:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EA9AF8057A;
	Fri, 24 May 2024 06:06:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9F75F8020D; Fri, 24 May 2024 06:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ABE0F80051
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 06:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABE0F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=CoO1YwEw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44NNPCFf007607;
	Fri, 24 May 2024 04:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvsVHHGQMX8vsgLsUH1hfDe87KvwavpeCjJC8JQ4OaU=; b=CoO1YwEwnsCvO6rA
	bjcqSeF2iE023pE1AOzP05k7E9+fJrYUIsOBm6biWHFRsYdz7PHleli7b/mY1XJe
	D24b+thoJnbxII+bzeiEHqTjkqfnLhIxPCXO2fmecO0v04uW7aqa23w1J6uohoc8
	WtMUDUsKUD0WHEANA85+rUIg/Iv4lkTO677O0Z4+ijtKId0yepLo2PRl8S/0sUpI
	xCXfDP7u4LuFFRaKXAYM2h0z9GRYXlZ7jANXrOTCPGx/ONLvPubuWq4hLv3eI5HJ
	b8v9Y4wzYh0ghtxBAdzWJGslmNpVDrodeAQ9xhgkl25RGFsDK2TdHqcVIgaR4zSg
	+9uyyg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9ts575-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 04:06:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44O46Gfa022937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 04:06:16 GMT
Received: from [10.216.21.109] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 21:06:11 -0700
Message-ID: <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
Date: Fri, 24 May 2024 09:36:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
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
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>
References: <20240524035350.3118981-1-quic_mohs@quicinc.com>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <20240524035350.3118981-1-quic_mohs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EXSyIxdS1tXOhZAk7cWSt9yHgp3wbtQC
X-Proofpoint-ORIG-GUID: EXSyIxdS1tXOhZAk7cWSt9yHgp3wbtQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_15,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=713 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240026
Message-ID-Hash: K2VPDDVB6GI6CQEBGSTQH3LMLTNVEUXT
X-Message-ID-Hash: K2VPDDVB6GI6CQEBGSTQH3LMLTNVEUXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2VPDDVB6GI6CQEBGSTQH3LMLTNVEUXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/24/2024 9:23 AM, Mohammad Rafi Shaik wrote:
> This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> QCS6490 RB3Gen2 boards.

Please ignore this abounded patch series. No need for review.

Thanks,
Rafi.
> 
> Changes since v1:
> 	- Use existing sc8280xp machine driver instead of separate driver.
> 	- Modify qcs6490 compatible name as qcs6490-rb3gen2.
> 
> Mohammad Rafi Shaik (2):
>    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
>    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> 
>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>   sound/soc/qcom/sc8280xp.c                                | 2 ++
>   2 files changed, 4 insertions(+)
> 

