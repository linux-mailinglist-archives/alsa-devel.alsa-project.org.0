Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8E7C4DAB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 10:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A0D1601;
	Wed, 11 Oct 2023 10:50:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A0D1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697014279;
	bh=d7ROTAxyfKIeLIqolIy/oeaasKRy5UYw9UI5E+HLbXg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h6IbOcbAdB0Q4oWBAJF3NALxMtX/4CrecIWHyDxW52cNpj+2Oc6Yq43Uw2EikAEg8
	 afyR66a1cAOL92lE1tN70bTFasoguwyYmBxGUzk8cOAOgPIxypNMeuo2syOs51yJJm
	 c5YCM3QQLQJLPHku+Rw/Jn063J4urtxS5M0lCSis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A50DF80166; Wed, 11 Oct 2023 10:50:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D933DF8027B;
	Wed, 11 Oct 2023 10:50:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82C48F802BE; Wed, 11 Oct 2023 10:50:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70904F8015B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 10:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70904F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=ZaTlXAtb
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39B5xlfO011115;
	Wed, 11 Oct 2023 10:50:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=8gYo5goS4DqeD1ldn/WMNS5pR/ViIwg7IylwRkFLbCQ=; b=Za
	TlXAtbPx+MB2v0D8AaSOiCRr0QWaExzh07Zo/oJZvuCeapBUJIlchy/0wVkKmKEn
	wF4z0gNW2gVgYd+nm+OoUH3zQARoNUOh9jLOsqhjQPZQakZgQ8UQum8NC5lIu53G
	J9/i4D9RVwogLLkVq45t8JbhccX58FoBHOkPFG54l4Myu31cTN8/lVAO4VwO3iQ/
	QVK9wmSpmZQtWB32TwY8Jbg0FQFxf0GPdf5ZAKxNUqJf8bLx+7v473H+0cTRORLN
	+6OGQsijOBEGjRMLIhQfjAvoAYEoRWr3fmVZBKuazCBrw1XmeMdLs2GuCUkIAx4t
	D2E7cjGWOwhthrlESwYw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tnp24gtuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 10:50:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21883100064;
	Wed, 11 Oct 2023 10:50:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B630822FA2E;
	Wed, 11 Oct 2023 10:50:05 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 10:50:03 +0200
Message-ID: <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
Date: Wed, 11 Oct 2023 10:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
To: Rob Herring <robh@kernel.org>
CC: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
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
        <netdev@vger.kernel.org>, <linux-p.hy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231010184212.GA1221641-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_06,2023-10-10_01,2023-05-22_02
Message-ID-Hash: B4UIEIDOYPYDOJS6WYRGZZDQKBB3EJFH
X-Message-ID-Hash: B4UIEIDOYPYDOJS6WYRGZZDQKBB3EJFH
X-MailFrom: prvs=864887d9af=gatien.chevallier@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4UIEIDOYPYDOJS6WYRGZZDQKBB3EJFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,

On 10/10/23 20:42, Rob Herring wrote:
> On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
>> ETZPC is a firewall controller. Put all peripherals filtered by the
>> ETZPC as ETZPC subnodes and reference ETZPC as an
>> access-control-provider.
>>
>> For more information on which peripheral is securable or supports MCU
>> isolation, please read the STM32MP15 reference manual.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Changes in V6:
>>      	- Renamed access-controller to access-controllers
>>      	- Removal of access-control-provider property
>>
>> Changes in V5:
>>      	- Renamed feature-domain* to access-control*
>>
>>   arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
>>   arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
>>   arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
>>   3 files changed, 1450 insertions(+), 1377 deletions(-)
> 
> This is not reviewable. Change the indentation and any non-functional
> change in one patch and then actual changes in another.

Ok, I'll make it easier to read.

> 
> This is also an ABI break. Though I'm not sure it's avoidable. All the
> devices below the ETZPC node won't probe on existing kernel. A
> simple-bus fallback for ETZPC node should solve that.
> 

I had one issue when trying with a simple-bus fallback that was the
drivers were probing even though the access rights aren't correct.
Hence the removal of the simple-bus compatible in the STM32MP25 patch.

Even though a node is tagged with the OF_POPULATED flag when checking
the access rights with the firewall controller, it seems that when
simple-bus is probing, there's no check of this flag.

of_platform_populate() checks and sets the OF_POPULATED_BUS flag.
Maybe that is my error and the firewall bus populate should set
OF_POPULATED_BUS instead of OF_POPULATED. Is that correct?

Best regards,
Gatien

> Rob
