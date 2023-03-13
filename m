Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC06B825F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 21:10:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4724B1425;
	Mon, 13 Mar 2023 21:09:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4724B1425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678738201;
	bh=QQnLw12sATkxoTDDvQ6SRZASxar/1oaBlKauOjrDCRE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rZ0MClCZJ1zCLRK/XZqFxsEdakMY7U1ieyR8iVGL0jQkizSqP3d+5mCJY9R+nzc6J
	 oWpMjZMfq6kNY5JxnJ74HYC6LKokERpyqZkJmQjzgZC1Xsggeqc40Kom8PjWj36NvF
	 FXIlxMQ98I3LqUkcey9qGrn7ST7tqXosQU/MbmWE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 804D0F80093;
	Mon, 13 Mar 2023 21:09:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EB94F80423; Mon, 13 Mar 2023 21:09:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21028F80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 21:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21028F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ON5fCxDH
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DGaXwg011798;
	Mon, 13 Mar 2023 20:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KwnIdWoiVAJBwcmcN8HpxRc9ZCasr2KvHIlvHAI8gXg=;
 b=ON5fCxDH4yEO3kIK7jweHPgWTQTR2Nc5gH1GXJL9wtM/0mznKSKf7x8/lujxEWqhGgOo
 YLFIH/3XnpL/0K+GamfQttfKh7f05nSU1hQTYOevJnz88MHfNP/qC6B8dXVDCyDxm2Xu
 hp6nOBZiS8ld2iAIZXhP0w4T9eMLpim/PLG8SKP/DB2nSQI5fMWP8zkkWsFM2+ydEl4I
 xqQdowKL/zklP0AhiIqpSYxSlhBEZZd2TNitlQcl1vtsxgcY5q8gVey0Nd4CDewDyo3O
 vKBbGkxz7+4VR3QT05c2jbwAWvTZst2Rdf6kGgzeVrpFkEdeifpjCvWilFTIUolAPUY1 rQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pa6n30kn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 20:08:55 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 32DK8sO4014513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 20:08:54 GMT
Received: from [10.110.94.159] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 13 Mar
 2023 13:08:53 -0700
Message-ID: <6024f762-6085-10cd-e73a-9031722b2334@quicinc.com>
Date: Mon, 13 Mar 2023 13:08:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 01/28] xhci: Add support to allocate several
 interrupters
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <tiwai@suse.com>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-2-quic_wcheng@quicinc.com>
 <a45ff335-0563-85c7-3b31-d6ca23a54a3f@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <a45ff335-0563-85c7-3b31-d6ca23a54a3f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3_oXSt_A1iE145gYnGnDroRcA8q41vMD
X-Proofpoint-GUID: 3_oXSt_A1iE145gYnGnDroRcA8q41vMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_09,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=994 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130158
Message-ID-Hash: 5PQ426NGVUJSEKNVMMQ4GK7LTWFRFI4S
X-Message-ID-Hash: 5PQ426NGVUJSEKNVMMQ4GK7LTWFRFI4S
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PQ426NGVUJSEKNVMMQ4GK7LTWFRFI4S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mathias,

On 3/10/2023 7:07 AM, Mathias Nyman wrote:
> On 9.3.2023 1.57, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Introduce xHCI APIs to allow for clients to allocate and free
>> interrupters.  This allocates an array of interrupters, which is based on
>> the max_interrupters parameter.  The primary interrupter is set as the
>> first entry in the array, and secondary interrupters following after.
>>
> 
> I'm thinking about changing this offloading xHCI API
> xhci should be aware and keep track of which devices and endpoints that
> are offloaded to avoid device getting offloaded twice, avoid xhci driver
> from queuing anything itself for these, and act properly if the offloaded
> device or entire host is removed.
> 
> So first thing audio side would need to do do is register/create an
> offload entry for the device using the API:
> 
> struct xhci_sideband *xhci_sideband_register(struct usb_device *udev)
> 
> (xHCI specs calls offload sideband)
> Then endpoints and interrupters can be added and removed from this
> offload entry
> 
> I have some early thoughts written as non-compiling code in:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git 
> feature_interrupters
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters 
> 
> 
> Let me know what you think about this.
> 

The concept/framework you built looks good to me.  Makes sense to have 
XHCI better maintain the offloading users.  One thing I would request is 
to move xhci-sideband.h to the include directory since the class driver 
levels would need to be able to reference the structure and APIs you've 
exposed.

I have yet to try it with our implementation, but I'll work on plugging 
it in and fix any issues I see along the way.

Thanks
Wesley Cheng
