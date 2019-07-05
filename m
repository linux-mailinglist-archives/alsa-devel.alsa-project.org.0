Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C8B6007D
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 07:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56233169F;
	Fri,  5 Jul 2019 07:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56233169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562303595;
	bh=WzL3WXO0Oiu01Rd78TYV3vIxsWzxC3ylqn39VE0vvkg=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f0lUHKy5AbkX2DE7/LfvH5nbkox69xcffKD/h+oRGPSlYky+hwNe4izCm3qWaOjUc
	 Ebq6PAlePdxWlpH0pfmuzd2xM549QdnkrV9h1oFzsRkvFW/VY1VaXxMPqAP6eztAGa
	 OjFvUxxmq117o5Jcqwr0CBPceZbTtlmZfPk/nGkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98AF1F80120;
	Fri,  5 Jul 2019 07:11:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D7F5F8011F; Fri,  5 Jul 2019 07:11:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8C60F800E6
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 07:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C60F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jg2oeaZt"
Received: from localhost (unknown [122.167.76.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A9B0216FD;
 Fri,  5 Jul 2019 05:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562303483;
 bh=bRpit7k3+POn9DvEoDSWbXaKbcM5/RRFJX8v30ubCX0=;
 h=Date:From:To:Cc:Subject:From;
 b=jg2oeaZtmRZFU+18VN61a0b1jhXi7/TpNdNQWmSH7Kkp+mLnxM2Rp8Mb3QMVOFgxZ
 9yKAF3oomaIztJ5YtJE6j9S3UNC+qnW5zRXhr6mNLlXVSk69km8ZSC1I7yqAx3Y3lJ
 rhkiYocCwWxtCe2q7HhC+sdG9tNiFJ3AbGzoIGEc=
Date: Fri, 5 Jul 2019 10:38:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20190705050813.GT2911@vkoul-mobl>
MIME-Version: 1.0
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [GIT PULL]: soundwire updates for v5.3-rc1
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
Content-Type: multipart/mixed; boundary="===============4615413336554496662=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4615413336554496662==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

Please pull to receive the updates for soundwire for v5.3.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-5.3-rc1

for you to fetch changes up to 2aeac95d1a4cc85aae57ab842d5c3340df0f817f:

  soundwire: add module_sdw_driver helper macro (2019-07-01 11:52:43 +0530)

----------------------------------------------------------------
soundwire updates for v5.3-rc1

Updates for 5.3 include:
 - module_sdw_driver macro for drivers
 - Documentation updates for code-blocks
 - Improvement from Pierre on intel and cadence driver
 - Clarification of DisCo properties and updates

----------------------------------------------------------------
Jan Kotas (1):
      soundwire: cdns: Fix compilation error on arm64

Mauro Carvalho Chehab (1):
      docs: soundwire: locking: fix tags for a code-block

Pierre-Louis Bossart (15):
      soundwire: intel: filter SoundWire controller device search
      soundwire: mipi_disco: fix master/link error
      soundwire: add port-related definitions
      soundwire: remove master data port properties
      soundwire: mipi-disco: remove master_count property for masters
      soundwire: rename 'freq' fields
      soundwire: mipi-disco: fix clock stop modes
      soundwire: clarify comment
      soundwire: rename/clarify MIPI DisCo properties
      soundwire: cadence_master: use rate_limited dynamic debug
      soundwire: cadence_master: log Slave status mask on errors
      soundwire: cadence_master: check the number of bidir PDIs
      soundwire: Intel: add log for number of PCM and PDM PDIs
      soundwire: fix typo in comments
      soundwire: intel_init: add checks on link numbers

Srinivas Kandagatla (1):
      soundwire: add module_sdw_driver helper macro

 Documentation/driver-api/soundwire/locking.rst |  4 +-
 drivers/soundwire/bus.c                        |  6 +-
 drivers/soundwire/cadence_master.c             | 30 +++++----
 drivers/soundwire/intel.c                      | 17 +++--
 drivers/soundwire/intel.h                      |  2 +-
 drivers/soundwire/intel_init.c                 | 25 +++++++-
 drivers/soundwire/mipi_disco.c                 | 35 +++++-----
 drivers/soundwire/stream.c                     |  8 +--
 include/linux/soundwire/sdw.h                  | 88 ++++++++++++++++++++--=
----
 include/linux/soundwire/sdw_type.h             | 11 ++++
 10 files changed, 162 insertions(+), 64 deletions(-)

--=20
~Vinod

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdHts9AAoJEHwUBw8lI4NHcdsQAJRMhyfZPdEo3XB+L3REtCC1
RuJz8AsFt5evH4yD+cMUPeSV8kAV3h2WjjcPH3N2d7oZS/8zkTj4POce7+2L2iLi
kP9Z8x+LiSHrpgGZd+9Wp+Y/0MWHZp7sUH9p9RxO5r39wVCVKiy9eCw8ZOx46IBM
1JBueQAot0N0MeCrnfwpv+OaCOrnrfO0ITaPypBXvbNtDAtFSpmHDmAgoVKcF1Cd
yfic4xCOdBVRByLJe/3C1kP3iU7T35sXYk5ONjFGo3Smgl94Th973nHli84cWxwW
WCKU9lSm1A0n4GKMYBEmlZmhIe9+n/e3EXKxAkpV689s/uSqresl+utjM8f4JOEu
dEhNDCK6+RvIxgwCFGGbM5nBdIMieE6vzycyyuPBHLEKLe97pY5GcV0nISGghZxZ
m7hDxNFqrmmCEyJ2sXXdljuDvfLkP5K+Q7msTHWllM48n82wIC+5UHStQOgFmheR
MzItfk84Owikx7vRvOBzPmdkceiks/5eEKuDOltI9y+xg6onfXub5cxiSz+yjPdw
s/KUOudlZrRhby8SUoldSBVfIf/CKqpVxmYFyqnpu/YSeIlRKmPFm3xpMjygRU/E
LKMrFvWJKMIj+NWAizwjdaF6DQ0L0GykxMgOPyARQUbaYvIBbYcSjqV94skn9Dg4
4QenkRxulsytX6KI3kfk
=5Z75
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============4615413336554496662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4615413336554496662==--
