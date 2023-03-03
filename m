Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9816ACB21
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FBE1198;
	Mon,  6 Mar 2023 18:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FBE1198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124825;
	bh=HAoHlLZS7U2ib3LiX2L2vyoYIuxEc8USUDccDvFc2+o=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GXhR3JoNqGMLErV42Hd6YvUsSyXYJOy50FgjPG4kQCyx3yTThfI4FAyb2QLb5ry/g
	 0RZ9sZQTj/j0Nsnk05TbIbLmO+1iGJ5WarpyxToFHpo/MHeW/U09h0M1T+S145mxBn
	 v3W3Z4bX2T/zvCz5L3AG66+Cn62UI15zKtgSNHQI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 167CCF80589;
	Mon,  6 Mar 2023 18:41:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC7E5F80266; Fri,  3 Mar 2023 18:33:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EDB5F800DF
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 18:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDB5F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oB/nk/P6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32385Nnc010547;
	Fri, 3 Mar 2023 17:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rT9oXyMOiJsVqlFyPDuL53W0Fy6C8viYI4Cr8IbjbC0=;
 b=oB/nk/P6rqPZ1p3q7nG5//wY4rA5HAnldkmEzFcDnaN5b/6gF0Ns3oKHhl1aaKPtR/Po
 Ir2pwm/apJM0F1cts1ujpoWCVJk6XqyGebYfb0TSpZ/ELrkEAsAnP5lJREDAAuF6p0XD
 gFiGynL71R7/AGRxR36E7TEjmWEIJoih94zkbiLfV/ZyjjrDER+jvVrcjtyk/940OavN
 KlPDcVA+edfR41a98tQVvJycPYksm0U/Q14BCshXGfqXhk6NF0BDjiyYJcQ2pd4yQwWw
 bjO2FCKzk8QMalr+NurMhpFgR93OX4SzOli05iE7w+c3yZBAe/3W2+eTnkVKuQfeMO94 Mg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p3c8hsu98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 17:32:54 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 323HWrlf016803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Mar 2023 17:32:53 GMT
Received: from [10.216.31.251] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 3 Mar 2023
 09:32:50 -0800
Message-ID: <79d4f0ad-c014-6b9f-4c0e-c71163457b30@quicinc.com>
Date: Fri, 3 Mar 2023 23:02:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230303125717.29196-1-quic_visr@quicinc.com>
 <73ea5ba2-18c8-abd8-3896-eb9656201f53@linaro.org>
From: VISHNUVARDHAN RAO RAVULAPATI <quic_visr@quicinc.com>
In-Reply-To: <73ea5ba2-18c8-abd8-3896-eb9656201f53@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IHn6InOu0g2tCAQk4achWYNMFhGgWF2z
X-Proofpoint-ORIG-GUID: IHn6InOu0g2tCAQk4achWYNMFhGgWF2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_03,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=750
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030150
X-MailFrom: quic_visr@quicinc.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: J2PLOYSFFAANRLACX65BT5E2CRHBDGH2
X-Message-ID-Hash: J2PLOYSFFAANRLACX65BT5E2CRHBDGH2
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:41:48 +0000
CC: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2PLOYSFFAANRLACX65BT5E2CRHBDGH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 3/3/2023 7:45 PM, Srinivas Kandagatla wrote:
>
>
> On 03/03/2023 12:57, Ravulapati Vishnu Vardhan Rao wrote:
>> @@ -1064,9 +1064,10 @@ static int tx_macro_hw_params(struct 
>> snd_pcm_substream *substream,
>>                     struct snd_soc_dai *dai)
>>   {
>>       struct snd_soc_component *component = dai->component;
>> -    u32 decimator, sample_rate;
>> +    u32 sample_rate;
>>       int tx_fs_rate;
>>       struct tx_macro *tx = snd_soc_component_get_drvdata(component);
>> +    u8 decimator = 0;
> Minor nit, any reason why decimator is intialized as part of this change.
>
> --srini
Will Remove that..Thanks for review
