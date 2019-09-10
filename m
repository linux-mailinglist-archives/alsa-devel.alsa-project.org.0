Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B22AEB63
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 15:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C7B1678;
	Tue, 10 Sep 2019 15:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C7B1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568121800;
	bh=vaLrqev3YeWK2xZcEnA4mR5UH7lPh/fXdVmVYY4awX0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MaGeF95NfQ7z5C1s6akXrQ9XKcZGG/E5Hf73aaDI06LAGda2QftskxVmVOMloLkZU
	 dSEjIhDo14xMvxC2wCVI96GOB7kdm/q3fa4IrJkeIxkUXlWXle6AdvjyRJKTGzhd6j
	 pos7HsNQQv2q1LL15bxUhDcCg6kPQbCEm28uYY3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6396CF80368;
	Tue, 10 Sep 2019 15:21:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9587EF80368; Tue, 10 Sep 2019 15:21:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8106DF800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 15:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8106DF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OOVstoD7"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADLQqP062583;
 Tue, 10 Sep 2019 08:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1568121686;
 bh=Fiv18WkpSi2E0hZY53yNFwdEsK8dFEfnR7kLuNVjuR4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=OOVstoD7+vguQQl8jPDvPTcp1qxxK9oRom3sKajxvIe77PBY7bkmfRVQljYegbf9R
 0g5t52SQBs3iwNgaG5qYM/7X3KoukrpbttQ+zv+wDjQPW24jlJS6bl10Nv8fmSEf4V
 rKCf360Z03oG1FSCE3IRDSBLOCdeVvuVllWaD5UE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ADLPsU125510
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Sep 2019 08:21:25 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:21:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:21:25 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADLPRu026587;
 Tue, 10 Sep 2019 08:21:25 -0500
To: <shifu0704@thundersoft.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>, 
 <perex@perex.cz>, <tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>
References: <1567753564-13699-1-git-send-email-shifu0704@thundersoft.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <76759c2c-3f5d-5cf6-fc2b-feb1dc8c0e6a@ti.com>
Date: Tue, 10 Sep 2019 08:21:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567753564-13699-1-git-send-email-shifu0704@thundersoft.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: navada@ti.com
Subject: Re: [alsa-devel] [PATCH] tas2770: add tas2770 smart PA dt bindings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Shi

On 9/6/19 2:06 AM, shifu0704@thundersoft.com wrote:
> From: Frank Shi <shifu0704@thundersoft.com>

Subject should be

dt-bindings: ASoC: Add tas2770 smart PA dt bindings

Also Please add Rob Herring <robh+dt@kernel.org> for review

> add tas2770 smart PA dt bindings
>
> Signed-off-by: Frank Shi <shifu0704@thundersoft.com>
> ---
>   Documentation/devicetree/bindings/tas2770.txt | 38 +++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/tas2770.txt
>
> diff --git a/Documentation/devicetree/bindings/tas2770.txt b/Documentation/devicetree/bindings/tas2770.txt
> new file mode 100644
> index 0000000..f70b310
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/tas2770.txt
> @@ -0,0 +1,38 @@
> +Texas Instruments TAS2770 Smart PA
> +
> +The TAS2770 is a mono, digital input Class-D audio amplifier optimized for
> +efficiently driving high peak power into small loudspeakers.
> +Integrated speaker voltage and current sense provides for
> +real time monitoring of loudspeaker behavior.
> +
> +Required properties:
> +
> + - compatible:	   - Should contain "ti,tas2770".
> + - reg:		       - The i2c address. Should contain <0x4c>, <0x4d>,<0x4e>, or <0x4f>.
s/should/may
> + - #address-cells  - Should be <1>.
> + - #size-cells     - Should be <0>.
> + - ti,asi-format:  - Sets TDM RX capture edge. 0->Rising; 1->Falling.
> + - ti,left-slot:   - Sets TDM RX left time slots.
> + - ti,right-slot:  - Sets TDM RX right time slots.
> + - ti,imon-slot-no:- TDM TX current sense time slot.
> + - ti,vmon-slot-no:- TDM TX voltage sense time slot.
> +
> +Optional properties:
> +
> + - reset-gpio:	Reset GPIO number of left device.
> + - irq-gpio:  IRQ GPIO number of left device.

You might want to use

- interrupt-parent: the phandle to the interrupt controller which provides
                     the interrupt.
- interrupts: interrupt specification for data-ready.

Instead of irq-gpio

> +
> +Examples:
> +
> +    tas2770@4c {
> +                compatible = "ti,tas2770";
> +                reg = <0x4c>;

Missing

#address-cells = <1>;

#size-cells = <0>;

> +                reset-gpio = <&gpio15 1 GPIO_ACTIVE_LOW>;
> +                irq-gpio = <&gpio16 1 GPIO_ACTIVE_LOW>;
> +                ti,asi-format = <0>;
> +                ti,left-slot = <0>;
> +                ti,right-slot = <1>;
> +                ti,imon-slot-no = <0>;
> +                ti,vmon-slot-no = <2>;
> +        };
> +

Suggestion to provide the URL to the data sheet.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
