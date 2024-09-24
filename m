Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBE984D00
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 23:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4188E950;
	Tue, 24 Sep 2024 23:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4188E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727214518;
	bh=ch1B+nC2XYty/18UmhZn1YTMQF1mkQxUCTtY9tk2Hzs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KCbPpQmKl1kBOQBw19a0j7iow1FITzSL/WQzVzkbqQHRSe1QgSwCHHVzYcnZ7xekW
	 PSS234Mn9pGt00tPBQlJQcASqRxErbhgrhhUFt2CmFP/5WSXkhumC/j+/4GyaroMP3
	 FdDHYUQQH6XrbM1T6p01oBaIawBf0exv8dfuIjmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55C09F805B5; Tue, 24 Sep 2024 23:48:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94A70F805B0;
	Tue, 24 Sep 2024 23:48:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 943FCF802DB; Tue, 24 Sep 2024 23:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78649F80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 23:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78649F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Gyb5F3Yu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48OHWcXS013004;
	Tue, 24 Sep 2024 21:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ch1B+nC2XYty/18UmhZn1YTMQF1mkQxUCTtY9tk2Hzs=; b=Gyb5F3YugcXOHjzE
	m5DpE3ezd3wXVDLsSZXbNge3FGmMWXVPXPwHeb9tBmVUZXr5K8d8hJMjLCRs9dM4
	RR42dn8TIZu5NwOZOKEon7CroYMKhx7LvkprC9vdQT5I2NJTgYXexcJUBizRxMBT
	J5AqWbgo8DCL6Zfiic8I5tp9FGB0Ysa9k4Ysp8c7BZMu/EC3RZAnrLn3/4s5pKlO
	aUEqW5Qoawu7ZDqYv2iAaV2A+HSIOpsBHfQaZnG1tTLmzd2ApJaOLwUm3xZ5zgXx
	xMucpwKhtKCrWdTeYoRBpzqBDGC2NgIQfn65ieuliTC7cbJ3681+pT1AgDqHPrV/
	7TI+Hg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakhpa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 21:47:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 48OLluZR006391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 21:47:56 GMT
Received: from [10.110.20.217] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 14:47:55 -0700
Message-ID: <dec459d3-fa0d-4ed0-ad6b-4a976b0f9e49@quicinc.com>
Date: Tue, 24 Sep 2024 14:47:54 -0700
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
 <182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
 <20240923012328.1e4d0bc6@foxbook>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240923012328.1e4d0bc6@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qiPxEtCjhcoNN42tT5PhLvaywjB-iOC8
X-Proofpoint-GUID: qiPxEtCjhcoNN42tT5PhLvaywjB-iOC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240151
Message-ID-Hash: GU3TK3FLYFS5HECMUAULSTHDLOOA5L6Y
X-Message-ID-Hash: GU3TK3FLYFS5HECMUAULSTHDLOOA5L6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GU3TK3FLYFS5HECMUAULSTHDLOOA5L6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michal

On 9/22/2024 4:23 PM, Michał Pecio wrote:
> Hi,
>
>> So what I ended up doing was to split off the context error handling
>> into a separate helper API, which can be also called for the sync ep
>> stop API.  From there, based on say....the helper re queuing the stop
>> EP command, it would return a specific value to signify that it has
>> done so.  The sync based API will then re-wait for the completion of
>> the subsequent stop endpoint command that was queued.
> AFAIK retries are only necessary on buggy hardware. I don't see them on
> my controllers except for two old ones, both with the same buggy chip.
>
>>  In all other context error cases, it'd return the error to the caller,
>> and its up to them to handle it accordingly.
> For the record, all existing callers end up ignoring this return value.
>
> Honestly, I don't know if improving this function is worth your effort
> if it's working for you as-is. There are no users except xhci-sideband
> and probably shouldn't be - besides failing to fix stalled endpoints,
> this function also does nothing to prevent automatic restart of the EP
> when new URBs are submitted through xhci_hcd, so it is mainly relevant
> for sideband users who never submit URBs the usual way.
>
> My issue with this function is that it is simply poorly documented what
> it is or isn't expected to achieve (both here and in the calling code
> in xhci-sideband.c), and the changelog message is wrong to suggest that
> the default completion handler will run (unless somewhere there are
> patches to make it happen), making it look like this code can do things
> that it really cannot do. And this is apparently a public, exported API.

Thanks for the clarifications.  Yes, unfortunately, I can't really test any scenarios where this would be exercised in the current path, so I will leave the code out for now, and just add some comments and updates to the commit message.  Can revisit when there is some other users for utilizing secondary interrupters.

Thanks

Wesley Cheng

