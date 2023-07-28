Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40969766DEA
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 15:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD60827;
	Fri, 28 Jul 2023 15:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD60827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690550071;
	bh=okov4bn0e+e7NVtVp6ykizZqgLz71XkFxjjZrZyDd1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rYVktrOmp2i/nZd0TdGNsyBNq2CVKbYuVQ0LGbRBzVFi++tFQcO58Z9ktZG4apLa4
	 vLVCmNbod3R/QAJ5XkDP+EdS58imr3g5fO94BZa9YKbJGb+dtNvWGMBbtuigk6NRxT
	 XuyF3COT81e4dcRg4ptse4mMamFcOYVKdjemsyNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FDDCF800C7; Fri, 28 Jul 2023 15:13:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB746F80163;
	Fri, 28 Jul 2023 15:13:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8379F8019B; Fri, 28 Jul 2023 15:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6A9BF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 15:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6A9BF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=YBRasAVW;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=sYNw8/vZ
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A5155C0181;
	Fri, 28 Jul 2023 09:13:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 28 Jul 2023 09:13:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1690549993; x=1690636393; bh=ZToFlheVlRcgWlBoH2hLUJMku
	MkpsEscckf149EpPOI=; b=YBRasAVW8ZvbobnrkoEDHC10/nfYiF5bNa2aK+dCz
	W/YWoTVj2gbwcXtjT0r/aLsiK75tOQ/dHONhQualKTlo1B/nV4Y722yCQmx1JdT7
	prqzPkZwno/pjdLcNMA23AcitiDUcpqZaMTtqJl5f05TBHivcqPWT3p2B50JI1Eq
	HPIrAI/2ZzHjPKsE8AMZNDHum0oK671hCAqllU7TsfWy3FJpd0Ucbd/HyNb6nFMb
	625W24QNiJDMVK6zQFE6iTyIi6oAC6AOypInbrmmwy8ZQz61V7GqqL+ULIRgG0IX
	egYYyLLDjmFg7tjWMrvmRfwO1xm8nFe3vJU32AUtrBBOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1690549993; x=1690636393; bh=ZToFlheVlRcgWlBoH2hLUJMkuMkpsEscckf
	149EpPOI=; b=sYNw8/vZndAKqqR4gVzpr/xCbpLe89Wzd1vJJPAdgBaLYKTkmvB
	Aowsi/mY+WE7jwgHuO7ynTNXO51OOXnK57SnMKhSuSaB2dY0hxQT6ieqSBDbqhDp
	A6czbsnDmUVGRQPD+Ic7vaT8R4SBspuI5Q1QH2SKYYeNNEQKyzmTOi59VLm0UNh/
	5RgbPLrmz5wiTfT/WL/gUon+4iw23whMYmgRsNIQsVN2/XR6kOrDvi1Xe9Sh0Lxx
	h9lp7BN4HrclB+P/u6kyRqTBmLMn1xG89Zm4RAdoK6k2Ph7ANNhBYIEOJrFjd3wk
	yTO3CuTqkwYCMNQ9Kk67CJfXfVV3o/1V98A==
X-ME-Sender: <xms:6L7DZAU_AavQ4spAOGx-2GN4OSxRgZoagKxEB4RkLLsiDad6bWUOBg>
    <xme:6L7DZElvuKQv7feVF-poVakdhcI-eBqZTf5bJVAgR6o176xc3mLetUOk9ksC-5IMj
    QDcjeXN5vcPZPBW1S4>
X-ME-Received: 
 <xmr:6L7DZEZQL7Ptba4zaEpd9k_qBv3SdKd29K0vNDPGaKIEr-8QOnmC_3UFg8Q1XcZTvvgz9voK3zH0uEBLvL1t89ZB0_t-rP148oU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrieeigdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepffdvudejvdevgfetheduueelhfelteejgfeujefg
    vdejgfeiheetuedttddvjefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:6b7DZPV9r8bSHwHeZ-4kzzb6DpbJ6fVd3PcS4lH_0VpfENHzBQ67uw>
    <xmx:6b7DZKmDAhSMRPDs-SRm_iD3MgOlZWDuSrFyF_QDwyA1JOVGwtpKSg>
    <xmx:6b7DZEeBDjb2bKqAxPUmX4pFF_qhtMSyPLI2yeZz8e-bXm60TzrH2Q>
    <xmx:6b7DZPz8UN_2t-yPqe6dnbXGICllF1T60fgmJ-R6NbI2JtmcyBoZdg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Jul 2023 09:13:11 -0400 (EDT)
Date: Fri, 28 Jul 2023 22:13:08 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
Message-ID: <20230728131308.GA142765@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
Message-ID-Hash: JWKQZL7BYZWHRIV4B3QSJI6SMPEBW7RY
X-Message-ID-Hash: JWKQZL7BYZWHRIV4B3QSJI6SMPEBW7RY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWKQZL7BYZWHRIV4B3QSJI6SMPEBW7RY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ei,

On Fri, Jul 28, 2023 at 11:16:11AM +0200, Michele Perrone wrote:
> Hard-coded stream format parameters are added for Weiss Engineering
> FireWire devices. When the device vendor and model match, the parameters
> are copied into the stream format cache. This allows for setting all
> supported sampling rates up to 192kHz, and consequently adjusting the
> number of available I/O channels.
> 
> Signed-off-by: Rolf Anderegg <rolf.anderegg@weiss.ch>
> Signed-off-by: Michele Perrone <michele.perrone@weiss.ch>
> ---
>  sound/firewire/dice/Makefile     |   2 +-
>  sound/firewire/dice/dice-weiss.c | 120 +++++++++++++++++++++++++++++++
>  sound/firewire/dice/dice.c       |  72 +++++++++++++++++++
>  3 files changed, 193 insertions(+), 1 deletion(-)
>  create mode 100644 sound/firewire/dice/dice-weiss.c

Thanks for the patch. I've been waiting so long for such patches to
support Weiss models. I welcome them.

As long as reviewing, I found some format and technical issues on the
patches:

Format issues:
1.unexpected line break
2.tab indentations are replaced with spaces

Technical issues:
3.build error due to missing snd_dice_detect_weiss_formats()
  * prototype of snd_dice_detect_weiss_formats() should be in dice.c
4. category_id in GUID
5.stream formats for INT202

I can correct 1st, 2nd, and 3rd issues. You can find the revised patch
in the top-most of my remote repository[1].

Let me confirm the 4th issue. TCAT defines 'category_id' field in GUID
value of devices. As long as I know, Weiss engineers uses 0x00 in the
field[2]. Is it still correct for the devices supported in the patch?

Next, let us discuss about INT202 stream formats.

+
+/* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire interface
*/
+static const struct dice_weiss_spec int202 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{0, 0, 0}, {0, 0, 0} },
+    .has_midi   = false
+};

(tx/rx should be device-oriented, tx = from device, rx = to device,
please correct)

I assume all of the DICE devices transmit isochronous packets to deliver
presentation time stamp and events (= PCM frames). Then driver software
utilizes the presentation time stamp and the amount of events to construct
payload of isochronous packets into the device.

I program ALSA dice driver based on the assumption, thus ALSA dice driver
doesn't work well without receiving any isochronous packet from the
device. However, the stream formats for INT202 device looks to support
uni-directional operation. Weiss engineers really use DICE chipset like
that? If so, I need to integrate the driver to support the case.


As another topic. I make collection of configuration ROMs[3] to make better
support for the devices in Linux system[4]. I'm pleased if you pick them
up from your devices and dedicate them for the collection.

[1] https://github.com/takaswie/sound/tree/topic/dice/weiss-support
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/firewire/dice/dice.c?h=v6.4#n59
[3] https://github.com/takaswie/am-config-roms/
[4] https://github.com/systemd/systemd/blob/main/hwdb.d/80-ieee1394-unit-function.hwdb


Thanks

Takashi Sakamoto
