Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D372BAB70
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 14:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D20716EC;
	Fri, 20 Nov 2020 14:40:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D20716EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605879681;
	bh=pCg/VOj2Q7ky74LkilysZyaA1x5QCrhbcwiskw2qYS4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITREPHyZg6ZJlGJIbZWAupLfUbb8tIRouV30s7x/my8NFZRfr8azOZO58n2mjTZ4/
	 +6k0c8xgLOU5U5mfgJxxC1N6C09d0vpjR/tnyKAQT4/ozQEyFSRZ+JfUitbRyNbNGk
	 PfEnVro53pZOmUjrnzE2eMiCADadthWPzUQoNXig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D22E6F8016D;
	Fri, 20 Nov 2020 14:39:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2BF8F8016C; Fri, 20 Nov 2020 14:39:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CBB3F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 14:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CBB3F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jhDNejlS"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AKDdZqW076615;
 Fri, 20 Nov 2020 07:39:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605879575;
 bh=wZhG8MmEO6RWkp9NIebIOaU7ygmPrS92fsTYsm1LD+0=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=jhDNejlS8XfYODAl093xJ/wsewtgoQoMkvL+8QYCvq7CfqyY/oGY6IENM/4AQ79Tm
 /TR1MFx1ibliPTI+02iSb8JEqfut1FBIFYmE/VkVgOcaQD9nLjszFM34jdGZUXxzTC
 DgyhPwsE7P1rII1kzpeJlHO5evzN2i0Fal+pJyWs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AKDdZ8v113455
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 07:39:35 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 07:39:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 07:39:35 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AKDdWCQ085567;
 Fri, 20 Nov 2020 07:39:32 -0600
Subject: Re: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
To: Viorel Suman <viorel.suman@nxp.com>, "Viorel Suman (OSS)"
 <viorel.suman@oss.nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Lee Jones
 <lee.jones@linaro.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
References: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
 <cee287f3-29c1-771f-ca20-812de1ae8044@ti.com>
 <VI1PR0401MB22729D51912D66FDB2973A7792E00@VI1PR0401MB2272.eurprd04.prod.outlook.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <c6e7ff22-f421-d05e-621f-738740b30482@ti.com>
Date: Fri, 20 Nov 2020 15:40:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0401MB22729D51912D66FDB2973A7792E00@VI1PR0401MB2272.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Viorel,

On 19/11/2020 18.24, Viorel Suman wrote:
> Hi Peter,
> 
>> DTS is supposed to look as follows:
>>>
>>> / {
>>>     ak4458_reset: gpio-reset {
>>>        compatible = "gpio-reset";
>>>        reset-gpios = <&pca6416 4 GPIO_ACTIVE_LOW>;
>>>        #reset-cells = <0>;
>>>        initially-in-reset;
>>
>> I can not find anything resembling to this in next-20201119.
>> Where is the implementation and documentation for this gpio-reset?
> 
> The board schematics is not publicly available; some info may be seen in DTS files below:
> https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8mm-evk.dts?h=imx_5.4.24_2.1.0
> https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8mm-ab2.dts?h=imx_5.4.24_2.1.0
> https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts?h=imx_5.4.24_2.1.0
> 
> In examples above the GPIO is handled by machine driver - wrong approach given that
> it requires machine driver being probed before codec driver.

Right, so this gpio-reset driver is not in mainline. You are adding
support for something which does not exists ;)

> 
>>> -	ak4458->reset_gpiod = devm_gpiod_get_optional(ak4458->dev,
>> "reset",
>>> -						      GPIOD_OUT_LOW);
>>> -	if (IS_ERR(ak4458->reset_gpiod))
>>> -		return PTR_ERR(ak4458->reset_gpiod);
>>> +	ak4458->reset = devm_reset_control_get_optional_shared(ak4458-
>>> dev, NULL);
>>> +	if (IS_ERR(ak4458->reset))
>>> +		return PTR_ERR(ak4458->reset);
>>
>> The binding documentation must be updated and you must support the gpio
>> way as well.
> 
> Sure, make sense.
> 
>> When I had this discussion around using the reset framework for shared
>> enable and/or reset pins it was suggested that _if_ such a driver makes
>> sense then it should internally handle (by using magic strings) the fallback
>> and work with pre-reset binding.
> 
> Thanks, would appreciate if you point me to the discussion you had.

There were few iterations of it when I finally given up, I can quickly
find rfc v2:
https://lkml.org/lkml/2019/10/30/311

Probably in earlier or later series the reset framework was also discussed.

I ended up using GPIOD_FLAGS_BIT_NONEXCLUSIVE in the pcm3168a driver.
https://lkml.org/lkml/2019/11/13/411
- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
