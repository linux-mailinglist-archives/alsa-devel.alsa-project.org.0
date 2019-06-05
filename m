Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A944F35B5B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 13:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28B1C1669;
	Wed,  5 Jun 2019 13:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28B1C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559734572;
	bh=IVejXmIpduLB35U8v7OG8HAn84eLdFGehe6YUkslg/k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+bLTx2iGb6TPQFwYnALxrQaf4KKwvWmTNSSby//sp4TZlPAXI1S0lIq9mIMLjtdl
	 FoHmMu4y4LOPILkPKsiRuhyERDelpiqJbhwNJHG6iWH1HNiMC9xrk/inJPYle38RNv
	 6cng0oOkgpVPwICS21PX+GuAbmAUxzsVcfUcDrls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84588F896DD;
	Wed,  5 Jun 2019 13:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF43F896DD; Wed,  5 Jun 2019 13:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A104F808E7
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 13:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A104F808E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="eyUu9oA8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OMR/kCfFh6eqJdv7T3Rmufx3H1EIFpl7D35n6TxbmNA=; b=eyUu9oA8hRQxkvsSRILhFmk5s
 z3IZuZsZLcunubrrvZ0U0i6mpFitVHw4zqnUVGipgpq4ZrbPOn0EbOXn1EtpDaqir1D/4hH2C+6Lx
 wTdtz5ViBYBDpU1PfsvTHe75wV2zHmKz+f1Y3MigqbafcdnuNLG7UMSvgMxYpBqhzhlC8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYUBR-0000Gu-Gx; Wed, 05 Jun 2019 11:34:21 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 04C5E440046; Wed,  5 Jun 2019 12:34:20 +0100 (BST)
Date: Wed, 5 Jun 2019 12:34:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Message-ID: <20190605113420.GQ2456@sirena.org.uk>
References: <20190522162142.11525-1-pierre-louis.bossart@linux.intel.com>
 <20190522162142.11525-9-pierre-louis.bossart@linux.intel.com>
 <20190523063433.6zuwdlt4vzw6urxj@debian.ka.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190523063433.6zuwdlt4vzw6urxj@debian.ka.intel.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 08/12] ASoC: SOF: ipc: fix a race,
 leading to IPC timeouts
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
Content-Type: multipart/mixed; boundary="===============8086920979213112540=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8086920979213112540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xPlWqmdJYj61cSlc"
Content-Disposition: inline


--xPlWqmdJYj61cSlc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2019 at 08:34:35AM +0200, Guennadi Liakhovetski wrote:
> Currently on all supported platforms the IPC IRQ thread first signals
> the sender when an IPC response is received from the DSP, then
> unmasks the IPC interrupt. Those actions are performed without

Please don't send new versions of single patches in the middle of a
series, it makes it really hard to follow what the current version of
the series is.  It's better to resend the whole series.

--xPlWqmdJYj61cSlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz3qLsACgkQJNaLcl1U
h9BM/QgAg4zzmQfbPs0RSTstn6Cv+Kxkd7F/3BLjBozmaQSInhw9rKQeZTmHPyd2
D8UsXW/HbhA4DvY+0nkGBbD+ULpzxXSC1XfjfAAqd+M9/39yMSWJBd7QBkhm33QL
Eh5KlNeX1DirL7CZeQ39iK8PfcojDIfELOKiPNu7mYstbt5Y/6jLzonemcQYwVQ+
y25/1fcmmxSVYaJ7sieSURIL579HT32nnG/olbvaFfyHveijqJ2F4v3RkTBq5QZp
DQoFA/34DCE0s9LJnvI4XV5PH2hSouYFd2suoMY7CDLy3wygoq16AE+vpVZ26EI+
lQru4olf586Ystsw+esVOS3268MUBg==
=7GCB
-----END PGP SIGNATURE-----

--xPlWqmdJYj61cSlc--

--===============8086920979213112540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8086920979213112540==--
