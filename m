Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240D2803BE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858D21923;
	Thu,  1 Oct 2020 18:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858D21923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601569122;
	bh=550ObKj0OVd2Etj3DF5vnvAqjxclqiEwkkyg6mAkvxE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wrjbf51wABA9Jw/D8OKI6uZiG6GPBUsKDtotR34faqf5BJ7oDIf+YAU7F+38DJs9y
	 5akz5H0q+sPhr9+wkb/HrcZZbd9ZyRrPcZGAPf8FzCx57fGMSaqwMTfnA+7fMoELsd
	 6XFrQmxLWv87/tJE7BNMSVUq+J9rYfxtWgNXdWU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F0FCF8020C;
	Thu,  1 Oct 2020 18:17:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A0CCF801F5; Thu,  1 Oct 2020 18:16:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5907F80105
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5907F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bmjgy8Mq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39C02208B6;
 Thu,  1 Oct 2020 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601569010;
 bh=550ObKj0OVd2Etj3DF5vnvAqjxclqiEwkkyg6mAkvxE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bmjgy8MqtcupAOak4HQajWBjJUKV8rpBI3XdM4osHD01IKETSd8rwxdCeS/75/EuG
 H7kY85ZIXHs+X6mvxsES9TFFyI9LO/1R07OnfFIWlzEA9jxaC+xKe6slXQQIp42uZ/
 5hyBwsW0PP2KGywPzUm4Uv+Lds9m6D57GvyLaOt4=
Date: Thu, 1 Oct 2020 17:15:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: tas2764: Add the TAS2764 binding doc
Message-ID: <20201001161551.GN6715@sirena.org.uk>
References: <20200930163809.6978-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zHDeOHGDnzKksZSU"
Content-Disposition: inline
In-Reply-To: <20200930163809.6978-1-dmurphy@ti.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--zHDeOHGDnzKksZSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 30, 2020 at 11:38:08AM -0500, Dan Murphy wrote:

> +  reset-gpio:
> +    description: GPIO used to reset the device.

Even if only a single GPIO is allowed DT properties for GPIOs should be
plural.

--zHDeOHGDnzKksZSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92ALYACgkQJNaLcl1U
h9ArgQf8D8WxeqQaN7IwoEzY6Ot/1JL/mF1DDRlBglnQGCE0NOABnw2x6ugo59YB
wxH6KxdizFIQ8tVWN3sd8lOzEArin9zxKDcaRWSjxyL5NH98nzzEFNrQX3Qf69N4
ziFdb45MaKovNo/tSYiYNglMN+WkCRu6E5PkxErBREcT84yHK5XjNj/FSwmqMnBt
gvlNtojgTNkO0OhzLFiDEA5Ha61i4zir+tKhIGDfeWikc4jV8YIkryjzX0mFUXdE
w8tlELxcaillspGo+HFcyyZ7y8vvAaDaMm1b6AcbQWTM1vNagNxNgPZzJUj/Vqh5
0mBYPVs46434GFpBbcD5r/1oD8efWQ==
=C474
-----END PGP SIGNATURE-----

--zHDeOHGDnzKksZSU--
