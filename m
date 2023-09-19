Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 690957A568D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 02:26:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8EC826;
	Tue, 19 Sep 2023 02:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8EC826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695083183;
	bh=ZgCAFvJGgqcbxizA0OG0/9MHzgkh7iVrTuMjn8R9ghQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gwcNpwPE3kKYGR4rE2ZawTo2Ktg0eP7jza1KQAy5gfEwHVCKMzndDzkR7oG8buwEr
	 cu6VcU/taD2lHW9cFNcairZlEeoWBrTmfgo8fhSs9ar1/BHjXSpiQ7Vi6Kfy2WCsQz
	 vfSv+3ZngnzPn4agyzwSH+izHC2bWyOTI+S3k8CI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC4E1F80494; Tue, 19 Sep 2023 02:25:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6027BF801F5;
	Tue, 19 Sep 2023 02:25:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C42BF8025A; Tue, 19 Sep 2023 02:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FA27F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 02:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FA27F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=hLuqgdvL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38INSgM7019894;
	Tue, 19 Sep 2023 00:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZzAyxflayBdGB5NOfX/tkFpQl2JCuDSFOECx7lyWW4w=;
 b=hLuqgdvLPsiVtXcgftB/4FfYgoInPmmD2++eoGa0tCWFhUg+QJSixCv4nEb4WIPOTyu2
 IElYIgXhGufTorMRnwuJlMLGY/UZ832/zaGSaZoa17feqRCjq7FD7O8K9qp6pu2c6yt1
 uX+HoTq9w+l2OVjbsciJITOFqMcBK3I0Uu2Z4aiy93Z9wilmqiaJk+XPli2vi2h2+O30
 UdK/Qs9Pu+e6sKrRd/gK+rWw7EpM9TRwl+1Q68Y2rn6KvvfS0v5/pGcmZZ3ya73SJOuy
 /SDBeyN5wmcjYKmXcUGrqUO2JpQ6bPIdsKtjuXrIkXjQvGaMmuXT2zAVSGJ1Lng3GS9H xQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t53ybc9f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 00:23:22 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 38J0NLYE009462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Sep 2023 00:23:21 GMT
Received: from [10.110.39.29] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 18 Sep
 2023 17:23:20 -0700
Message-ID: <f77aa92d-b71c-b6f7-bce2-35fa0c3011c0@quicinc.com>
Date: Mon, 18 Sep 2023 17:23:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v6 13/33] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
 <20230916001026.315-14-quic_wcheng@quicinc.com>
 <6e66d821-1275-4830-a898-bb82c333dcc5@linaro.org>
 <ef3731af-5b58-3dcb-9a6f-7e8755a13895@quicinc.com>
 <20230918201919.GA1694628-robh@kernel.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20230918201919.GA1694628-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9MWiJGmzLM4Bj6yRSS5de11vRTYHJIHr
X-Proofpoint-ORIG-GUID: 9MWiJGmzLM4Bj6yRSS5de11vRTYHJIHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=599
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190001
Message-ID-Hash: BX2PX3YGGQPRXP55OAUPMXVXBMPYMA7Y
X-Message-ID-Hash: BX2PX3YGGQPRXP55OAUPMXVXBMPYMA7Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BX2PX3YGGQPRXP55OAUPMXVXBMPYMA7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On 9/18/2023 1:19 PM, Rob Herring wrote:
> On Fri, Sep 15, 2023 at 05:43:45PM -0700, Wesley Cheng wrote:
>> Hi Konrad,
>>
>> On 9/15/2023 5:35 PM, Konrad Dybcio wrote:
>>> On 16.09.2023 02:10, Wesley Cheng wrote:
>>>> Add a new definition for specifying how many XHCI secondary interrupters
>>>> can be allocated.  XHCI in general can potentially support up to 1024
>>>> interrupters, which some uses may want to limit depending on how many
>>>> users utilize the interrupters.
>>>>
>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>> ---
>>> Any reason for a DWC3-specific property? Why not just
>>> use the XHCI-common one from patch 14 and error out if
>>> a value of more than 8 is found?
>>>
> 
> I'm pretty sure I said use the common one already...
> 

Yes, you mentioned that in the last rev.

>>
>> Not every XHCI plat user is going to be DWC3.  In case DWC3 is used, the
>> DWC3 host driver is the one that populates and adds the XHCI plat device (no
>> separate device node for XHCI), so that requires the DWC3 host to also
>> populate properties for the XHCI device. (dwc3_host_init())
> 
> This binding references usb-xhci.yaml already, so any property from
> there is allowed. Linux needs to handle that regardless of what the
> driver structure/division looks like.
> 

Ok, understood.  I will remove the need to have another DWC3 property 
and just use the XHCI one directly.  Checks are already in place in the 
DWC3 parser to limit the interrupters if it exceeds 8.

Thanks
Wesley Cheng
