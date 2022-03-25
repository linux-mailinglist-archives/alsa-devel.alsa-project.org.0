Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D414E721A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 12:20:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F0B16A6;
	Fri, 25 Mar 2022 12:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F0B16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648207253;
	bh=sKCePReqp4ZJymOSI9J4lq/V8FQUX26+JNamqgOmKYw=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dsizr+DS/r99HIr9EGr/UO6EDhecp1F9FzxIRyKYYD3h5j1oe60lCd72fJC3OXIn2
	 82eDI7jMKPWadXKoxNJFKLeWWtFs7GDUSs5Z6377watGQls3pjABZVhiaoSM+kwuFP
	 W0D0QVCRjqtTrCb8735ZWYsN3LKL+BETq7oW1HZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC322F801F7;
	Fri, 25 Mar 2022 12:19:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E28ADF800AA; Fri, 25 Mar 2022 12:19:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC40F800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 12:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC40F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="lv5yRVc2"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 87AE11F4614E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648207177;
 bh=sKCePReqp4ZJymOSI9J4lq/V8FQUX26+JNamqgOmKYw=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=lv5yRVc2k0I/c7KDjggKiXuVEGwwpOMPNMal8CNUvBFOrMrqLbUStd9sfpti2XuWw
 GxU0GJtnL1xMlub9WQk9bTsjtARZ/Ymf7AwFc6HD9G6C51OuCKYkdA/HJUWVFQFEA/
 GS+UTABwBtCVTu3JM5neiu02qw5FlfH9Gl3J3xkgw9FwDbqWi3RADA2Qw3ysHkSQQk
 RWXdpD8UBFHGt3il4TVA6xk/YQzpJhUvzrTows798nBsQZtBK/eN34Vaw6EzZwFThw
 787bqLLkZkRgRKoIeUBTL3ypMt+slpfdmWzph9LzMjkRpG6KIuXqoAFG4fGTwhQ5rW
 YVxjUdgARBZmA==
Message-ID: <c08cd648-f42c-b8f6-41a5-172fdb47d27e@collabora.com>
Date: Fri, 25 Mar 2022 08:19:26 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mn-bsh-smm-s2pro: Add
 tlv320aic31xx audio card node
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: Fabio Estevam <festevam@gmail.com>
References: <20220210134049.32576-1-ariel.dalessandro@collabora.com>
 <20220210134049.32576-2-ariel.dalessandro@collabora.com>
 <CAOMZO5DuB4d1243H46d1=heiNiz+pQVkjrGU+zV_r3GFKRTZfQ@mail.gmail.com>
 <d748d03d-4e9c-50a5-6c9e-089ec44a2540@collabora.com>
In-Reply-To: <d748d03d-4e9c-50a5-6c9e-089ec44a2540@collabora.com>
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

On 3/17/22 15:47, Ariel D'Alessandro wrote:
> Hi Fabio,
> 
> On 3/10/22 09:29, Fabio Estevam wrote:
>> Hi Ariel,
>>
>> On Thu, Feb 10, 2022 at 10:41 AM Ariel D'Alessandro
>> <ariel.dalessandro@collabora.com> wrote:
>>
>>> +&i2c2 {
>>> +       clock-frequency = <400000>;
>>> +       pinctrl-names = "default";
>>> +       pinctrl-0 = <&pinctrl_i2c2>;
>>> +       status = "okay";
>>> +
>>> +       codec: tlv320dac3101@18 {
>>> +               #sound-dai-cells = <0>;
>>> +               compatible = "ti,tlv320dac3101";
>>> +               pinctrl-names = "default";
>>> +               pinctrl-0 = <&pinctrl_dac_rst>;
>>> +               reg = <0x18>;
>>> +
>>> +               ai31xx-micbias-vg = <MICBIAS_AVDDV>;
>>> +
>>> +               HPVDD-supply = <&buck4_reg>;
>>> +               SPRVDD-supply = <&vdd_input>;
>>> +               SPLVDD-supply = <&vdd_input>;
>>> +               AVDD-supply = <&buck4_reg>;
>>> +               IOVDD-supply = <&buck4_reg>;
>>> +               DVDD-supply = <&buck5_reg>;
>>> +               reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
>>> +
>>> +               clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
>>> +               clock-names = "mclk";
>>
>> The clocks and clock-names properties are not documented in the codec bindings.
>>
>> Also, the driver does not use call clk_get() on this mclk clock.
>>
>> You should drop the clocks and clock-names properties.
> 
> The sound card driver is calling clk_get() on the codec's clock. See
> sound/soc/fsl/fsl-asoc-card.c:
> 
>     /* Get the MCLK rate only, and leave it controlled by CODEC drivers */
>     if (codec_dev) {
>         struct clk *codec_clk = clk_get(codec_dev, NULL);
> 
>         if (!IS_ERR(codec_clk)) {
>             priv->codec_priv.mclk_freq = clk_get_rate(codec_clk);
>             clk_put(codec_clk);
>         }
>     }

Do you have any other comments on this one? Otherwise, could you perhaps
ack this patch? See latest version:
  [PATCH v4] arm64: dts: imx8mn-bsh-smm-s2pro: Add tlv320aic31xx audio
card node

Thanks
Ariel
