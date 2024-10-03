Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D7798EB8B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 10:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE586851;
	Thu,  3 Oct 2024 10:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE586851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727943992;
	bh=AB0d6NMTstiPZWMsI7UYFkElIv/mKCBJDfRxlrRJXss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P9+J0LtdeugWW6rHEh6FYxe/1G2JSZAI64w5DPZ2SdZgCLrEYNi+279yditqbbKXs
	 otgyj4DkxnyuxOj8C0kAQwHzFmfyT9+h1Btd+NKKWXX/CSLPJdM6Q6ya87A0/fKSeo
	 tyhsvtKQwON3flpPWodlBtnYeLPmnGe/bYI3XO+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA4F3F805A8; Thu,  3 Oct 2024 10:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9CA5F80508;
	Thu,  3 Oct 2024 10:26:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EEEDF80517; Thu,  3 Oct 2024 10:25:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81755F80107
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 10:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81755F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TvN35hyn
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50EE04002B;
	Thu,  3 Oct 2024 08:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727943953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JHm94FJKntrSnrQpV7BYaxzJnPo2EYUvXKt/hl2o4XQ=;
	b=TvN35hynDrxnwsidmg4QW5e+4TG31RtmdkucP/s2sx5pNZHfRvRGxfJWyQ1ecsJp6ezYKR
	v5RHc2uxy2LdSf3E+OR3a/MY8ccXkBMAwxTkDNb8uX+z5uCXilPQW/Dn6z8HfvaonU4kxg
	p3sbowLVtsbpO8V8FW9D56BVc2RgkcqMmuyVuxaBm8RDbsB7utrlKqpPMPPhUljjrgy+Wp
	u8AYGmgKgG1w7BsJcuUNIpajLZazAlCjGiEgS0rQRV7n/xb8nTM+ny7UNGrqf7dDRgIx+4
	06P7jD5H3s7zPY6D2OavGbH6o57KjCqGSGnBuSzc2xo0QbYqoZBoCbTmAMgPig==
Date: Thu, 3 Oct 2024 10:25:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary
 <j-choudhary@ti.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-ID: <20241003102552.2c11840e@xps-13>
In-Reply-To: <172789067103.163279.11797735685119883296.b4-ty@kernel.org>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
	<172789067103.163279.11797735685119883296.b4-ty@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: EZLQVNWAGQPKSNTXWUDDRVAE3XB7RYYH
X-Message-ID-Hash: EZLQVNWAGQPKSNTXWUDDRVAE3XB7RYYH
X-MailFrom: miquel.raynal@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZLQVNWAGQPKSNTXWUDDRVAE3XB7RYYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

broonie@kernel.org wrote on Wed, 02 Oct 2024 18:37:51 +0100:

> On Tue, 01 Oct 2024 22:47:49 +0200, Miquel Raynal wrote:
> > My understanding of the interrupts property is that it can either be:
> > 1/ - TX
> > 2/ - TX
> >    - RX
> > 3/ - Common/combined.
> >=20
> > There are very little chances that either:
> >    - TX
> >    - Common/combined
> > or even
> >    - TX
> >    - RX
> >    - Common/combined
> > could be a thing.
> >=20
> > [...] =20
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next

I didn't read your e-mail in time, there is apparently more to fix if
P=C3=A9ter is right, as the current binding still does not allow the "rx"
interrupt alone, while apparently it should. I prepared a second fix.

Thanks,
Miqu=C3=A8l
