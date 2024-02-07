Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A209084C845
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 11:07:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5125A74C;
	Wed,  7 Feb 2024 11:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5125A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707300449;
	bh=8SIztSSdRHmnv6/+sGa3e7hEC65ih9fcCTIUIr5N3ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=avZa5aFdHi7pFWqaN+vvje0pb78qpBgohBJWEWU4US3z6E4OhhlG5pS3A5CWabaqn
	 UXMVcmIXkU/CVFxXA5CajF1P2bt7lSJzFxK93OdBa9XLCDQSxG1/QEBxRKszFf0K95
	 ECUEwaIUkybhxEcnDyzqwLXr35BSK3XpA2MZDaAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDA02F805AA; Wed,  7 Feb 2024 11:06:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0FDF80587;
	Wed,  7 Feb 2024 11:06:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 983B9F801EB; Wed,  7 Feb 2024 11:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3803FF8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 11:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3803FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=M4+L7DNx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13CC1CE188A;
	Wed,  7 Feb 2024 10:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F61C433C7;
	Wed,  7 Feb 2024 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707300396;
	bh=8SIztSSdRHmnv6/+sGa3e7hEC65ih9fcCTIUIr5N3ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4+L7DNxS+nHECEWBlPGeUjLKef0rkZ84tpxsN4MDZTx5siH0x7IfNdN2KWCLA0aF
	 enMLJUn3mMAjKREoqZ50HO2RFWxoa0ZCsojrmXXmLnUdWimd7BOpKqMudltLzpvq7V
	 nHo4mSRhIh+XY/X1+1La1Lbh/NXGGefRtpR0utlGHrglVSYY4OUswKtNZrpve7666C
	 cFl3aEF+QdvNE0JWkLelRyrKZs8BHLl9MV/ry4hiqq6c5SOlNENK4alIV9pTZYUS3B
	 3wRaT8dJVxwyeFLq23XlwzhNGIm3+VLHikl8cFTpNdfMbAsH69qgTChqbmqKVhgaBS
	 N3TKC4z0Tjaig==
Date: Wed, 7 Feb 2024 10:06:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tas2781: remove unused acpi_subysystem_id
Message-ID: <ZcNWKUByQZM6nayY@finisterre.sirena.org.uk>
References: 
 <df5c94396256e9573b772962182def52d20c50d4.1707250969.git.soyer@irl.hu>
 <631722b9ec0a4a2667d68f4747f01f3f7eb8ceb8.1707255177.git.soyer@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2001rdQd9M4MkVU"
Content-Disposition: inline
In-Reply-To: 
 <631722b9ec0a4a2667d68f4747f01f3f7eb8ceb8.1707255177.git.soyer@irl.hu>
X-Cookie: You might have mail.
Message-ID-Hash: XUW2DUSMGAX4SI7P2OM6O2G6UWOLYVDD
X-Message-ID-Hash: XUW2DUSMGAX4SI7P2OM6O2G6UWOLYVDD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XUW2DUSMGAX4SI7P2OM6O2G6UWOLYVDD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--r2001rdQd9M4MkVU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 10:34:15PM +0100, Gergo Koteles wrote:
> The acpi_subysystem_id is only written and freed, not read, so
> unnecessary.
>=20
> Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
> CC: stable@vger.kernel.org

This is clearly a cleanup, not a bugfix.

--r2001rdQd9M4MkVU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXDVigACgkQJNaLcl1U
h9BTKgf/Y91pr9e8zpI9HU+whTgfiYK/+lW5+OM8y2XgQUls1VnMG5fVUBPwlAa9
UyVXNUZGpGb7tpN4zdhNZmyl7m8IuN0JLPAaquDFPJycaRcck83Me89KhkKiZpFz
mvAQTULEv4BcF4R4fPgqhPRNTy7CxNAynHbSsuISfaFBjcjn0m7CkCUF626shYmp
wV39QOKWsLqJCJH0jGVEaxTgsn2rKvotCL2Bl7Eklb9qdRxDBwm/5g9q/ThGyP8s
P6bw2nYu1cLdIfWJvVbKahQBxdiYeKyzUK91jEew1Vy9bcCyPZ2VWe5pdXzTz4J/
7TJoritrxIq6p9JKAgjDwZzTLNqi0g==
=cqxc
-----END PGP SIGNATURE-----

--r2001rdQd9M4MkVU--
