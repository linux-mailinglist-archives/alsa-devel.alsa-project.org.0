Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE98CBFC3
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 12:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7A3205;
	Wed, 22 May 2024 12:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7A3205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716375477;
	bh=SylLlKY5CBoxLppHNyLoIhvEyhdTimOFUf/M84mucLM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQgwdH59773GDKacMu2C3NW/WGK3kR2mVyDiFxT7E6AfDMYgdyVwRh13uDeQ5/ojr
	 JaFHgiWxPjMRhKpZ3f2WuMSrdqquFPoiMsD11Ip7IArhqs4xd8PDCDyMYPK4qw0/dG
	 FZ8rlu7bvW8k/l9/J9an/Y/n16y7hLLGcMz2FIUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EACBF8042F; Wed, 22 May 2024 12:57:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D166EF805A9;
	Wed, 22 May 2024 12:57:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43879F8026A; Wed, 22 May 2024 12:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C281F80051
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 12:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C281F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eqDl9zPY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44M2YgKA031245;
	Wed, 22 May 2024 10:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=HPyJZ+IQWOZKRRpHGYSzS507Ci7ZQ9SHHNkKp70iD0A=; b=eq
	Dl9zPYMhkKVBMLcM5+Sxn7XDoMlwFv4Yr0pgD3VMFxx4MUnXqSGRludUaxOsREvV
	n/AIPeN9yIDQzZBFiBKOdOT4fcdTsFwsqVVr8SwXzHS0d85CjpHrCiKP4Nn7nS2P
	gIFGWA0DHhsx8QTSKkzAjGuWEfuxFw7otgrp1Rl7IPMywDd9Ym2AdRSpsTuSS5Sb
	fEdb9DmkLX48ukfuGAqsWUe86mxn6RBXaeSZt6D7d7U38cUZuT64Qvyn0mOGHQJi
	GhW1AoB54qYL+VESORRaz1lSSofc5QtKbxN9bejSkTjaOtB+aPaRk/4qiVFM6Ou/
	kXhMPmJPGNArSecYuWoQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pr2rn0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 10:56:50 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 44MAunkF002918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 10:56:49 GMT
Received: from [10.216.17.165] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 May
 2024 03:56:45 -0700
Message-ID: <40594542-ac60-0ff7-8474-a93f678a99be@quicinc.com>
Date: Wed, 22 May 2024 16:26:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <quic_pkumpatl@quicinc.com>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-3-quic_mohs@quicinc.com>
 <91f581ef-58ea-4b98-80e2-dd9b14a61c60@sirena.org.uk>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <91f581ef-58ea-4b98-80e2-dd9b14a61c60@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: oEa4VcuMEe6-HxUvq2uT8Hl8_qXlruDv
X-Proofpoint-GUID: oEa4VcuMEe6-HxUvq2uT8Hl8_qXlruDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_05,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220074
Message-ID-Hash: U4AAUX74DOEZFXLUMVETDVOYH66X72MQ
X-Message-ID-Hash: U4AAUX74DOEZFXLUMVETDVOYH66X72MQ
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4AAUX74DOEZFXLUMVETDVOYH66X72MQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/16/2024 5:17 PM, Mark Brown wrote:
> On Thu, May 16, 2024 at 10:17:56AM +0530, Mohammad Rafi Shaik wrote:
> 
>> +static const struct reg_default wcd937x_defaults[] = {
> 
>> +	{ WCD937X_DIGITAL_EFUSE_REG_0,				0x00 },
>> +	{ WCD937X_DIGITAL_EFUSE_REG_1,				0xff },
>> +	{ WCD937X_DIGITAL_EFUSE_REG_2,				0xff },
>> +	{ WCD937X_DIGITAL_EFUSE_REG_3,				0xff },
> 
> Given the name I'd expect these to vary per device so not have default
> values.  In general ID, status or volatile registers probably shouldn't
> have defaults since they should be read from the device.
> 

Thanks for the review,

Will cleanup those.
>> +static bool wcd937x_readonly_register(struct device *dev, unsigned int reg)
>> +{
>> +	switch (reg) {
> 
>> +	case WCD937X_DIGITAL_CHIP_ID0:
>> +	case WCD937X_DIGITAL_CHIP_ID1:
>> +	case WCD937X_DIGITAL_CHIP_ID2:
>> +	case WCD937X_DIGITAL_CHIP_ID3:
> 
>> +	case WCD937X_DIGITAL_EFUSE_REG_0:
>> +	case WCD937X_DIGITAL_EFUSE_REG_1:
>> +	case WCD937X_DIGITAL_EFUSE_REG_2:
> 
>> +	.readable_reg = wcd937x_readable_register,
>> +	.writeable_reg = wcd937x_rdwr_register,
>> +	.volatile_reg = wcd937x_readonly_register,
> 
> It's not a bug per se since things will work but you should probably
> have separate volatile and read only checks, things like the ID and
> efuse registers are read only but they shouldn't vary at runtime so
> could be cached and not volatile.

ACK,

Will cleanup and improve.

Thanks & Regards,
Rafi.
