Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E1903BB0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 14:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B169F6;
	Tue, 11 Jun 2024 14:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B169F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718108055;
	bh=Jv18zFh8XQWgM9b7LINvHYAD1Eh4fxPjv6vjA9pRihg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cFgkGXvLAbISIpJrRq/NTm2dNYMqrrRrEa+LB30A8drFMvme64bevgjDIExwDnfT0
	 XChg9OAtWvPEhhLuSjO72Hf6nL+moPJmpp6w6NtVoi9uTgbHr+13rZEW3JY5nJvH3Q
	 hTC8aSeGlrO53HqX/gUTHEQ4+06fnh4s32jIG0O4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBFF7F805B0; Tue, 11 Jun 2024 14:13:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1394AF805B5;
	Tue, 11 Jun 2024 14:13:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3E5F8057A; Tue, 11 Jun 2024 14:13:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF236F8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 14:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF236F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=eBJlOGPn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45B9gDTW018553;
	Tue, 11 Jun 2024 12:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x82hK8NhnLBb+QSZuUivDPcUai/65dDyEZPXvkHYaXI=; b=eBJlOGPn5olPi8aN
	PRLlYwaMyEsxtgX4i/BtRqLUdlg3aAuKCa9OBg3UO6oJhXn/ebaMNr7c7HSnQUsx
	2fps7fQK1R+ELquu9SbhF0HG/VAWNzV+S+7s5boTQza1m2P8Okwq20UcrBHAvEmm
	ucLCfsJlOTS9mj9guEJ2XaoPbMjugjbUZLBhYjdDvpIsD1vUBRig0a55ReBNjBvN
	fR2bxqWkczgS/ixhBOplJv1MBW0142D4ojSlBNn1sFxJIC5CyoZUEbnAS1Phx6Sc
	UCHOTA2kbhYNH3aG05/xKyskOPXYGaxVr3QP5m0EGrf7bIBjwrfGP7PZCXX4qRal
	mFVUjA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6b8bwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:13:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45BCDREZ014102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:13:27 GMT
Received: from [10.216.24.176] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 05:13:22 -0700
Message-ID: <9a14cb7b-8d6a-14b3-1d3a-b61086e4d4a9@quicinc.com>
Date: Tue, 11 Jun 2024 17:43:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "Jaroslav Kysela" <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <quic_pkumpatl@quicinc.com>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
 <171810116692.177725.17513047102055843084.b4-ty@kernel.org>
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
In-Reply-To: <171810116692.177725.17513047102055843084.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ycAQg5a7LKzw2oSSesGUY8tCsYXkrZJV
X-Proofpoint-GUID: ycAQg5a7LKzw2oSSesGUY8tCsYXkrZJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=963 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110091
Message-ID-Hash: 3KTS5INMVVBUSJFDTLGJBXQSMQUVCETR
X-Message-ID-Hash: 3KTS5INMVVBUSJFDTLGJBXQSMQUVCETR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KTS5INMVVBUSJFDTLGJBXQSMQUVCETR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/11/2024 3:49 PM, Mark Brown wrote:
> On Fri, 24 May 2024 09:25:28 +0530, Mohammad Rafi Shaik wrote:
>> This patchset adds support for Qualcomm WCD9370/WCD9375 codec.
>>
>> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
>> connected over SoundWire. This device has two SoundWire devices, RX and
>> TX respectively supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
>> 6 DMICs and MBHC.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/7] ASoC: dt-bindings: document wcd937x Audio Codec
>        commit: 27173bb0b64461acf4e00f1bae3b15d8d2348c14
> [2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
>        commit: c99a515ff15380ec5f8827049914145ba908e8da
> [3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
>        commit: 9be3ec196da41b20b624ae4ed0303df58548644e
> [4/7] ASoC: codecs: wcd937x: add basic controls
>        commit: 82be8c62a38c6a44e64ecb29d7a9b5cb35c6cad4
> [5/7] ASoC: codecs: wcd937x: add playback dapm widgets
>        commit: 57fe69db7a015e828ec69d819707c5b8eac6d052
> [6/7] ASoC: codecs: wcd937x: add capture dapm widgets
>        commit: 8ee78493be89c42d016f941a9b00c203ec08daab
> [7/7] ASoC: codecs: wcd937x: add audio routing and Kconfig
>        commit: 313e978df7fc38b9e949ac5933d0d9d56d5e8a9c
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark


Hi Mark,

The new v6 patch set is posted with review comments addressed.

The v5 is old patch set.

if possible please revert v5 and pick new v6 patch set.

Thanks & Regards,
Rafi


> 

