Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E40944AEBA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 14:27:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA9541655;
	Tue,  9 Nov 2021 14:27:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA9541655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636464474;
	bh=J2HKc1MxYjxe9gpE69xTbA5+nRuj4eiTFvnENQOr37k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acmjnVaxfZSacSa0tLyB/kOPPfGYS9Stsou5ndfozDqEnzrIKIbDSMPJqa4p9QGD+
	 VwceBD5a2htilBXE+4a8hf2Q+xe1d2R+6FzKbta7LUtYxkJ01iT6a1fSwKKE04dGET
	 sTFOIf1kbl6AhiqC80U188wsYhwmjrE9G5gZCnMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38651F800C9;
	Tue,  9 Nov 2021 14:26:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10817F802D2; Tue,  9 Nov 2021 14:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EC91F800C9
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 14:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC91F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f/gz9DKh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCDF361159;
 Tue,  9 Nov 2021 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636464383;
 bh=J2HKc1MxYjxe9gpE69xTbA5+nRuj4eiTFvnENQOr37k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/gz9DKhinbAoV/QCOVsqbhS3HF4+Pt5r4HFYK237NhSc01SfbPG6nkny+MI+ARf8
 8P7upGQlo8lYGWFhik7IN/Jum/EauOkZZVVkOnIQud6jIQ/yr53iJ5rgezpToOCRAE
 DF7PQXrTs+SHEqu5PeBjuls6FEjnEMDr1Q1b753FI0+DvIVxKTQp3MpQtLcf+S44ei
 axkOjztraSoaXVPGqChqbzNPIIQUnwcGsbZDC4vpxi0VHjQlaHooMe+/xJKLsGnr+d
 5S6HgE7TwHTejEfB7aPKkpW6CfNvNU5x11c8NUSR789I5VOZEQ3A7bRkp1FAMqmdQQ
 n5unOukEaiM4g==
Date: Tue, 9 Nov 2021 13:26:18 +0000
From: Mark Brown <broonie@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt9120: Update internal setting and fix auto
 sync problem
Message-ID: <YYp2+gqjn6+M/hZ7@sirena.org.uk>
References: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
 <1636439024-15877-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HVGDxR7W1SSa3wC/"
Content-Disposition: inline
In-Reply-To: <1636439024-15877-2-git-send-email-u0084500@gmail.com>
X-Cookie: Elevators smell different to midgets.
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 cy_huang@richtek.com, allen_lin@richtek.com
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


--HVGDxR7W1SSa3wC/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 02:23:43PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>=20
> - Update internal setting to fix issue.
> - Disable auto sync if fs is divided by 48.

Please submit one patch per change, each with a clear changelog, as
covered in SubmittingPatches.  This makes it much easier to review
things since it's easier to tell if the patch does what it was intended
to do.  When splitting patches up git gui can be helpful, you can stage
and unstage individual lines by right clicking on them.

--HVGDxR7W1SSa3wC/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGKdvoACgkQJNaLcl1U
h9CDUwf/empk/L0AB6TG5uu8RYPa6l2xwNsGoK24S7mFsEIsG7ykomIbzY5cn5de
O6C0OBLyNOZwl6WprWKMRGFtj+yzsAFijk47pq3FYOwEU/EHRt/WtBrcLSlYZQen
g913L88YViV5l7kCF5LgXQuetDkPMU+uXIFY74zLAPEpE9rCGfzmYkbEAp26bgtm
b8AMzlh4BBH7YquiB1yyyN23Zf8V7VdUZxzaCJZmLbYXS+iiwFzbTb69FdZvRIwD
6FVq8+ox0ftvpU4q94bPq/dZCWMIDdfXa1jLRl6axzfGWErvYA+p1+aVyJoy/x2T
SFvXJh3bMIDIH8XJ7dfn2enhoT62AA==
=sDK0
-----END PGP SIGNATURE-----

--HVGDxR7W1SSa3wC/--
