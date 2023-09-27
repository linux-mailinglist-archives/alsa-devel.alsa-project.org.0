Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEA7B0D1A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 22:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7764EA4B;
	Wed, 27 Sep 2023 22:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7764EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695844962;
	bh=cZHnqqiy7zk7+Xil7TBhejLc7d5bNTlXZiN45irE7sY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mR+sBe1hFC5oMhic+T2GLF/XmPv+tawkMIgmt4csZBtHc/ryALf3dsaIVcdv5+Bb2
	 +gEm4d0VD+3xu0hNhp3qEHXAw07ih+B7aTzSES9BC9Kxk7IQwd0SEHD1fFjawJ+iXT
	 USEo/IrhDhs+jtG5lWt1iilJrZzRDofsCeAwUvNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15028F80290; Wed, 27 Sep 2023 22:01:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C65C7F80166;
	Wed, 27 Sep 2023 22:01:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26449F8016A; Wed, 27 Sep 2023 22:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB609F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 22:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB609F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=DBixV+Y6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RJkZ32011894;
	Wed, 27 Sep 2023 20:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ryZutAebLaGLyVKZ1wZ2WPr3DnN8n1DAG80EGJowehs=;
 b=DBixV+Y6w/MthTtGGUv8auiu7df9weX4/brq78PevdvCw1sECoaaM+5R4iT87qhjSgL+
 hdUy7zS256Ojq/xQg1E24st0QXoY1ajZdkiusKkHt7Vbwfj1xqq2gFt7Ns6UoJNFyIj/
 HiSY6CNFUnKlQQnmdx7JspuYLT1yy5xTrSUieZ82n8DMw+y/vitVMD0nSnyRX7Hnk5sm
 OYdfyzdbVtKfVyLsCxEbwfhVYrqc57iLygWAd8RA6f9KfjIVktV39sn1t0UVmqk/tdbl
 B5gxgMR1foTSmnryE6xuzaU/7mNgIdqbzCS4+LAK6n19h8E7iY41q4Tlf7eBotdYbDBd Cg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcpkgrrh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:01:42 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38RK1fxj004565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Sep 2023 20:01:41 GMT
Received: from [10.110.25.80] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 27 Sep
 2023 13:01:40 -0700
Message-ID: <29584061-a7e9-5db4-a024-eaf7774a03dd@quicinc.com>
Date: Wed, 27 Sep 2023 13:01:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 09/33] ASoC: qdsp6: q6afe: Increase APR timeout
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-10-quic_wcheng@quicinc.com>
 <ZRRBIa+bVSqTHprO@finisterre.sirena.org.uk>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZRRBIa+bVSqTHprO@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: wmE0swXrHDd9mXk1xvEgSZNzbdkoY5Fi
X-Proofpoint-ORIG-GUID: wmE0swXrHDd9mXk1xvEgSZNzbdkoY5Fi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_12,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=324 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309270170
Message-ID-Hash: JR4EWSEEW6ZHLQJEF7RZCVP3S2IRLWXF
X-Message-ID-Hash: JR4EWSEEW6ZHLQJEF7RZCVP3S2IRLWXF
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JR4EWSEEW6ZHLQJEF7RZCVP3S2IRLWXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On 9/27/2023 7:50 AM, Mark Brown wrote:
> On Thu, Sep 21, 2023 at 02:48:19PM -0700, Wesley Cheng wrote:
>> For USB offloading situations, the AFE port start command will result in a
>> QMI handshake between the Q6DSP and the main processor.  Depending on if
>> the USB bus is suspended, this routine would require more time to complete,
>> as resuming the USB bus has some overhead associated with it.  Increase the
>> timeout to 3s to allow for sufficient time for the USB QMI stream enable
>> handshake to complete.
> 
> ...
> 
>> -#define TIMEOUT_MS 1000
>> +#define TIMEOUT_MS 3000
> 
> That seems worryingly large but if it's what the hardware/firmware needs
> I guess there's nothing doing - even the 1s that's being replaced would
> be nasty if we ever actually hit it.

I may have gone overkill with the delay, but when I measured the 
duration of the AFE start command it took ~1.5-2s.  It has to also 
account for the overhead within handling the USB QMI request in the 
qc_audio_offload driver.

Thanks
Wesley Cheng
