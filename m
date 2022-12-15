Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6764DCA4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 15:00:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8EA3231F;
	Thu, 15 Dec 2022 14:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8EA3231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671112834;
	bh=K86z9NSdw9/aS+azOytPKWndevq09xmbrfk7caSxPgs=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iFi4VTlNekK16SJM4EK27hgvV6SWuEJRcIXBYDw9NynycaEw/15R773ZAfWYWFSeJ
	 hv+VPwaQAJkwaerwkOcZWMjEmG4Cgogy1o7H+te2R1vv23qrpNdWFtqDIBJ9Kn6/uU
	 WLK/3UQddaJIxsGs9cbDZhKRF3tSZTATX+b3nASA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A887CF80141;
	Thu, 15 Dec 2022 14:59:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E347F804F3; Thu, 15 Dec 2022 14:59:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE86F80141
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 14:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE86F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=Qt4vQqpn
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 88D6C852E7;
 Thu, 15 Dec 2022 14:59:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671112779;
 bh=OyQTOu0hLalNreLx4H+Zadv07p3wZv6k2h97kl/KLO4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qt4vQqpntYxeVDXKNIB2ajJBvtvJSm3gk0Q2C/PGGRPFtk8QOnrP7gs3IIs1Xofzh
 f7BXcEX//bOpBmbHk2o7yyqZyxi8roQSw2HJJyrU4BxSxMzz/lqgE5RwRkTb4olj4O
 FVBSWMgtEOhcCPndLpWpaeOfuEL5mo/drfWmffQIMvh2REpLn0uEE09atAep+eq87U
 MVKGvZF2EMNRaUKvZZPgjogcHm5V/KL3xeABKdCrzt/aOt0RvW3T0AvPsXZ3FSUyNM
 hG4bQdstASdPWGFJZOKcm60zr7FktmjEp1cRS747TL4zP1AnP77hOyONpIfyd0SFi0
 Tj4Qk5H5pZwYg==
Date: Thu, 15 Dec 2022 14:59:33 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: wm8940: Remove warning when no plat data
 present
Message-ID: <20221215145933.285f8386@wsk>
In-Reply-To: <Y5sAKNV4p4G5VVtP@sirena.org.uk>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221215093615.3794156-1-lukma@denx.de>
 <Y5sAKNV4p4G5VVtP@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S962smDBHA8uwC/.ZbsyNUs";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--Sig_/S962smDBHA8uwC/.ZbsyNUs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Thu, Dec 15, 2022 at 10:36:13AM +0100, Lukasz Majewski wrote:
> > The lack of platform data in the contemporary Linux
> > shall not be the reason to display warnings to the
> > kernel logs. =20
>=20
> Please don't send new patches in reply to old patches or serieses,
> this makes it harder for both people and tools to understand what is
> going on - it can bury things in mailboxes and make it difficult to
> keep track of what current patches are, both for the new patches and
> the old ones.

Ok. I will not use --in-reply-to.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/S962smDBHA8uwC/.ZbsyNUs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmObKEUACgkQAR8vZIA0
zr0fkgf+J3u56i2V715qK2QUByAbzlJn7JJSfXBN8Ri7dAeNvEc97P/MlcGmoUdD
CwRRENNSu1k9WQtcP9Yktcjv20WIZNssLd2/e7h65GKgiRVKxn1sS/OaMLpHtTgt
C5ZVXV7YASwExayzr8iYsTmM+vn1q/M8JMEHowh6dFg33pPyb9EPGRHcMnHMlhck
GrgCVXPmW7NQrUsYAiIzT7zeSNfT8sSYwcUsS74jnWwW8LJbKtoCK9/ma7dkFWXI
Y51wINr8Xo4UtKFcjNcM8K9nAg+/SnQsa891tkV4xy3fPfEjsJb7V6V6FU9d89N5
sOa8A9x6fbytB6eMP4o37xf54Kl/hw==
=kPNc
-----END PGP SIGNATURE-----

--Sig_/S962smDBHA8uwC/.ZbsyNUs--
