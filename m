Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF477F17F2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 16:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8475E839;
	Mon, 20 Nov 2023 16:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8475E839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700495739;
	bh=5RAM8HOVYUU9Y/pFLKOLBfOhvTkMT7lRAWd7TNxEfAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bAxHshPzvDjxcaN4NjNqG1wm5z6ViIJBkEtauWiPpn0ci3BgFlvvtn0aeyEoWCxFC
	 7by3SVDgKW0X3yuQzhu/jOMpk6UiXAdLKBY6BLItolJYTqdsjoIaPKvISdACMw40N5
	 mXcspb8yOrjgKNa/ZNDiT6xHJODSGkGcpeeDGm7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 306F6F802E8; Mon, 20 Nov 2023 16:54:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADCD3F80249;
	Mon, 20 Nov 2023 16:54:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E926FF80254; Mon, 20 Nov 2023 16:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02B46F80246
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 16:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B46F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SAspqX/D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 598FC60E0A;
	Mon, 20 Nov 2023 15:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426F6C433C7;
	Mon, 20 Nov 2023 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700495659;
	bh=5RAM8HOVYUU9Y/pFLKOLBfOhvTkMT7lRAWd7TNxEfAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAspqX/Dssj5RtfYYHt3wCNydfXbYEChxLPiGn0CxTcos3DUyxsJRYAWvTbSzACdC
	 khzbW5fbO+tAL6mOjcdK6TSxZTmy2Jg5kHagr4AwE9OVE4EIDJ4IdxESD0VDXbzzzN
	 2NIKX4cL8+ip0K4sdCmw5SY9ipsHc7EWDRcJCGwIsRMKzWsuW+P5n0nIayyXxvwXCY
	 NqtM7oaQvOiehJ/z3p3y15yvlGU6Fa1EcLgodrrPCChE4PiVeajCbIRJXzZ7X254PN
	 ZUGArM91RkYiqfhCWBvHTIesTitsw/LLrjrjcwkPfZ9FY7S4fmphedlIsLbkY+qdbH
	 n6gyVNiln89ig==
Date: Mon, 20 Nov 2023 15:54:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <c031657a-a1ec-44eb-8885-afee68d7523b@sirena.org.uk>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
 <7248897a-0b59-4cdc-9915-d3297f2d6efe@sirena.org.uk>
 <261e118d-529b-0ce0-5524-d24d767fa92f@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ycCrs6TZIAPbbyZe"
Content-Disposition: inline
In-Reply-To: <261e118d-529b-0ce0-5524-d24d767fa92f@opensource.cirrus.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: YUTFBEWB4EAC6NF5LICRFAR6UM64SOIF
X-Message-ID-Hash: YUTFBEWB4EAC6NF5LICRFAR6UM64SOIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUTFBEWB4EAC6NF5LICRFAR6UM64SOIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ycCrs6TZIAPbbyZe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 03:46:26PM +0000, Maciej Strozek wrote:
> W dniu 20/11/2023 o=A014:40, Mark Brown pisze:

> > > +		} else {
> > > +			return 0;
> > > +		}

> > Is it a bug to call this function without to_poll set to something
> > known?  This will just silently ignore it which seems wrong and is
> > inconsitent with the handling in the interrupt case which will wait for
> > the the completion to be signalled and report a timeout on error.

> In interrupt case 0 means timeout (and calling function should expect 0 as
> error/timeout), so the only inconsistency I see is in not waiting before
> returning a timeout, but that would be needlessly wasting time?
> Do you think adding a debug print or a comment would help here?

It seems like a clear code bug if this is ever called with an unknown
completion, I'd expect a WARN_ON_ONCE() there.  The lack of a delay is
potentially going to affect how any error handling works which doesn't
feel ideal though the users look fine right now.

--ycCrs6TZIAPbbyZe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbgSUACgkQJNaLcl1U
h9DLHggAgw4p1rPiLwpJ1J/hleOS2jFFzXuwTkstI6G2g5uZWsaBuaUFeZQyHriY
avc7aCFDEjYZBryEbey+S08tmNygDp+qVkHrCy2VSCyVM3TeP7vaIwtebTA+bLWL
3bdP22f26lajNin048S3VyyLv0pYblUm3hSpCA/fIhp2TGW2HtRD7U1cSx9giCx1
yMpMKx559NWzmdv2Mmi9iRCDZvgFixZT+74VtshWAwhDBE3pmxax7DxXQ2XlG0RM
/WlpqGQbtspRZrIuhrL5TC1xZG4V1HEB5S9FpYggmY97cOxb7ZiPaN1Y7NP2ZaCt
qiwhCBj+GjggmiCqjjqbzxVHhdwouA==
=hruj
-----END PGP SIGNATURE-----

--ycCrs6TZIAPbbyZe--
