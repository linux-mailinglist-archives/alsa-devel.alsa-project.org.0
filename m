Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F697A339D
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Sep 2023 04:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DCE4206;
	Sun, 17 Sep 2023 04:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DCE4206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694919422;
	bh=2Jx1xRm6H8Dkwcc1aQm4b5g2l2J6bcGp2bphSTxQ1Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U0bqqyUVGrVbWg/HEr8kqU5BVGLp6SNUK3+NbGmDeskP/DjeUToU8GWqMlBRKEj+1
	 qAO4ws1pnJQvrfx+BzcuWQ1NBN3nnR6M0rLrJ0El7EITG32t7yFtXHFRIlykdIhxRT
	 1+ofYQCK/UDqDNOrBmcOhL09XPysxVltSUK8D/Do=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABF00F80494; Sun, 17 Sep 2023 04:56:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B28FF801D5;
	Sun, 17 Sep 2023 04:56:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78EFAF801F5; Sun, 17 Sep 2023 04:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28337F800F4
	for <alsa-devel@alsa-project.org>; Sun, 17 Sep 2023 04:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28337F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm2 header.b=EJ0cO6p5;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iTzL7vhD
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 4BCD33200645;
	Sat, 16 Sep 2023 22:55:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 16 Sep 2023 22:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1694919328; x=
	1695005728; bh=It8Z4S267dviJyjybONuiaVYyv9z5mrw7IW6uwIxOZY=; b=E
	J0cO6p5FCQEZUXx1G0p3/MChTGj7nMLTHLCsYef61rLNjRpIzL3BkX7KsCvqtdAL
	FIshZJyF1ZRHbs/ISJ9pUtv5cusakP23o3uHRVxmBu25gM8GI+Ywyndg25sYsOtm
	9R9pdQVemPucc7ZWGECL68JoOL7a0ROc3nlmzA2TUR3dnUolujxK58YDPBh2Yvm8
	qvovVaqX2j2lwgK6tmFU21fREB1b2hc4ZUxBRQ2MgCChQWeOm/nrDetFH9VqyiRL
	FyHCR85M60qYzNO7cXhOWtpdsTakeiYuLsKGD+GDjVnNVT/8MgvRng/GCgtQydfe
	v7WZXn1JD5XWtlG13Swmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694919328; x=1695005728; bh=It8Z4S267dviJ
	yjybONuiaVYyv9z5mrw7IW6uwIxOZY=; b=iTzL7vhDGLryH9qjlH/FljkytsgZk
	d3PcGJ5VqyKTON4dNOm/ZpNLURxCIh8QQkrRdPpBQI4jUGLizJPoH5iArNE+sNAT
	cSm0n1h2iZiJbadyUARlVYHtu8jLRShvkHlMHJ1lwRkzFxmwHz4xVG509iexSRlP
	vqBMswqW0hqK0Qdm1g/gZWeqg6mPNchWxiJZLErB0DYKfUp1j5pL1qqHSqV1uD47
	jJylYs64T/vOdEeiny6yHkqfc6oOFhDc/KoMoeM9WiEECcCgECBVNaCFGKOzHwCQ
	xl2lOGlecJXk2YhnjnSszWilOF56XDOzMK/glsfcoT+iLY0MpfmFeLORg==
X-ME-Sender: <xms:oGoGZd-G0U48GV0cgUFnMWBamO28rE4OtGBhYCrSEK4SK-cH_HrCaw>
    <xme:oGoGZRvj7M0L6uwctU9I3tK_ie_O83QIa8oJvPb0FdAWmDwdbOQEjUBkIjlwk8dtS
    XuuEbHMDCES7ks7GNI>
X-ME-Received: 
 <xmr:oGoGZbBMK0CBp7Eg5mv25GCcMEXXFZT5zJc0JlobVdkSvAeiC1wXrKtOpxhFjfoTdy75y_2tUW4EUVjYgqwIEXr_oLJKoXbJarA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudejhedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepgfeghfeiuddttdejtdehtdegudekffetledvtefh
    feduffeuveevhedtgefgffdvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgpdhffhgrughordhorhhgpdifvghishhsrdgthhenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrg
    hkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:oGoGZRczedDFjyaN5QPHMKd1AZzr8PQnZzQrjuNA_CIaApwUgbvEKQ>
    <xmx:oGoGZSMv-e4pQMe_YFYzrZumWSS0rub2F-unvqLYtOIuwqkqLRJXzw>
    <xmx:oGoGZTkgne8_AIdgxYCBInMgsXAASgwlatac5RAJMLQbPSt9fY0jfg>
    <xmx:oGoGZbbdP9xEVVtNb49WUNL0SjlXjYGsMmodqQWwEjL5RPDRqSxGSQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Sep 2023 22:55:26 -0400 (EDT)
Date: Sun, 17 Sep 2023 11:55:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>
Cc: Rolf Anderegg <rolf.anderegg@weiss.ch>, Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org
Subject: Re: INT203 and DAC1 (Re: [PATCH] ALSA: dice: add stream format
 parameters for Weiss devices)
Message-ID: <20230917025523.GA188984@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230905235441.GA24829@workstation.local>
 <a5b63c37-7f6f-46f3-a87f-e4e7c0c9b5c8@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b63c37-7f6f-46f3-a87f-e4e7c0c9b5c8@weiss.ch>
Message-ID-Hash: CK7ZO34S462S7JL2O6R3UETT7ZHCG4Q2
X-Message-ID-Hash: CK7ZO34S462S7JL2O6R3UETT7ZHCG4Q2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CK7ZO34S462S7JL2O6R3UETT7ZHCG4Q2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Michele,

On Sat, Sep 16, 2023 at 11:18:39AM +0200, Michele Perrone wrote:
> Hi Takashi,
> 
> sorry for our late reply.
> 
> 1. INT203
> 
> Yes, we can confirm that the latest INT203 firmware has the model ID 0x6,
> same like the INT202. Older INT203 firmware has the model ID 0xa.
> 
> At the snd-dice module level, there is obviously no difference, because
> the hardcoded capabilities (modes/rates) are the same.
> 
> The only drawback is that when connecting the INT202, users see two
> channels of input. But maybe this could be easily solved with an alsa
> card profile.
> 
> 2. DAC1
> 
> The DAC1 with model ID 0x5 that you found in the libffado configuration
> file is not same the DAC1 that you found on our website.
> That was an experimental device which included an embedded computing
> board, connected via FireWire to an internal DICE-based soundcard.
> This device was never released to the market, so I suggest discarding
> this entry.
> 
> On the other hand, the DAC1 from our website was indeed sold with a
> FireWire option. However, this is just and INT203 embedded inside the
> DAC1, with no special ROM. This means that when connecting the DAC1 via
> FireWire, it will present itself like an INT203.
> 
> I hope this answers all your question, otherwise let us know!
> 
> Kind regards,
> Michele Perrone

Thanks for your clarification! Now I figured out and post merge request
to systemd project.

* https://github.com/systemd/systemd/pull/29197


Thanks

Takashi Sakamoto

> On 06/09/23 01:54, Takashi Sakamoto wrote:
> > Hi Rolf and Michele,
> > 
> > I'm working to fulfill hardware database of systemd project[1] for Weiss models with received
> > collection of configuration ROM, then have some issues. I would ask you to provide information
> > to solve them.
> > 
> > This is the table of the value of model ID field and model name.
> > 
> >                  snd-dice    am-config-roms  systemd hwdb
> > DAC202          0x000007    0x000007        0x000007
> > DAC202(Maya)    0x000008    not yet         not yet
> > MAN301          0x00000b    0x00000b        not yet
> > INT202          0x000006    0x000006        0x000006
> > INT203          0x00000a    0x000006 (?)    not yet
> > ADC2            0x000001    0x000001        0x000001
> > DAC2/Minerva    0x000003    0x000003        0x000003
> > Vesta           0x000002    0x000002        0x000002
> > AFI1            0x000004    0x000004        0x000004
> > DAC1            not yet (?) not yet (?)     0x000005
> > 
> > I have two issues.
> > 
> > 1. INT203
> > 
> > The modalias table in ALSA dice driver[2] includes 0x00000a for the model, while the configuration
> > ROM includes 0x000006. Michele wrote commit comment for it[3]:
> > 
> > ```
> > Note: the INT203 presents itself as INT202, because the firmware
> >        running on the two devices is the same.
> >        The difference between the two lies in a jumper setting
> >        inside the device.
> > ```
> > 
> > In my opinion, there are multiple hardawre revisions for the model.
> > 
> > 2. DAC1
> > 
> > When committing to hardware database of systemd project[4], I referred to libffado2 configuration
> > file[5]. It includes `DAC1` with model ID 0x000005, while it is neither found in ALSA dice driver
> > nor the collection of configuration ROM. As long as searching DAC1 in website of Weiss Engineering,
> > I can see DAC1-mk3 has option card for IEEE 1394 connection[6]. Would I request you to provide
> > information about the model?
> > 
> > [1] `hwdb.d/80-ieee1394-unit-function.hwdb` in systemd project
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/firewire/dice/dice.c?id=4fb0dacb78c6a041bbd38ddd998df806af5c2c69#n395
> > [3] https://github.com/takaswie/am-config-roms/commit/e6717b3cbb4a
> > [4] https://github.com/systemd/systemd/commit/ff1cb7b9393ac
> > [5] http://subversion.ffado.org/browser/trunk/libffado/configuration
> > [6] https://weiss.ch/products/pro-audio/dac1-mk3/
> > 
> > 
> > Regards
> > 
> > Takashi Sakamoto
