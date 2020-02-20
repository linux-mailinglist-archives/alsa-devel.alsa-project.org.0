Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C511668E4
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 21:50:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23AA116AD;
	Thu, 20 Feb 2020 21:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23AA116AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582231808;
	bh=uxj2CTanYGB1yEVrPsFy57vqZ7ewHIyjriDExiJsoTQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHICeHf6ZabXTFiL2BkbPFj4fqCbSlVdl0shJGdXKElqvi6gZLxsU4kxn7WFa/VjB
	 wQDODIUkwleE4NMPJrw/ra8F0Bu/kKNA/hm71ZuFngd5a4NrdBjMz/lQMJfcvODjIB
	 B/XyEyO1OlUIdH4VAlWPJYtbrJavCSYPSiOExBk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C8B6F80150;
	Thu, 20 Feb 2020 21:48:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F03F8014C; Thu, 20 Feb 2020 21:48:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 80E6FF80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 21:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E6FF80114
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6072E30E;
 Thu, 20 Feb 2020 12:48:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9A3C3F68F;
 Thu, 20 Feb 2020 12:48:35 -0800 (PST)
Date: Thu, 20 Feb 2020 20:48:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/2] ASoC: tlv320adcx140: Add the tlv320adcx140 codec
 driver family
Message-ID: <20200220204834.GA20618@sirena.org.uk>
References: <20200219125942.22013-1-dmurphy@ti.com>
 <20200219125942.22013-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <20200219125942.22013-3-dmurphy@ti.com>
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 06:59:42AM -0600, Dan Murphy wrote:
> Add the tlv320adcx140 codec driver family.
>=20
> The TLV320ADCx140 is a Burr-Brown=E2=84=A2 highperformance, audio analog-=
to-digital
> converter (ADC) that supports simultaneous sampling of up to four analog
> channels or eight digital channels for the pulse density modulation (PDM)

This doesn't apply against current code, please check and resend.

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O8KEACgkQJNaLcl1U
h9Bt2Qf+NPWxuWjvFJykGdOsQaUJzxyvmW97nFWbcYWGFf6iFFmEHq4uXC0zbBWI
oC7YOTUca78ofsuv7fU9sWAdVMPSB9znSXs+tArD+7e/yUaIhLvSDGEQ7RxwQQ6e
42A18z1q1pI5zuEWlg99RISaeC/yqcpFOT9GevJ6DgP+6k1FGqQwzQ8UChGnggtt
L4q0lG/lEUAEyCCNyhdIKHJkr9Ba++dN9tQptfjofqFgZzAhYb7YdsFln/9xWF69
VXSdPEF0Mz4f36lMCBi7UUvzq+2qFGyc6qTCLq0I5YeDj7j0y4/1o/KofgLH2XFM
wwcuIR1f5tsq+mBxv3jKsG3kFFSRjw==
=X0sz
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
