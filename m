Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF492927DB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 15:05:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D54C91723;
	Mon, 19 Oct 2020 15:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D54C91723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603112731;
	bh=cqF7TYS+3s0vkYfvkAxCv00WvkrIIfSih7URN3Qul8Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcX5myYpZdxLyEDLSNHRi10P/UcCmfUIRGwbGoEE5P/Vztkc0SjRTA+ZAeQb3B5Q3
	 HRIgSbmX389UNJiU8EiLTYFDOcxlcsceCNyAB+TvzhlUKensSqet48K5zcdIS73sZR
	 Cd83ySCQpphfwU107x/XK3D3qkVrnDDVy3SNSNEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E43EF80264;
	Mon, 19 Oct 2020 15:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 650CAF8010F; Mon, 19 Oct 2020 15:03:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C869FF8010F
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C869FF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l24sJaGj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CFC222283;
 Mon, 19 Oct 2020 13:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603112622;
 bh=cqF7TYS+3s0vkYfvkAxCv00WvkrIIfSih7URN3Qul8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l24sJaGjidXhXBm2OBM3hZz1mKIoxujmjvUqZUZhnTWSSvdzip5WiUxeDP1B8o7GU
 C/RoePxFTquy9tFGAx7AZsrEpEwREYtz2EbOWF4uk5R/x32XJ0+pZlB+ef8hlenTqW
 +GtsXW0ACDEDh8BnRIKjmPzCJKNqCaXd5t5Sf7XY=
Date: Mon, 19 Oct 2020 14:03:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH] ASoC: adau1977: remove platform data and move micbias
 bindings include
Message-ID: <20201019130331.GA4904@sirena.org.uk>
References: <20201019105313.24862-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <20201019105313.24862-1-alexandru.ardelean@analog.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, nuno.sa@analog.com
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


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 19, 2020 at 01:53:13PM +0300, Alexandru Ardelean wrote:
> The change removes the platform_data include/definition. It only contains
> some values for the MICBIAS.
> These are moved into 'dt-bindings/sound/adi,adau1977.h' so that they can be
> used inside device-trees. When moving then, they need to be converted to
> pre-compiler defines, so that the DT compiler can understand them.

This is missing an update of the binding documentation for the new
property.

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+NjqMACgkQJNaLcl1U
h9AOtQf/Xp1fnxzE3EaB3q6cfcLQ/wqiYsF9GVcIOOw5jd6ouidERA5TYt/bovep
DUvbLQW+R0TcAZcHG+OzGcjhHETO7OsQZoD5uPi0DAQwrceFh1xI3GcZNDRa+Qqd
jdgHV50BK20Kwx83U0D1h0DFHdE2mJM7cow0S4yRMv5TZ5JZ4B7i/84Yvuu8vlT2
K6ckEdrZL2P+u3nyXFIsBjtbrw+YcH5v0F1AAAAlkSiPoyltTbQ4tdkWVpk9R+AO
FdwyuVH7NU5WCMkz7DuR7FNAmZFjzvDVZYYJPsgwJRqtXqq3dQk6VS5H82hk94d4
enqPA9aKp8ywBz2S3ZS7pszUKUs1/g==
=J4FR
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
