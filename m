Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32566769906
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:08:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6511A82A;
	Mon, 31 Jul 2023 16:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6511A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690812520;
	bh=IE4yyzEXtsHxCRraziINIfpy8FcZOw4hwE48/I4Z/4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GmpF+hfgtOW/joBWvZEDT3z4LV28G0i+/UDCzQLqvUHaG0xwhbP4OcxsW1y0E6UsC
	 2W0x5RjMMbrjqWDZgR/EV7LJ+7NNvlU4PvEqncT/YYicDyyBQHFivTX0AB1CxfDmD+
	 7EHj1Yqehz/h3DXbaCanwarL7Nm+06Q39rTl7EcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50BA8F80520; Mon, 31 Jul 2023 16:07:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB670F80163;
	Mon, 31 Jul 2023 16:07:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D6F5F8016D; Mon, 31 Jul 2023 16:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDDE7F80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDE7F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=GzxK9bCH;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pceFhPHw
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A4045C009A;
	Mon, 31 Jul 2023 10:07:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 31 Jul 2023 10:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1690812420; x=1690898820; bh=en0QkfmTEV4mg1m2nXM5ooY2O
	mHXOV5R2PM4BGiLb0s=; b=GzxK9bCHKPI5xqAneuGB4EAQM4S3TCnZIct03rh7e
	O//drPF9f7pfYG6fXS5hgHJ5YbAS4QPotYqm7DnaxHTJZYnByVbBFe+1c7i00Fn0
	qBvUmFmw13MP06aIRQucFQaKr5qHPP/a7oV55DA4QucBGyQv1OqpF11u55BflmSD
	YHycJ2gmhbkqfziWC32sKVT6tdoKSuRKTttA21HQ9LGkpsxcAdB68tS0k0NRvLci
	c5w6dSLSZ4clz0c5f/HBhp9TXtMBsTcAhKryJ9DkbCw5tXNeLj3PBIq1gSgiVNjo
	DHNo5uFOYzwlwQRSW7+mvYHkHSM97MF/sVvzsm1k4r1vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1690812420; x=1690898820; bh=en0QkfmTEV4mg1m2nXM5ooY2OmHXOV5R2PM
	4BGiLb0s=; b=pceFhPHwRanWS6UVGCcDx0pgWOkN8xV3agsw939i13dgEfIqHow
	pVArjrpAE0yTfH3PCc+F2Z+DVuMiwQxA75pVXnXC5YqWHDZ+Hc2j23fJECFZjMwh
	JqUEJQSTdD/osgicSwPLFzUv+M0jNJcKi6MLCQTDPL+X+vgjNO5Cdq8DOazqX5kM
	haJCXE0xlBAGeJ8NP13VgJF7da4tOYOvO0nEkoLo1//B6RDRLL9M4nPOLyl39v1O
	7Z2S7FZqbI/IHFiI9E5EIH0Nr7dr4ErtTIpS3mN1ihvOvZwJkwouoSXcGteHhA1H
	eYxYxK2mA+HBz4uB4YyQT22CoNfhlj8Jcrg==
X-ME-Sender: <xms:A8DHZCDGpcxLQD-T0rTQygJhnuUmEaBgcu1xVrT7QmxX7HTiS2p5wA>
    <xme:A8DHZMg3DMBOhNacU0aTH4nhcS1XFBb5aPkd-yOqAnzEzqjqJo0YZ1fw8L85D_ia8
    om4ozvv-i3d0f6QfJg>
X-ME-Received: 
 <xmr:A8DHZFnIEZMZX_SUybI5nq0D7cJ220GZvJDaTetYMvZ30Ri7R1roL4CUS9nSg0WDL8VqXMhkqzGS4O6nrPDlSEAlFYFAAbej_ow>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrjeeggdeglecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepjeejkeelffevteeikeffgeeileefkeeiudfggfei
    jeegvdetgedvueejtedvheejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpphhhoh
    hrohhnihigrdgtohhmpdhgihhthhhusgdrtghomhdpughotghsrdhrshenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhise
    hsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:A8DHZAywgb0qPVARD2syeGhe6JpCV3W41XgEtQY3pRuB0MmlM7DWyg>
    <xmx:A8DHZHSBtiO_WFn4JA9EZvNljByTz-qTicVg8_FBMPuDt0B7Cm9mWQ>
    <xmx:A8DHZLby2ZyN5SHyftT1Hkd2h3_jbAWZd2G_n2tI970uiBzR8G_j-w>
    <xmx:BMDHZBe5zZkQEuy0g3ZdpK3sB2jChIftfSSYT1_WtlvRdfRAcoFHAA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jul 2023 10:06:58 -0400 (EDT)
Date: Mon, 31 Jul 2023 23:06:55 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Isabelle Kernhof <isabelle.kernhof@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Message-ID: <20230731140655.GA367100@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Isabelle Kernhof <isabelle.kernhof@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
Message-ID-Hash: SW5S3Z3V57I7A6YUKXB6NVUQ6EVQD3E4
X-Message-ID-Hash: SW5S3Z3V57I7A6YUKXB6NVUQ6EVQD3E4
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SW5S3Z3V57I7A6YUKXB6NVUQ6EVQD3E4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mr. Michele,

On Mon, Jul 31, 2023 at 10:09:14AM +0200, Michele Perrone wrote:
> Dear Mr. Sakamoto,
> 
> thank you very much for the prompt feedback, and also for your
> contributions to the Linux audio Firewire stack during the last decade.

Thanks. Nowadays I also maintain Linux FireWire subsystem itself[1][2][3].

> We at Weiss Engineering would like to improve Linux support for our
> Firewire devices in order to extend their lifetimes. We have also
> occasionally received requests for Linux compatibility from some
> customers.
>
> This is also motivated by the fact that the old DICE Apple driver, which was
> originally developed by TCAT, is not maintained anymore and does not work on
> Apple Silicon computers. Therefore, we would like to give the alternative of
> running our devices on Linux if the customers decide to do.

I know that no driver for 1394 OHCI hardware itself is included in recent
MacOS anymore, regardless of hardware (x86_64/arm64). Your customer has no
choice when continuing using their Weiss products.

> We are also working on a update for our old music archive network player
> (MAN301), which uses a DICE chip to interface with its DAC; so it seemed
> only fair that owners of all Weiss devices based on DICE benefited from
> this.

That sounds great... However, let me note that the maintenance of Linux
FireWire subsystem will be end in 2029, 6 years later (see the first
reference link).

> Sorry for mistakes 1, 2, and 3 (you can tell it's my first kernel patch).
> And I indeed forgot to include the snd_dice_detect_weiss_formats() prototype
> into the patch submittal.
>
> About the 4th issue, yes, the 'category_id' is still correct [1].

Okay. ALSA dice driver has the mechanism to check category_id field
against known values, while the check is skipped for explicit device
entries which the patch adds. So this is just from my curiosity
(I forgot the mechanism in the last message).

> About the 5th issue, you are right both about the wrong tx/rx direction and
> the absence of isochronous packets from the device. I checked the DICE
> firmware code for the INT202 and we are indeed sending isochronous packets
> from
> the device. Therefore, the correct stream formats should look like this:
> 
> +/* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire interface
> */
> +static const struct dice_weiss_spec int202 = {
> +    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> +    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
> +    .has_midi   = false
> +};
> 
> I tested this configuration with XLR and RCA outputs, and it works
> correctly.

Good. I revised the patch and force-pushed to the remote repository
(747ddada9f4f).

> Sorry for the mistake, I don't have a deep knowledge about the old DICE
> firmware because I've started working at Weiss Engineering only
> recently.
 
You would have more resources about DICE chipset, and get more helps from
your colleague than me. No worry about it, I guess. 

The rest of my concern is that TCAT protocol extension (EAP) support. In
the extension, software can retrieve all of available stream format
from the target device without switching mode of transmission frequency.
If the device supports EAP, we do not necessarily to add hard-coded stream
formats (please refer to the device entry with
'snd_dice_detect_extension_formats()'). I would like you to check
specification of each Weiss product whether EAP is supported or not.

> About the configuration ROMs, that shouldn't be an issue; let me get
> back to you as soon as I speak with my colleague, Rolf Anderegg. He has
> worked on our DICE devices in the past but he's on vacation right now.

Once connecting device to IEEE 1394 bus, the content of configuration
ROM is exposed in sysfs node of Linux system. You can make a file to
contain it by redirecting the output to the file, like:

$ cat /sys/bus/firewire/devices/fw1/config_rom > rom.img

> Yet another topic is AVC support. We used to have support for it for the
> DICE driver in the 3.x kernel, and we are in the process of re-adapting
> that code.
> But this should be probably discussed in a separate e-mail.
 
Okay. For your information, I write user space program names as
'snd-dice-ctl-service' as the part of 'snd-firewire-ctl-services'[4]. At
present, it has no support for Weiss products[5], so I'm pleased if getting
any help in your side.

[1] https://git.kernel.org/torvalds/c/f3948874c340
[2] https://www.phoronix.com/news/Linux-Firewire-New-Maintainer
[3] https://www.phoronix.com/news/Linux-6.5-Firewire
[4] https://github.com/alsa-project/snd-firewire-ctl-services
[5] https://docs.rs/firewire-dice-protocols/0.2.0/firewire_dice_protocols/


Thanks

Takashi Sakamoto
