Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E186C214F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:25:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CC391E7;
	Mon, 20 Mar 2023 20:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CC391E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340305;
	bh=MCB1tE9pz0Hi0YjGT7HNw11zeMYIKmjGOilxmgXs4wA=;
	h=Date:Subject:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=nb/UPuOnCh/6swOO7O5EFrvcGWjwdxpiEes9EOGZeYQaugIwK7jmWJb5x2W6mQpDE
	 Rn0Bf7Yig4IRByNaZRYSk1t2/Zvc9o3nbPSGl5hfncuFqEVe9EX6NEctDMhOQ2NcUD
	 kLpBbS1IkYmh7W5O0KRLz9yxnkKVv+Xijqkgo/8Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BBCDF80254;
	Mon, 20 Mar 2023 20:24:14 +0100 (CET)
Date: Mon, 20 Mar 2023 21:23:58 +0200
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
To: Rob Herring <robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
 <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
 <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
 <e81f02f2-e692-e4ef-1510-fdc285dd5964@collabora.com>
 <20230320160137.GB1755078-robh@kernel.org>
In-Reply-To: <20230320160137.GB1755078-robh@kernel.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T656WW4NF4RFIR3XQ7VVULHTBLTWR6CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167934025392.26.10070449231896392577@mailman-core.alsa-project.org>
From: Cristian Ciocaltea via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A68CDF8027B; Mon, 20 Mar 2023 20:24:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42121F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 20:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42121F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Q68WvDc4
Received: from [192.168.1.90] (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A3C46603089;
	Mon, 20 Mar 2023 19:24:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679340242;
	bh=73rNgAiRZKESdwk9lBa5SvOXwN+9LmWd+1/M3nw9rTA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q68WvDc4qZ40xlJFOUXVHGFdF2dqRvTm9Qr0Sw44sFAIBBGDvaduV3YUuCgXjXG+y
	 fNXQOpHryBnV6DMykWkqjVS0j/c03DvLi8DqJ/R2/vd0DIgyxnXH+qKfcCYEDQNEj6
	 Cu8auu4popy5l6bph7TyLvQpZQOy7QkX80zL4cXTVnppwoHkUuTcgBY0FHVBgz2Ibo
	 6tOz1CYXe6g/Ji1cM6lFmDhhNKIEzZi9acDV4sFXkDqxwnDKs9Dnu/c29CAD+5rIRA
	 8gx5wyINXYeDj4dp1DU/ZNzAvS0SIeTSd00ljhwcqoPhl2rZRHvHzIcKPB6fmr+pEN
	 AkJ6mrS8BiRaQ==
Message-ID: <73fab0de-38f5-b9c3-9696-3f0dfc0a6b93@collabora.com>
Date: Mon, 20 Mar 2023 21:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/11] dt-bindings: serial: snps-dw-apb-uart: Relax
 dma-names order constraint
To: Rob Herring <robh@kernel.org>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-3-cristian.ciocaltea@collabora.com>
 <3679f2d0-55f0-1710-abc2-b268b6fc6969@linaro.org>
 <8ae57fe3-56aa-7e50-3eaa-a12a40657baf@collabora.com>
 <80796828-7b38-184a-2e8e-3cfe9158b67f@linaro.org>
 <13cb8dbd-994c-4b38-b715-44a3bf3d278d@spud>
 <e81f02f2-e692-e4ef-1510-fdc285dd5964@collabora.com>
 <20230320160137.GB1755078-robh@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20230320160137.GB1755078-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: T656WW4NF4RFIR3XQ7VVULHTBLTWR6CA
X-Message-ID-Hash: T656WW4NF4RFIR3XQ7VVULHTBLTWR6CA
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T656WW4NF4RFIR3XQ7VVULHTBLTWR6CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/20/23 18:01, Rob Herring wrote:
> On Fri, Mar 17, 2023 at 07:43:53PM +0200, Cristian Ciocaltea wrote:
>> On 3/17/23 18:26, Conor Dooley wrote:
>>> On Fri, Mar 17, 2023 at 04:54:47PM +0100, Krzysztof Kozlowski wrote:
>>>> On 17/03/2023 11:21, Cristian Ciocaltea wrote:
>>>>> On 3/17/23 10:31, Krzysztof Kozlowski wrote:
>>>>>> On 15/03/2023 12:47, Cristian Ciocaltea wrote:
>>>>>>> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
>>>>>>> dma-names properties") documented dma-names property to handle Allwiner
>>>>>>> D1 dtbs_check warnings, but relies on a strict rx->tx ordering, which is
>>>>>>> the reverse of what a different board expects:
>>>>>>>
>>>>>>>      rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
>>>>>>>
>>>>>>> A quick and incomplete check shows the inconsistency is present in many
>>>>>>> other DT files:
>>>>>>
>>>>>> Why not fixing the DTS? The properties should have fixed order.
>>>>>
>>>>> I was initially concerned about the risk of a potential ABI breakage,
>>>>> but I think that's not really a problem since dma-names is not directly
>>>>> accessed in the driver and DT Kernel API doesn't rely on a particular order.
>>>>>
>>>>> If there are no objections, I would switch the order in the binding to
>>>>> tx->rx, since that's what most of the DTS use, and fix the remaining ones.
>>>>
>>>> Since we added the order recently, I rather assume it is the correct or
>>>> preferred one.
>>>
>>> IIRC I checked around the other serial bindings & there was not a
>>> consistent order that all serial bindings used, so I picked the order that
>>> was used across the various allwinner boards that do use dma-names.
>>
>> Thanks for clarifying this, Conor! Would it be fine to switch to tx->rx
>> order as it requires less changes to fix the inconsistencies?
>>
>>> Before changing dts files, it's probably a good idea to make sure that
>>> the dma-names are not used somewhere outside of Linux.
>>
>> Right, that means we cannot exclude the ABI breakage concern. Not sure how
>> easy would be to actually verify this. Hence I wonder if there is really no
>> chance to allow the flexible order in the binding..
> 
> If it changes and someone complains, then yes we'll allow flexible
> order.

I looked a bit further and it seems the allwiner boards are not really 
affected as all of them are using the same DMA channel for both rx and 
tx. So we should be fine by switching to tx->rx order.

$ git grep -A10 snps,dw-apb-uart | grep 'sun.*dmas' | sort -u

arch/arm/boot/dts/sun6i-a31.dtsi-	dmas = <&dma 10>, <&dma 10>;
arch/arm/boot/dts/sun6i-a31.dtsi-	dmas = <&dma 22>, <&dma 22>;
arch/arm/boot/dts/sun6i-a31.dtsi-	dmas = <&dma 6>, <&dma 6>;
arch/arm/boot/dts/sun6i-a31.dtsi-	dmas = <&dma 7>, <&dma 7>;
arch/arm/boot/dts/sun6i-a31.dtsi-	dmas = <&dma 8>, <&dma 8>;
arch/arm/boot/dts/sun6i-a31.dtsi-	dmas = <&dma 9>, <&dma 9>;
arch/arm/boot/dts/sun8i-a23-a33.dtsi-	dmas = <&dma 10>, <&dma 10>;
arch/arm/boot/dts/sun8i-a23-a33.dtsi-	dmas = <&dma 6>, <&dma 6>;
arch/arm/boot/dts/sun8i-a23-a33.dtsi-	dmas = <&dma 7>, <&dma 7>;
arch/arm/boot/dts/sun8i-a23-a33.dtsi-	dmas = <&dma 8>, <&dma 8>;
arch/arm/boot/dts/sun8i-a23-a33.dtsi-	dmas = <&dma 9>, <&dma 9>;
arch/arm/boot/dts/sun8i-v3s.dtsi-	dmas = <&dma 6>, <&dma 6>;
arch/arm/boot/dts/sun8i-v3s.dtsi-	dmas = <&dma 7>, <&dma 7>;
arch/arm/boot/dts/sun8i-v3s.dtsi-	dmas = <&dma 8>, <&dma 8>;
arch/arm/boot/dts/sunxi-h3-h5.dtsi-	dmas = <&dma 6>, <&dma 6>;
arch/arm/boot/dts/sunxi-h3-h5.dtsi-	dmas = <&dma 7>, <&dma 7>;
arch/arm/boot/dts/sunxi-h3-h5.dtsi-	dmas = <&dma 8>, <&dma 8>;
arch/arm/boot/dts/sunxi-h3-h5.dtsi-	dmas = <&dma 9>, <&dma 9>;
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi- dmas = <&dma 14>, 
<&dma 14>;
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi- dmas = <&dma 15>, 
<&dma 15>;
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi- dmas = <&dma 16>, 
<&dma 16>;
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi- dmas = <&dma 17>, 
<&dma 17>;
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi- dmas = <&dma 18>, 
<&dma 18>;
arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi- dmas = <&dma 19>, 
<&dma 19>;

Thanks,
Cristian
