Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD3846DBB0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 19:58:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC4225D9;
	Wed,  8 Dec 2021 19:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC4225D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638989922;
	bh=Md4JZyTLZ1/MuWs9n7BR2w9UjoN0iel+sQpdRGheG84=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lL7cmjGDU102YKOINIW3XSZYLjcvzwOG50jAGHh/pKvAINhHCyoxJP4iO3OqpvpHd
	 BkdSnB9v6bNQ02tikkHNpWoBLDF9l91oTfcQTP0q4j2Nefo7ZKUojLxG/dUAv61/sr
	 QoMeV7pQMB6BpRICmSyX/dlHT8EdyTjXJBjOnnzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC8B7F804FB;
	Wed,  8 Dec 2021 19:57:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB6C3F804F1; Wed,  8 Dec 2021 19:57:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F19F804CC
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 19:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F19F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G/QzOAOU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E2C5B8226E;
 Wed,  8 Dec 2021 18:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11F7C00446;
 Wed,  8 Dec 2021 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638989859;
 bh=Md4JZyTLZ1/MuWs9n7BR2w9UjoN0iel+sQpdRGheG84=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G/QzOAOUUa/X5caQ77t393zt7dwQd4pWGNQ78F6t7ApVKzyMcPpO0WUJTNAxi+eAA
 bovyJulqmVjRE6nhZ9Pn4D3V2GJa1lX2GHCL56H1y7ZWTj5JQ9SkGslFo5u+qAKJe2
 MMklz2Xd5ZyS9M0JbP6Wqu3ZeRKbWrBQFMyuxMJTFMC69obmBAntTQVZnMBg+KBI4/
 OMpUB60UCTuDnlZ5jiln/Pu2lLMIcrOGdl12Nq/oZ3k+Zu5sGQ4OyXiQsC9Fm6quQ5
 4E7k1BC8Lrj6lgrTVwhlL/xJmSPMpf/J27GjZiAdiZVvWo/cX65x3scngliU4yVqhf
 IVCxhNXTyJ29A==
Date: Wed, 8 Dec 2021 18:57:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH v2 0/1] ASoC: rt5682s: Add dapm switch to mute/unmute HP
 playback output
Message-ID: <YbEAHv2jDeGW7yHQ@sirena.org.uk>
References: <20211208185517.1555884-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NefDtKgHbwoYfhbM"
Content-Disposition: inline
In-Reply-To: <20211208185517.1555884-1-AjitKumar.Pandey@amd.com>
X-Cookie: Alex Haley was adopted!
Cc: Alexander.Deucher@amd.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--NefDtKgHbwoYfhbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 12:25:16AM +0530, Ajit Kumar Pandey wrote:
> changes since v1:
> - Fix typo in commit description

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--NefDtKgHbwoYfhbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGxAB0ACgkQJNaLcl1U
h9CRLQf+LHWkiaGGy+KVrsOOuUkj8XgKJPQtStPNo9MiVnwX3k8Edgbwh5Lu1U0F
D49X1yw3pRbynWeYrEhY9rjSle1NNFxGfGU/48NaIWGLvFokIUm3eUmtavl8LmNx
TFt7LxLDsi/tITfJhbbSTbC3EMIHP1YMFyyZXOWj2ZuR9kxzDpMzdPkzpBnkk69G
LwtD+Iq0GUhgLk0pMAXZQAmaYAicke7jxoPYejbWq7yJbaRZ9Us2BCm43RjBySy0
vThkMN6NUBPFgp6Rx9P4T+8PX0SyCq6XsYr3PaRAwejMgzi+n3o5ggNGVOagqlaL
jggZjmgXMjKwVC+OsaawJPIohD0aAA==
=2XF0
-----END PGP SIGNATURE-----

--NefDtKgHbwoYfhbM--
