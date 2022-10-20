Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA4606207
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 15:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89886322;
	Thu, 20 Oct 2022 15:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89886322
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666273417;
	bh=zYSVRr4OMXEx34YQos301iWU4QJHxErmMqKF1Uyv8kc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rm9tFTPT/Z66KtTbWbzeBVxBZzWGw32isBYB+83m5iBPQrTm19utOjnCQlfkF7DJ/
	 1cT2ncDzuZEyj041Lbit8ewp3pWJR9mb5gXx3PSAv7g6A06M36VSfP7mBdsbIV0ZpH
	 bliJ0boduHsv3HRkd//G2p3lt2xz8Cobr66Piups=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A85A4F800B5;
	Thu, 20 Oct 2022 15:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C61FFF80519; Thu, 20 Oct 2022 15:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E28AF800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 15:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E28AF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O+1tOnX0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE21061B32;
 Thu, 20 Oct 2022 13:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCC3C433D7;
 Thu, 20 Oct 2022 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666273351;
 bh=zYSVRr4OMXEx34YQos301iWU4QJHxErmMqKF1Uyv8kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O+1tOnX01SO/Z2rz9kOSGFRgtYjHCdZdnMS1t6jlgSH7CNeGsZa3FSMV22HDPDUEC
 cNUQDhvmPkcwRYU6dCffutTXLgYI/OEgZMlLK7hDcQDZwp2m6xrfVw5h/ZoYplOpFE
 7yJmSpcrBGDyh50jaABL9Vx3se4bu/vqaFLjXybqVafvIVYWlQShooL592XYV4yN8/
 sPE30fvue8/JgotO222cdfijJKxDYXAQdyxmXqV3aT+dc/kU+fShFQc9keYgC7uzW4
 x5B7xlxFBmUUH8yVGoMTIldt9/Oc4KJywKye7s/OHRORaZTextHg/rDZT1ehGFjYGh
 N26ekXEeHm+1A==
Date: Thu, 20 Oct 2022 14:42:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 04/10] ALSA/ASoC: hda: clarify bus_get_link() and
 bus_link_get() helpers
Message-ID: <Y1FQQg7yNEBebRB9@sirena.org.uk>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <20221019162115.185917-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wpwprL2ihvEl+zuU"
Content-Disposition: inline
In-Reply-To: <20221019162115.185917-5-pierre-louis.bossart@linux.intel.com>
X-Cookie: Today is what happened to yesterday.
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--wpwprL2ihvEl+zuU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 11:21:09AM -0500, Pierre-Louis Bossart wrote:
> We have two helpers with confusing names and different purposes.
>=20
> Rename bus_get_link() and bus_get_link_at() as bus_get_hlink_by_name()
> and bus_get_hlink_by_addr() respectively.

Acked-by: Mark Brown <broonie@kernel.org>

--wpwprL2ihvEl+zuU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNRUEEACgkQJNaLcl1U
h9AMcAf/V8sQ103A3R+yNGbTpbj9TBCTdmb5iq/OA18BWHk7yHTsnNzsqkHy2iY5
PLZ/BjwccvNrP78p6Cqk76dbktRIKAVfaQt0MB0Xp9njkawgJMOyte8p70DZRTgP
j8Mf2wL9XKn9FoaCxFyK5yanuNn4gYHVBljcsZIixgv7YCuRaJNuG7PGqenfcqW2
ZahnkRyCq2XUnnUBTGWLfyq6QVFYJC6ZIBzBtdqRCIfhR+YwutsA05TYBgpUkOty
qxjUl6DLSGGzA2xNivXn/LIoJiJTtGluw9hgyuuCTgcTPlvvZK/dfGt84GdXMW00
lVmgaZ+W7T840aSSTQaiLieSqSV9ZA==
=vwhY
-----END PGP SIGNATURE-----

--wpwprL2ihvEl+zuU--
