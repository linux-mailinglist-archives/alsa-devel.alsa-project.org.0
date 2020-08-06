Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9E23DB3C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 16:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADC1F82E;
	Thu,  6 Aug 2020 16:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADC1F82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596725475;
	bh=JDmvzZCgqH0eW/JL/WrDgKtw4Wrp229xMkK6dRD6QNU=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6UTRcMJgAkEO9mPf/gDrBc5DIe+3qDyGGLEtkRFD0g9uJ0q9qYES7N4o/4SIutYw
	 IzAwxd4kDaPIu1BtzP2UxNJfSe6O0jplvgw4QILncOBQodJ/QRRq1bzBcaLWycm5iH
	 MRKTUKVEI7ceRAtZ+vmDMOyxptc4CrCGORBb1AfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06815F80150;
	Thu,  6 Aug 2020 16:49:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91CAFF8015C; Thu,  6 Aug 2020 16:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.arturia.com (mail.arturia.com [5.39.71.79])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3D37F800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 16:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D37F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=arturia.com header.i=@arturia.com
 header.b="CO6OeN+a"
Received: from [192.168.33.240] (226.142.197.77.rev.sfr.net [77.197.142.226])
 (Authenticated sender: markus.bollinger@arturia.com)
 by mail.arturia.com (Postfix) with ESMTPSA id 8544847C0BD9;
 Thu,  6 Aug 2020 16:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=arturia.com; s=mail;
 t=1596725361; bh=JDmvzZCgqH0eW/JL/WrDgKtw4Wrp229xMkK6dRD6QNU=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=CO6OeN+aVUsBgmLpVqXwIUjMfIn0C7lpFNG6w9hmHAOh7iukjG/fjKWp91/UOx+S2
 dFDRyKXrMbpM+K/wxSQa+1h5OYYhDEXYrmsjSsrV0cby0o5rphOfnVL8Yb7LSDafyG
 THR1merWhfGb6koAyRliAjj/Fh827xyeU+slNcew=
Subject: Re: asoc : snd_soc_simple_card connection to AKM4556 codec (i2s)
 issue on arm64
From: Markus Bollinger <markus.bollinger@arturia.com>
To: alsa-devel@alsa-project.org
References: <1f6b4d1f-88ff-94d2-5224-7219c61d558f@arturia.com>
Message-ID: <28bf58ec-1ef3-6e4a-f593-c23b8c6a6971@arturia.com>
Date: Thu, 6 Aug 2020 16:49:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1f6b4d1f-88ff-94d2-5224-7219c61d558f@arturia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: tiwai@suse.com
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

Hello,

I found what was missing: In the device-tree i2s0 parameters I had to 
add a reference to the sound-dai = <&ak4556_codec>;
&i2s0 {
     ......
     status = "okay";
     sound-dai = <&ak4556_codec>;
};

Now the drivers get loaded as expected (snd_soc_simple_card and 
snd_soc_ak4556),
I can aplay a sound file, but I have no sound.
With the oscilloscope I can see the generated LRCK clock, the SCLK clock 
and coherent SDO data, but the MCLK is constant zero.

My question now: Should the MCLK clock be handled automatically or do I 
have to initialize it in my driver ?
(I tried to do a snd_soc_dai_set_sysclk() in my hw_params fct, but it 
fails with -ENOTSUPP)

Best regards,
Markus


On 8/5/2020 12:52 PM, Markus Bollinger wrote:
> Hello,
>
> I try to get working an AKM4556 codec on the arm64 Rockchip RK3399 
> board under Linux 4.4.179
> The codec is a simple one (without i2c connection), similar to AKM4554 
> (but 24 bit instead of 16 bit audio) and hard configured to use i2s.
> I implemented the driver soc/codecs/ak4556.c which has only few 
> differences to ak4554.c.
> But when I try to get it working with the soc/general/simple-card.c, 
> the connection to the codec fails
> Both drivers (snd_soc_simple_card and snd_soc_ak4556) get loaded, the 
> call to
>
> asoc_simple_card_dai_link_of -> asoc_simple_card_sub_parse_of(cpu, ..)
>
> is OK, but the call to
>
> asoc_simple_card_dai_link_of -> asoc_simple_card_sub_parse_of(codec, 
> ..) -> snd_soc_of_get_dai_name
>
> fails with -EPROBE_DEFER.
>
> Now, i am not sure if it is a driver issue or rather a device-tree 
> one. I declared dt like this :
>
> / {
>
>     ak4556_card: ak4556-adc-dac {
>         status = "okay";
>         compatible = "simple-audio-card";
>
>         simple-audio-card,name = "ak4556";
>         simple-audio-card,format = "i2s";
>         simple-audio-card,mclk-fs = <256>;
>
>         simple-audio-card,widgets =
>             "Line", "Line In",
>             "Line", "Line Out";
>         simple-audio-card,routing =
>             "LIN", "Line In",
>             "RIN", "Line In",
>             "Line Out", "LOUT",
>             "Line Out", "ROUT";
>
>         simple-audio-card,cpu {
>             sound-dai = <&i2s0>;
>         };
>         simple-audio-card,codec {
>             sound-dai = <&ak4556_codec>;
>         };
>     };
>
>     ak4556_codec: ak4556-codec {
>         status = "okay";
>         compatible = "asahi-kasei,ak4556";
>         #sound-dai-cells = <0>;
>     };
>
>     i2s0: i2s@ff880000 {
>
>         compatible = "rockchip,rk3399-i2s", "rockchip,rk3066-i2s";
>         reg = <0x0 0xff880000 0x0 0x1000>;
>         rockchip,grf = <&grf>;
>         interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH 0>;
>         dmas = <&dmac_bus 0>, <&dmac_bus 1>;
>         dma-names = "tx", "rx";
>         clock-names = "i2s_clk", "i2s_hclk";
>         clocks = <&cru SCLK_I2S0_8CH>, <&cru HCLK_I2S0_8CH>;
>         resets = <&cru SRST_I2S0_8CH>, <&cru SRST_H_I2S0_8CH>;
>         reset-names = "reset-m", "reset-h";
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2s0_8ch_bus>;
>         power-domains = <&power RK3399_PD_SDIOAUDIO>;
>         status = "disabled";
>     };
>
> &i2s0 {
>     #sound-dai-cells = <0>;
>     assigned-clocks = <&cru SCLK_I2S0_DIV>;
>     assigned-clock-parents = <&cru PLL_GPLL>;
>     status = "okay";
> };
>
> Thank you in advance for your suggestions,
>
> Markus
