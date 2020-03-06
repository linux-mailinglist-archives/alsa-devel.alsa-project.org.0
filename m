Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC55517C2F4
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 17:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 396BD1614;
	Fri,  6 Mar 2020 17:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 396BD1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583512182;
	bh=0C+6XHYdJIVmksLjDyIuC4qeEjpyQ2kk5w5i1zngU48=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aK+9oHyaDDqLXvIr5IklLt6QEvdyn1b/4uQvItDmX1BhpG2okqfXp/CHHzGoWRskV
	 VwTDhPF1yhg+XAqPMHd1XjyHt1rL+543UrTbKeH0eLU5xMW5pXQYPI5CUVYGtciGJT
	 wbtMmRnNiFQz6RCluE4J4Om1sgZxv2bKMIqE+Ul8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20907F801EC;
	Fri,  6 Mar 2020 17:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFF2AF801ED; Fri,  6 Mar 2020 17:27:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 82BD0F80125
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 17:27:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82BD0F80125
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8560530E;
 Fri,  6 Mar 2020 08:27:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083E13F237;
 Fri,  6 Mar 2020 08:27:52 -0800 (PST)
Date: Fri, 6 Mar 2020 16:27:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.6
Message-ID: <20200306162751.GC4114@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 96781fd941b39e1f78098009344ebcd7af861c67:

  ASoC: sun8i-codec: Fix setting DAI data format (2020-02-17 21:58:41 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-fix-v5.6-rc4

for you to fetch changes up to 3fb83cbee1de58fcd5d22f1db89460bb7c08b6e8:

  ASoC: wm8741: Fix typo in Kconfig prompt (2020-03-05 12:53:51 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.6

More fixes that have arrived since the merge window, spread out all
over.  There's a few things like the operation callback addition for
rt1015 and the meson reset addition which add small new bits of
functionality to fix non-working systems, they're all very small and for
parts of newly added functionality.

----------------------------------------------------------------
Amadeusz S=C5=82awi=C5=84ski (1):
      ASoC: Intel: Skylake: Fix available clock counter incrementation

Axel Lin (1):
      ASoC: wm8741: Fix typo in Kconfig prompt

Charles Keepax (1):
      ASoC: dapm: Correct DAPM handling of active widgets during shutdown

Dan Carpenter (1):
      ASoC: SOF: Fix snd_sof_ipc_stream_posn()

Dan Murphy (2):
      ASoC: tas2562: Return invalid for when bitwidth is invalid
      ASoC: tas2562: Fix sample rate error message

Dragos Tarcatu (2):
      ASoC: topology: Fix memleak in soc_tplg_link_elems_load()
      ASoC: topology: Fix memleak in soc_tplg_manifest_load()

Jack Yu (2):
      ASoC: rt1015: add operation callback function for rt1015_dai[]
      ASoC: rt1015: modify pre-divider for sysclk

Jerome Brunet (1):
      ASoC: meson: g12a: add tohdmitx reset

Kuninori Morimoto (2):
      ASoC: soc-pcm/soc-compress: don't use snd_soc_dapm_stream_stop()
      ASoC: soc-component: tidyup snd_soc_pcm_component_sync_stop()

Matthias Reichl (1):
      ASoC: pcm512x: Fix unbalanced regulator enable call in probe error pa=
th

Olivier Moysan (1):
      ASoC: stm32: sai: manage rebind issue

Pierre-Louis Bossart (1):
      ASoC: soc-core: fix for_rtd_codec_dai_rollback() macro

Takashi Iwai (3):
      ASoC: intel: skl: Fix pin debug prints
      ASoC: intel: skl: Fix possible buffer overflow in debug outputs
      ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs output

 include/sound/soc.h                   |  2 +-
 sound/soc/codecs/Kconfig              |  2 +-
 sound/soc/codecs/pcm512x.c            |  8 +++++---
 sound/soc/codecs/rt1015.c             |  3 ++-
 sound/soc/codecs/tas2562.c            |  5 +++--
 sound/soc/intel/skylake/skl-debug.c   | 32 +++++++++++++++++---------------
 sound/soc/intel/skylake/skl-ssp-clk.c |  4 +++-
 sound/soc/meson/g12a-tohdmitx.c       |  6 ++++++
 sound/soc/soc-component.c             |  2 +-
 sound/soc/soc-compress.c              |  2 +-
 sound/soc/soc-dapm.c                  |  2 +-
 sound/soc/soc-pcm.c                   | 18 +++++++++---------
 sound/soc/soc-topology.c              | 17 ++++++++++-------
 sound/soc/sof/ipc.c                   |  2 +-
 sound/soc/stm/stm32_sai_sub.c         | 18 ++++++++++--------
 15 files changed, 71 insertions(+), 52 deletions(-)

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5iegYACgkQJNaLcl1U
h9BQxwf+NKp1kaJ1WS1iKTq4X8W6gWdH3fKAaTH3cMsKG7/h7Wphr6R9tok6VipF
0+GKqfvHNLtQEwGctZaNCnq7X9NWzh7ANlBuEcUP+Wc0Adm+FFsrhqkoO7Uft8pB
rDyyn9IRPt38OI9NAejd5q7NKtb9t/vbDL6p7GXr6oxfKc3glepLEAeKxHCoAsKt
ePaPG6Ie+6V1FrYt5Te1V6N23CKf8W3oof6illWX2K4h4WW+Dc4j4QovQfQ7x0/x
/jelecBFwfd4YSeHGAyviyJJZ0il7qw9w5Tk5GHjCZ3oSTU1xQzhft/rk08PaE9s
wj4qovOUwrgwCWERzeHbmE7/PA0Kag==
=Scji
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
