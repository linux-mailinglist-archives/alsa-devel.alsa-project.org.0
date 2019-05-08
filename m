Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC717462
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 10:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B56718FE;
	Wed,  8 May 2019 10:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B56718FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557305995;
	bh=S8wwToNvaVqBNJZIMLosgS24Rl/6WPBwj3mLLC0QuTk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7eWlHVz96KXmEBj27YY4wFbADhWCRWFnxAex51LbPpkkyRhNcv2tUpJXoguk9mcU
	 HkIiib+oSmNGW8v9oUY6l77KgQ5DkFRYoPW/6yRGpUml0jNSRo2EozHKTvuCL4aAWD
	 YpnjqMGud1OWbUjoUYlYRwpIsvB4i9Y5FEoYjZpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14308F896F0;
	Wed,  8 May 2019 10:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36B7AF896F0; Wed,  8 May 2019 10:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FC04F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 10:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FC04F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="R/IiKVNH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KTjwJzNEtFSkajH3vzYgeB4/wr8Nulp6GSXxHnJTs1w=; b=R/IiKVNHytRDHVp/N5eLDfhDs
 vKurTSDWONqGK7kDJXnhJBuIEAQZCyUomPODNRHRadpwsxEDApU5oPf+fjzItGm3zmR8Qrk+X/11T
 0Z34cRPGkvW9gAuglwnjhnKIUN32a/CNtozggzi0qilCF0vcvONfZId1mWGvRQTd1DPu0=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIOr-0007cn-97; Wed, 08 May 2019 08:58:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id DBC1D44000C; Wed,  8 May 2019 09:57:58 +0100 (BST)
Date: Wed, 8 May 2019 17:57:58 +0900
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20190508085758.GE14916@sirena.org.uk>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
 <20190506095815.24578-3-jbrunet@baylibre.com>
 <20190508070058.GQ14916@sirena.org.uk>
 <fd633a5597703f557d75e43c14213699efe295f0.camel@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <fd633a5597703f557d75e43c14213699efe295f0.camel@baylibre.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] ASoC: hdmi-codec: remove reference
 to the current substream
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
Content-Type: multipart/mixed; boundary="===============7728169634840429516=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7728169634840429516==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xTSxoVlouPBwYsmu"
Content-Disposition: inline


--xTSxoVlouPBwYsmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 10:08:44AM +0200, Jerome Brunet wrote:
> On Wed, 2019-05-08 at 16:00 +0900, Mark Brown wrote:

> > The advantage of mutexes is that they are very simple and clear to
> > reason about.  It is therefore unclear that this conversion to use
> > atomic variables is an improvement, they're generally more complex=20
> > to reason about and fragile.

> The point of this patch is not to remove the mutex in favor of atomic
> operations

Sure, but you mixed in a conversion to atomic operations as well.

> I can put back mutex to protect the flag if you prefer.

> Another solution would be to use the mutex as the 'busy' flag.
> Get the ownership of the hdmi using try_lock() in startup() and
> release it in shutdown()

> Would you have a preference Mark ?=20

Probably using a mutex for the flag is clearer.  I'd rather keep things
as simple as absolutely possible to avoid people making mistakes in
future.

--xTSxoVlouPBwYsmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSmhYACgkQJNaLcl1U
h9BLvgf9EVKAriQdgUhiq7Dz6aMAyyxmJDlqE/NScBYilBPz2t8G+HA2cvFlWiFK
zs5sJD8+Ilb+vIkLNTYWOwVllxdbBD/DYbm5YwxrZ2wF/J0Baa/8aW1UfCnnrtZr
pZnLGa9koscaXO7WSfi736t4neICdQZssXTNKBYfocxxD3ZkL0Yy2fUQRt4/WSr1
+aIF3xIlY+Hc36obOIKYk1Ds+1fIwYGjFtzeeSz8ucaJGI0/GZE3ATnVQ/RjtEly
dSq+r0n7kb/ZLWLDJipmPae0Q4gqdaQ/mtt825n0U5JTJVS5hWjEZHMbX1WhwzvJ
+Tc+JzCa2D7cicvc2W2OsR9GrWD0CA==
=dhQr
-----END PGP SIGNATURE-----

--xTSxoVlouPBwYsmu--

--===============7728169634840429516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7728169634840429516==--
