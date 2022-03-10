Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48174D4F66
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 17:35:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2063F191E;
	Thu, 10 Mar 2022 17:34:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2063F191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646930100;
	bh=cm75yWkXT7qQ2BQmzd7YWZEsUAPvYe4J81bSNn+ZXpA=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R5iPS3eGbOkE+U1doIICht4tdbz9wlR0VV4HYm4K6V10ngvOchnGONCZENMbRerMD
	 ETdUdiRIn1hScDp+i4reBDb2pN+tuOQOX4SMzuyMfwjshuns6fCyzENmjbUH0wx/Sf
	 7Csg3swAeQkzmn59z34e0eVNNH0BKEqwWwDQANxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 932FDF800D2;
	Thu, 10 Mar 2022 17:33:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A3B7F80137; Thu, 10 Mar 2022 17:33:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64A5BF800D2
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 17:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A5BF800D2
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id E245C435AD;
 Thu, 10 Mar 2022 17:33:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id bydpfAjuZnoN; Thu, 10 Mar 2022 17:33:44 +0100 (CET)
Received: from [172.25.161.48] (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id EA71A435AA;
 Thu, 10 Mar 2022 17:33:43 +0100 (CET)
Message-ID: <0f560987-151f-b844-e5b4-a3a10c8d46a8@aksignal.cz>
Date: Thu, 10 Mar 2022 17:33:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org
From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: simple-audio-card
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi everybody,
would be someone so kind and help me with my sound card?
My connection is:
cpu AT91SAM9G25 I2S (SSC0) --> codec TLV320AIC3106 <-- clock 12MHz
Codec is clock master.

dts related parts:

	sound {
		compatible = "simple-audio-card";
		simple-audio-card,name = "TLV320AIC3106";
		simple-audio-card,widgets =
			"Headphone", "Front Out",
			"Line", "Rear Out",
			"Line", "GSM Out",
			"Speaker", "Speaker",
			"Microphone", "Front In",
			"Line", "Rear In",
			"Line", "GSM In";
		simple-audio-card,routing =
			"Front Out", "HPLOUT",
			"Rear Out", "HPROUT",
			"GSM Out", "LLOUT",
			"SP_AMP INL", "MONO_LOUT",
			"Speaker", "SP_AMP OUTL",
			"MIC3L", "Front In",
			"LINE1R", "Rear In",
			"LINE1L", "GSM In";
		simple-audio-card,format = "i2s";
		simple-audio-card,bitclock-master = <&sound_master>;
		simple-audio-card,frame-master = <&sound_master>;
		simple-audio-card,aux-devs = <&speaker_amp>;

		simple-audio-card,cpu {
			sound-dai = <&ssc0>;
		};

		sound_master: simple-audio-card,codec {
			sound-dai = <&tlv320aic3106>;
			system-clock-frequency = <12000000>;
		};
	};

&ssc0 {
	#sound-dai-cells = <0>;
	status = "okay";
	pinctrl-0 = <&pinctrl_ssc0_tx_rx>;
};

&spi0 {
	status = "okay";
	cs-gpios =
		<&pioA 22 0
		 &pioC 14 0
		 &pioC 29 0
		 &pioA  4 0>;

	tlv320aic3106: codec@3 {
		compatible = "ti,tlv320aic3106";
		reg = <3>;
		spi-max-frequency = <1000000>;
		#sound-dai-cells = <0>;
		adc-settle-ms = <40>;
		ai3x-micbias-vg = <2>; /* 2.5V */
		status = "okay";
		DRVDD-supply = <&vcc_3v3>;
		AVDD-supply = <&vcc_3v3>;
		IOVDD-supply = <&vcc_3v3>;
		DVDD-supply = <&vcc_1v8>;
		ai3x-ocmv = <2>; /* 1.65V */
	};
};


In kernel 5.12 it worked fine, but I can't make it in either 5.15 or 5.17.

dmesg doesn't help at all, even with debug compilation switch:
...
[    1.203333] ssc f0010000.ssc: Atmel SSC device at 0x(ptrval) (irq 22)
...
[    1.616666] atmel_spi f0000000.spi: Using dma0chan2 (tx) and 
dma0chan3 (rx) for DMA transfers
...
[    1.639999] codec@3 enforce active low on chipselect handle
[    1.656666] at25 spi0.0: 128 KByte fm25 fram, pagesize 4096
[    1.696666] atmel_spi f0000000.spi: Atmel SPI Controller version 
0x212 at 0xf0000000 (irq 28)
...
[    3.033333] ALSA device list:
[    3.036666]   No soundcards found.

The only difference in 5.12 is:
[    3.869999] ALSA device list:
[    3.876666]   #0: TLV320AIC3106

So, what's wrong?
Thanks Jiri
