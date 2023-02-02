Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605D6888C4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 22:11:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD0DB7F4;
	Thu,  2 Feb 2023 22:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD0DB7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675372260;
	bh=7pj3Q04mglkAHU9R7M/fyCJkxPB/t6ObwgRFG5d6NqE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KW2jiebZRI+JsDWgkcZpUVjMDT31Kcet2jjugSTBbwccVWz6FwJD+3oZ+B/JzebW8
	 A5L4IJW23mr2CyglHon0Z9FRmtPWVopoUpGInb7PxaMnRCh/XZukrD8DzqVnyllZ5W
	 Ptxk56eHlM5iJA3AwDJXTUu6YojzMP3/Mog+fp78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FB3F80271;
	Thu,  2 Feb 2023 22:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5455F804C2; Thu,  2 Feb 2023 22:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8012F80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 22:09:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8012F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X0emkEoi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 403BE61CE2;
 Thu,  2 Feb 2023 21:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCD2C433EF;
 Thu,  2 Feb 2023 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675372193;
 bh=7pj3Q04mglkAHU9R7M/fyCJkxPB/t6ObwgRFG5d6NqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X0emkEoiA9I0KbTjXxTrG0QIVNUCsCqZWPtqOeRXq6MWFM0eVBnwrHZ7ogfNzhLas
 sh0+37XDzZQMaPE7ApWjTgPBnuSYPAyse/LbG7B77NNelG2vQppCOFmYHT454S9c5i
 Zg/GkRWomOCciMWN8b5YW7rTqsbxQsTfTR6JWtg2brDi25zAlt/0pAbTqMRrAOyZd6
 iHtlMY9gWbxKjiFh7q3P3hcYCYDTtTMSpxPnoeo4EH1ny8AHft/nTO/6iWjpE/HtJF
 /zvAMbD4YA5+97mP6YEs/dM/de+o8vGsXf+Am9lR1oyWNSM6dX9wip8KA8lkzOcwhm
 RqWyIx/T95sYA==
Date: Thu, 2 Feb 2023 21:09:49 +0000
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Message-ID: <Y9wmnfTi/p4FuRmd@sirena.org.uk>
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eAhHNtSkqZO523WD"
Content-Disposition: inline
In-Reply-To: <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
X-Cookie: Swim at your own risk.
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
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--eAhHNtSkqZO523WD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2023 at 02:34:17PM -0600, Gustavo A. R. Silva wrote:
> Hi Takashi,
>=20
> I wonder if this can go through your tree.
>=20
> It's already been reviewed by a couple of people. :)

As documented in submitting-patches.rst please send patches to the=20
maintainers for the code you would like to change.  The normal kernel
workflow is that people apply patches from their inboxes, if they aren't
copied they are likely to not see the patch at all and it is much more
difficult to apply patches.

--eAhHNtSkqZO523WD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPcJpwACgkQJNaLcl1U
h9A/vAf+PnLTOL+T2xyGoUbHCmmknCRAW5rThtQnG1eP4MK+E9C0f7ez4U++B45u
gtx3srMbZtTrLia7pDg3/Uy2xhdjUjOE/u/J9VzHyr1AyiTmLZcse/B2UsjfA7UN
iTMhls3ozwnVOvJSY7diCuIcTn3gvxIWtfq0Vl8mulzqdOMl1xDUbVF5oAODR7B0
1iYvJ2av1ZXfW1Bp0pM2tpOo62V8cB44WqYgDe4PEYQ9IobTdBGWtmo0FbQVSLpc
evfsMMmUMDTrgJXzEikD6pUc+J/ExBTuh3K6hagoCfKci3MBNIx5TxFBM00YlB56
blbuDvwS4PEcbJgtWOOuBj6rnhfffw==
=EnD1
-----END PGP SIGNATURE-----

--eAhHNtSkqZO523WD--
