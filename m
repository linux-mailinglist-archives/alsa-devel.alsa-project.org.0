Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2AA4890AF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 08:22:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40E881797;
	Mon, 10 Jan 2022 08:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40E881797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641799374;
	bh=rRVWLRufSTgMd4+97aEcGcFYX371nGXm0iPw3Zesi40=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2tyhlyHq5GvswF3ZDe1twOnCPXqMNQQ26Umwa+hLWbk+jdfX2nYFplNuQzBo5Okh
	 AZILn8aRPT5IPZgN+2OJcPoiJp0ZeqFbd5U1PmpGlWlqtathLEDh3dz/eet9ViwOXl
	 xUtkjDZFaOabIhhBjhn+UUDhUXtLzw6Jrimrx/3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF506F80134;
	Mon, 10 Jan 2022 08:21:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F479F8012E; Mon, 10 Jan 2022 08:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93397F800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 08:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93397F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c7MYhY2r"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20A7LaMQ095117;
 Mon, 10 Jan 2022 01:21:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1641799296;
 bh=450FrwEmAX4YxuRUwLjrMBnF3pKuFNomrfzlMhwifIE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=c7MYhY2r4D6TmgOkLFJHRS11ciXvTiulcWy45AJbeLeRXzN92OZ3wSc3gCRDM/+HY
 p9NffA5UNjetI+fD5Csj3ggdnG9yRWLHBC2sDcqFw9RbT89P3iOkHyLHLDOidyR9tm
 bvjyDUnTP0jtvVJBy1RTMdHb6TZuSeZRl+0MotKo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20A7LaFi094509
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Jan 2022 01:21:36 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 10
 Jan 2022 01:21:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 10 Jan 2022 01:21:31 -0600
Received: from [172.24.145.56] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20A7LSTs068148;
 Mon, 10 Jan 2022 01:21:29 -0600
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
To: Rob Herring <robh@kernel.org>
References: <20220103074427.4233-1-j-choudhary@ti.com>
 <1641218339.997415.2378536.nullmailer@robh.at.kernel.org>
From: Jayesh Choudhary <j-choudhary@ti.com>
Message-ID: <ed22462f-7e71-85e6-8d97-cbaf533fa0d5@ti.com>
Date: Mon, 10 Jan 2022 12:51:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1641218339.997415.2378536.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, peter.ujfalusi@gmail.com
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



On 03/01/22 7:28 pm, Rob Herring wrote:
> On Mon, 03 Jan 2022 13:14:27 +0530, Jayesh Choudhary wrote:
>> Convert the bindings for McASP controllers for TI SOCs from txt
>> to YAML schema.
>>
>> Adds additional properties 'clocks', 'clock-names', 'power-domains',
>> '#sound-dai-cells' and 'port' which were missing from the txt file.
>> Removes properties 'sram-size-playback' and 'sram-size-capture'
>> since they are not used.
>> Adds 'dmas' and 'dma-names' in the example which were missing from
>> the txt file.
>> Changes 'interrupts' and 'interrupt-names' from optional to
>> required properties.
>> Changes 'op-modes', 'serial-dir' to optional properties as they are
>> not needed if the McASP is used only as GPIO.
>> Changes 'tdm-slots' to required property only for I2S operation mode.
>>
>> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
>> INSTRUMENTS ASoC DRIVERS'
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   .../bindings/sound/davinci-mcasp-audio.txt    |  86 --------
>>   .../bindings/sound/davinci-mcasp-audio.yaml   | 201 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   3 files changed, 202 insertions(+), 86 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>>   create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
>>
> 
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/patch/1574696
> 
> 
> mcasp@0: 'num-serializer' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/am335x-cm-t335.dt.yaml
> 	arch/arm/boot/dts/am335x-sbc-t335.dt.yaml
> 

This is an error in the dts file. It has not been updated.
As pointed out by Peter, this property was removed by the commit ID:
1427e660b49e87cd842dba94158b0fc73030c17e

> mcasp@0: 'rt-num-evt' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/am335x-wega-rdk.dt.yaml
> 
> mcasp@2b00000: 'tdm-slots' is a required property
> 	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml
> 
> mcasp@2b10000: 'tdm-slots' is a required property
> 	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml
> 
> mcasp@2b20000: 'tdm-slots' is a required property
> 	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
> 	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml
> 

Patches to fix the above errors have already been applied to linux-next 
tree.

Links:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=277ee96f89d806f110e3011ea324155dd69e798f

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=29a5e8496b3ac0d400dfe32288c26c774beb8cc8

I re-ran the checks with the latest dt_schema. I didn't see these errors.

- Jayesh
