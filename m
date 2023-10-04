Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A8B7B8A9A
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 20:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC145A4A;
	Wed,  4 Oct 2023 20:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC145A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696444648;
	bh=l2Vy7dcBtmWkZCjePdvnKJDsdyYpnBkQGjTthUmW6Ww=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dvuNFP0c6/ZXjgKJzBt+Y5z/Zd/tGGCoXPshW8vKjHmzSxB45Lgd5pgnZe0NkB2dz
	 yym7/SIcSG1CZG51rvqGaT1i/0qi737FdeAjQM1QS80yEPH0vEET33BhcVLg4hVuIH
	 w78hj/jKilAyCEhxjakjZNYUwmC1F+Xp1joRJN+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE1DF80549; Wed,  4 Oct 2023 20:36:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4655F80310;
	Wed,  4 Oct 2023 20:36:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A40F8047D; Wed,  4 Oct 2023 20:36:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5C74F80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 20:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C74F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=AfcnYAjL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 394FBLvr028282;
	Wed, 4 Oct 2023 18:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6M3YAebF9rrs3opK3mpTD1jmedIyRT/cMOQ6DDH1tyM=;
 b=AfcnYAjLVk8hVxmWmdF/yylUGqfIZ7FeD1F4DB9WeY2hh1UuUaO8K8wzGq8ENxXacTBv
 +rXSm3UKVxoh9zjzKMby24VOV44iXS4UiH+RgCqYC8p/eg4/8vz4et4tjPoOwYPM4B4q
 duDpI5J0Dr9MHLh4hLwsjAQZOps3/HLypCaDY9fIcuMU6YyyGj6OgzDanbRsqcki2GAi
 2ujp+RKWMC8xWFH56kRquJsGwybxookOCZVxSPiNqMMm/Z89gpgUGFNEdLbTr4ZyTIdm
 WvAqoiCoOL9fA3OTtsRUCuK3AydDvMiu0GhTgKM0stQKqOcKGtZuH+vz4/U4Wny8iARN Jw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3th2gq1t4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 18:35:45 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 394IZhC3025160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Oct 2023 18:35:44 GMT
Received: from [10.71.112.36] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 4 Oct
 2023 11:35:10 -0700
Message-ID: <2127ef61-e263-2a0e-438a-6baa125aa70d@quicinc.com>
Date: Wed, 4 Oct 2023 11:35:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v7 01/33] xhci: add support to allocate several
 interrupters
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@intel.com>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <Thinh.Nguyen@synopsys.com>
CC: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-2-quic_wcheng@quicinc.com>
 <10ad0613-7e88-dbe8-c5a2-d535f8e9db03@linux.intel.com>
 <e3f3c8cd-6338-da08-d988-4d2ed68280e6@quicinc.com>
 <843897f1-3ce5-f8da-5f10-7d8a68849fd2@intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <843897f1-3ce5-f8da-5f10-7d8a68849fd2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 6qI8t9feb8uXz-ckzPnXYaJeZ5ViYC9L
X-Proofpoint-ORIG-GUID: 6qI8t9feb8uXz-ckzPnXYaJeZ5ViYC9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=598 mlxscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310040136
Message-ID-Hash: P6B7MXAFEQCVPAJV7PG42BTP2JBUFIJ3
X-Message-ID-Hash: P6B7MXAFEQCVPAJV7PG42BTP2JBUFIJ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6B7MXAFEQCVPAJV7PG42BTP2JBUFIJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mathias,

On 10/4/2023 7:02 AM, Mathias Nyman wrote:
> On 2.10.2023 23.07, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 9/28/2023 3:31 AM, Mathias Nyman wrote:
>>> On 22.9.2023 0.48, Wesley Cheng wrote:
>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>
>>>> Modify the XHCI drivers to accommodate for handling multiple event 
>>>> rings in
>>>> case there are multiple interrupters.  Add the required APIs so 
>>>> clients are
>>>> able to allocate/request for an interrupter ring, and pass this 
>>>> information
>>>> back to the client driver.  This allows for users to handle the 
>>>> resource
>>>> accordingly, such as passing the event ring base address to an audio 
>>>> DSP.
>>>> There is no actual support for multiple MSI/MSI-X vectors.
>>>>
>>>> Factoring out XHCI interrupter APIs and structures done by Wesley 
>>>> Cheng, in
>>>> order to allow for USB class drivers to utilze them.
>>>>
>>>>   }
>>>> +void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct 
>>>> xhci_interrupter *ir)
>>>> +{
>>>> +    struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>>>> +    unsigned int intr_num;
>>>> +
>>>> +    /* interrupter 0 is primary interrupter, don't touchit */
>>>> +    if (!ir || !ir->intr_num || ir->intr_num >= 
>>>> xhci->max_interrupters) {
>>>> +        xhci_dbg(xhci, "Invalid secondary interrupter, can't 
>>>> remove\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /* fixme, should we check xhci->interrupter[intr_num] == ir */
>>>> +    spin_lock(&xhci->lock);
>>>
>>> Needs to be spin_lock_irq() ir spin_lock_irqsave() as xhci->lock is 
>>> used in interrupt handler.
>>>
>>>
>>>> +    intr_num = ir->intr_num;
>>>> +    xhci_free_interrupter(xhci, ir);
>>>> +    xhci->interrupters[intr_num] = NULL;
>>>> +    spin_unlock(&xhci->lock);
>>>
>>> likewise
>>>
>>
>> Let me check these again.  In general, I think I will use both the 
>> xhci->mutex and xhci->lock where needed, because I believe we'd run 
>> into sleep while atomic issues
>> while freeing the DMA memory.  Will rework this and submit in the next 
>> rev.
>>
> 
> Maybe we need to split xhci_free_interrupter() into separate remove and 
> free functions
> 

Thanks for sharing the work you've been doing.  Yes, I did something 
similar as well on my end, but will refactor in your code and re-test.

> Did some work on this, and on the sideband api in general.
> 
> Code still has a lot of FIXMEs, and it's completely untested, but to 
> avoid us
> from doing duplicate work I pushed it to my feature_interrupters branch 
> anyway
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git 
> feature_interrupters
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=feature_interrupters 
> 

Ok.  Initial look at it seems like it will be fine, but will integrate 
and make changes where needed.

Thanks
Wesley Cheng
