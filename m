Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 380CB4D4702
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 13:30:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C5018F8;
	Thu, 10 Mar 2022 13:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C5018F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646915456;
	bh=CZ+98rfIUbuxEfMNh49aT6L/21Pxtpljcv4bPyBYh5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P9zNQzzAC4OZrI5uZU4iycq8sT1xrLjO0equ0ngUqQksGybdYwVnITmB0kL0W/1bN
	 izEITZlWPWy4qfz9fyw2LR1TB4b6iWTzXULel/ERVr8UXSA81nCszVKNZsktWQAUUm
	 12W5EKxRHChDEp+7ZoQflRZj9+TOgTgRV7+++lew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 479BFF800D2;
	Thu, 10 Mar 2022 13:29:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9822DF80137; Thu, 10 Mar 2022 13:29:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC3DCF8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 13:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC3DCF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SrcrDgBh"
Received: by mail-ej1-x633.google.com with SMTP id qa43so11593457ejc.12
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 04:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bvM9bpVqadFGT6cTj1FgeTbHx/untvfyWRFVU5A7JsI=;
 b=SrcrDgBhBKn4+VnFUMlAEETG43sIlaSqOgAHopzDVTrptjvyakX8mQdXxW99D7Cadp
 uRjTTytvfVQ9+vjrrvmMI1Pud2XIytkDFyt8JxDpnuOgMLp1BjClFjlIeQ8mqv0OSNNh
 lCTYmoGDqb6IwjPPP0Sfuv/n6nkZl1qvMc7DiViPcxx9l7s4CjlVAzxPDXc1hCaT4Gx8
 LuJ1l5J4CGaiLwZ+tdk+PMTsvTPk37GwP5G/i/DqRjnBg3DuQS2S+DxWriW2Kv1gujZP
 BhZmwOoz0EQSed0flzuxhxqqP4fTNxIcwiWgPtjRyO1iU7Mv4dS+jEoRxpJWLTnli2oT
 W0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvM9bpVqadFGT6cTj1FgeTbHx/untvfyWRFVU5A7JsI=;
 b=L9feW1pgmxG2sd/4Lxw58oiI5bxxOjkfQYMtnM/jJlywDBl6q8r5s1K7SV7xuCEHLo
 3nQV0lIa269wx9/EqgSDhu1kY1iyCSq9jUS5D6UPbsiBb4NH4slBRO8NUJKxJiEq1ZZM
 wMLYQXntvhjHp74IjxYNXDv+N+K9fCVMNmbIbssLR0ba0HulPiHJgFE9x7DQC6tjk0At
 /9qcd16C50U5KcSFkdDMIGKnVfway6iLln5JIH0CxB0Jc/PHd/FEOwAh+Zw5TQ7HWXFI
 sN4yBtf7oDVoGTPPSujnUbN4p5+rV5RwNv031DIGqomi3pkD6/haRtz7c21I+WMrildr
 WLWw==
X-Gm-Message-State: AOAM533SbC+n/hrIKv5t0Kc06aXswf7NSsV0hlGEpwq+XNJrqqnddaA/
 /j3E+r8S0r+T0ZLWlNr33QUc8413RqYx2YKYH1ZjjUGZ
X-Google-Smtp-Source: ABdhPJwbtiAMQz9G/jYe3ISah8jTsiGU5IhD7/7DVnW8LV+hNJXY6XvlTpAK2teBoBh7TYw/ra5mYNoltIFfd2cu8dA=
X-Received: by 2002:a17:907:7f06:b0:6d6:f8f7:2655 with SMTP id
 qf6-20020a1709077f0600b006d6f8f72655mr4010142ejc.658.1646915374966; Thu, 10
 Mar 2022 04:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
 <20220210134049.32576-2-ariel.dalessandro@collabora.com>
In-Reply-To: <20220210134049.32576-2-ariel.dalessandro@collabora.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Mar 2022 09:29:23 -0300
Message-ID: <CAOMZO5DuB4d1243H46d1=heiNiz+pQVkjrGU+zV_r3GFKRTZfQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mn-bsh-smm-s2pro: Add
 tlv320aic31xx audio card node
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

Hi Ariel,

On Thu, Feb 10, 2022 at 10:41 AM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> +&i2c2 {
> +       clock-frequency = <400000>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c2>;
> +       status = "okay";
> +
> +       codec: tlv320dac3101@18 {
> +               #sound-dai-cells = <0>;
> +               compatible = "ti,tlv320dac3101";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_dac_rst>;
> +               reg = <0x18>;
> +
> +               ai31xx-micbias-vg = <MICBIAS_AVDDV>;
> +
> +               HPVDD-supply = <&buck4_reg>;
> +               SPRVDD-supply = <&vdd_input>;
> +               SPLVDD-supply = <&vdd_input>;
> +               AVDD-supply = <&buck4_reg>;
> +               IOVDD-supply = <&buck4_reg>;
> +               DVDD-supply = <&buck5_reg>;
> +               reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
> +
> +               clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
> +               clock-names = "mclk";

The clocks and clock-names properties are not documented in the codec bindings.

Also, the driver does not use call clk_get() on this mclk clock.

You should drop the clocks and clock-names properties.
