Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9486BF5EC9
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 12:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 061E7168B;
	Sat,  9 Nov 2019 12:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 061E7168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573299453;
	bh=ZD2XXDIEoPKL3ZTS84vUamNxrQaa04CerkdCpWmlTBM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s7FYikMECvI0JcMvLKonVJWFbS/tFHZO9gKosqLvhPgTRq+zyVE5+3lh+dHafz0c/
	 HZvVaamXoGZEPP32gAacz5oarDydbjl//cD/39jZxzl3U+rDton9fhJPzbcRlLsWpP
	 ry4sB7H883xVqpieDxrHsLYEFYYw3+uQhG8wWGRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AE6F80446;
	Sat,  9 Nov 2019 12:35:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5165F8049B; Sat,  9 Nov 2019 12:35:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1588FF800D3
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 12:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1588FF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DYi9/wRH"
Received: from localhost (unknown [122.167.114.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DFC721882;
 Sat,  9 Nov 2019 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573299338;
 bh=cQXBX0OJ9C7Kz28crSa+G0G6zQ5T8jmPKuqN+fpt810=;
 h=Date:From:To:Cc:Subject:From;
 b=DYi9/wRH4IzALSQ6qkLY/wFx4oW1OFB3EKrtBsVZoaxs42/LHiqWNdXJ+MggqN2G6
 ae9HzXCYGCvI0gcPbAs9aRH4CV+V1c7bP2WMIWPezDtxPmt4hi/E/SR5RC7xtPjU7N
 QyhqRCf73eR0HSwArH5M0kGx6yd/AzqUFO0ENJvI=
Date: Sat, 9 Nov 2019 17:05:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20191109113527.GE952516@vkoul-mobl>
MIME-Version: 1.0
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [GIT PULL] soundwire update for v5.5-rc1
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
Content-Type: multipart/mixed; boundary="===============2129426419355261013=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2129426419355261013==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Here is the soundwire updates for v5.5-rc1. I may send another pull
request with more changes which are under review next week. This time we
have few core changes and bunch of changes to Intel drivers.

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.5-rc1

for you to fetch changes up to 2e8c4ad1f04413a4a67ef10746a7566007d2ed55:

  soundwire: ignore uniqueID when irrelevant (2019-11-09 16:46:56 +0530)

----------------------------------------------------------------
soundwire updates for v5.5-rc1

This round we have bunch of core and Intel driver updates spearheaded
by Pierre

Details
 - Update unique id checks in core and ACPI helpers
 - Improvements to to Intel driver and cadence lib

----------------------------------------------------------------
Bard Liao (2):
      soundwire: intel: remove playback/capture stream_name
      soundwire: cadence_master: improve PDI allocation

Pierre-Louis Bossart (14):
      soundwire: intel: add missing headers for cross-compilation
      soundwire: intel: remove X86 dependency
      soundwire: remove DAI_ID_RANGE definitions
      soundwire: cadence/intel: simplify PDI/port mapping
      soundwire: intel: don't filter out PDI0/1
      soundwire: intel/cadence: fix startup sequence
      soundwire: cadence_master: add hw_reset capability in debugfs
      soundwire: intel: add helper for initialization
      soundwire: intel/cadence: add flag for interrupt enable
      soundwire: cadence_master: make clock stop exit configurable on init
      soundwire: intel: fix PDI/stream mapping for Bulk
      soundwire: remove bitfield for unique_id, use u8
      soundwire: slave: add helper to extract slave ID
      soundwire: ignore uniqueID when irrelevant

Vinod Koul (1):
      soundwire: intel: use correct header for io calls

 drivers/soundwire/Kconfig          |   2 +-
 drivers/soundwire/bus.c            |   7 +-
 drivers/soundwire/cadence_master.c | 292 +++++++++++++++++----------------=
----
 drivers/soundwire/cadence_master.h |  39 ++---
 drivers/soundwire/intel.c          | 201 ++++++++-----------------
 drivers/soundwire/intel_init.c     |   1 +
 drivers/soundwire/slave.c          |  98 ++++++++++---
 include/linux/soundwire/sdw.h      |   7 +-
 8 files changed, 295 insertions(+), 352 deletions(-)

Thanks
--=20
~Vinod

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAl3GpH8ACgkQfBQHDyUj
g0eoAQ//bAFsDbTiqbiNm7U3dBR7Hex8a+woP0J2wlLAJ/+rXAmM4FihEfUvDBMv
lxYGTtqWsox4K5DbrnpUAsk2OOGWHdLhrXn/9ZeTOgCOK3MfCcr4jxu8JfaJegIv
M8mtq4iygjhZjgbw2i9PQELPu0M19LvXjEX+wrDX6lswmb/MeFBzgWJ17Qy3d7FC
tti+VgwJFy9Ma5h3Q+kaa/z8dvP5wg2iXJhtj1ExDpOSNmpsoZuiL/K0XNYUDNk7
ViaxTkIohrdheyoYjUwT2jMHBvMtby+/i6T8oH2n2y3hrB4XjNErMgmaj0Ot3wHQ
GbFpRbvky4doyovPCil8DRNimvxBmjB6VZbMvOSvgXxxy0WcPnBJm8nuOCJOR7fC
kVTMnGlKARoX7vxfJDV/4fSTgs2GWn0LcunJN+l3bIiRuwEol3ARw67WsbhOnf7x
h2zLUlbfn07GFuktsOLiz8Dl22XQKz24bpAbNiBLBWzIl/fesBcJ3JFsEppsw2BF
6A7lEZzvxajkxahrOUE6keiS/iMMnjMzl+k7o8HiwCydzoi3RnWB14k2OaP3CY0p
MkM9B7ccPM78JR8sNuouKZ+56O65OMK2R7nUTHVBfrh0XXrUGM3T5QPRA9LWTOg3
p62wBhCiFw3FINcMLqH0Sm9wjrcNna2fIBuD0Qpve94WeCtspJE=
=J4DV
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--

--===============2129426419355261013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2129426419355261013==--
