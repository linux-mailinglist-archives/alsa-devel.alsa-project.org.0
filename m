Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B3747A4F
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 01:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E841210;
	Wed,  5 Jul 2023 01:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E841210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688512764;
	bh=hQsjQzYTf6onI5Se5FktyD4OeriP0PTfEu50epn5iqk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dn2svPyXV+9UbU6Ik6BgTLgudSlFV0bgbDGx0zYu1DyY+Bi/RPHW8YGKt8VzCqpBU
	 T2X5w8bu94dgMScly85K25HEJybMC30nZfTyzM8r8sTbFzCYjrrZMa82jUpoMnUtqW
	 Jj6t2xhvKxy4nD2s4LAUWrl4KmIthCW5LIhwKqX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00ECDF80153; Wed,  5 Jul 2023 01:18:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF33F80124;
	Wed,  5 Jul 2023 01:18:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C673EF80125; Wed,  5 Jul 2023 01:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F11EF800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 01:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F11EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=g2A2FTbS;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eRk5Asmq
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7FA383200974;
	Tue,  4 Jul 2023 19:18:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 04 Jul 2023 19:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1688512694; x=1688599094; bh=hQsjQzYTf6onI5Se5FktyD4OeriP0PTfEu5
	0epn5iqk=; b=g2A2FTbSt1sss1dV5/n6uvwD8oGUVN4ZucR/eMH4PI19fA9SP5R
	oZWEHn6X/+0KJog11X3WYn1RkWkyVnQndGq1fvPSaL7EHJisIJNvltxzJAEZ8o8P
	MveHIYKxAASyl+GrDH6QW0EKaeVUN+k6IxotFyfHOPdil+z5PS7HZab/lWE4xTFW
	qDHtfw1rjgRb6NBrWNBNNm7XfYxQU4VLHCiPBtOdSnvHosm/QBlGsta3P5XnQwZF
	om2o4FVD1ty2x4AL7RWXPJ3Z29XJQssa11bLz4iYFXQB7ChalDmztttiQAd10xmb
	CPOqSv/jQubocoFlxeJn2HKlwzMXLvRnCLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1688512694; x=1688599094; bh=hQsjQzYTf6onI5Se5FktyD4OeriP0PTfEu5
	0epn5iqk=; b=eRk5Asmqe4Q9qJPtd579Z2PmJ6OCiza104EGMLSp/8f0xqfem9Q
	UMMMd6GTXPwedQeZ/lX5ktLBF4Mmrz4GWz/VUf6C4JSeYj4onO+FJHAyh28YVZ6K
	iCSYeOyXv+6SgSPSm/Zyf1YzKvpE7QZsv+HxH36PunldHr9UUs4PpfpojKBOQ26k
	1XJz3Osj5/qvvbdjMVpn5hU4tkmU1nfmhAo1cFFyti5vpkTfd7ntvZwDya09+H6w
	6T+A1lNPRpm5sQV+CWgVFqQLDRSHqTIfbF7Gj2qDhiPt2FB/0kyx00isxEOdXTO1
	0gkl3u8jyu2cK6jDwbcmPbb0y9dEziWNOMA==
X-ME-Sender: <xms:tKikZEEBJ0ybAfMS7kkAUZuw18e7odZMYrb3Jqw_ChCEXOnQKqNXNQ>
    <xme:tKikZNUKnkXNA49bQk_mVJ6vPcS_DCVSs-xqI6_Mt1iMhI-aoCcuva36AM7xVc2zN
    8oXfSPJYXv8kN_XU24>
X-ME-Received: 
 <xmr:tKikZOJSwkti3xrJKFSxBDXYNHQg0OPahYBqFGHb07tyAJb3RM3qWfCewAng_SHHXGexKA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudehgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepnfhukhgv
    ucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnh
    epkeefffeujeevueejueegleelhedtgedvledukedttdffhfeifeelvdduheefjeeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvse
    hljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:tKikZGHCb4EhcgViQaGtflbhDKpveg3Hg7n5j0LL7o0BykVzoLpQAA>
    <xmx:tKikZKWt6BDsVFNxCPVkfRPai-_sN2Ij1cX_RopiUbTjRvI6nSGNNw>
    <xmx:tKikZJPJFuo7c5fkkuW4xs9MgTwD-BJbnrpM-ZheN0Smsmp0tI1SJw>
    <xmx:tqikZBNnjlLOS58R-mFj4BcK7R7CvMKODTLwTilu8cbu3ejT3YuxlA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 19:18:07 -0400 (EDT)
Message-ID: <ee2e1c4bfc888f4f3285ba0f94a48a5f8f1eca8b.camel@ljones.dev>
Subject: Re: [PATCH v2 0/5] ALSA: hda/realtek: add extra ROOG laptop quirks
From: Luke Jones <luke@ljones.dev>
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, sbinding@opensource.cirrus.com,
 andy.chi@canonical.com, tcrawford@system76.com, tangmeng@uniontech.com,
 p.jungkamp@gmx.net, kasper93@gmail.com, ruinairas1992@gmail.com,
 yangyuchi66@gmail.com, yangyingliang@huawei.com,
 linux-kernel@vger.kernel.org,  alsa-devel@alsa-project.org
Date: Wed, 05 Jul 2023 11:18:02 +1200
In-Reply-To: <878rbw41ln.wl-tiwai@suse.de>
References: <20230704044619.19343-1-luke@ljones.dev>
	 <878rbw41ln.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (by Flathub.org) 
MIME-Version: 1.0
Message-ID-Hash: RVBROAAWYKIRNN5BBUBW2CASLL2I5UFO
X-Message-ID-Hash: RVBROAAWYKIRNN5BBUBW2CASLL2I5UFO
X-MailFrom: luke@ljones.dev
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVBROAAWYKIRNN5BBUBW2CASLL2I5UFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 2023-07-04 at 08:44 +0200, Takashi Iwai wrote:
> On Tue, 04 Jul 2023 06:46:14 +0200,
> Luke D. Jones wrote:
> >=20
> > - Adds quirks for various ASUS ROG laptops.
> > - Fixes up a previous quirk
> > - Fixes up a whitespace error
> >=20
> > This introduces a quirk chain that is similar to the ROG Ally quirk
> > chain, but
> > due to the verb configs being currently tested these new quirks do
> > not use it
> > and instead add a new chain. It is likely the Ally quirk will be
> > removed in
> > favour of this new chain in future.
> >=20
> > Luke D. Jones (5):
> > =C2=A0 ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
> > =C2=A0 ALSA: hda/realtek: Add quirk for ASUS ROG GA402X
> > =C2=A0 ALSA: hda/realtek: Amend G634 quirk to enable rear speakers
> > =C2=A0 ALSA: hda/realtek: Add quirk for ASUS ROG G614Jx
> > =C2=A0 Fixes: 31278997add6 (ALSA: hda/realtek - Add headset quirk for
> > Dell
> > =C2=A0=C2=A0=C2=A0 DT)
>=20
> Now applied all patches.=C2=A0 The subject line of the last patch was
> modified to match with the standard.=C2=A0 The Fixes tag was moved to the
> right place, too.

Thanks mate. I looked at the patch guidelines for that but I must have
misunderstood it :)
