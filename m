Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBAAC9DBD
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Jun 2025 06:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3396022D;
	Sun,  1 Jun 2025 06:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3396022D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748752428;
	bh=E+NDocvrVOO5ZktAdgvFBlQivdXUl5tXpW+Hle+4z7o=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i5nmqHQ3SRWza6sIF8x1CUlk/fTUFmKLYgVt9pA1KvHJCsKeHOZZo0oQYO0S1C1Pm
	 cOLc8soriZqn5GFaK4IducRGZ5YD7eza5P2PJVJpyDJSy9rkJHUkt8+2HY4h4v5DcW
	 KpRk9rQeitqxSTyzfvRvKnpgHpd9eFSCnFyFvhvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3064FF805B2; Sun,  1 Jun 2025 06:33:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5610F805C0;
	Sun,  1 Jun 2025 06:33:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA0C3F80269; Sun,  1 Jun 2025 06:33:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F205F8016D
	for <alsa-devel@alsa-project.org>; Sun,  1 Jun 2025 06:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F205F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256
 header.s=default2002 header.b=ksA8DYZO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=seKVIG/wOZ86tOskLuXdLlBJwd/vemmgDGseqAnYRss=; b=ksA8DYZOzr0ttL/RoiClihYppX
	tp8yDwGYODSz202qlRiewmNN/PsYCjleFo4wONBXUDiqIs18TwioInIVfiw6U2tVlpt2bMOGAHVRa
	rZiQSakwwnKr/aeJUz09fLiJyM+PZcu/UcBxyZMGjs9w923Cj+1M7CN9ZdCoDu7+pzorgZbh5aPcX
	MZvVW4iFL/9mNjuwbXSzCP4XRnMYgArrfJi872/CFZhcpl0Ke42FE+WjsAEsd8/3R7DfC5vowprP/
	VJaI+75zoOYUgPtG6MNwLRRvEqY+X6u4vdacqAMmKZmlHz3W+EXfEifZVqSbmtpeVcEdYjnyY5++b
	wt50Qo+w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <lars@metafoo.de>)
	id 1uLaNd-0000xu-36;
	Sun, 01 Jun 2025 06:33:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls
 TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lars@metafoo.de>)
	id 1uLaNd-000F49-1T;
	Sun, 01 Jun 2025 06:33:05 +0200
Message-ID: <4e315810-dcf5-48ac-ab86-f7c481a1c49d@metafoo.de>
Date: Sat, 31 May 2025 21:33:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
To: Steve Broshar <steve@palmerwirelessmedtech.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
 <f278f7cf-dc78-4fac-b27d-2a7fbce08b62@metafoo.de>
 <IA1PR15MB600894BEC69309E17E839812B561A@IA1PR15MB6008.namprd15.prod.outlook.com>
Content-Language: en-US
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: 
 <IA1PR15MB600894BEC69309E17E839812B561A@IA1PR15MB6008.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27654/Sat May 31 11:15:24 2025)
Message-ID-Hash: OWRWBX3KOAI4IH6LTGTZ6AW62GG3YQXA
X-Message-ID-Hash: OWRWBX3KOAI4IH6LTGTZ6AW62GG3YQXA
X-MailFrom: lars@metafoo.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OWRWBX3KOAI4IH6LTGTZ6AW62GG3YQXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This seems to be one of the cases where chatgpt doesn't get it quite 
right and just makes stuff up.

Generally you still need a simple driver for you codec that at least 
specifies which formats and rates are supported. But this can be a 
really simple driver, doesn't have to do anything other than registering 
the codec.

On 5/30/25 14:47, Steve Broshar wrote:
> Thanks for the help. I learned that to output I2S to a slave device, I shouldn't need a device-specific driver; that built-in drivers are all I need. I thought that was going to be easy to setup, but I have no luck with it. The boot log contains: platform sound-auditon: deferred probe pending
>
> I have been working with chatgpt extensively as it seems you do too. It has a deep understanding of the linux kernel codebase. But, so far I cannot get the device to initialize (probe). Do you agree that I should be able to avoid the use of a device-specific driver? Do you see any issues in the device tree below?
>
> Here's the device tree setup:
>
> &sai2 {
> 	#sound-dai-cells = <0>;
> 	pinctrl-names = "default";
> 	pinctrl-0 = <&pinctrl_sai2>;
> 	assigned-clocks = <&clk IMX8MN_CLK_SAI2>;
> 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
> 	assigned-clock-rates = <24576000>;
> 	fsl,sai-mclk-direction-output;
> 	status = "okay";
> };
>
> 	pinctrl_sai2: sai2grp {
> 		fsl,pins = <
> 			MX8MN_IOMUXC_SAI2_TXC_SAI2_TX_BCLK      0xd6
> 			MX8MN_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC     0xd6
> 			MX8MN_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0    0xd6
> 			//MX8MN_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0    0xd6
> 			MX8MN_IOMUXC_SAI2_MCLK_SAI2_MCLK    0xd6
> 		>;
> 	};
>
>
> 	// Compton audio output does not require a device-specific codec; the built-in, dummy driver is sufficient
> 	codec_auditon: codec-snd-doc-dummy {
> 		compatible = "linux,snd-soc-dummy";
> 	 	#sound-dai-cells = <0>;
> 	};
>
> 	// audio output for Compton can be accomplished via the built-in simple-audio-card driver
> 	// since only need to stream I2S; device (ADAU1467) does not require setup/control
> 	sound-auditon {
> 		// specify the built-in simple sound card driver
> 		compatible = "simple-audio-card";
> 		
> 		// description that shows in userland; i.e. via 'aplay -l'
> 		// auditon: a quantum of sound ;)
> 		simple-audio-card,name = "auditon";
> 		
> 		// specify stream format
> 		// supported options: i2s, right_j, left_j, dsp_a, dsp_b, ac97, pdm, msb, lsb
> 		//simple-audio-card,format = "i2s"; // with i2s, boot log shows: deferred probe pending and no device is setup
> 		simple-audio-card,format = "dsp_a";
> 		
> 		// assign CPU as master for bit-clock
> 		simple-audio-card,bitclock-master = <&cpu_link_auditon>;
> 		
> 		// assign CPU as master for frame-clock
> 		simple-audio-card,frame-master = <&cpu_link_auditon>;
>
> 		status = "okay";
>
> 		cpu_link_auditon: simple-audio-card,cpu {
> 			sound-dai = <&sai2>;
> 			dai-tdm-slot-num = <2>; // 2=>stereo
> 			dai-tdm-slot-width = <32>; // bits per slot
> 		};
>
> 		simple-audio-card,codec {
> 			sound-dai = <&codec_auditon>;
> 		};
> 	};
>
> Thanks in advance.
>
> Steve Broshar
> Palmer Wireless Medtech


