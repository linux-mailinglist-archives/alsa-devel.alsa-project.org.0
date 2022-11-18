Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27F62FB79
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 18:18:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB0816AF;
	Fri, 18 Nov 2022 18:17:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB0816AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668791927;
	bh=wJyRo8S1VrlhS0mBHB4hNP4GcZ4/8wConScxD6n3gqc=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ojUX/xk53C2jZ52cp85Ij090thkNiVU6h0vupzVQTz8VfxDc4jyMSCc/1pxDnrQD4
	 BvCJl/npyaGAOb216Il7jb1LJHRk5U5LwDsbXDLFI5ozoRI3eLFfLdYvwYcURfZSgy
	 vjnP7Wfq0/pg36KTFcGUtcuwrl9zO/n0jRFviD6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61DD0F8020D;
	Fri, 18 Nov 2022 18:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24E52F801D8; Fri, 18 Nov 2022 18:17:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 110C8F800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 18:17:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110C8F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="c6/wH7bT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AIGL6be005988; Fri, 18 Nov 2022 17:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=NiuypNdOqR/rG511Q0zqzPzzkScy2mrvgGpr4qFKyyk=;
 b=c6/wH7bT5xrJgZritoEp0tqi0mPtckNb7NqrJ9r8astKk32UHSuj6KYHNf90WuGQMGEN
 JVURrTNMgT5j+uMsiwFQTT3w/Wp4XYup5g6muFNlDbLXU2HBheuPR7f+5aYtV+0cNOnx
 z4N6hSIbTrzJf0w76uM+Awaz95bB0wssKoqq9jlhJoeD2jwjS0+kjzdwR779wRScewth
 IH8M87nCTnEmXmFttu8bxWTaS1CvenmMSrXNqJnB3Gzio6MG1mHwJT5tEH+Rtjq69oB/
 d71fJd+sTjqBQsBn1QGY0K/WSdFaT2WeB37vVfhOoei6sfr1Sau1tCwms9Wjinu173mY jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0mva9d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 17:17:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AIHHh7C016182
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Nov 2022 17:17:43 GMT
Received: from [10.110.0.156] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 09:17:42 -0800
Message-ID: <6b152096-608c-1b3c-e1bc-f83149af1198@quicinc.com>
Date: Fri, 18 Nov 2022 09:17:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
From: Patrick Lai <quic_plai@quicinc.com>
Subject: Unable to open hostless PCM device after introduction of commit -
 ASoC: Stop dummy from overriding hwparams
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Zj8diAqjKrHwnaSwCkGwm2uEVv3F056A
X-Proofpoint-GUID: Zj8diAqjKrHwnaSwCkGwm2uEVv3F056A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211180102
Cc: alsa-devel@alsa-project.org, srinivas.kandagatla@linaro.org,
 vinod.koul@linaro.org, quic_rohkumar@quicinc.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Amadeusz,

On the product I am working on, a hostless PCM device is defined for 
purpose of activating CODEC driver to setup the path inside CODEC. So, 
CPU DAI and PCM Platform are defined to use dummy dai & DMA supplied by 
sound/soc/soc-utils.c.

After upgrading to newer kernel, hostless PCM device failed to open. 
After doing a bit of digging, the root cause is that dummy_dma_hardware 
is not set in dummy_dma_open() due to new conditional check logic 
introduced in this commit - 6c504663ba2ee2abeaf5622e27082819326c1bd4.

In order to fix problem I am encountering properly without regressing 
your scenario, I would like to get a better understanding of problem you 
were addressing. My understanding, from looking through other drivers 
under sound/soc, is that pcm hardware info is usually set by PCM 
platform/DMA drivers. For your scenario, do you have other component e.g 
CPU/CODEC DAI, set PCM hardware definition? I am not sure conditional 
check logic from 6c504663ba2ee2abeaf5622e27082819326c1bd4 guarantees 
that other component would be setting pcm hardware info. Appreciate if 
you can provide more insight to your scenario?

Thanks
Patrick
