Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D0B656FE0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 22:14:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 683E17DBF;
	Tue, 27 Dec 2022 22:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 683E17DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672175655;
	bh=s7C4AvRgDx4P3pKpBeWZFZqrKswPJ5Ow25EE757/ddg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WuDI9RcGr6NUKihZl2Mr9/XBRHTMHlAlXbyfWR/YxF1uaQoLlRb9uvejQMaVn42JN
	 L5DenLcc3knvnDtZbpmyQJ8dCeF1wI/lHRNsz3VE1GE9Xyvsn1EjeK393AlcMYyNxm
	 WP7S4syf6TbfwWLgvbYp9DG2MwpLB2lwK8NrJ9MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9748F8023B;
	Tue, 27 Dec 2022 22:13:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78F4EF8023B; Tue, 27 Dec 2022 22:13:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E432F804B0
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 22:13:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E432F804B0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=FODmdZjR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRKxwL4003804; Tue, 27 Dec 2022 21:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=jgO5us+oA4k3N4yZQE4cDbyyRZmFzPfkDOIOMe2G32Q=;
 b=FODmdZjRYIhHmSdQQIxeV5XovvEbdWbpGbaWTN6IFwy5KrOC4MNuJgkCHVNoJIi6LKMy
 YRZBGItlxTfIUrCqmISv0K79JDyRbRY9IeLH0x+yJVRIjyNGjnWGDpMg4cLsE36RoDjS
 ic+yV3gYzdDdbzM7arqhPCd9xaj9jfDF/z7F4NXTWa24Bd5C++FkKzatzOYvjdR9b+dB
 dUbnbi2qY4bMTKQij/vV4y6AqHKrX2Gag0j1Id3bvWPg0gmMJm9znuYrrW85Oi+truaJ
 WX0Kvh+SkI55ik2QcWBcit4qQ1brT+nOPerm/G7uuZiSay8dSq+W2jvwGEff9l/7Wv8O wA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnsna5hnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:13:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRLD86F012266
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:13:08 GMT
Received: from [10.110.31.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 13:13:06 -0800
Message-ID: <1c72011b-b80c-7f6f-66d3-0658cfd600d2@quicinc.com>
Date: Tue, 27 Dec 2022 13:13:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 06/14] usb: core: hcd: Introduce USB HCD APIs for
 interrupter management
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-7-quic_wcheng@quicinc.com> <Y6a+VJ75lRIUE9yD@kroah.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Y6a+VJ75lRIUE9yD@kroah.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: F9HvhhInpQnjSHfK6HuHlGUpVZJbRwtx
X-Proofpoint-ORIG-GUID: F9HvhhInpQnjSHfK6HuHlGUpVZJbRwtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_16,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 mlxlogscore=382 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270176
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, bgoswami@quicinc.com, mathias.nyman@intel.com,
 Thinh.Nguyen@synopsys.com, andersson@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Greg,

On 12/24/2022 12:54 AM, Greg KH wrote:
> On Fri, Dec 23, 2022 at 03:31:52PM -0800, Wesley Cheng wrote:
>> For USB HCDs that can support multiple USB interrupters, expose functions
>> that class drivers can utilize for setting up secondary interrupters.
>> Class drivers can pass this information to its respective clients, i.e.
>> a dedicated DSP.
> 
> Where is the locking here that seems to be required when a hcd is
> removed from the system and you have data in flight?  What am I missing
> here in the design of this?

The XHCI driver is the one that maintains the list of interrupters that 
are available, so the locking was placed in the XHCI driver versus 
adding it in the core hcd layer.

> 
> And yes, HCDs get removed all the time, and will happen more and more in
> the future with the design of more systems moving to Thunderbolt/PCIe
> designs due to the simplicity of it.
> 

As part of the HCD removal, it has to first ensure that class driver 
interfaces, and the connected udevs are removed first.  qc_audio_offload 
will first handle the transfer cleanup and stopping of the audio stream 
before returning from the disconnect callback. (this includes ensuring 
that the interrupter is released)

This concept is how all usb class drivers are currently implemented. 
When the HCD remove occurs, the class drivers are the ones responsible 
for ensuring that all URBs are stopped, and removed before it returns 
from its respective disconnect callback.

>> +/**
>> + * usb_set_interruper - Reserve an interrupter
> 
> Where is an "interrupter" defined?  I don't know what this term means
> sorry, is this in the USB specification somewhere?
> 

Interrupter is defined in the XHCI spec, refer to "section 4.17 
Interrupters"

> 
>> + * @udev: usb device which requested the interrupter
>> + * @intr_num: interrupter number to reserve
>> + * @dma: iova address to event ring
>> + *
>> + * Request for a specific interrupter to be reserved for a USB class driver.
>> + * This will return the base address to the event ring that was allocated to
>> + * the specific interrupter.
>> + **/
>> +phys_addr_t usb_set_interruper(struct usb_device *udev, int intr_num,
>> +							dma_addr_t *dma)
>> +{
>> +	struct usb_hcd *hcd;
>> +	phys_addr_t pa = 0;
>> +
>> +	hcd = bus_to_hcd(udev->bus);
>> +	if (hcd->driver->update_interrupter)
>> +		pa = hcd->driver->update_interrupter(hcd, intr_num, dma);
>> +
>> +	return pa;
> 
> Wait, you return a physical address?  What are you going to do with
> that?  And what guarantees that the address is valid after you return it
> (again, remember memory and devices can be removed at any point in time.
> 

The interrupter is basically another event ring which is the buffer 
allocated for the controller to copy events into.  Since the audio dsp 
now takes over handling of the endpoint events, then it needs to know 
where the buffer resides.  Will fix the interruper typo as well.

The allocation and freeing of this event ring follows how XHCI allocates 
and frees the main event ring as well.  This API just reserves the 
interrupter for the class driver, and return the previously allocated 
(during XHCI init) memory address.

Thanks
Wesley Cheng
