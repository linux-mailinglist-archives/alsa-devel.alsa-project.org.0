Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 354E495F4D8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 17:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75480829;
	Mon, 26 Aug 2024 17:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75480829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724685393;
	bh=MNySsTMjSfq+h1YPOUlX+67nt0L84v5H9Fl6brzwTkI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imgCakhHhwcWfzfeZRM8OGHEWbwpV51xVep5vEjYFiQlL1kShhsy9x6v/NoSUj6Qj
	 Nf/iv0ltuupHg3Bf0Xri3Ei7cJzaQnfirbJGeYvCjI2lAPWXz9XRnsUiV++keLACsr
	 v4R+WPXhnbUyojgUtw0z12Al2lttqsd4VTD5vXkA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 102D9F8058C; Mon, 26 Aug 2024 17:16:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51991F80568;
	Mon, 26 Aug 2024 17:16:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB435F80423; Mon, 26 Aug 2024 17:12:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9451FF80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 17:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9451FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=bRqcjasO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 47Q8MSR5003106;
	Mon, 26 Aug 2024 15:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2WGmtVoNopml6AxDzLxFtlGo8E8wIzrXO8d4WxlEMaA=; b=bRqcjasOwsmas9aV
	UYudAUzthwzDtTcb2T2KNGHLiCBmz7L29S1nPWntYunXe2nT2OY10QXKhO0TI5fn
	udCVuc+e5aF/0ETvRBLUPo9KyQa3aDD+JsEmPQw2kNlaKHQ4Lxbun4sn23ew89ou
	DzgXtpeSm+hYKJmSUFnifZ2vUdVcqTYnOt5r86rZxUKEMARX4UgZ41guO7sYSNhC
	kyVhmgrpI2UWJjpywhtzA+2Iw4tmnBRBkUnOFFMkJQd9UfqGPfYhc3N4kB+zbeuS
	ktw2SuN2EV+IoMVk5HKcvuH1W2ztm2JNrjva+WOpYr8a05Y3YfpZ+2dyfoRbeP1D
	ySTzRg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41796kv1b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 15:11:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 47QFBi60008804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 15:11:44 GMT
Received: from [10.110.100.101] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 08:11:44 -0700
Message-ID: <5459c1bc-33eb-41ad-b290-3d40bb5b81fe@quicinc.com>
Date: Mon, 26 Aug 2024 08:11:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 01/33] xhci: add helper to stop endpoint and wait for
 completion
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-2-quic_wcheng@quicinc.com>
 <9f25b900-ae1c-41af-a380-ac5e00860283@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9f25b900-ae1c-41af-a380-ac5e00860283@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tzt44VPgerTf-ShlyNRILMJIgpSquE64
X-Proofpoint-ORIG-GUID: tzt44VPgerTf-ShlyNRILMJIgpSquE64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_12,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408260115
Message-ID-Hash: 6FC2ZVXUAAXOL642CIN65K5EM6XJR5ZV
X-Message-ID-Hash: 6FC2ZVXUAAXOL642CIN65K5EM6XJR5ZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FC2ZVXUAAXOL642CIN65K5EM6XJR5ZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre,

On 8/26/2024 1:48 AM, Pierre-Louis Bossart wrote:
>
> On 8/23/24 22:00, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
>> xhci_queue_stop_endpoint().  This is useful for client drivers that are
>> using the secondary interrupters, and need to stop/clean up the current
>> session.  The stop endpoint command handler will also take care of cleaning
>> up the ring.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  drivers/usb/host/xhci.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  drivers/usb/host/xhci.h |  2 ++
>>  2 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 37eb37b0affa..3a051ed32907 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -2784,6 +2784,45 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>>  	return -ENOMEM;
>>  }
>>  
>> +/*
>> + * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
>> + * waits for the command completion before returning.
>> + */
>> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
>> +			    gfp_t gfp_flags)
>> +{
>> +	struct xhci_command *command;
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	command = xhci_alloc_command(xhci, true, gfp_flags);
>> +	if (!command)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_irqsave(&xhci->lock, flags);
>> +	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
>> +				       ep->ep_index, suspend);
>> +	if (ret < 0) {
>> +		spin_unlock_irqrestore(&xhci->lock, flags);
>> +		goto out;
>> +	}
>> +
>> +	xhci_ring_cmd_db(xhci);
>> +	spin_unlock_irqrestore(&xhci->lock, flags);
>> +
>> +	wait_for_completion(command->completion);
>> +
>> +	if (command->status == COMP_COMMAND_ABORTED ||
>> +	    command->status == COMP_COMMAND_RING_STOPPED) {
>> +		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
> nit-pick: is this really a timeout? In that case you would have used
> wait_for_completion_timeout(), no?

With respects to the xHCI command implementation, every time a command is queued to the host controller, it arms timer (xhci->cmd_timer) that is used to handle the timeout conditions.  This is the reason for not using the _timeout() variant, as we can let the xHCI command timeout handler do the cleanup and stopping of the HCD. (marking as dead)  It will also ensure that any completion events are completed as part of the timeout handler as well (xhci_handle_command_timeout() --> xhci_abort_cmd_ring())

Thanks

Wesley Cheng

>> +		ret = -ETIME;
>> +	}
>> +out:
>> +	xhci_free_command(xhci, command);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
>>  
>>  /* Issue a configure endpoint command or evaluate context command
>>   * and wait for it to finish.
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index 30415158ed3c..1c6126ed55b0 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -1914,6 +1914,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
>>  void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
>>  void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
>>  unsigned int count_trbs(u64 addr, u64 len);
>> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
>> +			    int suspend, gfp_t gfp_flags);
>>  
>>  /* xHCI roothub code */
>>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,
