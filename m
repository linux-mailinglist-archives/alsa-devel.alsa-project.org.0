Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6D610F25
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 12:56:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3735A282E;
	Fri, 28 Oct 2022 12:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3735A282E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666954593;
	bh=nFjORNVTf+TRMTqeQVeerWjWKXAbrWqpRQns/dwztZs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hYQJevDMqaLR8LoQEHBvvln3tRLSZi3AWI5XMOoDpXgjabAAZ7iP8KnG4FKGY8sNv
	 IGYHUPfqUzreha7cpW2AkFPsRqQmymjId2x6TBq9yvxzRKYVlOhWQSnP6Z+p0jo4eA
	 7GAHna/wLHalr81k3Pbmv2DNnHb96cry5IvC+jIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 561C6F80095;
	Fri, 28 Oct 2022 12:55:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 907F9F80095; Fri, 28 Oct 2022 12:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 636A6F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 12:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 636A6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fwykub34"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A154B6279F;
 Fri, 28 Oct 2022 10:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5979C433D6;
 Fri, 28 Oct 2022 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666954532;
 bh=nFjORNVTf+TRMTqeQVeerWjWKXAbrWqpRQns/dwztZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fwykub34Q/MCGz93v7Hwgci6uIPqgu3jabRJeXTGzBxtex5OQtPfDjLhHRr1X27/P
 lOnKyB2yE7kbtXgOJszZR5KUIZQLXkFXHKqVVBMvpUf7dJDJ6esUfUuzKa3n53i5/W
 rV955CvlssvxXpAsQdiU94YmQ4oDxXaSK5uUUVUrFMcm81LXn6WpHi1YgbPdoXfsGq
 olgIBXyzg4fHqqHn9/oyCVbGKA8V+swsd/rnwQeY5q5lJzjpCGIUn/IykFqgfvPniF
 CFKOflsqP5Qmv2MLYqhN9dFIe4DOnvFsPGaU4OI63AF2RLY0LGClA2VrxPMlBRmMON
 8imltCwKdmPdA==
Date: Fri, 28 Oct 2022 11:55:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Bergin <peter@berginkonsult.se>
Subject: Re: [PATCH v2] ASoC: cs42xx8-i2c.c: add module device table for of
Message-ID: <Y1u1Hl7GaTlS/jeF@sirena.org.uk>
References: <20221027115057.442925-1-peter@berginkonsult.se>
 <20221028075045.493191-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lt61aAraIxElQ1nh"
Content-Disposition: inline
In-Reply-To: <20221028075045.493191-1-peter@berginkonsult.se>
X-Cookie: Life -- Love It or Leave It.
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, rf@opensource.cirrus.com,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org
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


--lt61aAraIxElQ1nh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 09:50:44AM +0200, Peter Bergin wrote:
> When trying to connect the device with the driver through
> device-tree it is not working. The of_device_id is defined in
> cs42xx8.c but is not correctly included in cs42xx8-i2c.c.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--lt61aAraIxElQ1nh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNbtR0ACgkQJNaLcl1U
h9AFqQf+K+eRfq9uKu9Z6qplac0kFMuatMLuwnXT2FIu4W4Y7v3RNeJG9wTfzcjj
5uhk1Czmwp7/t3rsKYJM4Yncuwfk+nB723EspO+95glNewFMzwQWFHFTmU199tVI
i+uu+L90LqfcvlmvBa2nWPp1lX2vFFhqd/xRMfnGG0tnX+Ell9GzZW5XTiStKrZX
l7ltevbWMvJ+5g87SKpzZ9AU0Gsazkzx6dBT0vxfUVwBV1u2Oyb9LKo+mqJ7ViGg
lM8ZpVJmCJbMczHyfr+c0/yyo2uTjm4+OLz23ABISSl5YiAXi8roV2k/609AiQqj
F1gvTDJ8FrQXIQwsHHXxMEPiGe93Dg==
=fvxc
-----END PGP SIGNATURE-----

--lt61aAraIxElQ1nh--
