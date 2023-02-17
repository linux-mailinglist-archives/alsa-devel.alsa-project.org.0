Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4369B3F1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 21:29:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D871CFA9;
	Fri, 17 Feb 2023 21:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D871CFA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676665740;
	bh=pF7kUkNkF9U6HlW278YWadT9FZhhPf2WabxKp1q56Jw=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n5/X27bLlN7USOr/VHFqgzdZet2+J/s437yPIUHd8agjWTzm7oUf/xJSAUI+PWKu3
	 webmXr6gkjv8VY5TS5l60zcLZ+3RCLVzFXnUxVbSM0ZcNBg6j6Pa7TcO3GC5rkpjep
	 96nErcWu6CtxJ0Zwu+zS8CdycqHC6ItMLdz2rNNE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B50FEF800E4;
	Fri, 17 Feb 2023 21:28:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEA0CF80171; Fri, 17 Feb 2023 21:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6881DF800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 21:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6881DF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qy+krOUJ
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 060A3240007;
	Fri, 17 Feb 2023 20:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676665678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvDZ7Ve+5FFvR/CqSfvy5MV7TZP0j51A/S+5V2+9/OI=;
	b=Qy+krOUJ44tvEiFjWe9YQkjR8tcp8Y98DemShkj0+2SlPQOzy5NE0xuVLPS61xJTSIdP/7
	iw6n/SwXTgLhW+RSZE3Tt6+2g1bnqECHxbwmXJ+ySh35qcuowJTP+LrvtUVWUNBZh/YVMt
	nf+0XG9cifw3v0NDHbgNuy5w8DycFBSOz5GuNu/ukZM7G86Wzz+0EX6XkzRQsJOnmWXCE4
	T/cT4XK2iP6mL4UzaOVGQ7ZN2TI3sANGJ1HlxGa9pSBiktAzZDmpw4MYkt5/7ef5vn6ehC
	6s5n98W01n0UVjigYqwCmFnQAnxpjis5ScbOK6w7dqwf6OParTyU9GbzWsHeRQ==
Date: Fri, 17 Feb 2023 21:27:54 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
Message-ID: <20230217212754.4fba0b78@bootlin.com>
In-Reply-To: <20230217211820.39fb47a7@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
	<87mt5dyxph.fsf@mpe.ellerman.id.au>
	<0606f44f-bdbb-055c-6fff-440007222ce3@csgroup.eu>
	<Y+/SStm9ifszrYA1@sirena.org.uk>
	<20230217211820.39fb47a7@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NAJBTUIZNVOED3BDO66UTVOHIUEAYPC6
X-Message-ID-Hash: NAJBTUIZNVOED3BDO66UTVOHIUEAYPC6
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Li Yang <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Nicholas Piggin <npiggin@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAJBTUIZNVOED3BDO66UTVOHIUEAYPC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Feb 2023 21:18:20 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> On Fri, 17 Feb 2023 19:15:22 +0000
> Mark Brown <broonie@kernel.org> wrote:
>=20
> > On Fri, Feb 17, 2023 at 06:32:03AM +0000, Christophe Leroy wrote:
> >=20
> > > Mark, is that ok for you or do you expect this series to go via soc t=
ree ?
> >=20
> > Sure, that sounds good to me.  I'll give it another check and
> > then assuming everything is fine apply for -rc1.
>=20
> Thanks a lot,
> Herv=C3=A9
>=20

And note that the v6 series is available.
  https://lore.kernel.org/linux-kernel/20230217145645.1768659-1-herve.codin=
a@bootlin.com/
with the v5 feedbacks from Krzysztof taken into account.

Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
