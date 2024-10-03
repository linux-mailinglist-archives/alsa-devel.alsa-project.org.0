Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F798EB85
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Oct 2024 10:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10810868;
	Thu,  3 Oct 2024 10:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10810868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727943877;
	bh=Ww5sEm1UZ8mj7K1bio4w12k7oSUV2QtudL0chVEX1GE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lciIOgjnyRlBhEjkbkE844QOtjYGvKzvVyYsrH0ZpIzv6kjLJ63k3FElpReDrHOBf
	 OuhrJ8i76Oj0kHFkAJWAiiHwvH/qYmGqqlxcWv77ICVje6YNXdu0e2ny2g28UWgDUj
	 YTALINj0L1dqm/zLCESve8m2FahUGyrg2lcGDhqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C211FF805B6; Thu,  3 Oct 2024 10:24:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB91F805A9;
	Thu,  3 Oct 2024 10:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 892BAF80517; Thu,  3 Oct 2024 10:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD6D8F800C9
	for <alsa-devel@alsa-project.org>; Thu,  3 Oct 2024 10:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6D8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mPlpIB/6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7DF40014;
	Thu,  3 Oct 2024 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727943828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=On2xGY5hMkwzoaaeU/lUt2EeaXWPfHOtxpzc3euMH4g=;
	b=mPlpIB/6/H9XXT8zHcMVr57dEbfDlPG0y/MDEb33FGrj2YbJ6Jm1l2fj+a1BMS1eNtYgYO
	0JS662KMHvs2jv3y04xLPcEoPVUQfbWl/ZrPJzfKhQ1e+ZUQR2Wpy1uZgq4uYWbMMIcEao
	URUhSrj+9+JzNZPhwhfuX6rGhUrhd1HNIEY1YaEjM+3ea4VnqFK80XEhbkx/4Jj9BgAjGo
	nFZ46KA2v5KRSk4G2gDnTFAALwXfzSp3NqSJwn6CTmQ4qDm1ol5R8KlilvopdLKuDHrHDW
	/O64VocxDJCbkhT1ZE2zQQrd091r16phQpz5e0fpnDI0iyWvQIzhDCx4R+gDbA==
Date: Thu, 3 Oct 2024 10:23:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-ID: <20241003102347.0f95e48d@xps-13>
In-Reply-To: <a67e031b-5685-48f2-b3b0-5181dd7371f2@gmail.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
	<a67e031b-5685-48f2-b3b0-5181dd7371f2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Message-ID-Hash: V3O6BQMPHQWYEEM6YV7DEIHDU3CH2TUV
X-Message-ID-Hash: V3O6BQMPHQWYEEM6YV7DEIHDU3CH2TUV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3O6BQMPHQWYEEM6YV7DEIHDU3CH2TUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi P=C3=A9ter,

peter.ujfalusi@gmail.com wrote on Wed, 2 Oct 2024 11:43:56 +0300:

> Hi,
>=20
> On 01/10/2024 23:47, Miquel Raynal wrote:
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
> > could be a thing. =20
>=20
> For interrupt these are the valid ones=C3=89
> - Common only
> - TX and RX
> - TX only
> - RX only

Thanks for the input!

AFAIU, Rx only is currently not a valid description. As you are
providing a description list with minItems =3D <1>, I think it expects
either the first item or nothing. When I change the example in the yaml
to only give the "rx" interrupt, make dt_binding_check errors out.

I will propose an update.

Thanks,
Miqu=C3=A8l
