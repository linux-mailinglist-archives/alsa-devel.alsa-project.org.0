Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C19839767
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 19:15:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9918F857;
	Tue, 23 Jan 2024 19:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9918F857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706033726;
	bh=EuIdbsvyEjvt0FMH5fVVnAJqZpjgSM2y3FKdaFbL4eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FBjdMCzHIYVyW83+O3TjYwAJj5+eKQclPcdbaldH/Djmxcj+95UNx4G9tyUMBqCKB
	 BVUTxYjR9k4IruMIKDApxUE6CTb1yUpJ7SVm+u5z1Uc7zvBZa5VzHVqA0eih5Vwgtm
	 4BRm/qQLFgy5FDHB7cM3b8g+P/0P8M7Ya8uKhCvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BA5CF8057C; Tue, 23 Jan 2024 19:14:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABDCF80520;
	Tue, 23 Jan 2024 19:14:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B5BF8028D; Tue, 23 Jan 2024 19:14:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A542AF80149
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 19:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A542AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GGDf1I/o
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C886CE2F56;
	Tue, 23 Jan 2024 18:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD28C433F1;
	Tue, 23 Jan 2024 18:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706033674;
	bh=EuIdbsvyEjvt0FMH5fVVnAJqZpjgSM2y3FKdaFbL4eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGDf1I/ooVgFDkKnpcEkeZTIqA7DLN+pnUkt16nkDbTdlQnj6yJ4tte6Q0I8CmfVi
	 0e13HumBvMjQd55zhSg9OQe4CxjCHmlk0Z0vfRdDPbFnsRmZyt9q5Ua2gWhkqyCN7R
	 HXTSLTdL59YZYtO2nd8vE800NFCqcWgO1LoaI94qTghaz7Xc6nZ0VbwogfzZQIuECA
	 qOk93/Ssr2B0cy0sLuowCyGqx33TIEXwCE3osB86jdrlFU/NvA3O7r8lcU039fFM+X
	 ztQ86cwGgqqO9SDSVvG9pWPxLmefgAO5NEM1hH1HmS5wz/fR3OmD1SE77BguyaVF3f
	 Vj7lbg7VgKSgA==
Date: Tue, 23 Jan 2024 18:14:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/1] Add support for the framer codec
Message-ID: <8519e1ab-42a7-4b66-86d3-d574c7e8a1e4@sirena.org.uk>
References: <20240123165615.250303-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pEFwQk1O5c+w1uU8"
Content-Disposition: inline
In-Reply-To: <20240123165615.250303-1-herve.codina@bootlin.com>
X-Cookie: Stay together, drag each other down.
Message-ID-Hash: 5JSHKMFP2NPDENSPLBXAGKXGJKZABOCT
X-Message-ID-Hash: 5JSHKMFP2NPDENSPLBXAGKXGJKZABOCT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JSHKMFP2NPDENSPLBXAGKXGJKZABOCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pEFwQk1O5c+w1uU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 05:56:12PM +0100, Herve Codina wrote:
> Hi,
>=20
> This patch introduces the framer codec support.
>=20
> The patch was previously sent as part of a full feature series and
> was previously reviewed in that context:
> "Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--pEFwQk1O5c+w1uU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWwAgQACgkQJNaLcl1U
h9CACQf+JSXLP8HEJFIVGaxMScSSutupMb8WfEunNGnepzwDj+HenCzzhKZh/4Uq
+Mi9UeXPFHPiGjclTRv17bp1ZO+/uPgcEWkEF5B3qISDUZf0HgvkMOA77R4hZ4HE
UIvZqWuaZz75MzGk+QZ2E5x92ut3YcP2nOACLCfQei2Xghaw0959ogv/zoSaM+NI
WJjnlCmMpw9Hhn9j6NPPQFyhUwp2geB7GnyRIf/H0UteMgqEznrpCe8DJUD456dQ
X7Zec6smOENJ+qqNgLJlzkcc+6xCdJICN9UXX0hBGyGf5vsuffTBbO20nOfqyudb
7gHrsPr0UkKzechmj5rjBXehP3td0A==
=Cr36
-----END PGP SIGNATURE-----

--pEFwQk1O5c+w1uU8--
