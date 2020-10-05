Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41B283757
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 16:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E50417C0;
	Mon,  5 Oct 2020 16:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E50417C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601906903;
	bh=dwIWw6fJzGmxGKYpaY7zdG/+D2r5dltoQj5YSmqdnIQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BMSw0Sqb26hTUOBfDzPlAE6P7XqwPDW6S+xSvj0kPNR+spbDWcMBl77j6uX3Eg3F0
	 RNBbWtVF8OAJOkKviyKi75eM0nZdVG3JB3jguh7ADoKHD6hIoBBigqza78FCQ60YdD
	 yZBFDY0WHSc3+U7ZVg4iTeGOir/DmmWVzRZpXD6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D703AF80260;
	Mon,  5 Oct 2020 16:06:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29766F8025A; Mon,  5 Oct 2020 16:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CD0DF800EF
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 16:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CD0DF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c9NeXe+z"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B039205F4;
 Mon,  5 Oct 2020 14:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601906785;
 bh=dwIWw6fJzGmxGKYpaY7zdG/+D2r5dltoQj5YSmqdnIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c9NeXe+ztBp1syWhX1FJIXLwLb4bJJtjcyNA3I5qmXSp6ZuD4vxj0y0eTAPydCdFR
 Qpb6O2ug/41t24YKOyCWXOPnqCXHq1tZGlinYtHZV72fxRJbM8A94V6G093UCFKGyh
 A8bmJAtwgdNYVTIPbxaQ8mJCQU3Lo7L1TUoIIWj4=
Date: Mon, 5 Oct 2020 15:05:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix a typo in a comment
Message-ID: <20201005140522.GA41489@sirena.org.uk>
References: <20201002192801.639743-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20201002192801.639743-1-christophe.jaillet@wanadoo.fr>
X-Cookie: Boy!  Eucalyptus!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 dmurphy@ti.com, grandmaster@al2klimov.de
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


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 09:28:01PM +0200, Christophe JAILLET wrote:
> It is likely that this header file is about the TLV320ADCX140. (0 and 4
> swapped)
> While at it fix a missing "H" in a comment related to the include guard.

This doesn't apply against current code, please check and resend.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97KCEACgkQJNaLcl1U
h9CGuwf/bKRzx1tM8jnFK/J44PLpsS60wfI4/IYRkDXuLb7hmOjm2pLHMZfLuuXn
6nn/D4KVMG7cQ1E1l+UcOcKnL2LhczJeE1Sf6ao9js3GVfcdoqkyRp6T3qNUV5Xd
UxCDXEsfp+B0YPfwOVJ6qNwmMmHsAQQFZAQLpYeIUh7lMypaNf4iklVJAFezca2f
EcghVIUqpAbYhdKXfJxBUOb06L8lASeVdaS5SRlSH3W5GdxT46Y1BjgHxMQeLzp+
Rx1V7zrJisAscleY+Ezik8LvgwxxDrDXiODueB8UXwKE6Obvfogn/g12AWDTOM4A
Iu+c+zVZu64EA05H6Rhvk8tGsPaAiw==
=fZhr
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
