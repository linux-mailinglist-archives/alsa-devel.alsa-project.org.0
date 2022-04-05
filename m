Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48D4F22CB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 07:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A6E171D;
	Tue,  5 Apr 2022 07:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A6E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649138334;
	bh=SpQT9D0PlXe5QAoiLPCESfP7QQ6zNYrIRVnmnPal7IQ=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsGzc6TYRa8GyH/8Fj9vedRZLFBYG+DXebsk2HxENm1WVsjgzsstrITVsa5/kE2nN
	 H6A9CkBV9kcQhx8fmXgV83wLlbgBN1v7egPMmnoMw23O3EyQWZVZ0WtgZI7R5PKAuc
	 WFPgBhERiSZBNHh2IgwphlpAkmO2sFsv0+97efcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD506F8049C;
	Tue,  5 Apr 2022 07:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27EAEF80482; Tue,  5 Apr 2022 07:57:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7281DF800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 07:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7281DF800D2
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 8990443151;
 Tue,  5 Apr 2022 07:57:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id YlU9JqGIT7Md; Tue,  5 Apr 2022 07:57:33 +0200 (CEST)
Received: from [172.25.161.48] (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id C605A43138;
 Tue,  5 Apr 2022 07:57:32 +0200 (CEST)
Message-ID: <c55051a5-8294-213b-5746-cb5761a7230e@aksignal.cz>
Date: Tue, 5 Apr 2022 07:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: simple-audio-card
Content-Language: en-US
From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
To: kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org
References: <0f560987-151f-b844-e5b4-a3a10c8d46a8@aksignal.cz>
In-Reply-To: <0f560987-151f-b844-e5b4-a3a10c8d46a8@aksignal.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>
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

Hi,
something strange with it. When I compile kernel without loadable module 
support (# CONFIG_MODULES is not set) it works.

On 10. 03. 22 17:33, Jiří Prchal wrote:
> Hi everybody,
> would be someone so kind and help me with my sound card?
> My connection is:
> cpu AT91SAM9G25 I2S (SSC0) --> codec TLV320AIC3106 <-- clock 12MHz
> Codec is clock master.
> 
> dts related parts:
> 
>      sound {
>          compatible = "simple-audio-card";
>          simple-audio-card,name = "TLV320AIC3106";
>          simple-audio-card,widgets =
>              "Headphone", "Front Out",
>              "Line", "Rear Out",
>              "Line", "GSM Out",
>              "Speaker", "Speaker",
>              "Microphone", "Front In",
>              "Line", "Rear In",
>              "Line", "GSM In";
>          simple-audio-card,routing =
>              "Front Out", "HPLOUT",
>              "Rear Out", "HPROUT",
>              "GSM Out", "LLOUT",
>              "SP_AMP INL", "MONO_LOUT",
>              "Speaker", "SP_AMP OUTL",
>              "MIC3L", "Front In",
>              "LINE1R", "Rear In",
>              "LINE1L", "GSM In";
>          simple-audio-card,format = "i2s";
>          simple-audio-card,bitclock-master = <&sound_master>;
>          simple-audio-card,frame-master = <&sound_master>;
>          simple-audio-card,aux-devs = <&speaker_amp>;
> 
>          simple-audio-card,cpu {
>              sound-dai = <&ssc0>;
>          };
> 
>          sound_master: simple-audio-card,codec {
>              sound-dai = <&tlv320aic3106>;
>              system-clock-frequency = <12000000>;
>          };
>      };
> 
> &ssc0 {
>      #sound-dai-cells = <0>;
>      status = "okay";
>      pinctrl-0 = <&pinctrl_ssc0_tx_rx>;
> };
> 
> &spi0 {
>      status = "okay";
>      cs-gpios =
>          <&pioA 22 0
>           &pioC 14 0
>           &pioC 29 0
>           &pioA  4 0>;
> 
>      tlv320aic3106: codec@3 {
>          compatible = "ti,tlv320aic3106";
>          reg = <3>;
>          spi-max-frequency = <1000000>;
>          #sound-dai-cells = <0>;
>          adc-settle-ms = <40>;
>          ai3x-micbias-vg = <2>; /* 2.5V */
>          status = "okay";
>          DRVDD-supply = <&vcc_3v3>;
>          AVDD-supply = <&vcc_3v3>;
>          IOVDD-supply = <&vcc_3v3>;
>          DVDD-supply = <&vcc_1v8>;
>          ai3x-ocmv = <2>; /* 1.65V */
>      };
> };
> 
> 
> In kernel 5.12 it worked fine, but I can't make it in either 5.15 or 5.17.
> 
> dmesg doesn't help at all, even with debug compilation switch:
> ...
> [    1.203333] ssc f0010000.ssc: Atmel SSC device at 0x(ptrval) (irq 22)
> ...
> [    1.616666] atmel_spi f0000000.spi: Using dma0chan2 (tx) and 
> dma0chan3 (rx) for DMA transfers
> ...
> [    1.639999] codec@3 enforce active low on chipselect handle
> [    1.656666] at25 spi0.0: 128 KByte fm25 fram, pagesize 4096
> [    1.696666] atmel_spi f0000000.spi: Atmel SPI Controller version 
> 0x212 at 0xf0000000 (irq 28)
> ...
> [    3.033333] ALSA device list:
> [    3.036666]   No soundcards found.
> 
> The only difference in 5.12 is:
> [    3.869999] ALSA device list:
> [    3.876666]   #0: TLV320AIC3106
> 
> So, what's wrong?
> Thanks Jiri
