Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACD44B678
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 12:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB6216A4;
	Wed, 19 Jun 2019 12:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB6216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560941428;
	bh=twLoAhPdIEVTEhPNFn1qVQBqWGCWQ3hs5Is6sPQdFp4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNFLzmN9nFVGCZuYRbdJaNYYQiiA1xw6+sKZuZ/SgukaSJmwPQX8HH28hujxAAtcB
	 gTHuZ/mjrX4mJNOywljUc8EqR+9Zjd9Xa8+xo+CM6fU3zdJFEzKWNC/UMV7/EjrXVm
	 gAnCexwiFsMLjfdeJ/A823tnWzHPoYgEGWdKULLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D9AF89682;
	Wed, 19 Jun 2019 12:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E54C0F896B8; Wed, 19 Jun 2019 12:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3D8F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 12:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3D8F808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vYvV0+I4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFoThdm8+JY9skCYeK/lGe4plwxhDJdKl3xKyP/AphU=; b=vYvV0+I4vDAktY1JqRzuCX4Ar
 dXm4oX/HJbTUc8H+9pRl5Q/XADSCGvdBj9190s12JcURFNXRLONCfCRWvbHx8SYKB/BiCqCoyFnav
 BtRQz6JUExA2ErQEzUum84cbuCI4lk633NVoHDhHcmxSnEJ9iCvoDxkcqy5j7rgBNNPis=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdY8m-00070N-5M; Wed, 19 Jun 2019 10:48:32 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 94E46440046; Wed, 19 Jun 2019 11:48:31 +0100 (BST)
Date: Wed, 19 Jun 2019 11:48:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <20190619104831.GQ5316@sirena.org.uk>
References: <20190618181539.9169-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190618181539.9169-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: Intel: sof-rt5682: add MCLK
 support for BYT platform
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
Content-Type: multipart/mixed; boundary="===============3474689786432206818=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3474689786432206818==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLvi8k+ew82wFfnH"
Content-Disposition: inline


--SLvi8k+ew82wFfnH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 02:15:38AM +0800, Bard liao wrote:
> From: Xun Zhang <xun2.zhang@intel.com>
>=20
> The sof-rt5682 machine driver currently uses BCLK on BYT/Minnowboard
> platform. The MCLK signal is available since the Turbot revision, so
> enable MCLK on BYT/Minnowboard Turbot platform.
>=20
> Signed-off-by: Xun Zhang <xun2.zhang@intel.com>
> Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
> ---

If you've got an ack or other tag for a patch you should carry that
forward to new postings unless there's some reason to remove it.

--SLvi8k+ew82wFfnH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0KEv4ACgkQJNaLcl1U
h9BekAf+Kdpq1fuCR3RmHbadwWkKbu1kEwnn3loLqguUmgjSf3hFieDhoBX36VPI
ByM1pyv66P5nZri7y6WlQkPVcu0wwh9akqYN9wPQHJW8WQx6M8i55ghkiy3M/Mz8
2fhQuMFIat8RR6uKXxOuHfHiIfF6fl1m03uc2vj7tymVivpq653vgOo5cY6N69AH
+dAOLAscubwfaY0g5OhOwvP/uMkx7Mauvr1qVim3zGScTuIO30jFDyAe8ulFiK34
Ykn68uxHdXVmt/7QaRN4w7Rbp/lXnMnAyp2Ksqdb+23mbDoLH3oYSVcYctvgt7h6
C0uKHhY/a3W91CYjI8R7WiX9j8bUDQ==
=vLU/
-----END PGP SIGNATURE-----

--SLvi8k+ew82wFfnH--

--===============3474689786432206818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3474689786432206818==--
