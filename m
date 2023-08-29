Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC8778BFAA
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 09:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23321F2;
	Tue, 29 Aug 2023 09:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23321F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693295537;
	bh=pY0ULOcJRtKWSIybxypDPttEl48rjbi03G4bRSgyox4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HuHfR0GJ8S5tPLSLp/nWZLsglJExMeUY1n8C830/lsApI6DV2MxxPkuZgU5zt7N20
	 2hLf+PktG+OCc3iSSJIIqKha5A4GegoITNOdrBO787UjEDK5IVcGbgp0iRWzUXTQlf
	 6Wn3f7Y/pSNfUUVvfY+jmAfvk+07mdG8RVezhbHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84D7CF80155; Tue, 29 Aug 2023 09:51:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEAC9F80155;
	Tue, 29 Aug 2023 09:51:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D557CF80158; Tue, 29 Aug 2023 09:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B88F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 09:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B88F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=LM5qESvP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37T7E8XU022824;
	Tue, 29 Aug 2023 07:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=n0qmg06RN1x9oidKdpsB9U+geqMev7HxNzt7gY8+6os=;
 b=LM5qESvPAmYL1wfU0EiIAOa6tNJMpqgdxdt6A7r0LhBlV35i0/lDKRpExt3I+wkoU5uR
 W52DTGpNDwDIQft5jhIhmcS+T9cSDPPPD2drdL1tUkkF6btg8fiNue+ae2GKRp83vNsT
 T8t0Q39soTo+cuZ0r2UK3vj7FKwONxyHQ/3B15P9qb4chljwFmFceoRS+3nd5MRtLozh
 R84vXaa/y8RDeMfdl34pUO9qt6RvgFn9JYQrecIuvxkYrY/mO2gJtwxHrLht4vfR7XcD
 Igp6RdTWpdC+u/W7UB1DD6KGL7VT6er2qCupIFphjQHTrR09KvakssNrQ/KAze1Yh7WO Og==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ss4wq0rvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 07:51:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 37T7oqTf021732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 07:50:52 GMT
Received: from [10.110.46.69] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 00:50:51 -0700
Message-ID: <c6a5b214-7812-25a4-c23c-8e57c0efe3fd@quicinc.com>
Date: Tue, 29 Aug 2023 00:50:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 11/28] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring
	<robh@kernel.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <gregkh@linuxfoundation.org>,
 <tiwai@suse.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <quic_jackp@quicinc.com>,
        <quic_plai@quicinc.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-12-quic_wcheng@quicinc.com>
 <20230311134008.GA20831-robh@kernel.org>
 <f7bd1ae7-fc38-0f29-546b-9ea4a323f42f@quicinc.com>
 <73655c17-5246-2c96-d415-6a30497966c3@linaro.org>
 <9d31db9c-4e58-767a-15c5-65f7c04bd989@quicinc.com>
 <e2b2f268-182a-5ba4-2541-f0a401eda1c8@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e2b2f268-182a-5ba4-2541-f0a401eda1c8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZcPfopBsDJ1JQuOuXkevSo_AEwKMdkw2
X-Proofpoint-ORIG-GUID: ZcPfopBsDJ1JQuOuXkevSo_AEwKMdkw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_04,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 adultscore=0
 mlxlogscore=433 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290067
Message-ID-Hash: I7U7WZUSZRZHEEHRYIIRXS6PQFJJ2LOG
X-Message-ID-Hash: I7U7WZUSZRZHEEHRYIIRXS6PQFJJ2LOG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7U7WZUSZRZHEEHRYIIRXS6PQFJJ2LOG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/2023 12:42 AM, Krzysztof Kozlowski wrote:
> On 29/08/2023 09:19, Wesley Cheng wrote:
>>>>
>>>> This is a XHCI feature, but the DWC3 design is built in a way that DWC3
>>>> host initializes the XHCI device and populates the properties associated
>>>> to XHCI dev.
>>>
>>> You speak about driver now, not bindings. If driver has limitations,
>>> change it. Not really problem of bindings.
>>>
>>
>> Its the limitation of the HW.  Depending on how the SNPS DWC3 controller
>> was implemented the vendor it can support less than the value mentioned
>> in the Synopsys databook.
> 
> Then what is "XHCI dev"? A Linux device? Then a driver topic. What is
> "populates the properties" - what or whose properties? Of Linux device?
> Then a driver topic...
> 

I will reword it to using XHCI host controller versus using terms like 
device and properties for the next rev.

Thanks
Wesley Cheng
