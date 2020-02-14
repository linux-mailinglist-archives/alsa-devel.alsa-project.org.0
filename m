Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A515DB48
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 16:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DFD8166C;
	Fri, 14 Feb 2020 16:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DFD8166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581695094;
	bh=9GPgMdMuBYEpAFENI7egU9gT8TMUQhP4hNhr63Y+rW0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=poCzRS6EsKy6CkgWlZwq88jOinc26gnreeorAI0MiWTmBPPBa60RTbbpZmZXBaMU3
	 7hpxRwXKdydx7mNcT/E89uMxvEe/IWEOPWVQG4J8+KAAiKcHOjkzBptO8FkKBpnYo3
	 x/6sA+thbSsTxEmI1p5XeCZkNgxRRX5BnjxIJnuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C53F80086;
	Fri, 14 Feb 2020 16:43:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71AFCF8014F; Fri, 14 Feb 2020 16:43:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D8CD2F80086
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 16:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CD2F80086
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BC2E328;
 Fri, 14 Feb 2020 07:43:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F1953F68E;
 Fri, 14 Feb 2020 07:43:05 -0800 (PST)
Date: Fri, 14 Feb 2020 15:43:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20200214154304.GP4827@sirena.org.uk>
References: <20200214105744.82258-1-tzungbi@google.com>
 <20200214105744.82258-4-tzungbi@google.com>
MIME-Version: 1.0
In-Reply-To: <20200214105744.82258-4-tzungbi@google.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: core: remove SND_SOC_BYTES_E
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
Content-Type: multipart/mixed; boundary="===============3086947808919035477=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3086947808919035477==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K8zN2sh9fO5jmbe4"
Content-Disposition: inline


--K8zN2sh9fO5jmbe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 06:57:44PM +0800, Tzung-Bi Shih wrote:
> Reverts commit fb5126778333 ("ASoC: core: add SND_SOC_BYTES_E").

Not sure I see any great need to do this - it's not doing any harm and
something else might come along which could use it.

--K8zN2sh9fO5jmbe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5GwAcACgkQJNaLcl1U
h9B/Sgf/X32Q0oK6g5R91Wy4BoWfrVozp7scHEikjUURK8+S7ay7WPigoFX3q/cE
aTSfMRc0RcEgyo3cwkMaQJwEBLHhrzGG5niiPEhhecNA8CRgElIVUR0qi9h3483b
5HbUvzZUlBQWZdGYiOXmQShTL1O4gWanOCf2anpwpuBxDG/YD9/9ldZDL6zO8hAo
oT1AUXCY6QUYXM1H5kvuq0w/pYiimLo5IOMvBhj0RTLc9Q6KBESuKCqTlS+1Q8Yp
U4a+/b5kQ+WVpCLhSfHncuvcX8V+M0MhhLJbfRZZPkHf4+YL6f+5IuQzMRYGbn78
4IxFoB4MFXslPnsU5+R/KiNxHXxy2Q==
=VqrR
-----END PGP SIGNATURE-----

--K8zN2sh9fO5jmbe4--

--===============3086947808919035477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3086947808919035477==--
