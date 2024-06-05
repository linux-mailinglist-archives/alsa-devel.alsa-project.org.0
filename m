Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796108FC04A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 02:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656AFB60;
	Wed,  5 Jun 2024 02:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656AFB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717545778;
	bh=zbchVJpN8CtKnOtJCSxgSZT+M5QQnqyJvmlSKZIv2Xc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pinvAhSktVvWaAPGXdJywehddRrtv2D/hcAohbw/fTlBSayQWuoeM/RGZQW809LN/
	 aycb+xfnapodBFJ/yfziig/FsZ2QlkpS7M3MTEey/l46b4+zOB4nN20WhJMN7R45tH
	 RFJf5wI5jKb6wSvtWnAFV5lwDDeBUkMDMnkRTN/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C0D5F8057A; Wed,  5 Jun 2024 02:02:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2B5CF8057A;
	Wed,  5 Jun 2024 02:02:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50857F802DB; Wed,  5 Jun 2024 02:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F2A7F800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 02:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F2A7F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=BNH7oVyn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 454IIEe0006678;
	Wed, 5 Jun 2024 00:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2cTX+tDsHPj5h2dpCR1ziwRegx7pqfUXJVgw+e3/P7s=; b=BNH7oVynwYZLaB1R
	cMhSF8boJHJ+Kl+2TZcsIYc99w/69wVDu+dOkBu6QmkkE3PpJYSPKf7G/oJe6ik3
	N0dn1COsTrMiZ9w4+3IuCcma4J2u1z7axiJLyaRxPCW7VF/bZbq2kJTH/8NtBmvX
	hgHO2F2/d6RHbb84h8FPRmGz+mskDFphY8JHsqsgtN/ikZfgch+C2sHOmhjwhVlt
	wVx+w8AL+/5byQd3v78a4pO8538DngPn4cD+XdMknlHyjT7L4RoHw7SPj+OoPNPW
	Nti3ms6kZ/dqOhCsoRkO6dykTYwlmNQhHJ9fG+noML85NxxEMT6zE15jkpaTgpyN
	9GAcvA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj8300kra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 00:02:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 45502BCb012993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 00:02:11 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 17:02:07 -0700
Message-ID: <6f9d7066-9592-4a14-a811-c2451cbc33fa@quicinc.com>
Date: Tue, 4 Jun 2024 17:02:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <kernel@quicinc.com>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
 <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
 <be0ee1bc-336f-4960-a54c-8bb71449fd1c@quicinc.com>
 <1acb74e5-e768-40f0-9eff-06b37c0d79ee@sirena.org.uk>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1acb74e5-e768-40f0-9eff-06b37c0d79ee@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EDj6ebt_bWiWvtkF7p8yfoReQrMkAZBA
X-Proofpoint-ORIG-GUID: EDj6ebt_bWiWvtkF7p8yfoReQrMkAZBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406040194
Message-ID-Hash: FCGRWKKZWFZI7DAM76ZSY6G5PW4UZ63M
X-Message-ID-Hash: FCGRWKKZWFZI7DAM76ZSY6G5PW4UZ63M
X-MailFrom: quic_jjohnson@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCGRWKKZWFZI7DAM76ZSY6G5PW4UZ63M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/4/2024 7:14 AM, Mark Brown wrote:
> On Tue, Jun 04, 2024 at 06:59:31AM -0700, Jeff Johnson wrote:
>> On 6/4/2024 4:56 AM, Mark Brown wrote:
> 
>>> Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
>>> just seems like a huge amount of noise and I'm having trouble thinking
>>> of a use case.
> 
>> https://bugzilla.kernel.org/show_bug.cgi?id=10770
> 
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.
> 
> and I'm not seeing anything in the above link that articulates an actual
> use case.

Sorry for the terse response. I agree with others that it was premature to
enable the warnings before all the instances were cleaned. But since things
are as they are, and since I saw others had 100% cleaned drivers/net, I took
it upon myself to clean up some other top-level directories without worrying
about if it made sense or not.

/jeff
