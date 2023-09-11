Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B636279A70D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 11:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086F284B;
	Mon, 11 Sep 2023 11:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086F284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694425964;
	bh=NUVvGNDfVneu7k6hv6c41eAwOlvV5uCmmQy/DE0ADxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rWuZrgDPhuwvVHgU5uBwY7PGSX9QLg9wWwr4Ai87LHjv2IVMgVkuqtEqAWY8zFY5p
	 hOy+Q+BFMwRFAGyGl9GKqtGX2rBEvIFys0Tx1XFlTUqPZOyKX8gmlZD3mSi+pG4enK
	 w6zUl8QjnsceD4ru+taOIPJZuxw9HJyuk0hJtdC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D534BF80537; Mon, 11 Sep 2023 11:51:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3A8F80246;
	Mon, 11 Sep 2023 11:51:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F6CDF80425; Mon, 11 Sep 2023 11:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_HELO_PASS,SPF_NEUTRAL
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB3FEF800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 11:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3FEF800AA
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 347ED1C0006; Mon, 11 Sep 2023 11:51:41 +0200 (CEST)
Date: Mon, 11 Sep 2023 11:51:40 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, perex@perex.cz, tiwai@suse.com,
	broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
	bradynorander@gmail.com, muralidhar.reddy@intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 5.10 4/9] ALSA: hda: intel-dsp-cfg: use common
 include for MeteorLake
Message-ID: <ZP7jLFodE0ndbQB3@duo.ucw.cz>
References: <20230908193611.3463821-1-sashal@kernel.org>
 <20230908193611.3463821-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="52UtXH6MR9bvNHUJ"
Content-Disposition: inline
In-Reply-To: <20230908193611.3463821-4-sashal@kernel.org>
Message-ID-Hash: 3UXJOUHGAKXAUR2E4IPAEOQ2GBI7WC46
X-Message-ID-Hash: 3UXJOUHGAKXAUR2E4IPAEOQ2GBI7WC46
X-MailFrom: pavel@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UXJOUHGAKXAUR2E4IPAEOQ2GBI7WC46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--52UtXH6MR9bvNHUJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> [ Upstream commit 73e6ebf6a21a62429282632eccb8aa4212489b3c ]
>=20
> This was not updated in Commit 0cd0a7c2c599 ("ALSA: intel-dsp-config: Con=
vert to PCI device IDs defines")
>

AFAICT, this is not queued to 6.1. What went wrong here?

BR,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--52UtXH6MR9bvNHUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZP7jLAAKCRAw5/Bqldv6
8p3LAJ0Y2mNhL7Pv9gNoBfHQQzAl2WdHVwCgnSksuS4IOjpz5h8cnmjbWsfB6E0=
=vvQu
-----END PGP SIGNATURE-----

--52UtXH6MR9bvNHUJ--
