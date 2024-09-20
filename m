Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07397DAEC
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Sep 2024 01:50:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EFF7B71;
	Sat, 21 Sep 2024 01:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EFF7B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726876243;
	bh=ipjxMYTJoUHV3BA3NQmOYPF7baYuN9ZnKpWZo3rOiu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kb0Y/M2wU9OIyugoDatlp8OI5tgjA8E41fw0przk2fGpU/LrII3X3daPR0SgZtQ1b
	 UM/RRzrLl6B8mCv0ZG1jEOuspdyFan84XtqVfdOO9i6sPIL1UPey79Wws8beSAcRRu
	 6fLZinLUlCcsmEGvphuc7jC+t8wa5KJcw/FqtdyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98674F8059F; Sat, 21 Sep 2024 01:50:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B99D7F800D0;
	Sat, 21 Sep 2024 01:50:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C5E5F8020D; Sat, 21 Sep 2024 01:50:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C749AF80074
	for <alsa-devel@alsa-project.org>; Sat, 21 Sep 2024 01:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C749AF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=oJUhsjfE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48KKfbDf018634;
	Fri, 20 Sep 2024 23:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipjxMYTJoUHV3BA3NQmOYPF7baYuN9ZnKpWZo3rOiu4=; b=oJUhsjfEtGDyM+Xk
	sT9Exk6FnRk/K6LyxiHaCDBqhVQbTf9oAsbilKHcPnCirdSxQW7Zu1BgW5oSfbOl
	fZi+/Dg5P+46YauPnUtI1ShsqpNNTsKIxnWvPiRVF0Hl3tNcbs/mMeNeVPfGGI5W
	WA71H3X71j6loxOa4Uop19VSgmmhYkd2pjOPqFrgcR+youl3vZYOR085mQ5eaqAp
	MT/5pUUcu/2hkaGobdhEskM14ziOgL75PBULCWpJURYdIszjjkZ1vdUB9UoFMl0Z
	8dq1uAhO9+I14V7FSfXVJ8axATi9KnrF/xg0onTL2vXjzp4MtEVigsfIOxkYHy7d
	ANgOUw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hftsu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 23:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48KNnwf2011994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 23:49:58 GMT
Received: from [10.71.112.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 16:49:57 -0700
Message-ID: <182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
Date: Fri, 20 Sep 2024 16:49:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait for
 completion
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
CC: <mathias.nyman@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
        <broonie@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
        <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>,
        <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <robh@kernel.org>, <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <20240913103237.2f5dc796@foxbook>
 <a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
 <20240915095514.6b01fefb@foxbook>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240915095514.6b01fefb@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: iytzgxK0RhtlpMsGzW7stpvgCpcQAXKb
X-Proofpoint-ORIG-GUID: iytzgxK0RhtlpMsGzW7stpvgCpcQAXKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200174
Message-ID-Hash: ROQG6OECEB73SBA3CAEWY5PVB57MWDRG
X-Message-ID-Hash: ROQG6OECEB73SBA3CAEWY5PVB57MWDRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROQG6OECEB73SBA3CAEWY5PVB57MWDRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michal,

On 9/15/2024 12:55 AM, Michał Pecio wrote:
> Hi,
>
>> Maybe the last sentence is not needed.  When we are using the
>> secondary interrupters, at least in the offload use case that I've
>> verified with, the XHCI is completely unaware of what TDs have been
>> queued, etc...  So technically, even if we did call the default
>> handler (ie xhci_handle_cmd_stop_ep), most of the routines to
>> invalidate TDs are going to be no-ops.
> Yes, the cancellation machinery will return immediately if there are
> no TDs queued by xhci_hcd itself.
>
> But xhci_handle_cmd_stop_ep() does a few more things for you - it
> checks if the command has actually succeeded, clears any halt condition
> which may be preventing stopping the endpoint, and it sometimes retries
> the command (only on "bad" chips, AFAIK).
>
> This new code does none of the above, so in the general case it can't
> even guarantee that the endpoint is stopped when it returns zero. This
> should ideally be documented in some way, or fixed, before somebody is
> tempted to call it with unrealistically high expectations ;)
>
> As far as I see, it only works for you because isochronous never halts
> and Qualcomm HW is (hopefully) free of those stop-after-restart bugs.
> There will be problems if the SB tries to use any other endpoint type.

So what I ended up doing was to split off the context error handling into a separate helper API, which can be also called for the sync ep stop API.  From there, based on say....the helper re queuing the stop EP command, it would return a specific value to signify that it has done so.  The sync based API will then re-wait for the completion of the subsequent stop endpoint command that was queued.  In all other context error cases, it'd return the error to the caller, and its up to them to handle it accordingly.

Thanks

Wesley Cheng

