Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A726FD724
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AAF71097;
	Wed, 10 May 2023 08:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AAF71097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700590;
	bh=CW1/dfNr8Zz2U3fHX1my6YUmcTJ2tWZXQwD5R0H4CKg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LiBKwci3aSRInmxIZahmj1JoBTDsIekcrSf/6JsPIU+qNy/bPsnkUqDWIsIiljVAC
	 qFm1YkE1m9Fxrh8et96wlxfyPUzHBnfaEBPRL+U2L1FdzYC4/E7AGWH4Chqzop7twb
	 zKw7+lF7I9v5yu6CAtF+Yoeo4aQ9N48QFx9GAAxw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29261F80553;
	Wed, 10 May 2023 08:33:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9EC0F8032D; Tue,  9 May 2023 20:07:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF723F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 20:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF723F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=RJ+iP4UJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 349GgReT028290;
	Tue, 9 May 2023 18:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=mVQZRuD+3P2r942mwHwPs57XW9EIasfEdq69rorUZAk=;
 b=RJ+iP4UJSK48LBKOGpe5CN3lxw4UaVVYKM+iHG6HXagjn2pHdJhR20MxankyDXDI3SUq
 cn/JGKK+/8vcwkwih92Per7/+ijf3e1EbBQWa1GReSBOljTiWgCx8123ZKpRMDkDw3ZW
 xVjISRPFunfB3Jj1jg1eBi3MWd62qXFuoAkzFiwYg2vMjfff64PeI3gKaDwxmWy8ve93
 NklmtABcBDg1I0LH9PqezdIyYh0m6cbxcR7FMnFmlZWLd0BBTo1KA5k2dSOpZj7Vn9tp
 AvNfgd/tkc9S/cSoN8ZAmiSpiJ8BjAq6Ap6pqrsSmOaw/nXs2jvsnvWxz6dy/vcxzsDg HQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfr508hbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 18:07:01 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 349I70Ge016716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 May 2023 18:07:00 GMT
Received: from [10.216.0.143] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 9 May 2023
 11:06:57 -0700
Message-ID: <94a81b02-e8e0-3b99-f63b-aef288790c82@quicinc.com>
Date: Tue, 9 May 2023 23:36:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
To: Mark Brown <broonie@kernel.org>
References: <20230509103232.20953-1-quic_visr@quicinc.com>
 <ZFpaiBs19P2m2i/q@finisterre.sirena.org.uk>
From: VISHNUVARDHAN RAO RAVULAPATI <quic_visr@quicinc.com>
In-Reply-To: <ZFpaiBs19P2m2i/q@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MOzKdvGzFMlCiX5w2XRUJWaq9xZ80NnM
X-Proofpoint-ORIG-GUID: MOzKdvGzFMlCiX5w2XRUJWaq9xZ80NnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=440 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090150
X-MailFrom: quic_visr@quicinc.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: CXWTNTFTOJCTECQFFV5GVKEDXQMYPIDM
X-Message-ID-Hash: CXWTNTFTOJCTECQFFV5GVKEDXQMYPIDM
X-Mailman-Approved-At: Wed, 10 May 2023 06:33:09 +0000
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXWTNTFTOJCTECQFFV5GVKEDXQMYPIDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 5/9/2023 8:06 PM, Mark Brown wrote:
> On Tue, May 09, 2023 at 04:02:31PM +0530, Ravulapati Vishnu Vardhan Rao wrote:
>
>>   	val = ucontrol->value.enumerated.item[0];
>> +	if (val < 0 && val > 15)
>> +		return -EINVAL;
> Srini is right that it'd be better to read the upper bound from the
> control, that way it can't geto out of sync.

Will address and resend it..

Thanks for review.


