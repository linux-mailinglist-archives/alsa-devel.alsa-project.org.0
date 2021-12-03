Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34D467D73
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 19:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 087CC2432;
	Fri,  3 Dec 2021 19:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 087CC2432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638557070;
	bh=/2Mbnq6vGmH9P5g4eZuYQ0dNWjt5+nF1xogtBejsGi4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFGOIcBYeMqcjdKNMymzN9MXFL16bJTVwXoMHl/Zal49YM1vYxaps/yUAATjiwXTR
	 16qYSgkScWGSQd0CG1d3X1y1CXz8TY6/wdj35xgNdP03NL/kRCOJLqBp/viJCpEgwI
	 iz0mvaKOL23PO9p1MAI+P3CiPxxOV2hE+68+z98w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F7AF80249;
	Fri,  3 Dec 2021 19:43:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 772AEF80246; Fri,  3 Dec 2021 19:43:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F2E0F800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 19:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F2E0F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qrUOXQJY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1946B826AB;
 Fri,  3 Dec 2021 18:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09755C53FCD;
 Fri,  3 Dec 2021 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638556982;
 bh=/2Mbnq6vGmH9P5g4eZuYQ0dNWjt5+nF1xogtBejsGi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qrUOXQJYCynKCreXj87IGzVFsY/onj5hEXGVdJUbUmeeNqL/Y3Wf9Nl17LfoGS11g
 JWyjFakJnxzfLEON45XGR8raa56Te+gds9xL3Fa34DQ6+mIxE1cSMzDU1BP/Ux2awr
 x7m9tFHRnPZQO6FLeX0GCsyaUhZjoy9ObmpqZM1GHrQ++A86IcmKohKlgC+0HJb+g9
 PoxLOdvj8/cVWa4A30wjobRboM/lLy/BtLf3CcvH7hL45FsgqIV9rIOtaCmhIrR7tQ
 T+lyqbdY2EPpojJoPqMTJPfhLTBWd189hsuZIBVSv6DuXJq7agNO9dwzQu85gvqJID
 0rE+HPiEUie2w==
Date: Fri, 3 Dec 2021 18:42:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [bug report] ASoC: Intel: mrfld - create separate module for pci
 part
Message-ID: <YaplMVVr4cbPx8bW@sirena.org.uk>
References: <20211202151322.GA21325@kili>
 <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JwFhH7dH9HfbDsHv"
Content-Disposition: inline
In-Reply-To: <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
X-Cookie: Don't get mad, get interest.
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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


--JwFhH7dH9HfbDsHv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 03, 2021 at 07:46:04AM -0600, Pierre-Louis Bossart wrote:

> I would guess that indeed a return 0; is missing, but maybe it's time to
> remove this PCI code completely. I can't think of any user of the PCI
> parts of this driver.

> Andy, Hans, Mark, Takashi, what do you think?

I'm fine with removing it.

--JwFhH7dH9HfbDsHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGqZTEACgkQJNaLcl1U
h9B3dgf/TfgVop+CgtOEA1u4587Dw+ojz+RxYPx5o+lZDBOzHXq9mc/am8wyQNO8
EkRsepnzv1aPh/VkPyRA3hAtXHlQvVpW0YuUIfLugyzdwg5BP186iufdq7ICSI3v
scV9lMKn5v8jz26QUpZv+S7DgTY7+1ytg2E/jmUM68p5KkVbR93d7uku50xrzaTR
UA8UkZlb6a0bn/uPvc2mBpClwaXOpehfsTETe1+Z8EAvsSLDXdkaq3+6nRi5u0dH
DZP6uuRku0DVAuuzxgWFHBAi7wRCHFmflrru+fC86atXQASCLhJqMB3Fb+CLEM3A
TiX/zuypJVkuWNXWkDdPxWdjctKZ1Q==
=L0y/
-----END PGP SIGNATURE-----

--JwFhH7dH9HfbDsHv--
