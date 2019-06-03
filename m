Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD333388
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 17:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ED2D165F;
	Mon,  3 Jun 2019 17:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ED2D165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559575765;
	bh=ZN/JyQc1X0a5VhCpH7qJYYdtofIe30Vg6JZb3al1sug=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVDcWEjGbEhbh9GK+HRlrzZgGYe0eGPI+S8QcJYIMVCiEDc27NrQmYzG3+I69KEfm
	 hY1EtlBu3Rr01M2DyRLSd2aenPQIoatRaYwDzyB9wvv1Ot3tKF3aofkP7X2af+8+Rx
	 29wppr4C+KLTdVXnH97Uj005w6Tbr1b1ef6kWOvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA492F896ED;
	Mon,  3 Jun 2019 17:27:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB5DFF896DD; Mon,  3 Jun 2019 17:27:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55596F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 17:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55596F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="xfE05/ki"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iEWFECNWEoRXHdke6havOY+8o53ZmeWbffO16u0RrZA=; b=xfE05/kilw0Y6BZLHtPD9FVK6
 62ltCKphRfOyqNZePrg/XtYAowVIxrQ+G7gM5apeB/BvedYY4mVGEZgMkI3ZgJm2kV10K0W/sDnyM
 Y6u2mIcR5iwBdSChCjobF2zBCFwdiWitghbQKKzgnYr2i9zC/aHTU7IDUR0beb8dhBYAs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXorw-0002EH-9r; Mon, 03 Jun 2019 15:27:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6B345440046; Mon,  3 Jun 2019 16:27:27 +0100 (BST)
Date: Mon, 3 Jun 2019 16:27:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20190603152727.GU2456@sirena.org.uk>
References: <1559298842-15059-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1559298842-15059-1-git-send-email-krzk@kernel.org>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2] Revert "ASoC: core: use component
 driver name as component name"
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
Content-Type: multipart/mixed; boundary="===============7279592808088772076=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7279592808088772076==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9pXJW6w71JX4l3T"
Content-Disposition: inline


--s9pXJW6w71JX4l3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2019 at 12:34:02PM +0200, Krzysztof Kozlowski wrote:
> Using component driver as a name is not unique and it breaks audio in
> certain configurations, e.g. Hardkernel Odroid XU3 board where following
> components are registered:

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--s9pXJW6w71JX4l3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz1PFwACgkQJNaLcl1U
h9DFewf+Nrpc5dIbkdtpXJkd+/r3A72X4Qa3bSaqMe32ihQnjGEheNTX/QRKVJRI
2CPV6hCZ21/kjRHjjPZh7wnz3/2ICFPbVFT0oqw7ODSgYB9mbKfJG22awJVr1xtY
jncb8BwIddJhKu2wmP0kFqvZZ4bUhspqeQ5pStUhlrkpy2Vgk3KCzvhDcOaDaMv1
1/+eGxpQfFQyHD6MFK+ilSePDl9ZYm+tnzjtAP7ztdjJaRQRiRhwHTUEHUf+ViAL
Gd789UwaU9no7R0/MxgHHWB/0+qd/JTp91XzVCTJBFu7dlwoLynN4kVAIVrvUDTl
mhhtur3Rm0khwJ2jfqvuVqv8Rwq5ag==
=vsht
-----END PGP SIGNATURE-----

--s9pXJW6w71JX4l3T--

--===============7279592808088772076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7279592808088772076==--
