Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1396ACFA
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 01:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962F91DF;
	Wed,  4 Sep 2024 01:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962F91DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725406907;
	bh=eLMorv5ImHjzmX/53xeY71LHYT219pKZ5TOhfbMwm4A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MQDUpOI8YjNgEJ+Tm8tQRb0GGQOOy9u5uYI/aoLhpix864A+j44xXlX76UCh7uscn
	 ulq1qgy0XvsDN/yKavgr8a9zVXQsvsNqK7FVPxKmrOhbrN43++hMTEyP0fIDyffV43
	 Ba3venwFMl0UW/mfFa4a9AMHl9VezHnaVOZXmU28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92408F805B3; Wed,  4 Sep 2024 01:41:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEBEDF805AA;
	Wed,  4 Sep 2024 01:41:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51C03F80199; Wed,  4 Sep 2024 01:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 384E3F80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 01:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 384E3F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=gEK8Vr58
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 483LNZ3X020641;
	Tue, 3 Sep 2024 23:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4m1WSIMEa2HxAAYRfG6VTEh6N8eEtGqZqmhFNeM8To=; b=gEK8Vr58B35gGfVS
	ShZnFo53Ats+CZ9tpiKaLSvyWWXPuLjSYlLT2ys2XU3pXvWg7vCaqa711KhbG23A
	auWVZnQefGrvXTHZTKeB50aeEI6nOfexkgCVFeJ/h1YDkNEXiB/wrI/ZZdWuXzSj
	7r/yLsm+Az5kK8j1+AYH85omnHtPOmFzYm5Ms4fszobXTwaygzH7qO3FAOLhgzPc
	F1SKaq0CwBCLvPTkw4jWCfmUHF89plIcJu2t88FpgL63/cf0uVtWAmqenlK3L1AR
	If8fbDZNf714sqCPXn6qwXSWm2fMJIHTaX/TdW0MXNDlzEZaj7Opst9ytW8LmcUb
	zJ4m3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxf8uaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:41:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 483NfBEP010670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:41:11 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:41:10 -0700
Message-ID: <8a5be3be-7097-4258-a5a4-7ab440823968@quicinc.com>
Date: Tue, 3 Sep 2024 16:41:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 28/33] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-29-quic_wcheng@quicinc.com>
 <e7955dd7-95b1-4999-a2a1-519e8d7297a6@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e7955dd7-95b1-4999-a2a1-519e8d7297a6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: oziW5Qz2pRWDwRJPq6WwrkL2uGdOS1DB
X-Proofpoint-ORIG-GUID: oziW5Qz2pRWDwRJPq6WwrkL2uGdOS1DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=968 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030189
Message-ID-Hash: Y3YOC7JXZIPDOXZY773KKSUE5HXWWRGC
X-Message-ID-Hash: Y3YOC7JXZIPDOXZY773KKSUE5HXWWRGC
X-MailFrom: quic_wcheng@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3YOC7JXZIPDOXZY773KKSUE5HXWWRGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/30/2024 2:52 AM, Pierre-Louis Bossart wrote:
>> +/* Stream disable request timeout during USB device disconnect */
>> +#define DEV_RELEASE_WAIT_TIMEOUT 10000 /* in ms */
> 10s really? That seems rather large for a stream disable timeout...

Hmm, yes that is overkill, will adjust it accordingly.


>> +static struct snd_usb_platform_ops offload_ops = {
>> +	.connect_cb = qc_usb_audio_offload_probe,
>> +	.disconnect_cb = qc_usb_audio_offload_disconnect,
>> +	.suspend_cb = qc_usb_audio_offload_suspend,
>> +};
> You probably want to explain why there's no .resume_cb?
>
> The comments mention also that the suspend_cb has to stop playback, but
> then who resumes playback :-)
>
I can add a comment.  Ideally, the suspend_cb is only used for the case of PM suspend/system suspend.  If usb autosuspend is enabled, then the QC offload driver will handle the voting based on the audio stream being active or not.  Is there a use case where the ASoC layer re-opens any previously active audio streams so that userspace doesn't have to?  Currently, I was under the assumption that the audio stream would have to be re-opened by the application.

Thanks

Wesley Cheng

