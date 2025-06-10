Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAC4AD3DB7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 17:43:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79441601F7;
	Tue, 10 Jun 2025 17:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79441601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749570238;
	bh=wUQnz5zzADPtqnscV5ZyBEA3YvKl5iGvmQmsBWNsWkE=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nM1LAWDGCnwQMENQVHF3whNKjx41e95w1deT8IfjxElfb0AZr1qv/TX0dRHuUGO9G
	 xtK1jfTlZ3jB0a6IniULySdHsUHWItZS8VWODSMpbshOfNhSVUU8e7Kpco4DtLsa2O
	 dQC3b/GRqd9PURjNJTo6sWIRfU4uJ+Zwn1AocxCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4E28F805B1; Tue, 10 Jun 2025 17:43:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F35F805C1;
	Tue, 10 Jun 2025 17:43:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF30F804B2; Tue, 10 Jun 2025 17:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA512)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B687F80087
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 17:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B687F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=base.nu header.i=@base.nu header.a=rsa-sha256
 header.s=20250128 header.b=k/qDNWpi
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=20250128; bh=yiRlw9eA7OO
	mBI1FOSb9eqqymunmmoYuhkytdpOGygU=; h=references:in-reply-to:subject:
	to:from:date; d=base.nu; b=k/qDNWpiK2IDW81diSjzad29ShIxANcrTIyKrBj9nfY
	65tgu0niyMqzDlLrgPlgqdI/RZp3g2yzwzNzWeb9V/pOHjg/9OAy5xItg2StSho1k6BWO0
	CR/HswgW1Q5DZZFd0lDkPBGGIMJlQJynO23LuYLIc2l6vwDJWYQlj3MRSKrRtBAhwMNIWg
	y+AvitlXUXbB4I+b7QvL5Svj4dijmfaBY+5kBcgTIHJIfPJLPsPJbHgy4BY0ey17Scou2Y
	l44mem7n/vOctwJoiBffPfzchViaIsiNdtxUXpHPIRLKxPgRCb2oihsiCESlsn5Iuxz1/e
	3cI5nwO315TtDYdGSDg==
Received: from hellmouth.base.nu (localhost [127.0.0.1])
	by hellmouth.base.nu (OpenSMTPD) with ESMTP id 4e1e91ef
	for <alsa-devel@alsa-project.org>;
	Tue, 10 Jun 2025 15:43:17 +0000 (UTC)
Received: from [127.0.0.1] ([185.190.198.236])
	by hellmouth.base.nu with ESMTPSA
	id q7qZOJRSSGgarQAADaPQrA
	(envelope-from <livvy@base.nu>)
	for <alsa-devel@alsa-project.org>; Tue, 10 Jun 2025 15:43:17 +0000
Date: Tue, 10 Jun 2025 16:43:16 +0100
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: =?US-ASCII?Q?RE=3A_Request_for_help=3A_How_to_upgrade_?=
 =?US-ASCII?Q?a_sound_driver_from_kernel_4=2E14_to_6=2E6?=
User-Agent: K-9 Mail for Android
In-Reply-To: 
 <IA1PR15MB600848657AD18CFD8DE71F5FB56AA@IA1PR15MB6008.namprd15.prod.outlook.com>
References: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
 <f278f7cf-dc78-4fac-b27d-2a7fbce08b62@metafoo.de>
 <IA1PR15MB600894BEC69309E17E839812B561A@IA1PR15MB6008.namprd15.prod.outlook.com>
 <4e315810-dcf5-48ac-ab86-f7c481a1c49d@metafoo.de>
 <IA1PR15MB600848657AD18CFD8DE71F5FB56AA@IA1PR15MB6008.namprd15.prod.outlook.com>
Message-ID: <FC907B1E-1E9A-4A18-BF73-87371D07C81C@base.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XL7WRZS3DV5YERQTSD3MH7ONZBGOJDZU
X-Message-ID-Hash: XL7WRZS3DV5YERQTSD3MH7ONZBGOJDZU
X-MailFrom: livvy@base.nu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Type: text/plain;
 charset=utf-8
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XL7WRZS3DV5YERQTSD3MH7ONZBGOJDZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10 June 2025 15:59:57 BST, Steve Broshar <steve@palmerwirelessmedtech.com> wrote:
>Thanks for the direction.
>
>Can you suggest a resource for writing such a driver? I cannot find anything that describes what a driver would do exactly. Is there a template or example that you can suggest that I use as a starting point?
>
>-steve
>
>-----Original Message-----
>From: Lars-Peter Clausen <lars@metafoo.de> 
>Sent: Saturday, May 31, 2025 11:33 PM
>To: Steve Broshar <steve@palmerwirelessmedtech.com>; alsa-devel@alsa-project.org
>Subject: Re: Request for help: How to upgrade a sound driver from kernel 4.14 to 6.6
>
>Hi,
>
>This seems to be one of the cases where chatgpt doesn't get it quite right and just makes stuff up.
>
>Generally you still need a simple driver for you codec that at least specifies which formats and rates are supported. But this can be a really simple driver, doesn't have to do anything other than registering the codec.
>
>On 5/30/25 14:47, Steve Broshar wrote:
>> Thanks for the help. I learned that to output I2S to a slave device, I 
>> shouldn't need a device-specific driver; that built-in drivers are all 
>> I need. I thought that was going to be easy to setup, but I have no 
>> luck with it. The boot log contains: platform sound-auditon: deferred 
>> probe pending
>>
>> I have been working with chatgpt extensively as it seems you do too. It has a deep understanding of the linux kernel codebase. But, so far I cannot get the device to initialize (probe). Do you agree that I should be able to avoid the use of a device-specific driver? Do you see any issues in the device tree below?
>>
>> Here's the device tree setup:
>>
>> &sai2 {
>> 	#sound-dai-cells = <0>;
>> 	pinctrl-names = "default";
>> 	pinctrl-0 = <&pinctrl_sai2>;
>> 	assigned-clocks = <&clk IMX8MN_CLK_SAI2>;
>> 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
>> 	assigned-clock-rates = <24576000>;
>> 	fsl,sai-mclk-direction-output;
>> 	status = "okay";
>> };
>>
>> 	pinctrl_sai2: sai2grp {
>> 		fsl,pins = <
>> 			MX8MN_IOMUXC_SAI2_TXC_SAI2_TX_BCLK      0xd6
>> 			MX8MN_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC     0xd6
>> 			MX8MN_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0    0xd6
>> 			//MX8MN_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0    0xd6
>> 			MX8MN_IOMUXC_SAI2_MCLK_SAI2_MCLK    0xd6
>> 		>;
>> 	};
>>
>>
>> 	// Compton audio output does not require a device-specific codec; the built-in, dummy driver is sufficient
>> 	codec_auditon: codec-snd-doc-dummy {
>> 		compatible = "linux,snd-soc-dummy";
>> 	 	#sound-dai-cells = <0>;
>> 	};
>>
>> 	// audio output for Compton can be accomplished via the built-in simple-audio-card driver
>> 	// since only need to stream I2S; device (ADAU1467) does not require setup/control
>> 	sound-auditon {
>> 		// specify the built-in simple sound card driver
>> 		compatible = "simple-audio-card";
>> 		
>> 		// description that shows in userland; i.e. via 'aplay -l'
>> 		// auditon: a quantum of sound ;)
>> 		simple-audio-card,name = "auditon";
>> 		
>> 		// specify stream format
>> 		// supported options: i2s, right_j, left_j, dsp_a, dsp_b, ac97, pdm, msb, lsb
>> 		//simple-audio-card,format = "i2s"; // with i2s, boot log shows: deferred probe pending and no device is setup
>> 		simple-audio-card,format = "dsp_a";
>> 		
>> 		// assign CPU as master for bit-clock
>> 		simple-audio-card,bitclock-master = <&cpu_link_auditon>;
>> 		
>> 		// assign CPU as master for frame-clock
>> 		simple-audio-card,frame-master = <&cpu_link_auditon>;
>>
>> 		status = "okay";
>>
>> 		cpu_link_auditon: simple-audio-card,cpu {
>> 			sound-dai = <&sai2>;
>> 			dai-tdm-slot-num = <2>; // 2=>stereo
>> 			dai-tdm-slot-width = <32>; // bits per slot
>> 		};
>>
>> 		simple-audio-card,codec {
>> 			sound-dai = <&codec_auditon>;
>> 		};
>> 	};
>>
>> Thanks in advance.
>>
>> Steve Broshar
>> Palmer Wireless Medtech
>
>

What SoC does the device have?

Olivia
