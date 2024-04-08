Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E230F89BA9C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 10:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A0522A8;
	Mon,  8 Apr 2024 10:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A0522A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712565923;
	bh=vJ9C9ICtmHohArhbC1wa6KFi5aR/p0VT/SWDNweoaAs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nBzrkowasZg21jL0Q0GSNJmxovGgxq85Z5qRHg0UTxVDW03trVuPNOnHLShaibdys
	 5GVStofkbfydrTBpIsOqmxFskNFYkqmBM0N40neLvgAOOeVZ7dAGi8Vbyad9FeeBpl
	 rRCb4Hn90MnMnonfERQ2DaMdFiVJ/GjTKBhMh0kM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9B50F805A1; Mon,  8 Apr 2024 10:44:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F33DF8059F;
	Mon,  8 Apr 2024 10:44:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD21CF8026D; Mon,  8 Apr 2024 10:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5394CF80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 10:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5394CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=H0Hz8koo
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4387SNEk009700;
	Mon, 8 Apr 2024 10:44:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=p9CMLavhVsATyBEL2PMrrzwDGq1Q/Uy83NePUSe/nV8=; b=H0
	Hz8kooN+RWyeLVNT5G6PnWy8ULfDSW6CpoagsFb+J3M0DtuXTtnHqwuFRioi3gAA
	z5t7reJ8TsDXoNyseC06fx94TQCm6ALfyu6bsdF56llYVodLg9zaUIGjwFgk8DmE
	zXqWHU2YrzgiaVhWnsN82v10SkaVMrvQJ80OkoBuvJLqZ+Kpqac574MQ8DF/PNQk
	FZ7K4mrgNckGiIqwFgGzwaEUM/92Kh75C09Nbbz1efURqgiAW/I7HKGkw+Rcqd5J
	lc1lWbYAnp3PuE8qyX64hAyomATyqJvNHG1wh159HfLOx5KBBLJVFOjc6Rg6NG0V
	F9DOJvtck291a9gQZoMA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xaw9cnmn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 10:44:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F2D0D40059;
	Mon,  8 Apr 2024 10:44:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2018E211978;
	Mon,  8 Apr 2024 10:43:02 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:42:59 +0200
Message-ID: <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
Date: Mon, 8 Apr 2024 10:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Introduce STM32 Firewall framework
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
        <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
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
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
Message-ID-Hash: PW2LU36GO7T5HBPPGUEXDAD7ATDUEB53
X-Message-ID-Hash: PW2LU36GO7T5HBPPGUEXDAD7ATDUEB53
X-MailFrom: prvs=4828731996=alexandre.torgue@foss.st.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PW2LU36GO7T5HBPPGUEXDAD7ATDUEB53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Gatien,

On 1/5/24 14:03, Gatien Chevallier wrote:
> Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
> platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
> register to the framework to offer firewall services such as access
> granting.
> 
> This series of patches is a new approach on the previous STM32 system
> bus, history is available here:
> https://lore.kernel.org/lkml/20230127164040.1047583/
> 
> The need for such framework arises from the fact that there are now
> multiple hardware firewalls implemented across multiple products.
> Drivers are shared between different products, using the same code.
> When it comes to firewalls, the purpose mostly stays the same: Protect
> hardware resources. But the implementation differs, and there are
> multiple types of firewalls: peripheral, memory, ...
> 
> Some hardware firewall controllers such as the RIFSC implemented on
> STM32MP2x platforms may require to take ownership of a resource before
> being able to use it, hence the requirement for firewall services to
> take/release the ownership of such resources.
> 
> On the other hand, hardware firewall configurations are becoming
> more and more complex. These mecanisms prevent platform crashes
> or other firewall-related incoveniences by denying access to some
> resources.
> 
> The stm32 firewall framework offers an API that is defined in
> firewall controllers drivers to best fit the specificity of each
> firewall.
> 
> For every peripherals protected by either the ETZPC or the RIFSC, the
> firewall framework checks the firewall controlelr registers to see if
> the peripheral's access is granted to the Linux kernel. If not, the
> peripheral is configured as secure, the node is marked populated,
> so that the driver is not probed for that device.
> 
> The firewall framework relies on the access-controller device tree
> binding. It is used by peripherals to reference a domain access
> controller. In this case a firewall controller. The bus uses the ID
> referenced by the access-controller property to know where to look
> in the firewall to get the security configuration for the peripheral.
> This allows a device tree description rather than a hardcoded peripheral
> table in the bus driver.
> 
> The STM32 ETZPC device is responsible for filtering accesses based on
> security level, or co-processor isolation for any resource connected
> to it.
> 
> The RIFSC is responsible for filtering accesses based on Compartment
> ID / security level / privilege level for any resource connected to
> it.
> 
> STM32MP13/15/25 SoC device tree files are updated in this series to
> implement this mecanism.
> 

...

After minor cosmetic fixes, series applied on stm32-next.
Seen with Arnd: it will be part on my next PR and will come through 
arm-soc tree.

Thanks
Alex



