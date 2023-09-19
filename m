Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFE7A6637
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 16:10:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E85DEE;
	Tue, 19 Sep 2023 16:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E85DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695132646;
	bh=ZneiNh7xQsv862NrJp4BnMv8fnfLDLgfX7YP2TYAc1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qaITl0GwWPHEYMQMjvO/f2AzAX9xh/3Hb74XLGVY5jZY5KBwY8MgmWJp8TAjLXXOM
	 wJBL5Dlj1Pnm/KZxI8AyYAuVCfMgTeeIKUhMMEnrUm5per/SZaEZE/g4lpMuiSMulD
	 uhj/jZ+F/WAcMaGDdvAb1HvA7idCl+5ECZ7SU+VM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCA54F800F4; Tue, 19 Sep 2023 16:09:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67246F801F5;
	Tue, 19 Sep 2023 16:09:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60420F8025A; Tue, 19 Sep 2023 16:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44EA2F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 16:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44EA2F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=JSd2LKk0;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=TrxUyXTi
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9A2EB5C01A2;
	Tue, 19 Sep 2023 10:09:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 19 Sep 2023 10:09:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1695132562; x=1695218962; bh=iBpN9RwHC/roQt1e6Pn06BngS
	R0Z+zOvi/Y9W4l8+Yg=; b=JSd2LKk0aMFJmdjrl6Isr+1R9z9lNossg2moKUqwW
	veM/r8bAp9RG5WXBxtjB3NfLdihcScntlTUd60SKuAd5kLgnwfmXfX2vzjdFJmIG
	zDrGoPXEZR8NEjpDcpx8SOMQoKvLuJk0h/xzrSs1HkPBXZ+U0sfOdaT68ecADchU
	0wGfa1vPtCANNhDLUCXydthl2IDi8WLX/1i2bOrYG74cJvNlrXJmw0xEUxCt/v14
	mkKfnoa3KLgX2/rx1gzUjnZ2DxPJLpsC2TXaot2mYak7mm3zfokXzKgDDsYEf6ij
	QeN0Ss/tj4nKNyq/tuzspKuUibFxvQ9i2Hx1qfbN0pvhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695132562; x=1695218962; bh=iBpN9RwHC/roQt1e6Pn06BngSR0Z+zOvi/Y
	9W4l8+Yg=; b=TrxUyXTik4Q+RJlGKzyO97ZR2DFiWnlwDjQqfpSuSqlSUyhRG01
	RUw5DJbDo/h6BnyMYhUnkDDomGVPsfqVYD72nm9EclXnHhd6ZndMkQzhbMnj0oXJ
	iIqy8p6dQaeGSPWFskqQIMiHfSZBGtbHdWiqTVrIPHT8uFFRf5sqb9PtK+qakuFN
	SON+l/Ng1uHNBQH8wQ4Y94GwBvODr5Gz5LmpLbkw+9bcZhn7AX2dzxzto9GUtlJQ
	QL+pGLb0hs0rDqvKlPakQyvWzMfqqw7C4DCF4R08g4WSWLJoZHniiytTD2+8QvKS
	PZaEl+6aE6LUNO5+8jX5duOSJRr8B2nbXuw==
X-ME-Sender: <xms:kKsJZema6IRD96ckXZYTFwwcQwOnbIqojDoUb6OSx0qUvWJCsPcPdw>
    <xme:kKsJZV1n-bZC34FYeNK-QGRCe5iO133qQHwyzp7AiYJh4JixFaZuz0wj2FmyULTRi
    dNdPWeHCjBTsuLTfiQ>
X-ME-Received: 
 <xmr:kKsJZcroKuLu9tKX5vf9JieOuQyxNrHHpEW7MUcl99w9lt0A3-bKuZyk7fHwog27Vf-hBglZINHP8o8X5uBVksyMsSYXcUVusw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudekuddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefvrghk
    rghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhih
    drjhhpqeenucggtffrrghtthgvrhhnpefhfffhgfehtdduveeljeefvddvjeffhfevteeg
    gfeivedvveevheegleeitdduueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgr
    shhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:kKsJZSkGhuSu_46HJcWDi81BqFuJnw_8RcuTY-0p925v1Wg8QBNMAQ>
    <xmx:kKsJZc05qS5A_UE8idYHddeyjL_XPHMf1xxcnaniMvhWYJ5lTBClOA>
    <xmx:kKsJZZtm3nciTDGGl-8i0P3Aiq7bolgpRhCQjD20z9DVeo8acy_8kQ>
    <xmx:kqsJZaDTIokgFv5b_nySVvlMKR6j78T5U8jtYlXWpgRIAMuQh4cAyA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Sep 2023 10:09:19 -0400 (EDT)
Date: Tue, 19 Sep 2023 23:09:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: Takashi Iwai <tiwai@suse.de>, Rolf Anderegg <rolf.anderegg@weiss.ch>,
	alsa-devel@alsa-project.org
Subject: Re: MAN301 external clock issues (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Message-ID: <20230919140916.GA212186@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Takashi Iwai <tiwai@suse.de>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230905235441.GA24829@workstation.local>
 <eb2cd50f-04c9-47f6-9fb3-c75d7b20a563@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb2cd50f-04c9-47f6-9fb3-c75d7b20a563@weiss.ch>
Message-ID-Hash: 7JAH2KSI752XPEUTYIBMHRDI6TDP3FGJ
X-Message-ID-Hash: 7JAH2KSI752XPEUTYIBMHRDI6TDP3FGJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JAH2KSI752XPEUTYIBMHRDI6TDP3FGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michele,

On Mon, Sep 18, 2023 at 03:19:10PM +0200, Michele Perrone wrote:
> Hi Takashi,
> 
> I'm encountering a strange issue when working with our MAN301 device and
> external clock sync. I am currently using our kernel-side AV/C code to
> switch between clock sources[1].
> 
> When I switch to an external clock source, the user-space ALSA code is not
> able to change the clock rate anymore. This means that I cannot switch to
> the external clock rate that the DICE is currently locked onto.
> 
> Here is a practical example / steps to reproduce:
> 
> 1. Set the clock source to internal and the clock rate to an arbitrary
>    value (e.g. 44100) from the user-space. The relevant sections of
>    /proc/asound/card0/firewire/dice will then look like this:
> 
> global:
>   owner: ffc0:000100000000
>   notification: 00000040
>   nick name: Weiss MAN301
>   clock select: internal 44100
>   enable: 0
>   status: locked 44100
>   ext status: 00010001
>   sample rate: 44100
>   version: 1.0.12.0
>   clock caps: 44100 48000 88200 96000 176400 192000 aes1 aes2 aes3 wc
> internal
>   clock source names: AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF
> (TOS)\Unused\Unused\Unused\Unused\Word Clock
> (BNC)\Unused\Unused\Unused\Unused\Internal\\
> 
> ext status:
>   clock source: internal
>   locked: 1
>   rate: 44100
> 
> 2. Set the clock source to external (e.g. aes1) through AV/C command[1]
>    and connect a digital input with a different clock rate (e.g. 48000).
>    Now the two sections of will look like this. You can see that the
>    external source status is "locked".
> 
> global:
>   owner: ffc0:000100000000
>   notification: 00000010
>   nick name: Weiss MAN301
>   clock select: aes1 44100
>   enable: 0
>   status: unlocked 44100
>   ext status: 00010001
>   sample rate: 44100
>   version: 1.0.12.0
>   clock caps: 44100 48000 88200 96000 176400 192000 aes1 aes2 aes3 wc
> internal
>   clock source names: AES/EBU (XLR)\S/PDIF (RCA)\S/PDIF
> (TOS)\Unused\Unused\Unused\Unused\Word Clock
> (BNC)\Unused\Unused\Unused\Unused\Internal\\
> 
> ext status:
>   clock source: aes1
>   locked: 1
>   rate: 48000
> 
> 3. Try to set the clock rate to 48000 from user-space ALSA. This will
>    fail. Only 44100 can be used. Example:
> 
> $ aplay --disable-resample 48000_S32.wav
> Playing WAVE '48000_S32.wav' : Signed 32 bit Little Endian, Rate 48000 Hz,
> Stereo
> Warning: rate is not accurate (requested = 48000Hz, got = 44100Hz)
> 
> 
> The current workaround is going back to the internal clock source, switch
> the clock rate to the one reported in the "ext status" section, and then
> go back to the external clock source. This however does not feel quite
> right.
> 
> I will be very grateful for any suggestion from your side.
 
I programmed ALSA dice driver to behave like that.

The driver configures the target device for sampling rate which ALSA PCM
application expects when the device uses internal source of clock. When
the device is configured to use external source of clock, the driver
adds constrains to ALSA PCM hardware configuration so that the application
works with current sampling rate configured in device.

In your case:

clk src    ext rate   rate in device   appl avail rates
--------- ---------- ---------------- ------------------
Internal       -         44.1 KHz        44.1-192.0 kHz
External    48.0 kHz     44.1 kHz        44.1 kHz

For the case of external source of clock, you need to configure the
sampling rate in device by your hand, by accesing to GLOBAL_CLOCK_SELECT
offset in global section of TCAT protocol.

As a result:

clk src    ext rate   rate in device   appl avail rates
--------- ---------- ---------------- ------------------
Internal       -         44.1 KHz        44.1-192.0 kHz
External    48.0 kHz     48.0 kHz (*)    48.0 kHz

I note that the device's behaviour of the external source scenario
differs depending on models even if the pair of models uses the same
Dice ASIC. I guess that firmware version brings such chaos.

> Thank you and kind regards,
> Michele Perrone
> 
> [1]https://github.com/weiss-engineering/snd-dice/blob/5a95496c0666048bc5bc8c07b3e1d74f392dc9a4/dice-avc.c#L436


Regards

Takashi Sakamoto
