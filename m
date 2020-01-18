Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0560141648
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2020 08:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABCAD17BF;
	Sat, 18 Jan 2020 08:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABCAD17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579330914;
	bh=LzmQLETIDqNCHRYM4F0SejRDnCK6tdZ30VLM7cchyx4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fCV67lofQeXfeA308h7bOAoSs8NHe3JF7nKCdG3HYDGfnk04QkJpfAQdPJ9CYzq3Z
	 UKxcEkC4j1Qe8M9f0VGqxYgYBuoBkZoUaZ4YiE9606cjYqnw003/yloobGvZwKIVWr
	 H2lyUqc4tqhXwls973a16idktPdZ13IiP3Ys+FxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86032F800AA;
	Sat, 18 Jan 2020 08:00:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88763F8014E; Sat, 18 Jan 2020 08:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C99CCF80126
 for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2020 07:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C99CCF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H5hsh+bs"
Received: from localhost (unknown [171.61.88.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6378B24687;
 Sat, 18 Jan 2020 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579330792;
 bh=iem9dpbUJv5W79Ig20Qtuu/JUjWJvQ+ft+3dxHYuXKY=;
 h=Date:From:To:Cc:Subject:From;
 b=H5hsh+bsAfYkgHoBqpzGXvn1ch4FR4aOzOcJPRoII9Lxfm8njD/FHALu+FULDmBV/
 j4pF/DJ032Lm83mcOTDGLDJwqzxIpbm+e6vbmpTa3kSNqoi49EPojXbGgYxn5uHKhk
 kMRQtv3CK0/PBF2HhZnRLXNKDpMXfsVsP8N/oJ50=
Date: Sat, 18 Jan 2020 12:29:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200118065948.GX2818@vkoul-mobl>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [GIT PULL]: soundwire updates for v5.6-rc1
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
Content-Type: multipart/mixed; boundary="===============6835929429507978207=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6835929429507978207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O5XBE6gyVG5Rl6Rj"
Content-Disposition: inline


--O5XBE6gyVG5Rl6Rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

Here are the updates for soundwire for v5.6-rc1. I have also shared tag
'sdw_interfaces_2_5.6' to ASoC folks, they might be merging that for
cross tree dependency of ASoC drivers (soundwire slaves)

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.6-rc1

for you to fetch changes up to 5098cae1f79cc0580dc2741ce250307a60451eca:

  dt-bindings: soundwire: fix example (2020-01-16 17:36:40 +0530)

----------------------------------------------------------------
soundwire updates for v5.6-rc1

This round we have bunch of updates to interfaces for ASoC (audio)
subsystem by Intel and a new Qualcomm controller driver

Details
 - Updates for sdw_slave interfaces for ASoC
 - Updates to cadence library and intel driver
 - New Soundwire controller for Qualcomm masters
 - Rework of device number assignment

----------------------------------------------------------------
Bard Liao (4):
      soundwire: intel: update headers for interrupts
      soundwire: intel: add link_list to handle interrupts with a single th=
read
      soundwire: intel: fix factor of two in MCLK handling
      soundwire: intel: report slave_ids for each link to SOF driver

Pierre-Louis Bossart (16):
      soundwire: sdw_slave: add probe_complete structure and new fields
      soundwire: sdw_slave: add enumeration_complete structure
      soundwire: sdw_slave: add initialization_complete definition
      soundwire: sdw_slave: track unattach_request to handle all init seque=
nces
      soundwire: intel: update interfaces between ASoC and SoundWire
      soundwire: intel: add mutex for shared SHIM register access
      soundwire: intel: add clock stop quirks
      soundwire: stream: remove redundant pr_err traces
      soundwire: cadence_master: filter out bad interrupts
      soundwire: cadence_master: log more useful information during timeouts
      soundwire: cadence_master: handle multiple status reports per Slave
      soundwire: bus: check first if Slaves become UNATTACHED
      soundwire: cadence: update kernel-doc parameter descriptions
      soundwire: cadence: remove useless variable incrementation
      soundwire: bus: fix device number leak on errors
      soundwire: cadence: fix kernel-doc parameter descriptions

Rander Wang (4):
      soundwire: intel: update stream callbacks for hwparams/free stream op=
erations
      soundwire: intel: add prototype for WAKEEN interrupt processing
      soundwire: cadence_master: clear interrupt status before enabling int=
errupt
      soundwire: cadence_master: remove config update for interrupt setting

Srinivas Kandagatla (3):
      dt-bindings: soundwire: add bindings for Qcom controller
      soundwire: qcom: add support for SoundWire controller
      dt-bindings: soundwire: fix example

Vinod Koul (1):
      Merge branch 'topic/sdw_intel' into next

 .../devicetree/bindings/soundwire/qcom,sdw.txt     | 167 ++++
 .../bindings/soundwire/soundwire-controller.yaml   |   2 +
 drivers/soundwire/Kconfig                          |   9 +
 drivers/soundwire/Makefile                         |   4 +
 drivers/soundwire/bus.c                            |  55 +-
 drivers/soundwire/cadence_master.c                 |  66 +-
 drivers/soundwire/intel.c                          |  23 +-
 drivers/soundwire/intel.h                          |  13 +-
 drivers/soundwire/intel_init.c                     |  32 +-
 drivers/soundwire/qcom.c                           | 861 +++++++++++++++++=
++++
 drivers/soundwire/stream.c                         |   8 -
 include/linux/soundwire/sdw.h                      |  23 +-
 include/linux/soundwire/sdw_intel.h                | 167 +++-
 13 files changed, 1351 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
 create mode 100644 drivers/soundwire/qcom.c

Thanks
--=20
~Vinod

--O5XBE6gyVG5Rl6Rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAl4irOMACgkQfBQHDyUj
g0fy3hAAvem9d5zAqveSbm2n9ZOjJWwAVKw/wzrsldIAU7n/ovvJPza6evV3Bw7H
2+y/kSa5Qyn5ZhrBYoqoIUD3Em/G8vCwkvLaOQeDsAv0zVLQ5yjn0iVB6gLia2eO
Bd1w9ZogPGrtFLqBa/BFljeUmnEox+HdJ7efvzLlQTzD24krU5NlAB8y985ltdpU
wc3RQEU/r4cyVGszuZrt2mzWPRtTydo/2SPBL5VnGvOuGCjOMnaBRkNGedAVv/rF
f4exH0ojKuRXFHa/pmhMebI2bfrNTzkTFMPgcLcfOhGdbh+vyDO0+1ONJKZ/P1jx
cBswTbl7hj838QJTKWNrT/VL+KX94mmPUu7U3IPy/bsDQ517MSiSPBnC2MfCm5w/
CJwC3gRJPJkGlX9HKNflkDjMiurqR2F0dOpJedhRj97Qb0r8IXoJP/C4olpLWp8I
jFuZjCPReaiNsPQ0itRToVajOla83STr3udWBjz/2n+UGPefsv5fDKy4HHRjLQGc
PIVu424+YZiOX27xQ4j/pcMtNnbU/yBi5b0uPaiuUVbgRZHR5itjG9Br2UnxaXmh
jPqZ1l5HFAQytNumcihQPzb/fXxqMj0nnYhTV18VpYzf4KVvB+8RwQVNYAgvrDh6
yeVA8byq4x+Dj8r2wZbxOhyi/Dt8KUhVEW6R17mqQ1Uppr4juLc=
=S1GA
-----END PGP SIGNATURE-----

--O5XBE6gyVG5Rl6Rj--

--===============6835929429507978207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6835929429507978207==--
