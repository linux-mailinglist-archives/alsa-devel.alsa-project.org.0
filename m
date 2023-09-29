Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 141FA7B3367
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 15:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C3DAEA;
	Fri, 29 Sep 2023 15:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C3DAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695993599;
	bh=iQN0yyX9QDsRv+GZpfDwakA0IvnZ1M6jXkM28D0DwDs=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TusZjM5gZICytIW3ljj+qQp9F/J5neId/VaPPsmvnQl/29SczQQAWVXlQAuYTPTBR
	 OTAVSRE4xVTaw5W5MPiAGtEKu89Zmp8n0asC+Vho25fzNH+F3sVFmU97V/otrqWOat
	 4nGecxQ8AB+S1CG5A5lcv9EphjR5LyEevsIpdYdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59573F800AE; Fri, 29 Sep 2023 15:19:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C63EF8016A;
	Fri, 29 Sep 2023 15:19:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5AEBF801D5; Fri, 29 Sep 2023 15:19:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 404ECF8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 15:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404ECF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=garM6WT7
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38TABSom007571;
	Fri, 29 Sep 2023 15:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=KMM5HFfGi3/V+NX/zIj16MtndrNJ3wjO6VBqQEWwOzE=; b=ga
	rM6WT7soC9Qg5lgEynlNIDEz19ICFxdBxx8K4WKaa81yBoo69ZoqQgPtPJrk+yqH
	6Ke+T4tgb/wvQ7+D6b8/REeHXj+x3qhuVXstjmlbfDXVsD7fnq1otz0IBlMfWVfL
	E4pait5J8DRp751sajaRVoUu+IBQuOKISwGGaDU+w8jkYTr9fXxKlpYDQovtoe8f
	gElrQ2fdRogxsh24zwaguSO+d3txrH3Ag2t7373pPcvxthqul803q1iHU52Zkj5N
	HDkK8wgJgLFXVxL19kvPUsq9yAyQ76DfuoiJhXjgKUsphyNPOIYM5JXL5gCdij8s
	EmQ/SdD52jWC2koKfFGg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ta9k0s0fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 15:18:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE29710002A;
	Fri, 29 Sep 2023 15:18:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AB3A2865FC;
	Fri, 29 Sep 2023 15:18:48 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 29 Sep
 2023 15:18:46 +0200
Message-ID: <6e419e89-10f1-e448-10fe-64f1ea9ff862@foss.st.com>
Date: Fri, 29 Sep 2023 15:18:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [IGNORE][PATCH v4 01/11] dt-bindings: Document common device
 controller bindings
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <Oleksii_Moisieiev@epam.com>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>,
 <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-2-gatien.chevallier@foss.st.com>
 <2023081117-sprout-cruncher-862c@gregkh>
 <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
Content-Language: en-US
In-Reply-To: <4f0f9d6c-ce4d-73a2-60bf-801c1a1d6cc3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_11,2023-09-28_03,2023-05-22_02
Message-ID-Hash: KR3NDJ4RYQOEB7WV45V4A7HEJGZOTKDU
X-Message-ID-Hash: KR3NDJ4RYQOEB7WV45V4A7HEJGZOTKDU
X-MailFrom: prvs=86360455f8=gatien.chevallier@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KR3NDJ4RYQOEB7WV45V4A7HEJGZOTKDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/11/23 14:00, Gatien CHEVALLIER wrote:
> 
> 
> On 8/11/23 12:16, Greg KH wrote:
>> On Fri, Aug 11, 2023 at 12:07:21PM +0200, Gatien Chevallier wrote:
>>> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
>>>
>>> Introducing of the common device controller bindings for the controller
>>> provider and consumer devices. Those bindings are intended to allow
>>> divided system on chip into multiple domains, that can be used to
>>> configure hardware permissions.
>>>
>>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>> [Gatien: Fix typos and YAML error]
>>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>>> ---
>>>
>>> Changes in V4:
>>>     Corrected typos and YAML errors
>>
>> Why are we supposed to ignore the first patch in this series, but pay
>> attention to the 10 after this that depend on it?
>>
>> totally confused,
>>
>> greg k-h
> 
> Hello Greg,
> 
> I'm sorry that this tag troubles your review. It was first suggested
> in [1]. The "IGNORE" means ignore review on this thread, as it is still
> under review in another thread (Link in the cover letter). It does not
> mean that the content should be ignored for the series. I will change
> this to something else as this is obviously confusing the review.
> 
> @Oleksii, can we imagine integrating this patch to this series or do
> you prefer to keep it apart?
> 

Hi,

after a discussion with Oleksii: I'll rename the binding to narrow
down its scope and integrate the patch in my series. This way, I'll drop
the [IGNORE] tag.

=> I'll stick with the generic binding for V5 (Sorry for the misleading
    information in the previous mail)

Best regards,
Gatien

> Should I consider a resend with another tag if Oleksii prefers to keep
> this patch apart?
> 
> [1] 
> https://lore.kernel.org/all/1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org/
> 
> Best regards,
> Gatien
