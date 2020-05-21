Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CB61DCFB7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 16:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB30C1838;
	Thu, 21 May 2020 16:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB30C1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590071373;
	bh=45si3ZDX8+CTnWHHDSXuNiYj4XJAuQTAtiOhyfpPBJw=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Mufe4hVPhKjpCHFcaguwnr1ccnTlsIPF5tl2XmgH6IqhQfq3RR8vRJFtxM+brG6JH
	 3c1s03pPqdK4fYcV8/BttMlroaIB5a3CdzmkzVSU7Qn//Xj2q2Ij58aV3F1emlUCqC
	 FpV0ao1n3llIWJdXZsuQocBKOtB1Mg4jm+xTc2RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E91DFF801F8;
	Thu, 21 May 2020 16:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 964B3F801D8; Thu, 21 May 2020 16:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AF00F80161
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 16:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AF00F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OzZJrHdE"
Received: from localhost (unknown [106.200.226.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D77262072C;
 Thu, 21 May 2020 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590071264;
 bh=45si3ZDX8+CTnWHHDSXuNiYj4XJAuQTAtiOhyfpPBJw=;
 h=Date:From:To:Cc:Subject:From;
 b=OzZJrHdEO/x2TOzEntiJeA5o5Bq1eECq/z9U3qNkrOF653dWhh/Lp/Dkx0xg2Gvr/
 cgQ3jLE8xln179VS8r2HPL+ggmTfWYu06Ixch+WIguXK3o5/1oy0OOUHBQ5wDqiNsZ
 vFTxH/QiD600NsGA2TuprtuVvycU8PH11qIMgE00=
Date: Thu, 21 May 2020 19:57:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: [GIT PULL] soundwire updates for v5.8-rc1
Message-ID: <20200521142739.GB374218@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
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


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Please pull to receive updates for soundwire. The big news the
sdw_master_device getting completed along with sysfs attributes for
master and slave devices. That closes the long cleanup work done by
Pierre and Bard for the devices.

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.8-rc1

for you to fetch changes up to fcbcf1f7b56855ffe1cec768cb1013c5a4c854c3:

  soundwire: intel: use a single module (2020-05-20 19:24:55 +0530)

----------------------------------------------------------------
soundwire updates for v5.8-rc1

This contains sdw_master_device patches and other updates done by Intel
folks.

Details:
  - sdw_master_device to represent the master instances.
  - sysfs properties for sdw_master_device and sdw_slave.
  - Documentation update for TDM modes.
  - some code cleanup patches and odd updates.

----------------------------------------------------------------
Bard Liao (2):
      soundwire: bus: add unique bus id
      soundwire: master: add runtime pm support

Guennadi Liakhovetski (2):
      soundwire: (cosmetic) remove multiple superfluous "else" statements
      soundwire: intel: (cosmetic) remove multiple superfluous "else" state=
ments

Kuninori Morimoto (1):
      soundwire: intel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro f=
or DAI pointer

Pierre-Louis Bossart (11):
      soundwire: qcom: fix error handling in probe
      Documentation: SoundWire: clarify TDM mode support
      soundwire: slave: don't init debugfs on device registration error
      soundwire: debugfs: clarify SDPX license with GPL-2.0-only
      soundwire: bus: reduce verbosity on enumeration
      soundwire: bus: rename sdw_bus_master_add/delete, add arguments
      soundwire: bus_type: introduce sdw_slave_type and sdw_master_type
      soundwire: bus_type: add sdw_master_device support
      soundwire: disco: s/ch/channels/
      soundwire: master: add sysfs support
      soundwire: add Slave sysfs support

Rander Wang (1):
      soundwire: intel: use a single module

Samuel Zou (1):
      soundwire: qcom: Use IRQF_ONESHOT

Vinod Koul (2):
      soundwire: fix trailing line in sysfs_slave.c
      soundwire: fix spelling mistake

 .../ABI/testing/sysfs-bus-soundwire-master         |  23 ++
 .../ABI/testing/sysfs-bus-soundwire-slave          |  91 +++++++
 Documentation/driver-api/soundwire/stream.rst      |  89 +++++-
 Documentation/driver-api/soundwire/summary.rst     |   7 +-
 drivers/soundwire/Makefile                         |   8 +-
 drivers/soundwire/bus.c                            |  71 +++--
 drivers/soundwire/bus.h                            |   4 +
 drivers/soundwire/bus_type.c                       |  22 +-
 drivers/soundwire/cadence_master.c                 |   8 +-
 drivers/soundwire/debugfs.c                        |   2 +-
 drivers/soundwire/intel.c                          |  13 +-
 drivers/soundwire/intel_init.c                     |   4 +-
 drivers/soundwire/master.c                         | 172 ++++++++++++
 drivers/soundwire/mipi_disco.c                     |  11 +-
 drivers/soundwire/qcom.c                           |  34 ++-
 drivers/soundwire/slave.c                          |  10 +-
 drivers/soundwire/sysfs_local.h                    |  14 +
 drivers/soundwire/sysfs_slave.c                    | 214 +++++++++++++++
 drivers/soundwire/sysfs_slave_dpn.c                | 300 +++++++++++++++++=
++++
 include/linux/soundwire/sdw.h                      |  32 ++-
 include/linux/soundwire/sdw_type.h                 |   9 +-
 21 files changed, 1066 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-master
 create mode 100644 Documentation/ABI/testing/sysfs-bus-soundwire-slave
 create mode 100644 drivers/soundwire/master.c
 create mode 100644 drivers/soundwire/sysfs_local.h
 create mode 100644 drivers/soundwire/sysfs_slave.c
 create mode 100644 drivers/soundwire/sysfs_slave_dpn.c


--=20
~Vinod

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAl7Gj9sACgkQfBQHDyUj
g0fzshAA0vax3mxArjtFFNhboQ7Z2HALKsebNx1xdY2hVpt+H4CfSM7nOIoI7ZIw
dm+s7GZFzPbmX/CWdQWw1Fbxld0KRuN+28aqGVMgJ5QeYDgJmeoZT2q/UscmXC3s
TadnUfhAEAb5nXI+F91QvP8ex7M0RVMxj6I6Oe/x9APtgKOek/V9zgA3VkBWJaCX
Hpq65rsn1lJUZ4rkCu7m1wKk+5VdhhM7k6FF5sdYOm7Cn0MGEE3lQF7nJFGVjnW8
fiVMNOPyS7qaTs9oAAQM6zQMSBvrqiNPKPME/kT9p43FwUC/ISFOKHArV7gOOw0j
WqfhVA8Wsvm60IaJfsa7qPZIKdm0WFf1c4gKqpTYap22+kDYLlC0v9aWhFT9jtin
gEoPdhaD2mToWbz3hm+GbgdsN8zyUtQxX8HGJ2u2qRcVTPcY4NtBo4rNSRU9wnKy
5pwf1/L/T1uY1y5OrDekuCgIMGGXKlzCrD1VUWLuVxtwvl3jY1lIshOL9Vs7w4Tl
O/WHdQTam7gg232y4VYPd1LTjCZa2WnRZFmgVLdfccHGQeSsJAc9slwAT1TzwGqo
a2a9LEHsLCQGvSNscte45blQJxLoBN4tdLuUViMbrYlbjLFUg1jv+Jtvb7Uv3EyU
fHX+hBe768tzIjXJvjboAR7Y+WYWTlHlnEwa+z+oQ2ws+aFpAaw=
=MoI/
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
