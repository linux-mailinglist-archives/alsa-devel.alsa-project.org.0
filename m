Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E5F656FB5
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 22:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40417DE6;
	Tue, 27 Dec 2022 22:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40417DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672175257;
	bh=z9hR6PdQbysyEAizeDE6+2NsPNALXKpMcbxENkrHzTI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S1QIDdiZRj5LRLY+iEBSG/UxjLZKdTUsONBQbhfiKjAEA3f89+A543YOmtn+AMrEI
	 ntQd9p0xY2eFOdLHfo7tvt1/2asCVtk1YZ3dqo3DvEvsiLAUbYXoV2FPhW2vezKxxg
	 ue3A+YJpXCSxhYw8uhPoAbGGOPoMvjtV1LZkv2Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63035F804B0;
	Tue, 27 Dec 2022 22:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7630F804E4; Tue, 27 Dec 2022 22:06:42 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C855F804B0
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 22:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C855F804B0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=ihTCo4qq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRKx1oH028995; Tue, 27 Dec 2022 21:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1uhLU5AfBzQHfS2v22R1XGgfpb7X30fYPSm78dQqBO0=;
 b=ihTCo4qqNMz0jpHc8k6+p31Zm9UHg2BppgNNu7i+v83cYdtE6G3DPgsmebzWePVGutp9
 rb8vl9Bi7viJl2fQAk21SOsC9GLYAvZce6899TjAA+3kwI1cKrGrsbK8nnK8b+9Q9s73
 iPmqs4lM5kR0n3KjbUWLIv/ygLciT6i0z3qjrVa96O/dAQMlmhr3/4aYjoE6vl3SCfp1
 cDCJvO5WojXeRsKcKxXqmFSEfzJDAMhpTHfPICxOSqxYUOAGXoZkYTWG4OsXbjeBpYPw
 S7SLWzhgsOre7nYUNRlo9kNtDupxPRWkddHrhN3FZQeR4mpb98ftTYU2d9VkLfn7CvSq Rw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mr1r1guwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:06:38 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRL6b7P008573
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 21:06:37 GMT
Received: from [10.110.31.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 13:06:36 -0800
Message-ID: <cd0b6275-ec26-d364-6a38-6607230d82cf@quicinc.com>
Date: Tue, 27 Dec 2022 13:06:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 03/14] ASoC: qcom: Add USB backend ASoC driver for Q6
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-4-quic_wcheng@quicinc.com> <Y6bAQ8hDLkvrvjQQ@kroah.com>
 <Y6rtdy4NPfi/KOqd@sirena.org.uk> <Y6r26VfIfpE8zpPY@kroah.com>
 <Y6sLH+8nVFImL0Oo@sirena.org.uk>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Y6sLH+8nVFImL0Oo@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: vi3zFIMNnJv1JDR_lUmFjx81nWldrRnX
X-Proofpoint-ORIG-GUID: vi3zFIMNnJv1JDR_lUmFjx81nWldrRnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_16,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=506 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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
 lgirdwood@gmail.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, quic_plai@quicinc.com,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark/Greg,

On 12/27/2022 7:11 AM, Mark Brown wrote:
> On Tue, Dec 27, 2022 at 02:45:13PM +0100, Greg KH wrote:
>> On Tue, Dec 27, 2022 at 01:04:55PM +0000, Mark Brown wrote:
>>> On Sat, Dec 24, 2022 at 10:02:59AM +0100, Greg KH wrote:
> 
>>>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> 
>>>> All of the code in this patch series is older than 2022 as I know it has
>>>> been in shipping devices for many years.  Please use the proper
>>>> copyright year to make your lawyers happy...
> 
>>> Are you *positive* about this.  Based on some preparatory discussions
>>> the Qualcomm people had with Takashi and I it seemed like this was a new
>>> version of existing concepts.  I'm sure they had something already but
>>> it's not obvious to me that they're just posting the same code.
> 
>> I thought that this same code has been shipping in devices for a few
>> years now in the last few Samsung phone models.  Is this not the same
>> code that is in those devices?
> 
>> If not, why not, what happened to that codebase that makes it not worthy
>> of being submitted upstream?
> 
> I don't specifically know anything about that code but I'd expect that
> for out of tree code breaking new ground like this there'd be a strong
> likelyhood that there'd be design level issues and that's what the pre
> submission discussions were all about - how to fit the concept into the
> kernel subsystems in a way that might be maintainable.  There's also
> been the whole transition to their new DSP firmware going on.  It's
> possible that what was shipped was implemented in the same way with the
> same code but I'd not assume that this is the case without actually
> comparing the two.

It's correct that all the ASoC related patches are new, and didn't exist 
previously in QC products.  It is due to the fact that Android has a 
different ALSA userspace concept which allowed for a lot of the Q6 audio 
front end (AFE) communication to be done from userspace, I believe. 
This is the reason that we had to introduce this new ASoC based design.

I can't comment much more about the Android ALSA design, maybe @Patrick 
Lai can.

Thanks
Wesley Cheng
