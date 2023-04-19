Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD946E9046
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 236B6ECE;
	Thu, 20 Apr 2023 12:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 236B6ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681986810;
	bh=LzVwyrH1fnUDYxA2qvp8T1YEo/Qsswf2wH+BYssPEP8=;
	h=From:Subject:Date:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jGQHUdiov1ON036oxweki0UYJm/e8dDiEt9JAgyev/ULBiimD7rio1JLIoUiQnk91
	 srCq//MeBxM4XjHWYumPHlSW6MBHzm7jUp3SnzLcMAur32fgaEys/CshdMxcoblZgN
	 ZExV270s2H1m0NYgEfc59olYoxT7bpQSwWunhpZs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 505B7F80149;
	Thu, 20 Apr 2023 12:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7584F80155; Wed, 19 Apr 2023 10:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EC37F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 10:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EC37F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256
 header.s=fm3 header.b=q8szrX4P;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=TiCJm6rt
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 0B1CF5C009A;
	Wed, 19 Apr 2023 04:48:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 19 Apr 2023 04:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1681894132; x=1681980532; bh=BvBEm4WkjkPuPnu8E2KTiwt7Qfg5cR+kwBs
	6T1Qyed8=; b=q8szrX4Pj63FjUJqj9HciHg7ACXPzSnCqroQs0rsalpiX+c4PQF
	uPf7d2jPJfI2KJWhqA537kno0WYp5ep0DvobvIpqct+eyEJDVOWqUWfDzcjLBYh6
	X9D5S00kC6dLJSdKFvcaKPij9aELXRifMOzT/wgNQcKauC5gTLprkTu3x6F3bLPg
	TIbV0FhLb4y60A/G8GZuJwcsialQZvEEzxKBAMnUl69R0ZYSp4lPT5VCyO8gzZSi
	CH0srTeOZYlDXIC3K1C+Wn//5Ut2uBx28OA+VnYpAIxWEODpL3YMQhH92BUBr3s9
	LbiLdACe2osQZv2KCpRVRay/6Fxe2jbQ7bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681894132; x=1681980532; bh=BvBEm4WkjkPuPnu8E2KTiwt7Qfg5cR+kwBs
	6T1Qyed8=; b=TiCJm6rtXwtNktMdvtOASpY09t2R0QyconT6kQwB57OJo6wUsVu
	mPBPH45HmoBkwcehh70r7BCF17qr904m4aZVsKbK3UrpKkMd1la3joYxpnvQGhOe
	EOEFiN7zhtXs5ohbgS97fqfaK8MHMbImh8ZQb89LPie3h14fXVl5wrjSvXQmk4vS
	5aUKJDwmRscWrr5e3y9Pz2uKZRglgAEfubdAgfS3kzvCdjOUervvPWJ6yNpiohwh
	CgAoTURXgqR5jY+PpGRKdOLGntJ9QKnib5CHdCm26HWEsV1w015f4Gga57F0haBq
	z99VpHUdGT+k87M7gHvkdCoN89ubm69J5Fg==
X-ME-Sender: <xms:86o_ZCK2xcUynXWmKBTCGKCytx2M9P_HjSxi8kW-joJVkFRUC_9cDg>
    <xme:86o_ZKI0H4I2MhxNzqRXsimEGwDNwXpDPs9v-HQNIcPr2TFzE_GZGDyJ0E1OI_xU9
    CuMqhf6mwq4IXJUig>
X-ME-Received: 
 <xmr:86o_ZCtNS2mOXNDxl3ZrnNmEBn20gkFKrYgavcV4K5YQEn_qoMwObWqukgNFolcLP3FxPA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfedttddgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpegtgffhggfufffkfhevjgfvofesth
    hqmhdthhdtjeenucfhrhhomhepofgrrhhthihnucevohiguceotghogiihsehfrghsthhm
    rghilhdrtghomheqnecuggftrfgrthhtvghrnhephffhveeujeefgfettdevfeffgfeuvd
    ekhfdvhfelkedtudeihefghefhuefhgfehnecuffhomhgrihhnpehsohhunhgujedrtgho
    mhdpghhithhhuhgsrdgtohhmpdhlihhnuhigrghuughiohdrohhrghdpghhithhlrggsrd
    gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    tghogiihsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:86o_ZHbp6y623-5XQ5SRN42KhE9LYYHA2mc7x2YZbrvtqw_WihBzng>
    <xmx:86o_ZJYvPre2ysvmcHXoHuzoxFkkziilk7Y2LcTKku-WA-rW_bbFtg>
    <xmx:86o_ZDCjaVeHEoo3bPsgc_ZXbltb6-U8vkuAu8nhaMCyrfa58JdedA>
    <xmx:9Ko_ZIxtzrWj-L1QOfUtX9YLYgpQN1ZhsrBA4xAzjnjvSAUMwRHkLg>
Feedback-ID: i475842f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Apr 2023 04:48:51 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Martyn Cox <coxy@fastmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [LAD] snd-firewire-ctl-services 0.1.0 released
Date: Wed, 19 Apr 2023 09:48:40 +0100
Message-Id: <6C7704D9-2D47-480A-A0B4-225F30DD3662@fastmail.com>
References: <20230419084401.GA659018@workstation>
In-Reply-To: <20230419084401.GA659018@workstation>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
X-Mailer: iPhone Mail (20B101)
X-MailFrom: coxy@fastmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MORCFRSYVV5KGO5SJOG2VQMUEABRXWRT
X-Message-ID-Hash: MORCFRSYVV5KGO5SJOG2VQMUEABRXWRT
X-Mailman-Approved-At: Thu, 20 Apr 2023 10:32:35 +0000
CC: linux-audio-dev@lists.linuxaudio.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MORCFRSYVV5KGO5SJOG2VQMUEABRXWRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is great. Thank you Takashi.

M
-
https://sound7.com

> On 19 Apr 2023, at 09:44, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote=
:
>=20
> =EF=BB=BFHi all,
>=20
> This is a short announcement about a new release of
> snd-firewire-ctl-services project.
>=20
> After development for mostly three years[1], version 0.1.0 is released
> today. If you have FireWire audio device and interests in ALSA support,
> the release would be worth to check out.
>=20
> * https://github.com/alsa-project/snd-firewire-ctl-services/releases/tag/s=
nd-firewire-ctl-services%2Fv0.1.0
>=20
> The project provides user space service programs to operate digital
> signal processing function in devices supported by ALSA firewire stack.
> If using such device, you can configure DSP functions such as the volumes
> of device. For some device, effects such as dynamics and equalizers are
> also configurable. Available devices are listed in README.rst of the
> project.
>=20
> The service programs work as 'message broaker'. ALSA control applications
> are available for end-user interface to communicate to the service
> programs[2]. The device connected to IEEE 1394 bus is the peer. The
> service programs receives messages from both ends, then translates and
> convert the messages to send to the opposite end.
>=20
> Against your expectation, the project provides neither GUI programs nor
> end-user interfaces. I know that the user experience is heavily on
> look-and-feel on the GUI programs, while it is out of the aim of project.
> I daily use quashctl in QasTools[3] and it is pretty good to me for such
> ALSA control application.
>=20
> If encountering any issue, please file it to github repository[4]. README
> should be helpful to new users.
>=20
> Thanks for your support and long patience to ALSA firewire stack.
>=20
> [1] https://lists.linuxaudio.org/hyperkitty/list/linux-audio-dev@lists.lin=
uxaudio.org/thread/EX4FJ7IIRYM5EDRCYXFXFSABAKYZH3WZ/
> [2] For TASCAM FireWire series, ALSA sequencer application is such end as
>    well to operate control surface.
> [3] https://gitlab.com/sebholt/qastools
> [4] https://github.com/alsa-project/snd-firewire-ctl-services
>=20
>=20
> Regards
>=20
> Takashi Sakamoto
> _______________________________________________
> Linux-audio-dev mailing list -- linux-audio-dev@lists.linuxaudio.org
> To unsubscribe send an email to linux-audio-dev-leave@lists.linuxaudio.org=


