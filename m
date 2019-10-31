Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C23EACE8
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 10:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630272020;
	Thu, 31 Oct 2019 10:54:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630272020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572515707;
	bh=7jWINTGZb3xtACK1W/jpp18RlYW6MDLOuutsalMca5c=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CazEZgZhhzsBJ/9zHYcJxz0HSB9IVR9bPbYM+w+xACCUBtGVxGrS0+zVNvNZnaju/
	 Lw4KZmF77uU59iIGbGZbmbWq055Bt0Ccd1gBN631RKVJ2ysV5TZsvUuUPLc62PXGH2
	 KRE/mkOY8To9ioT9uBQdOXNbLIFMTCIiFaQFMsxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EA7F803CF;
	Thu, 31 Oct 2019 10:53:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98A49F80392; Thu, 31 Oct 2019 10:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D85F802A0
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 10:53:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D85F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JCar7aCf"
Received: from localhost (unknown [122.178.193.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F4B42087F;
 Thu, 31 Oct 2019 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572515594;
 bh=QW7rGRQ20lko7WgAp46i15PtwtIhjseDb6gvGuH4qBs=;
 h=Date:From:To:Cc:Subject:From;
 b=JCar7aCfQ/5RQy8KIyYfHp19KYbL7oPZf6kchKZZJwPwIIbekq5fDtd9r809dBzJ8
 bRoGa3jqsMhBHk9P0+kS2o+s57xrTE269eQOYNiytTvAm/i9Ro15M5KjtKuSRIAplL
 nDpBLVVUZMzN57KPozDl0mYUS3v7diwn6FtvQPYE=
Date: Thu, 31 Oct 2019 15:23:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20191031095307.GB2695@vkoul-mobl.Dlink>
MIME-Version: 1.0
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [GIT PULL] soundwire fixes for v5.4-rc6
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
Content-Type: multipart/mixed; boundary="===============5045408019779763131=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5045408019779763131==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Please pull to receive couple of fixes for soundwire. All these changes
have been sitting in linux-next as well

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.4-rc6

for you to fetch changes up to 7b47ad3322d114736e08cc244a84fe7af9b861f6:

  soundwire: slave: fix scanf format (2019-10-24 16:55:45 +0530)

----------------------------------------------------------------
soundwire fixes for v5.4-rc6

- Kconfig fixes to ensure soundwire is built only for ACPI and DT
  platform
- fix for intel PDI offsets and numbers
- slave scanf format fix

----------------------------------------------------------------
Bard Liao (1):
      soundwire: intel: fix intel_register_dai PDI offsets and numbers

Michal Suchanek (2):
      soundwire: depend on ACPI
      soundwire: depend on ACPI || OF

Pierre-Louis Bossart (1):
      soundwire: slave: fix scanf format

 drivers/soundwire/Kconfig | 1 +
 drivers/soundwire/intel.c | 4 ++--
 drivers/soundwire/slave.c | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

Thanks
--=20
~Vinod

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAl26rwMACgkQfBQHDyUj
g0f1ew/+OuStpx9k0acc5fIsgZY4bxqb2y57K327fISTBneEPCCDMpXDPYjML7ce
AaeLyk1mi8cqa8CmNmcv/6K9vrOoESbxcEcflMpusthum0EzwtAjQrzG6uMxGiOY
DBhMVqmLnnxcIkI/7wFXUUs087cZywj2uyPNHHk1CcDbO0yRAMxjEC7MifgW2DbH
9/1ADf4Ze0zJdgTzrHdKlzKYvHAj+9dARihFqoDjmC0QahzAEAUSSeIgOlHuTF5s
t8GTZ5bPEaR+9xNYH2viVk1QWw8PVIMN2j8gXve7XpML2fpmxXQQXz9q9v69+psc
XsI+D/duULMw/cQI2Bp87Eiq/MyQ1udNHCiWC8NHa1OKEFM2xNsg0dJVaYZuBTVO
7tINUHw2fjTtNMm0VfMwIR65l74oWbnaO+trcyXdqEwhDbCPuJWAr2Vxlt083QF9
xChxEP4WnQeVKGcAq9S8ovHuduo6PsmQz2Ndt8ioGUlLjNM6gf6QBokIdaN6zqLI
OxI6FLH/wN9DuspQl4tZ2ebKr+wkMdz9P0nyR2gP8zEFoFjnD421SIPI8GysTL/A
0W96MZ0RcneussZEaiaFjytZweRrWrw1yirD1aFpOsHMnJhG6FG5M4xywn4oiUTB
s//Jnaha53f3NxSQ6r2Drdy4rd850D+hVpRIZfmQN1zKTqLi7e8=
=IbpA
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

--===============5045408019779763131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5045408019779763131==--
