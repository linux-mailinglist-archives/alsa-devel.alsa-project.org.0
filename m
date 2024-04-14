Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E68E8A0C93
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 11:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBA721B5;
	Thu, 11 Apr 2024 11:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBA721B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712828390;
	bh=wanp9p18Kaf0ShHZ0lGWcX4M0b7lk+ryk6Qlal5cEOU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nocbTiuyayxhHPpeLXgOJbs3/Dl3bRQf9/Ra82X2JkpwBdCTA9d2yFDyvhkOOvilc
	 M7ZBa/s/R2pGjYa+P+RF6I2m+2bOU+YELsbEsa4Vo3YN04jyimVZwfpgl3erVukUuS
	 egaZhp1/AxkbkgWfHY4S1sfwVT2EOXCdp2fkw3ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDF35F80571; Thu, 11 Apr 2024 11:39:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02404F8028B;
	Thu, 11 Apr 2024 11:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96826F80238; Thu, 11 Apr 2024 11:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCAEEF8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 11:38:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCAEEF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=RH23LTku
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43B7Pfi7029833;
	Thu, 11 Apr 2024 11:38:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=6rfS5zPiSmzZMMxQ4v6y7X7sH1FVnmMas6q+NGiPbP0=; b=RH
	23LTkuSOQZgrLqSQPcyDWEaHansF0FyzusSDHHejYeeQubA/RF03+Fcw0JO1uxMG
	vxF1TpPcpGgm0D5a22KTGFQ7B10VA0NGWF7kWPIuCEes6xP+vVpTvGT3WcMqMrto
	D4vR5lrxgA/glhjYfqpRe5c0L23nsZVK7DVfPfG0lEV5OCEp0AXAts6p2Sz8Eqn+
	pfNDTysrxZZj3w6etWkPop5DdColzGvEkh0mS5oMq1L4D7HeqW1uQ1DiKhu8ho9x
	WWExS/Zmj9aq87LkaFiH+L0wv8VNYlPBEg0uHS/sXlEIu+kMGooWvN+/JWrTbuwL
	XfW02l4cyVpCxpiEPg5w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xbfy12h6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 11:38:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D322A4002D;
	Thu, 11 Apr 2024 11:38:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 906DE2132CA;
	Thu, 11 Apr 2024 11:37:27 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Apr
 2024 11:37:25 +0200
Message-ID: <ee47d2e8-763f-4451-b9f3-b46ded4c1b97@foss.st.com>
Date: Thu, 11 Apr 2024 11:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Introduce STM32 Firewall framework
To: Rob Herring <robh+dt@kernel.org>
CC: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
 <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: 
 <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_03,2024-04-09_01,2023-05-22_02
Message-ID-Hash: DUXKF4GDOHJ6OXOYD5R4KESYDLFB6I7Q
X-Message-ID-Hash: DUXKF4GDOHJ6OXOYD5R4KESYDLFB6I7Q
X-MailFrom: prvs=48317865ae=alexandre.torgue@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUXKF4GDOHJ6OXOYD5R4KESYDLFB6I7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob

On 4/9/24 19:13, Rob Herring wrote:
> On Mon, Apr 8, 2024 at 3:44 AM Alexandre TORGUE
> <alexandre.torgue@foss.st.com> wrote:
>>
>> Hi Gatien,
>>
>> On 1/5/24 14:03, Gatien Chevallier wrote:
>>> Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
>>> platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
>>> register to the framework to offer firewall services such as access
>>> granting.
>>>
>>> This series of patches is a new approach on the previous STM32 system
>>> bus, history is available here:
>>> https://lore.kernel.org/lkml/20230127164040.1047583/
>>>
>>> The need for such framework arises from the fact that there are now
>>> multiple hardware firewalls implemented across multiple products.
>>> Drivers are shared between different products, using the same code.
>>> When it comes to firewalls, the purpose mostly stays the same: Protect
>>> hardware resources. But the implementation differs, and there are
>>> multiple types of firewalls: peripheral, memory, ...
>>>
>>> Some hardware firewall controllers such as the RIFSC implemented on
>>> STM32MP2x platforms may require to take ownership of a resource before
>>> being able to use it, hence the requirement for firewall services to
>>> take/release the ownership of such resources.
>>>
>>> On the other hand, hardware firewall configurations are becoming
>>> more and more complex. These mecanisms prevent platform crashes
>>> or other firewall-related incoveniences by denying access to some
>>> resources.
>>>
>>> The stm32 firewall framework offers an API that is defined in
>>> firewall controllers drivers to best fit the specificity of each
>>> firewall.
>>>
>>> For every peripherals protected by either the ETZPC or the RIFSC, the
>>> firewall framework checks the firewall controlelr registers to see if
>>> the peripheral's access is granted to the Linux kernel. If not, the
>>> peripheral is configured as secure, the node is marked populated,
>>> so that the driver is not probed for that device.
>>>
>>> The firewall framework relies on the access-controller device tree
>>> binding. It is used by peripherals to reference a domain access
>>> controller. In this case a firewall controller. The bus uses the ID
>>> referenced by the access-controller property to know where to look
>>> in the firewall to get the security configuration for the peripheral.
>>> This allows a device tree description rather than a hardcoded peripheral
>>> table in the bus driver.
>>>
>>> The STM32 ETZPC device is responsible for filtering accesses based on
>>> security level, or co-processor isolation for any resource connected
>>> to it.
>>>
>>> The RIFSC is responsible for filtering accesses based on Compartment
>>> ID / security level / privilege level for any resource connected to
>>> it.
>>>
>>> STM32MP13/15/25 SoC device tree files are updated in this series to
>>> implement this mecanism.
>>>
>>
>> ...
>>
>> After minor cosmetic fixes, series applied on stm32-next.
>> Seen with Arnd: it will be part on my next PR and will come through
>> arm-soc tree.
> 
> And there's some new warnings in next with it:
> 
>        1  venc@480e0000: 'access-controllers' does not match any of the
> regexes: 'pinctrl-[0-9]+'
>        1  vdec@480d0000: 'access-controllers' does not match any of the
> regexes: 'pinctrl-[0-9]+'

Yes I noticed it to my colleague. YAML update has been sent for VEND/VDENC.

https://lore.kernel.org/lkml/171276671618.403884.13818480350194550959.robh@kernel.org/T/

As soon as it is acked I could merge it in my tree.

Alex

> 
> Rob



