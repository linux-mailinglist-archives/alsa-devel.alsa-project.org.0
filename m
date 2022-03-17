Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A54DCDE2
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 19:49:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 871F81706;
	Thu, 17 Mar 2022 19:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 871F81706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647542963;
	bh=0WzZgN9aj0s8HEM+nPIbGUukn4MTB8wYqvpInAw1fPY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rziCcZnniu85Lpia729ITFMVRRzNIgJeczChjwly8sHI4sJNpjRze6Q6bl1Nc1PO8
	 zrxlDOXsaHunvH0bhcyEVoPSRZatIoJWxCdVbJuivp2vPsdtcoXqsqtdjO2ISF/H4m
	 Rs/YEYaBvVSCffvCl7C6VF5UMRCR/y7OEPfeC4as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00C1F80087;
	Thu, 17 Mar 2022 19:48:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C230F8013F; Thu, 17 Mar 2022 19:48:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3304F80087
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 19:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3304F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="N7TCbvr7"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id ABF301F45A25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647542886;
 bh=0WzZgN9aj0s8HEM+nPIbGUukn4MTB8wYqvpInAw1fPY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N7TCbvr7Xn1NBsfZdq5HFid3scc3xT6XYCe80AU9aFufOzzv5jFqfCPumrdJedHmb
 AVdzMfFYrR64U8BRyKzhAICQSO2TYQaFDyR1MbtHBE9RBxaL5C52+Q5yccbYmi/iBS
 M+0vYNRJonT0VJpJFR9lEp+l1lTLDSIEgovl4QFcuBiQMqu+GmnJhoypmm5ZI/Wr8w
 IM0GP0iCzWyeFRcAdktirYF7fHhcuzYwOy1+dMUB+bV4jBlrJY2I56o4YZJlgnx3Y4
 hTQhgxW9U30DTtqNcAlJp+lS+QRjygHO/80E+xJse+1btt2BeUvoqzmqbvFgirMlm7
 58oLeFJuq3s6Q==
Message-ID: <d748d03d-4e9c-50a5-6c9e-089ec44a2540@collabora.com>
Date: Thu, 17 Mar 2022 15:47:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mn-bsh-smm-s2pro: Add
 tlv320aic31xx audio card node
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
References: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
 <20220210134049.32576-2-ariel.dalessandro@collabora.com>
 <CAOMZO5DuB4d1243H46d1=heiNiz+pQVkjrGU+zV_r3GFKRTZfQ@mail.gmail.com>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <CAOMZO5DuB4d1243H46d1=heiNiz+pQVkjrGU+zV_r3GFKRTZfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Fabio,

On 3/10/22 09:29, Fabio Estevam wrote:
> Hi Ariel,
> 
> On Thu, Feb 10, 2022 at 10:41 AM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
> 
>> +&i2c2 {
>> +       clock-frequency = <400000>;
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_i2c2>;
>> +       status = "okay";
>> +
>> +       codec: tlv320dac3101@18 {
>> +               #sound-dai-cells = <0>;
>> +               compatible = "ti,tlv320dac3101";
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pinctrl_dac_rst>;
>> +               reg = <0x18>;
>> +
>> +               ai31xx-micbias-vg = <MICBIAS_AVDDV>;
>> +
>> +               HPVDD-supply = <&buck4_reg>;
>> +               SPRVDD-supply = <&vdd_input>;
>> +               SPLVDD-supply = <&vdd_input>;
>> +               AVDD-supply = <&buck4_reg>;
>> +               IOVDD-supply = <&buck4_reg>;
>> +               DVDD-supply = <&buck5_reg>;
>> +               reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
>> +
>> +               clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
>> +               clock-names = "mclk";
> 
> The clocks and clock-names properties are not documented in the codec bindings.
> 
> Also, the driver does not use call clk_get() on this mclk clock.
> 
> You should drop the clocks and clock-names properties.

The sound card driver is calling clk_get() on the codec's clock. See
sound/soc/fsl/fsl-asoc-card.c:

    /* Get the MCLK rate only, and leave it controlled by CODEC drivers */
    if (codec_dev) {
        struct clk *codec_clk = clk_get(codec_dev, NULL);

        if (!IS_ERR(codec_clk)) {
            priv->codec_priv.mclk_freq = clk_get_rate(codec_clk);
            clk_put(codec_clk);
        }
    }

Regards,
Ariel
