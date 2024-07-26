Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6793D396
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 14:58:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE50BE8E;
	Fri, 26 Jul 2024 14:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE50BE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721998699;
	bh=yzOx6oM1nG1syyzmhuVhnMa728h4vx7kNlsuELDiy+4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LSe+f4+AThleCTzRc1/n2t+VIPquwWBvN/uuz9DSqDPTHbtNqIDK6mP3btDmFJ4Ci
	 6X5J6i/C/q+npah7wD5E2R+sKf7lxXCNvL+x0JzYr9dC78r2h9RAFBlWn/dM9EhJro
	 Z9jmyiWrh4++DrNQxRUEXNDECAmHvWbo05x7qhqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1588F805B5; Fri, 26 Jul 2024 14:57:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F21FF805B1;
	Fri, 26 Jul 2024 14:57:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF686F8026D; Fri, 26 Jul 2024 14:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MIME_HEADER_CTYPE_ONLY,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D07EF800AE
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 14:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D07EF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=YZdNMN0d
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A8D4D3C3;
	Fri, 26 Jul 2024 14:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101;
	t=1721998530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=yzOx6oM1nG1syyzmhuVhnMa728h4vx7kNlsuELDiy+4=;
	b=YZdNMN0dE0uA7FnFXFdQTZc+gmQ70zEsvC94v1Q86rzibdNqDnJL5nrE5j8IB/b+AFTBzz
	Dt4IzhB9GH0pF8coLguAkhMykHFlDxsb7IQC+qSUYMRZcp5e5A77Zwq5byUEB5RusCBMwr
	7nlQc4/EIUzYkfbtqzGPcbrGikt6KKZioI14gpIIONVciaCFyrxrt33p0iZf5x4gZyx7YU
	U9OhZkBEgbYpE+W5LeXEPVV77ZZltUaVXsCYdDgDQq2CdX7+I45vXmnPFxI0vBpvf2FPAa
	fZ6T9AmMoYOvGazPddd7C7Lge7dhToJFuw15hwDu68RIEENxFamVE+FGrITgFg==
Content-Type: multipart/signed;
 boundary=3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 26 Jul 2024 14:55:28 +0200
Message-Id: <D2ZHJ765LUGP.2KTA46P1BL75X@walle.cc>
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>, "Simek, Michal"
 <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "patches@opensource.cirrus.com"
 <patches@opensource.cirrus.com>, "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>, "Conor Dooley"
 <conor.dooley@microchip.com>, "beanhuo@micron.com" <beanhuo@micron.com>
From: "Michael Walle" <michael@walle.cc>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "sbinding@opensource.cirrus.com"
 <sbinding@opensource.cirrus.com>, "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
X-Mailer: aerc 0.16.0
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
 <BN7PR12MB28027E62D66460A374E3CFEADC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <e212f9fa-83c5-4b9e-8636-c8c6183096ab@linaro.org>
 <BN7PR12MB280237CDD7BB148479932874DC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <576d56ed-d24b-40f9-9ae4-a02c50eea2ab@linaro.org>
 <BN7PR12MB2802F288C6A6B1580CF07959DC95A@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c6f209c8-47da-4881-921d-683464b9ddd5@linaro.org>
 <9cdb7f8b-e64f-46f6-94cb-194a25a42ccd@linaro.org>
 <BN7PR12MB28028B63E69134094D50F3E4DC2A2@BN7PR12MB2802.namprd12.prod.outlook.com>
 <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
In-Reply-To: <
 <IA0PR12MB769944254171C39FF4171B52DCB42@IA0PR12MB7699.namprd12.prod.outlook.com>
Message-ID-Hash: RCGTRXKHXWWJ3SOBN7OEJ7LCZQPJXTCQ
X-Message-ID-Hash: RCGTRXKHXWWJ3SOBN7OEJ7LCZQPJXTCQ
X-MailFrom: michael@walle.cc
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCGTRXKHXWWJ3SOBN7OEJ7LCZQPJXTCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Based on the inputs/suggestions from Tudor, i am planning to add a new=20
> layer between the SPI-NOR and MTD layers to support stacked and parallel=
=20
> configurations. This new layer will be part of the spi-nor and located in=
=20
> mtd/spi-nor/

Will AMD submit to maintain this layer? What happens if the
maintainer will leave AMD? TBH, personally, I don't like to
maintain such a niche feature.
I'd really like to see some use cases and performance reports for
this, like actual boards (and no evaluation boards don't count). Why
wouldn't someone just use an octal flash?

And as already mentioned there is also mtdcat, which seems to
duplicate some features?

-michael

--3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqOcwREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+OcUAX9IjhR2BCZQ3HqidzuFStguMrN9iUIuss1D
/ACvRq7kf2Zbxhm0mck1AjUfrnZR1eABf0SfkJW5GxxyiY5HbWtKSnCVoTuXKQTM
LqmzqtPHKs+pr9bhbYutKEnQZiOlOyW93g==
=jfd2
-----END PGP SIGNATURE-----

--3ce0a5c807a2ece26c72ec8034eaad1072585a573fd66fa563151480afdc--
