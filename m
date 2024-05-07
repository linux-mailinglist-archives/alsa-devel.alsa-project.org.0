Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 259398BE13A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 13:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74D2E74C;
	Tue,  7 May 2024 13:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74D2E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715082090;
	bh=PWpBOpNDr/xlcI419TA4O+00/LhO4PVJAa2tV399Fak=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jsbmWdpCptHOSZyvClowJG2aW2gCjbfzPwfxL1dGzcCDtR5VkADAfOJLxVhdzeJx6
	 LV6bBrbDZK/wa3mdM4ag1JStGngl+2izFMMTTKhmReBeETua2lHk9Ljbxeb2FRu+XQ
	 tK3CejLO+Y++1UNEyxdwJ80g/tqBD8+uDqJE/ObI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF10CF805AC; Tue,  7 May 2024 13:40:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB12F805A0;
	Tue,  7 May 2024 13:40:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0C39F8049C; Tue,  7 May 2024 13:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03873F8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 13:40:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03873F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=TuQ3fNX1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4477As4c021346;
	Tue, 7 May 2024 11:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vAW2kebA5xILfVJjv5PmFuP/px2n8NNHksYQ7E6Ix3M=; b=Tu
	Q3fNX1UNjyigHTf80l/GM20us+RTLBZFYV0KGWa91lNytIuJmm8JGtv2EWgtMH16
	zwU3G6gvahZDS0qOcbioDf1yjaRp4MM5G032z55Jr7z77+8BFcXcbWhzDC+UPyo1
	Am0tRA2eUi26wF1aY2bfmCcc31AzouILAjL/CGbzxCH1YHNmNY66foI4kuLXPphX
	CVi1i15j4X91jLsZK1YZvpea8ajlu6irmMp984htotNHfhNGcZ/jahbWR1yTtHc5
	IFc/9rE+JHcvDFcFJ3AY1suKWtvsuhKjo67HOeMuQHBiTh73IXcG/Bcfd9VwJAxO
	irddtMqMAFnXQT9P466w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyfhv0jdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 11:40:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 447BeIe0009444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 11:40:18 GMT
Received: from [10.216.54.232] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 04:40:13 -0700
Message-ID: <ed691f73-d56e-a653-d4bf-229a3ec561f1@quicinc.com>
Date: Tue, 7 May 2024 17:10:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
CC: <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>
References: <20240425091857.2161088-1-quic_mohs@quicinc.com>
 <20240425091857.2161088-3-quic_mohs@quicinc.com>
 <59f78ca7-ea09-41d7-9e6e-b0ce1af484e4@linux.intel.com>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <59f78ca7-ea09-41d7-9e6e-b0ce1af484e4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: EDpNuAaSPbn_8MGd_rOpdrn-bePJnojS
X-Proofpoint-ORIG-GUID: EDpNuAaSPbn_8MGd_rOpdrn-bePJnojS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_05,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 mlxlogscore=940
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070081
Message-ID-Hash: IFZXYHUHYB2T37LXWOPOOAAFYH3YXPIZ
X-Message-ID-Hash: IFZXYHUHYB2T37LXWOPOOAAFYH3YXPIZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFZXYHUHYB2T37LXWOPOOAAFYH3YXPIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/25/2024 7:13 PM, Pierre-Louis Bossart wrote:
> 
>> +struct wcd937x_priv {
>> +	struct sdw_slave *tx_sdw_dev;
>> +	struct sdw_slave *rx_sdw_dev;

> 
> Does this mean that the codec has 2 SoundWire interfaces?

Yes, Similar to WCD938x 
(https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/sound/soc/codecs/wcd938x.c?h=next-20240507), 
it has two soundwire interfaces.

All read/write operations associated with WCD937x goes over tx_sdw.

rx_sdw_dev is unused in this driver. I will remove it.

> 
> If yes, aren't there merits in splitting the implementation in two
> separate drivers, one for each interface and probing on the relevant partID?
> 
> This is how the RT713 was handled. The mic function was exposed as the
> RT1713.
> 
> By representing the device as a single entity, things could be fun
> because the two interfaces are really independent. things like clock
> stop are handled at the interface level.
> 
> The code in this driver is difficult to review, for example in the probe
> you wait for the TX part to complete the enumeration/initialization, but
> there's nothing mentioned or stated on the RX part, and there's really
> nothing related to the detection of this device. I don't actually see a
> sdw_driver at all, it's a platform driver.
>
wcd937x waits for TX part to complete as it is needed for register 
read/write operations.

Please refer patch 3/7 for slave driver.

> Would you mind adding a paragraph on how the SoundWire interfaces are
> handled and how the SoundWire bus is involved if there's no sdw_driver?
> 
> Thanks!

Sure, will add details in the commit message.

Soundwire master driver is already upstreamed and is available at
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/soundwire/qcom.c?h=next-20240507

Thanks & Regards,
Rafi.

