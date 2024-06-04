Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151528FBF9C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 01:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2612D84C;
	Wed,  5 Jun 2024 01:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2612D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717542526;
	bh=Rlz96sMG/kOG1NkbypRbXtCzD5LzoBOpjZ03kKZSVZU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ODkxX9THlt+50AVuz3Fh5Kl2ahvx34EwfGCCaJye1xaNpMuBqXwKlnM7XktBLuYG0
	 K/WVPxg1PIdKZRvLtSjTVI0zpONGu8cqf+0x08HKpNJdPL4AHLe5XtSK3poiyAbfTH
	 N9tpJ+DbCu7V5/VCWu1MuHtw577hWS1PtCSFzLoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B808AF805A0; Wed,  5 Jun 2024 01:08:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B533F8059F;
	Wed,  5 Jun 2024 01:08:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFC49F802DB; Wed,  5 Jun 2024 01:08:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 92008F800FA
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 01:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92008F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Sh07SUgr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 454HSp4U006214;
	Tue, 4 Jun 2024 23:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rlz96sMG/kOG1NkbypRbXtCzD5LzoBOpjZ03kKZSVZU=; b=Sh07SUgrhjImHfdH
	8SF5gPwkwFVEDWC9F2gQeDqxysGKGJPr/2jsqi4pVZDjYbDd0CTK6X9gFRCGoBmk
	OitrJsxIZIleOjunqKg+LtJMVf4L9jeXQ0r/F2sMtEl7xyaZ8x/sd4Msj7Xe7irj
	+FFCrxMEBlLFeMJOS9cPWWwuD7t8C+12N/pbjSOksp+JjD1Q5a7PSQ+nk7ljVedB
	NnZNPRntRdACwGyvkyIu1VyTtmcCDKJJ/QvEi2jYkD+9TBiyY7mJElBrnvchVHSL
	CeWB663RCxYRf/TckWRXkkvkR05Weo4p17EEf+VRjVPCubqYjl8cXY+a3vmtWVpO
	VG9wqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj7brrmjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 23:07:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 454N7lP2012541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 23:07:47 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 16:07:46 -0700
Message-ID: <ed29f097-eb5d-4133-a3f0-4fb0e8933cb8@quicinc.com>
Date: Tue, 4 Jun 2024 16:07:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 32/38] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240524001043.10141-1-quic_wcheng@quicinc.com>
 <20240524001043.10141-33-quic_wcheng@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240524001043.10141-33-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pZc8JSSJvyCdzyxMTEuTXq3F2dtNbF2a
X-Proofpoint-GUID: pZc8JSSJvyCdzyxMTEuTXq3F2dtNbF2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=847 clxscore=1011 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406040187
Message-ID-Hash: M77VLIQMJFVV3UTL3D77ZFPUXOMM44TG
X-Message-ID-Hash: M77VLIQMJFVV3UTL3D77ZFPUXOMM44TG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M77VLIQMJFVV3UTL3D77ZFPUXOMM44TG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/23/2024 5:10 PM, Wesley Cheng wrote:
[...]
> +EXPORT_SYMBOL_GPL(qcom_snd_usb_offload_jack_remove);
> +MODULE_LICENSE("GPL");

please add missing MODULE_DESCRIPTION()


