Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A04946B2DF4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Mar 2023 20:52:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07F51891;
	Thu,  9 Mar 2023 20:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07F51891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678391526;
	bh=bYrwqZxgazS5MAIL36xXenYmpyrf5552LSJu8fjVATQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AY6rJdMbQVO6WvBlr5iX+MHiVbrE4Fi+C7tUoYe46oko8YFdICuvupw1Ks4ILutrv
	 M+G9OTSAl3uzE/MrO3FboKYw7PRTEFv+Yx4HlLO01b9PavWiNOT++BUW7EIfRH5XC4
	 CiEvAVbzxVw+fmbRMceZVs4Hbz5nHEFavd2xbPhI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E98F80236;
	Thu,  9 Mar 2023 20:51:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3AC4F8042F; Thu,  9 Mar 2023 20:51:12 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 91C26F8007E
	for <alsa-devel@alsa-project.org>; Thu,  9 Mar 2023 20:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91C26F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=VI5vS0TL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329Jmu0O017492;
	Thu, 9 Mar 2023 19:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=RCEYb1Ihg59IinP+txkWtQHoA64JPH94f7dtWtPgKEs=;
 b=VI5vS0TLXE11Qhq/53pkIMtV4dW5FASfwLhdzoHM+ICxdhfwSUrqsi44oIgNO+Hf9jsf
 fY07IEMg2wYO5aweMMAt1QMaDPMRYAbf+Hd8cj616/isUkdvqpebPL6wu1O5LkCx8ypx
 XW4NR4Pm8l2EhkvouE8YICy5WGgRY3yFazmUL1z2JqPxYDv6iPJ491HMDxUXoYB7EC1x
 smzcvd2RsONRRJ8aCKaAN514led6L/pX0Jk9OJJWvqHZN3kwciZlT9OqtvHTM8Gxlapz
 gG09U/qkVLIid3qPLz595MR4yj/IicuDZd5VWLYiTaAMOrr1CjylUvGBnCkjYna+sEAn Ew==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p72qau466-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 19:51:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 329Jp5cO030563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Mar 2023 19:51:05 GMT
Received: from [10.110.90.116] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 9 Mar 2023
 11:51:04 -0800
Message-ID: <74b92725-8596-2f86-02b9-8dbfd6df9d95@quicinc.com>
Date: Thu, 9 Mar 2023 11:51:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 02/28] usb: xhci: Add XHCI APIs to support USB
 offloading
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-3-quic_wcheng@quicinc.com> <ZAl+ydxOCoGXIj1Y@kroah.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <ZAl+ydxOCoGXIj1Y@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: geECP4ky0IkofcbkGzEuZCV5TJOm-pFx
X-Proofpoint-ORIG-GUID: geECP4ky0IkofcbkGzEuZCV5TJOm-pFx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_10,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090158
Message-ID-Hash: RXZCG3SFG3Z73YJFLCUKIO5GOHBAH4HK
X-Message-ID-Hash: RXZCG3SFG3Z73YJFLCUKIO5GOHBAH4HK
X-MailFrom: quic_wcheng@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, robh+dt@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXZCG3SFG3Z73YJFLCUKIO5GOHBAH4HK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg,

On 3/8/2023 10:38 PM, Greg KH wrote:
> On Wed, Mar 08, 2023 at 03:57:25PM -0800, Wesley Cheng wrote:
>> Some use cases, such as USB audio offloading, will allow for a DSP to take
>> over issuing USB transfers to the host controller.  In order for the DSP to
>> submit transfers for a particular endpoint, and to handle its events, the
>> client driver will need to query for some parameters allocated by XHCI.
>>
>> - XHCI secondary interrupter event ring address
>> - XHCI transfer ring address (for a particular EP)
>> - Stop endpoint command API
>>
>> Once the resources are handed off to the DSP, the offload begins, and the
>> main processor can enter idle.  When stopped, since there are no URBs
>> submitted from the main processor, the client will just issue a stop
>> endpoint command to halt any pending transfers.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/host/xhci.c       | 130 ++++++++++++++++++++++++++++++++++
>>   include/linux/usb/xhci-intr.h |   8 +++
>>   2 files changed, 138 insertions(+)
> 
> Please use checkpatch.pl on your patches before sending them out :(
> 
> Some other minor comments:
> 

Thanks for taking the time to review these!

Hmm, I did run checkpatch, and cleaned up the warnings it did give. 
However, I think something changed with regards to the tools on my host 
env.  Will address those and make sure it runs properly next time.

Will fix the minor changes you mentioned, and focus on the general 
questions you had.

>> diff --git a/include/linux/usb/xhci-intr.h b/include/linux/usb/xhci-intr.h
>> index 738b0f0481a6..d42cc9a1e698 100644
>> --- a/include/linux/usb/xhci-intr.h
>> +++ b/include/linux/usb/xhci-intr.h
>> @@ -80,7 +80,15 @@ struct xhci_interrupter {
>>   	u64	s3_erst_dequeue;
>>   };
>>   
>> +/* Secondary interrupter */
>>   struct xhci_interrupter *
>>   xhci_create_secondary_interrupter(struct usb_hcd *hcd, int intr_num);
>>   void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir);
>> +
>> +/* Offload */
>> +int xhci_stop_endpoint(struct usb_device *udev,
>> +			struct usb_host_endpoint *ep);
>> +phys_addr_t xhci_get_xfer_resource(struct usb_device *udev,
>> +					struct usb_host_endpoint *ep, dma_addr_t *dma);
>> +phys_addr_t xhci_get_ir_resource(struct usb_device *udev, struct xhci_interrupter *ir);
> 
> Why are these functions unique to offload?
> 

Wanted to separate the set of APIs used for creating a secondary 
interrupter versus offload related ones.  In general, the APIs under the 
secondary interrupter portion can be used for other things other than 
offloading.  As Mathias pointed out, they had a use case where they 
wanted to utilize the secondary interrupter to actually route and 
receive interrupts on the secondary ring, not to suppress them. (which 
is opposite of what the offload concept is doing)

Now for the offload section, those are specific to that feature, because 
we need to pass certain memory information about what was allocated by 
XHCI to the entity that we are offloading the IO operations to.  Hence, 
why they are APIs which fetch the transfer ring and event ring 
addresses.  In addition, we do have the stop EP as well, since in the 
offload case, since the main processor doesn't submit TDs (transfer 
descriptors) then it isn't aware there are transfers in progress.  When 
the endpoint is released, then the offload driver needs to be the one 
that halts the EP.

As you mentioned, I will add documentation to better describe these.

Thanks
Wesley Cheng
