Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB68CAF36
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 15:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A51014F;
	Tue, 21 May 2024 15:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A51014F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716297333;
	bh=xBzALiC8QpbiUZ0vIp/DDNJUn3RjiTwJaSILiRdd+3U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a92P0jriVaJ8Vez6Hq3tHkiaOq3OmMaKannWDdflPALcU7a3gtf58kadoyGy3dYP1
	 M56+hyFTa9Qyh31qVRgzi45NrXrq+2TgvjPww4jwIuCiOG0hSQoGfXpEZREXjhY1gv
	 QiADl5pTeTciKkC+EXK1UiEnOHx/S5YeM/aiH/BE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8798AF805A8; Tue, 21 May 2024 15:15:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 797FDF805AA;
	Tue, 21 May 2024 15:15:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52778F8026A; Tue, 21 May 2024 15:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F0A6F80051
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 15:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F0A6F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=p+BndcQU
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44LBRiTd019430;
	Tue, 21 May 2024 15:14:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=/JwugDw4q1sV/Kf5SJf4M3YRla9SOKHNH5flwjaLMV4=; b=p+
	BndcQUREV6vnAs24JULfWquhsrWpIIlgDhAF1nYhHkU7hU+WmPGT9NSS+AuVj3qv
	IqMklPxg4JOrbgrn8VqHONaWyexs/qy3qJX6aNKBTIMEE3X57GTPfPoyizgzcE1F
	6Jpuy06CHFYp1h82UjBEQ79OOwH3bb3eNwBjpbead9ZepN0naqcaD+WvNJne7ViK
	cTrc+Fw5s0Y8PSIA33CfDnt6Tksw57cbmuMi/rfMpMKJDH1LwnoaJnEt3L39Nl9n
	acn6SklqU2i1tNW0AqfzpbAiyFoNhT3FXgLNEi+QtKSLYsC+Bf6I9kLBzqVF5+M0
	8isqx80pqOqhLIgV/PXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n42cc30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 15:14:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 944294002D;
	Tue, 21 May 2024 15:14:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0DDD321A8FD;
	Tue, 21 May 2024 15:13:54 +0200 (CEST)
Received: from [10.48.86.132] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 15:13:53 +0200
Message-ID: <7ba9113b-7360-4201-b983-e53e90f2be06@foss.st.com>
Date: Tue, 21 May 2024 15:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: stm32: Ensure compatible pattern
 matches whole string
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240520222705.1742367-1-robh@kernel.org>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20240520222705.1742367-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_08,2024-05-21_01,2024-05-17_01
Message-ID-Hash: H5P5EU5WUL4VES6CVRNDXHURRILTLNP4
X-Message-ID-Hash: H5P5EU5WUL4VES6CVRNDXHURRILTLNP4
X-MailFrom: prvs=58716732f3=olivier.moysan@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5P5EU5WUL4VES6CVRNDXHURRILTLNP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/21/24 00:27, Rob Herring (Arm) wrote:
> The compatible pattern "st,stm32-sai-sub-[ab]" is missing starting and
> ending anchors, so any prefix and/or suffix would still be valid.
> 
> This also fixes a warning on the example:
> 
> Documentation/devicetree/bindings/sound/st,stm32-sai.example.dtb: /example-0/sai@4400b000/audio-controller@4400b004: failed to match any schema with compatible: ['st,stm32-sai-sub-a']
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 59df8a832310..f555ccd6b00a 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -68,7 +68,7 @@ patternProperties:
>       properties:
>         compatible:
>           description: Compatible for SAI sub-block A or B.
> -        pattern: "st,stm32-sai-sub-[ab]"
> +        pattern: "^st,stm32-sai-sub-[ab]$"
>   
>         "#sound-dai-cells":
>           const: 0

Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

Thanks
Olivier
