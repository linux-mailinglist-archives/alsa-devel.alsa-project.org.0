Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC310722607
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F77827;
	Mon,  5 Jun 2023 14:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F77827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685968630;
	bh=nZwzWRbUjtqgCZKGkZzJhbXU6JBV9oEBXx/wRWmja3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jCckQBLkIS+a/1Vw9JBZRqmp0FXFnL3sM51EpVo5/p0cYLN2zzOnlqCol55dGVRiG
	 2Ad0eoq7JG6XdMiNAXbgJRjFeIpu+4a85XzIMwaS+3Qe7VayhL2t7vwQbYlTSguAcg
	 OG2vNA04EWVOcazFweG3fkOfAJ/CZJrpnKPME3rA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34208F80549; Mon,  5 Jun 2023 14:36:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD7A8F80199;
	Mon,  5 Jun 2023 14:36:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D58CF80548; Mon,  5 Jun 2023 14:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53AC5F8016C
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53AC5F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M2vsIhX5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BA016237E;
	Mon,  5 Jun 2023 12:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E10AC433EF;
	Mon,  5 Jun 2023 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685968568;
	bh=nZwzWRbUjtqgCZKGkZzJhbXU6JBV9oEBXx/wRWmja3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2vsIhX5F81Ujo6EeaYCPq8RmI+7s8v4vdBWO/p5/mwrP4DbenDCN4n3UeFMzcWhF
	 x1qGuVv0lsCvA6r1piu+ptenxMe5Euprreh3W45XSRbyBKlYCubDHAICnabbsbRape
	 OpV84JRCeDNRXMexIdTPvsGntZ9Gojc7ieB9fkLiVBLYO7MHHefXNOsZaRIXq0fgdy
	 LzjUYQAQwHrG35BIcHB++YYkizXFA60TdLlGWxS7AMf70oVszdusxekMvI8dBoDwQM
	 9xaMDML4JT2cDSChL4IpI3FhQIQWYe3XBleFmliA6MgS4BqIDUvJ98yB+WprarhbPc
	 nC9VFMxIiOjPQ==
Date: Mon, 5 Jun 2023 13:36:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
Message-ID: <bfc2b94f-f030-4236-8370-143a8e4d0faf@sirena.org.uk>
References: <20230602124447.863476-1-arnd@kernel.org>
 <1108b836-38bf-4284-b3b9-82cb33509092@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UCIP91/GiG2xL0T0"
Content-Disposition: inline
In-Reply-To: <1108b836-38bf-4284-b3b9-82cb33509092@app.fastmail.com>
X-Cookie: Biggest security gap -- an open mouth.
Message-ID-Hash: L6K6R76LVBTYT764HLN2SI6DTK46AKBE
X-Message-ID-Hash: L6K6R76LVBTYT764HLN2SI6DTK46AKBE
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6K6R76LVBTYT764HLN2SI6DTK46AKBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--UCIP91/GiG2xL0T0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 10:58:25AM +0200, Arnd Bergmann wrote:

> Please disregard, this version was incomplete, and I ran into the
> same issue again in another randconfig build.

> v2 coming up, please use that instead.

I already applied this one before I saw your message...

--UCIP91/GiG2xL0T0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR91rIACgkQJNaLcl1U
h9Avbwf/QeHTGVBCinNkmwT7kGX/3+fYCa5y3duDBpjzzQKB0cEl4P2ESNdw+asK
dseIyssXPHu3SqepXeD0ndpYgUqWZLaTIAYWpxGGoT8+xpimgNEdnfmLyvXwQRCz
EDZCF1T8mM37jeK4FILPORaVOJgnkAGy/Ifk/vMJid1r6iDDMPXJigUHwF9fz3Hl
cpdax9PvX+5ZtITuwiU+JdipRHuoV5FJooERUriTDkbnVT/tgA/ggvTHv9gtQfue
CG9GrX0zSVFmfAt+rvi45VoJk38u8qEoDkvtUTWsdTdyI42CLZ1QljHrHKcjaR4Q
+/N/NaQDbVdrKYf8SUwimAMoARuauw==
=b+tY
-----END PGP SIGNATURE-----

--UCIP91/GiG2xL0T0--
