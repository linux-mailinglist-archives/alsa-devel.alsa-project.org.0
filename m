Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AF69090B6
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 18:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34B8BC0;
	Fri, 14 Jun 2024 18:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34B8BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718383490;
	bh=OGecIESkxQlGPPHFvJKS/1V4WaNGOExMXfaeDU81YVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b5kCsvnzWQLy28dVvYlAw7elWMffJZL4wUHuaAsfdmsJ1npbnfIVI+Ucr4T/fkhGI
	 ZAvb24Kt8B9FmjTkLPHxAJ29TXKfgCQgqGyekBX3ZCM4BatRmieZ8oY6fDQjyUkvUo
	 r5gF+8VpQO66Ao+CvGGbBUl78ZVNBmnVVGo+Qe34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9B03F800ED; Fri, 14 Jun 2024 18:44:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 270DCF8058C;
	Fri, 14 Jun 2024 18:44:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78948F80448; Fri, 14 Jun 2024 18:44:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 932E8F800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932E8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hL+l8FUI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F429CE2BE4;
	Fri, 14 Jun 2024 16:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56300C2BD10;
	Fri, 14 Jun 2024 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718383428;
	bh=OGecIESkxQlGPPHFvJKS/1V4WaNGOExMXfaeDU81YVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hL+l8FUIXR9ASHQf9xeEPHt7CfdJYNX0X2a16Kb6dXovnPp+k2I7dQZVJz+bHAS+w
	 /Akw4bgdYCbPoCYPoxyXVhpR07QLakzGw+lOuLOCEcwc4m6XbzkVwX996ca3rr7kcm
	 ZekEHG9V5TCkNvXESp+C05L37+ynL56sBerph8iI/t5rhWxp+D44Fo5+P42u35Gl0K
	 7dhB+rmHkWPUfnZ28d9jgrO3szh5oJ5ZQY2ImBXkHINHxIt+m8b3G8wRkGcMlTbQL6
	 yUuCucQDUEkjvZjxu10iU71nkcLMlqu5oTEbzmsM1vD1k2Y6LXTCZz2aWqsZ/1SvcG
	 l+KTBfQzjR8yQ==
Date: Fri, 14 Jun 2024 17:43:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Chancel Liu <chancel.liu@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 0/4] Add audio support for LPC32XX CPUs
Message-ID: <ZmxzQLbzuEupDkiJ@finisterre.sirena.org.uk>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uEH+YoQX+igcbHZ"
Content-Disposition: inline
In-Reply-To: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: E6VS3EHY7UR34HVGLC2DJWG2CR4JPB4A
X-Message-ID-Hash: E6VS3EHY7UR34HVGLC2DJWG2CR4JPB4A
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6VS3EHY7UR34HVGLC2DJWG2CR4JPB4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4uEH+YoQX+igcbHZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 06:34:48PM +0200, Piotr Wojtaszczyk wrote:
> This pach set is to bring back audio to machines with a LPC32XX CPU.
> The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
> The support was dropped due to lack of interest from mainaeners.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--4uEH+YoQX+igcbHZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZscz8ACgkQJNaLcl1U
h9BWvgf/f+S9NLVWH8/lPOJWNtq9tQndYQy8OK5iMAQJm7mKL0A4ttTTMYMYnh9h
tL3EW+ywS15IBWgG89JDmI9AuB9nWQKgmQIqjVuGW+54g1EYmViI28IteOGUZnv4
xSF8N2Ak+ag00veuwAnYp3oMDUbtZ/VpEcoBj6Na+QDI5ok19cDT4Vqo0lWSMTn8
9liaCr84fAjnbULZLuudLqd4wrhxbBtaYwCQ+iH2tW/N4j04iuTdop7ogfilTi/0
ZsZOYX4xC1lJ1EbS7qpQSTsA5aDQQ7BwwzOE43HOhzTLoOcVVEl2a5dmZkSHNNDc
2R617vs7FjbtGTrFUOVMTAzD01F8lQ==
=TUpG
-----END PGP SIGNATURE-----

--4uEH+YoQX+igcbHZ--
