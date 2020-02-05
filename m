Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D51211528A4
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 10:48:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AACB1685;
	Wed,  5 Feb 2020 10:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AACB1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580896136;
	bh=RdHi1XjOE1olSRHYaNPW+6ixHL/nsbQP4f+HcamuqY0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EbEJnrR9T8XgjjYv6u9CVk7dWNGoj7j24EcaKOzAc5GjxZ23yXECDLzOUrhhuivT2
	 PCZlZu7kBHSRhmMODtbGnAq3SGclZTeUdA63GcLFnAmz7cxk2DbGgTvwIRIf9b7yBl
	 vIwu3eAumA/OTxoQeeV5SL1pR0ACpfZLJaNpDlXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AA3DF80142;
	Wed,  5 Feb 2020 10:47:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE067F800E2; Wed,  5 Feb 2020 10:47:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22B19F800E2
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 10:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B19F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nLBFwa0i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w6VyfKiTatNmRb28ONiB+lgDslmqOhquY7mxgQks45I=; b=nLBFwa0imk+qWzl8JHWI/NXh1
 AeGNSGxc2VysNlYJTb00vhM/41FmsFg14k5S+QqN40nRbMu3lcP3cW1vjQTBwoj/uzv3kx0+DU1Op
 2oRbM7Qnx6DNvX3SWwKf7amB8bp847J2dOO4kLBTuymrDBimoyU7lRiKzcONDxKjSQmVE=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izHH1-0003nO-P2; Wed, 05 Feb 2020 09:47:07 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3132FD01A54; Wed,  5 Feb 2020 09:47:07 +0000 (GMT)
Date: Wed, 5 Feb 2020 09:47:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200205094707.GD3897@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [GIT PULL] ASoC fixes for v5.6
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
Content-Type: multipart/mixed; boundary="===============4384191682714538893=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4384191682714538893==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4ivd53YxxNwCQqF"
Content-Disposition: inline


--j4ivd53YxxNwCQqF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit d8e2e0d2491e78f3f7b451c3a93ba29950efe2cf:

  ASoC: soc-core: remove null_snd_soc_ops (2020-01-23 12:20:06 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v5.6-2

for you to fetch changes up to 42b716359beca10684195fd6e93a74ecd8ca8003:

  ASoC: wcd934x: Add missing COMMON_CLK dependency (2020-02-04 11:22:30 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.6

A collection of updates for bugs fixed since the initial pull
request, the most important one being the addition of COMMON_CLK
for wcd934x which is needed for MFD to be merged.

----------------------------------------------------------------
Akshu Agrawal (1):
      ASoC: amd: Fix simultaneous playback and capture

Bard Liao (1):
      ASoC: intel: soc-acpi-intel-icl-match: fix rt715 ADR

Guennadi Liakhovetski (2):
      ASoC: SOF: fix an Oops, caused by invalid topology
      ASoC: Intel: consistent HDMI codec probing code

Jon Hunter (1):
      ASoC: tegra: Revert 24 and 32 bit support

Kai Vehmanen (3):
      ASoC: SOF: Intel: refactor i915_get/put functions
      ASoC: SOF: Intel: do not disable i915 power during probe
      ASoC: SOF: trace: fix unconditional free in trace release

Marek Szyprowski (1):
      ASoC: max98090: silence lockdep warning

Nathan Chancellor (1):
      ASoC: rt1015: Remove unnecessary const

Oder Chiou (1):
      MAINTAINERS: Remove the Bard Liao from the MAINTAINERS of Realtek CODECs

Pan Xiuli (1):
      ASoC: SOF: pci: add missing default_fw_name of JasperLake

Pierre-Louis Bossart (2):
      ASoC: SOF: core: free trace on errors
      ASoC: SOF: core: release resources on errors in probe_continue

Ravulapati Vishnu vardhan rao (1):
      ASoC: amd: Fix for Subsequent Playback issue.

Srinivas Kandagatla (1):
      ASoC: wcd934x: Add missing COMMON_CLK dependency

Takashi Iwai (4):
      ASoC: rt1308-sdw: Add __maybe_unused to PM callbacks
      ASoC: rt700: Add __maybe_unused to PM callbacks
      ASoC: rt711: Add __maybe_unused to PM callbacks
      ASoC: rt715: Add __maybe_unused to PM callbacks

Yong Zhi (1):
      ASoC: SOF: Intel: add PCI ID for JasperLake

 MAINTAINERS                                       |  1 -
 sound/soc/amd/raven/acp3x-i2s.c                   | 12 ++++---
 sound/soc/amd/raven/acp3x-pcm-dma.c               | 14 ++++-----
 sound/soc/codecs/Kconfig                          |  1 +
 sound/soc/codecs/max98090.c                       |  3 +-
 sound/soc/codecs/rt1015.c                         |  2 +-
 sound/soc/codecs/rt1308-sdw.c                     |  4 +--
 sound/soc/codecs/rt700-sdw.c                      |  4 +--
 sound/soc/codecs/rt711-sdw.c                      |  4 +--
 sound/soc/codecs/rt715-sdw.c                      |  4 +--
 sound/soc/intel/boards/bxt_da7219_max98357a.c     | 14 ++++-----
 sound/soc/intel/boards/bxt_rt298.c                | 14 ++++-----
 sound/soc/intel/boards/cml_rt1011_rt5682.c        | 13 ++++----
 sound/soc/intel/boards/glk_rt5682_max98357a.c     | 16 +++++-----
 sound/soc/intel/boards/sof_rt5682.c               | 15 ++++-----
 sound/soc/intel/common/soc-acpi-intel-icl-match.c |  2 +-
 sound/soc/sof/core.c                              | 38 ++++++++++-------------
 sound/soc/sof/intel/hda-codec.c                   | 21 ++++---------
 sound/soc/sof/intel/hda.c                         |  3 +-
 sound/soc/sof/intel/hda.h                         |  7 ++---
 sound/soc/sof/pcm.c                               | 10 ++++++
 sound/soc/sof/pm.c                                |  4 +++
 sound/soc/sof/sof-pci-dev.c                       |  3 ++
 sound/soc/sof/trace.c                             |  7 +++--
 sound/soc/tegra/tegra30_i2s.c                     | 25 +++------------
 25 files changed, 118 insertions(+), 123 deletions(-)

--j4ivd53YxxNwCQqF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl46jxoACgkQJNaLcl1U
h9C8tQf7BnlqKDrWsIyoXOGdzSa6qKnMNQGfFuR0zeYf7oUaE/2SKfSzj0NsxRQJ
ncWFuo17sxt8m7JBozZGZ4W8+pmLvB/QmsSciwL9HbDv+VkL6IFim/Ibi8CPZLH7
sJqRmTxKZSSoghi4ACEy0HVyjsOalJTZvWq3jNYa1bg3YxInwTfs+B1ljYmjvcaf
o2UybNRNUi6dG3i0bXR/C7KDqsVTTfo60sWEm8b38p2/sKpLx8Kqdb6nG+NwZiFJ
AU20UZSsqjT8Sy8JEoHTxlN2Blon8FOVaXR5x/zXMEgmHbYk+uAxRCP0TefYOF2v
WDAT4JkBcgBVG8JH7kaaQ7imD+IVnw==
=dFf2
-----END PGP SIGNATURE-----

--j4ivd53YxxNwCQqF--

--===============4384191682714538893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4384191682714538893==--
