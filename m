Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCEE75051D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 12:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A911F1;
	Wed, 12 Jul 2023 12:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A911F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689158915;
	bh=OR6v6byc3piqGmloeM6rtUJuNgUmB9bZiOuqEkDadxM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jkJGQktHbzjWwOyX/C5elXaV2u150eqadOGSmTlh+/3yOOw69pER7fDPp3kTaY1Jh
	 vCNTS2eQp1M+y16pK8OFdrxiGdu6046C1Ha4e6hTzGvZrUNvt13VNO+Ofo3D/8H0do
	 jKZF/RNLl6QbfwE1K+bMCjPSlk3ZJs2wILjhnmy8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41D27F8027B; Wed, 12 Jul 2023 12:47:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E758F80236;
	Wed, 12 Jul 2023 12:47:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFF80F80249; Wed, 12 Jul 2023 12:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59EBDF80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 12:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59EBDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YtGiLugP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CAUKpt018634;
	Wed, 12 Jul 2023 10:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NhtwwmrFLrsgWtVNGMMYdBX94i+RseVMe+iRvC4WikU=;
 b=YtGiLugPMEe8ENFDZaHZLqzMG1fCV1K8JRjgpxpgmfZs6nqpa973fPLSJhaYpo5g7VPt
 LvtC472eo6mhPHMdiA3tFdHrjLhr9OBu0kMCt0BPUpqJ1N2vbECMKAwDesyM2llhuyo+
 9NIEBauw4U7kCDX2tdoQtq9sCuoZ4oRa1llzPX2TGZRX0fDc4qhbzCeXpXTe44cNk4KD
 IWTUvQewunt+I1NgXaDkZIs1nGZ+KuhoeWXGyngdD7jyLrFqgODEy5KpCXLpPKher2UD
 UzKhkKadUIS1IJ8H6VCxshm02PU/cw+u/JGIBotyoCHCobOer/iokMkngNuLzsr7qyBa sA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsfeq16na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 10:47:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id
 36CAlTGW029892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jul 2023 10:47:29 GMT
Received: from [10.204.79.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 12 Jul
 2023 03:47:24 -0700
Message-ID: <9c766061-5508-c60c-55a1-2cf893f655e2@quicinc.com>
Date: Wed, 12 Jul 2023 16:17:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2] ASoC: dt-bindings: Update maintainer email id
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <bgoswami@quicinc.com>,
        <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <cychiang@chromium.org>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20230707074337.3120530-1-quic_rohkumar@quicinc.com>
 <CAMuHMdXRt_9BzfnaqVJUAS4QdvGBDZk3B+R_cERUykZhyNWtzQ@mail.gmail.com>
From: Rohit Kumar <quic_rohkumar@quicinc.com>
In-Reply-To: 
 <CAMuHMdXRt_9BzfnaqVJUAS4QdvGBDZk3B+R_cERUykZhyNWtzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ibN9tAFNWnfiJZqiQ04kuYBXdPCS-kxz
X-Proofpoint-GUID: ibN9tAFNWnfiJZqiQ04kuYBXdPCS-kxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_06,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=951 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120095
Message-ID-Hash: GZOS5JSMPYPVKCDROJBJ2X54F62SGNQU
X-Message-ID-Hash: GZOS5JSMPYPVKCDROJBJ2X54F62SGNQU
X-MailFrom: quic_rohkumar@quicinc.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZOS5JSMPYPVKCDROJBJ2X54F62SGNQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 7/12/2023 2:48 PM, Geert Uytterhoeven wrote:
> Hi Rohit,
>
> Thanks for your patch!
>
> On Fri, Jul 7, 2023 at 9:49 AM Rohit kumar <quic_rohkumar@quicinc.com> wrote:
>> [PATCH v2] ASoC: dt-bindings: Update maintainer email id
> Thank you for stepping forward to become a maintainer for all ASoC
> DT bindings ;-)
>
>> Updated my mail id to latest quicinc id.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Rohit kumar <quic_rohkumar@quicinc.com>
>> ---
>> v2: Updated commit header
>>
>>   .../devicetree/bindings/sound/google,sc7180-trogdor.yaml        | 2 +-
>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml     | 2 +-
> Oh wait, this is not for all of ASoC...
>
> Please use one-line summaries that reflect the actual changes.
> Thanks!

Sorry, Looks like change is already applied. I will take care of it from 
next time.

Thanks,

Rohit

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
