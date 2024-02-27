Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B486A3FD
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 00:55:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C44846;
	Wed, 28 Feb 2024 00:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C44846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709078145;
	bh=9FOVYSo+iG9hyEh6u5SNUAzHZYr9W8MBAUjQN2LkKlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U9KGZlOIrnYHHMbw+tpzg1XIuZN0q1hAKjaS97tyCpxu2ZnhfWgrDDdrE8qYKn3wR
	 IH42jPBKDQSpfSLzkLf1Uk0pq1ofPGvI10ZOaP/wOWvRJ+VgfQDjjs6ASbB4d7H0Fd
	 lB5bGGJ11rY92TTBvplVisbSjWRLECLPtLoig1X0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65816F805AE; Wed, 28 Feb 2024 00:55:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88688F8059F;
	Wed, 28 Feb 2024 00:55:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36995F801C0; Wed, 28 Feb 2024 00:55:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13FE7F80104
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 00:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13FE7F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=XWhf3FJv;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=NpNnDLpj
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AB5A05C018B;
	Tue, 27 Feb 2024 18:54:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 27 Feb 2024 18:54:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1709078091; x=
	1709164491; bh=xcTOWQg1PFqLrVMI8eNqGXIBCtofOFm0NofjwWW70hE=; b=X
	Whf3FJvTgI+79gWTC8DKbYy2eMK/+Ppq3rXmiwm9c16lfwAoF/xWRyTF8/kDu60M
	Ga0wm2rWKDeLPtyW97xGmWK3DuxyNlQl44Y29qYLJtKEwzs3oAtMh/VlMkwbiTdC
	2H8qOGaBaB05Lj94jVEAoNj9Xf8ucxNNiJHkeHMoGggsiM9fySUHt5hYibaLLQOf
	rBdumKRCdXxqJcOw9D/V1VpK9rda2EWP6DFhNXiHD8vNqJlQnDrkmYmSYN6M0BdE
	x7b+5YcJQulnXu8XxQcvkNc/9C87YzWYiRhuRDfE6zOt3x0zEcGYF7wvTKNXUa7d
	FjQfDJO+XVF9XBZcTgzQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709078091; x=1709164491; bh=xcTOWQg1PFqLrVMI8eNqGXIBCtof
	OFm0NofjwWW70hE=; b=NpNnDLpj04rFEtOxzkqJ84o8vXg4qO3QwN83AkjYi1Vu
	W7n/tdWFIGZDEjND4B0mf/L8TUJ52k+21m+2hVSBC4U6G+qUQoj8wuhoRFrdt32W
	CcqO3bm1lABua/A0s0LGp5mh5Bsd/TnhJHywXapoI7QTiXE359xeOPnJfrTjyg9r
	w4Ex5njMHbYpG7QUjU0DORn/EMQnuRon3BSHRBh0ePHsTKQaw3F6QCgkcaghM9AI
	T7oQcbXPFsbAUsaDyIAW9FiH5vcarZwz5PeuJ00O0P2VavNOSssZjBj/7Hmo86Qc
	m3/yspYgDJ5DsXlEIGMKWazsIhQmoJFwGLpY3wxsTw==
X-ME-Sender: <xms:S3beZZvtOVf5_lx-lKRtMfCe-leyD2EBRWW4oIon4cgduKbGsEKMZg>
    <xme:S3beZSeJ_es6d6Jo0KsP7Vwa9KV6kkBKP-CCHrSV-ucNVlxVMi_PYYQ7Rs2dacj1h
    IODWk3Bff5rUwhYloc>
X-ME-Received: 
 <xmr:S3beZczHgH3GnjGk8XyogAQRZLkWEaS_MAlAiLgXEj0CVKHTH-T3xZis-fAEBvRapcNqKEeEjF9_-JlmXYDDaqRm3YetmRGSpA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvledrgeeigdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
    hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
    hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
    tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:S3beZQPGSYBiuQoLT-IymQNjPgwmZDm6kU-Qfx-Ul71ubdGEpHrpfA>
    <xmx:S3beZZ_FV0gURLZZzOoe3-yESPbIgPM5vJl_EUtEBnDgVPI6dcCQxg>
    <xmx:S3beZQWbZjoInvmrWeHL3ZF2Ij4oowY4cQKoo9JG-3vW7vj7OqIlyQ>
    <xmx:S3beZbluRPIg1XJwK_8kavynnARDfo2K-9AvtbuoOGXWmlPl3tYQLQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Feb 2024 18:54:49 -0500 (EST)
Date: Wed, 28 Feb 2024 08:54:46 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Message-ID: <20240227235446.GA70770@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
 <17a48bbd-6b2c-4977-89f8-03f3385d3a56@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17a48bbd-6b2c-4977-89f8-03f3385d3a56@weiss.ch>
Message-ID-Hash: C6YBJTQXECJJR2T6S4Y3PF5IMSCFVVUT
X-Message-ID-Hash: C6YBJTQXECJJR2T6S4Y3PF5IMSCFVVUT
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6YBJTQXECJJR2T6S4Y3PF5IMSCFVVUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michele,

Thanks for your reply.

On Mon, Feb 26, 2024 at 05:06:12PM +0100, Michele Perrone wrote:
> You are correct about the available input and outputs, but I'm not sure that
> I understand your routing scheme very well.
> 
>  * The currently active digital input can be selected with "Digital
>    Input Capture Route", like this:
>      o AES/EBU: amixer -c 0 cset numid=3,iface=MIXER,name='Digital
>        Input Capture Route' 0
>      o S/PDIF RCA: amixer -c 0 cset numid=3,iface=MIXER,name='Digital
>        Input Capture Route' 1
>      o S/PDIF toslink: amixer -c 0 cset
>        numid=3,iface=MIXER,name='Digital Input Capture Route' 2
>        When playing sound from stream input, it doesn't make any
>        difference which one the above is currently selected.
>  * The clock can be selected independently from the current input with
>    AV/C [1].
>  * The 2-channel output can be routed to all the digital and analog
>    outputs simultaneously (but analog outputs are only available if the
>    DAC is connected).
>    One can choose which outputs are active or not with the "Output
>    Playback Switch":
>      o AES/EBU on: amixer -c 0 cset numid=6,iface=MIXER,name='XLR::XLR
>        Output Playback Switch' 1
>        AES/EBU off: amixer -c 0 cset numid=6,iface=MIXER,name='XLR::XLR
>        Output Playback Switch' 0
>      o S/PDIF RCA on: amixer -c 0 cset
>        numid=7,iface=MIXER,name='RCA::RCA Output Playback Switch' 1
>        S/PDIF RCA off: amixer -c 0 cset
>        numid=7,iface=MIXER,name='RCA::RCA Output Playback Switch' 0
>      o DAC on: amixer -c 0 cset numid=10,iface=MIXER,name='DAC::DAC
>        Output Playback Switch' 1
>        DAC off: amixer -c 0 cset numid=10,iface=MIXER,name='DAC::DAC
>        Output Playback Switch' 0
>  * There is no hardware mixer capability, i.e. the inputs cannot be
>    routed directly to the outputs.
> 
> Our preamp mode works like this:
> 
> 1. A digital input source is selected with AV/C (Toslink, or RCA, or
>    XLR), i.e. with "Digital Input Capture Route"
> 2. Clock input source is set to the same as audio input source with
>    AV/C [1]
> 3. DICE clock rate is set to external clock rate [2]
> 4. A simple 2-channel ALSA loopback with digital volume control is
>    created between input and output
> 
> I hope this answers your questions, otherwise please let me know.

Hm. I'm sorry but it is still unclear that the destination of audio
signal in the IEEE 1394 isochronous packet arrived at your device
(precisely the source port in the router function of TCAT DICE chip).
It is Playback PCM channel in ALSA word, and depicted as
'stream-input-1/2' in my diagram for my convenience.

```
spdif-opt-input-1/2  ---+
spdif-coax-input-1/2 --(or)--> digital-input-1/2 -----------------> stream-output-1/2
aesebu-xlr-input-1/2 ---+             |
                                      v
stream-input-1/2 --------------------(or)--+----------------------> spdif-coax-output-1/2
                                            +----------------------> aesebu-xlr-output-1/2
                                            +--analog-output-1/2 --> analog-xlr-output-1/2
                                                       +-----------> analog-coax-output-1/2
```

I assume that the actual source selection of 'digital-input-1/2' is done
in the router function of DICE chip as well as the selection between
'digital-input-1/2' and 'stream-input-1/2'. The mixer function of the
chip is not used as I expected, thus the selection should exist as the
source of audio signals for the outputs. However, in the above description,
I cannot find such selection.

Or the device has a fixed route between 'stream-input-1/2' and
'analog-{xlr,coax}-output-1/2'? The user can not hear the audio signal
of opt/coax/xlr digital input ports in the analog outputs?


Thanks

Takashi Sakamoto
