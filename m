Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E797CE14A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 13:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753921663;
	Mon, 29 Apr 2019 13:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753921663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556537397;
	bh=Azv6BvOLZwf0s0JVqRJxuvv3l8j15LeLoh5Akz5uwS8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pzE3XaL+H2/HXkA953g3FxJkU2IE/jYrDHVxLmt4nAWuzFZnyutOpkSnk7hmdmgED
	 OvqKDffUJktQ39Vu+lW2xDlOHBncig2iFRajQcJ1FGA7teXYKAjiWlsTb2jaCXncwJ
	 Fx3WEaVzMdOa17uImzBf0wHhYddAkxtm/RAzdf3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDBEF80C41;
	Mon, 29 Apr 2019 13:28:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA024F89693; Mon, 29 Apr 2019 13:28:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46AC8F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 13:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46AC8F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XXSiBucS"
Received: from localhost (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19FF12084B;
 Mon, 29 Apr 2019 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556537322;
 bh=gG5FFTjfM5Lp/tmOAVDJhSzr6Q+9Ve90iHqXWOVCsG8=;
 h=Date:From:To:Cc:Subject:From;
 b=XXSiBucSMGlu+xVhMsFO7Y7eE6akiUS4WKkXoAOmDxhD9c8dGixxsLmaULu2cs2rN
 B8CS/xdHBcw3HrtPaQw6yRdOZq/IqAp8JqwbO28jMnGz/k0G1lUz47+8KeJ2gIqNFH
 1C8losMDRA7t82U+CPSgt4OMr5Jou/osDEPahpao=
Date: Mon, 29 Apr 2019 16:58:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190429112829.GH3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [GIT PULL] soundwire updates for v5.2-rc1
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
Content-Type: multipart/mixed; boundary="===============4953711455552681611=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4953711455552681611==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oLBj+sq0vYjzfsbl"
Content-Disposition: inline


--oLBj+sq0vYjzfsbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Greg,

Please PULL to receive updates to soundwire subsystem

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.2-rc1

for you to fetch changes up to 4abbd783d126cabfc20d1b8d50b1d5026b5cba09:

  soundwire: intel: fix implicit header use of module.h/export.h (2019-04-1=
4 15:52:50 +0530)

----------------------------------------------------------------
soundwire updates for v5.2-rc1

This round saw interest from Intel, Linaro and Cadence in
Soundwire. More patches are in pipeline (maybe next cycle)

 - removal of useless initialzation in core
 - couple of header and kcalloc inversion fixes on Intel driver

----------------------------------------------------------------
Paul Gortmaker (1):
      soundwire: intel: fix implicit header use of module.h/export.h

Pierre-Louis Bossart (3):
      soundwire: intel: fix inversion in devm_kcalloc parameters
      soundwire: remove useless initializations
      soundwire: stream: remove useless initialization of local variable

 drivers/soundwire/bus.c        | 2 --
 drivers/soundwire/intel.c      | 5 +++--
 drivers/soundwire/intel_init.c | 2 ++
 drivers/soundwire/stream.c     | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

Thanks
--=20
~Vinod

--oLBj+sq0vYjzfsbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcxt/dAAoJEHwUBw8lI4NHz4AQAJAOb2nb95UYUxrr0RLV+jCv
PRb7otRSeBJMfWcfAFVWdf2i4bdOeD/k4iGxYpYx/nWDtzHtLciZ2u+7S/+z+5bd
KKCYpmuCEkhWgm0USTwuZzNV8DOHTnR8eOTrS79nueJHqZolcPyhnWOBXIpqC8Gd
GiXFxedbsk/pXvs0Rj3HZLxQkFgSPlNg4rW69KWCNUMRpn70BsMv9xAaBrJRs5mx
2XdtUqx8HPxgXXOA5eeo1d/UIZ6/9SSHvSYTb45CE4AVhqvFNnw5R4a/HH3A3Coa
8nk0PAU79FFmHUIS8hpqk2qppL18+byuruiog99myI6J96GeS0UkuWwFX+C2mhdj
4+DzaOBXapO0wB2tv2tqM5IxQAav5yOLywu4FccCzrXSKqv6tBnKjFQMk+0PIz3q
cnmb3+FztSRpDFzYKbTGIabRT2rXjEBiHuh5b9RbjPpQTECdRCr9VyVgFILYinez
EMoidk5kB2ErVa7vx9QQdTapAJPNOeruRXaNGiOZHz+weeECUpNM9R74h35TFTU8
sU1DD8Na48dFW58DGS0s5SDcUgvtQWcGrwhJW4+MtV8ASs9EPIcfdLWKZeB+RMql
BRYg/xaykYvriTaupv3HffnuzrXfwI6nZTNk9uM9mmyfmqKRd7AgS/7YSINQsxxC
UQUF0H8CpChsCpn1a/Is
=I1sV
-----END PGP SIGNATURE-----

--oLBj+sq0vYjzfsbl--

--===============4953711455552681611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4953711455552681611==--
