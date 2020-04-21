Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B201A1B3075
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 21:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62FD816CD;
	Tue, 21 Apr 2020 21:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62FD816CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587497755;
	bh=p8+z7h4/lL/ryPfdwNZNUyKmuRRSoMfmiHolqMejUWU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYcSTv8o6dwZy1+EyDtOdbM8Vsje5cHlpqz+dFZZ0cgAyl4Glkxdi+79KhUvr1Wvb
	 Fv3MLSHGHd2Z3M8/hMPSzAXq27dszzc7baGSdYbZjwJegUyMBgXsH1h73VOLt8Yk3p
	 A7gofWKySGJqVw96lXtH8uKZxqwXLPsW6RtvC6n8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 265B9F80143;
	Tue, 21 Apr 2020 21:34:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 032C3F801EC; Tue, 21 Apr 2020 21:34:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4D8DF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 21:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D8DF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b5yIuE/3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC463206D5;
 Tue, 21 Apr 2020 19:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587497640;
 bh=p8+z7h4/lL/ryPfdwNZNUyKmuRRSoMfmiHolqMejUWU=;
 h=Date:From:To:Cc:Subject:From;
 b=b5yIuE/3EARpXKG9dpnt1w/5/99jq2/6ebkSFzpW0clAdqBQPwa7Po4PA9zNNYbQE
 xvtlTnIoH5O5zek+V2yqZO9KsbWNnCHxS+Ai9x3zTx1+/RS9JJq+wwHo+3losFtuZ/
 nGev9c4RE/Gl2JPdt+SXCIpnfbWhxEPpKTxJB5zg=
Date: Tue, 21 Apr 2020 20:33:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fix v5.7-rc2
Message-ID: <20200421193357.GI4540@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline
X-Cookie: Non-sequiturs make me eat lampshades.
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


--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit ccfc531695f3a4aada042f6bdb33ac6be24e1aec:

  ASoC: cs4270: pull reset GPIO low then high (2020-04-07 15:29:54 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/as=
oc-fix-v5.7-rc2

for you to fetch changes up to 1e060a453c8604311fb45ae2f84f67ed673329b4:

  ASoC: wm8960: Fix wrong clock after suspend & resume (2020-04-21 15:43:22=
 +0100)

----------------------------------------------------------------
ASoC: Fixes for v5.7

Quite a lot of fixes here, a lot of driver specific ones but the biggest
one is the revert of changes to the startup and shutdown sequence for
DAIs that went in during the merge window - they broke some older x86
platforms and attempts to fix them didn't succeed so it's safer to just
roll them back and try to make sure those platforms are handled properly
in any future attempt.

The rockchip S/PDIF DT stuff was IIRC for validation issues.

----------------------------------------------------------------
Akshu Agrawal (1):
      ASoC: amd: Fix button configuration

Amadeusz S=C5=82awi=C5=84ski (8):
      ASoC: topology: Add missing memory checks
      ASoC: topology: Check return value of soc_tplg_create_tlv
      ASoC: topology: Check return value of soc_tplg_*_create
      ASoC: topology: Check soc_tplg_add_route return value
      ASoC: topology: Check return value of pcm_new_ver
      ASoC: topology: Check return value of soc_tplg_dai_config
      ASoC: topology: Fix endianness issue
      ASoC: codecs: hdac_hdmi: Fix incorrect use of list_for_each_entry

Bjorn Andersson (1):
      ASoC: qcom: common: Silence duplicate parse error messages

Charles Keepax (4):
      ASoC: dapm: Fix regression introducing multiple copies of DAI widgets
      ASoC: dapm: Move error message to avoid some duplication
      ASoC: dapm: Remove dapm_connect_dai_link_widgets helper
      ASoC: madera: Remove a couple of stray blank lines

Gyeongtaek Lee (1):
      ASoC: dapm: fixup dapm kcontrol widget

Jason Yan (2):
      ASoC: intel: soc-acpi-intel-icl-match: remove useless 'rt1308_2_adr'
      ASoC: Intel: soc-acpi-intel-cml-match: remove useless 'rt1308_2_adr'

Jerome Brunet (2):
      ASoC: meson: axg-card: fix codec-to-codec link setup
      ASoC: meson: gx-card: fix codec-to-codec link setup

Johan Jonker (4):
      ASoC: convert rockchip spdif bindings to yaml
      ASoC: rockchip-spdif: add #sound-dai-cells property
      ASoC: rockchip-spdif: add power-domains property
      ASoC: rockchip-i2s: add power-domains property

Krzysztof Kozlowski (1):
      ASoC: samsung: s3c24xx-i2s: Fix build after removal of DAI suspend/re=
sume

Mark Brown (3):
      Merge series "ASoC: rsnd: Fixes for multichannel HDMI audio output" f=
rom Matthias Blankertz <matthias.blankertz@cetitec.com>:
      Merge series "ASoC: meson: fix codec-to-codec link setup" from Jerome=
 Brunet <jbrunet@baylibre.com>:
      Merge series "ASoC: rsnd: multi-SSI setup fixes" from Matthias Blanke=
rtz <matthias.blankertz@cetitec.com>:

Matthias Blankertz (4):
      ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
      ASoC: rsnd: Fix HDMI channel mapping for multi-SSI mode
      ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
      ASoC: rsnd: Fix "status check failed" spam for multi-SSI

Olivier Moysan (1):
      ASoC: stm32: sai: fix sai probe

Philipp Puschmann (1):
      ASoC: tas571x: disable regulators on failed probe

Pierre-Louis Bossart (2):
      ASoC: soc-dai: revert all changes to DAI startup/shutdown sequence
      ASoC: SOF: Intel: add min/max channels for SSP on Baytrail/Broadwell

Sebastian Fricke (1):
      soc/stm/stm32_sub_sai: Add missing '\n' in log messages

Sebastian Reichel (1):
      ASoC: sgtl5000: Fix VAG power-on handling

Shengjiu Wang (1):
      ASoC: wm8960: Fix wrong clock after suspend & resume

Srinivas Kandagatla (1):
      ASoC: wsa881x: mark read_only_wordlength flag

Stephan Gerhold (2):
      ASoC: soc-pcm: dpcm: Only allow playback/capture if supported
      ASoC: q6dsp6: q6afe-dai: add missing channels to MI2S DAIs

YueHaibing (1):
      ASoC: wm89xx: Add missing dependency

 .../devicetree/bindings/sound/rockchip-i2s.yaml    |   3 +
 .../devicetree/bindings/sound/rockchip-spdif.txt   |  45 -------
 .../devicetree/bindings/sound/rockchip-spdif.yaml  | 101 ++++++++++++++
 include/sound/soc-dai.h                            |   1 -
 include/sound/soc.h                                |   3 +
 sound/soc/amd/acp3x-rt5682-max9836.c               |   6 +-
 sound/soc/codecs/Kconfig                           |   3 +
 sound/soc/codecs/hdac_hdmi.c                       |   6 +-
 sound/soc/codecs/madera.c                          |   4 -
 sound/soc/codecs/sgtl5000.c                        |  34 +++++
 sound/soc/codecs/sgtl5000.h                        |   1 +
 sound/soc/codecs/tas571x.c                         |  20 ++-
 sound/soc/codecs/wm8960.c                          |   3 +-
 sound/soc/codecs/wsa881x.c                         |   4 +
 sound/soc/intel/common/soc-acpi-intel-cml-match.c  |   8 --
 sound/soc/intel/common/soc-acpi-intel-icl-match.c  |   8 --
 sound/soc/meson/axg-card.c                         |   4 +-
 sound/soc/meson/gx-card.c                          |   4 +-
 sound/soc/qcom/apq8096.c                           |   4 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |  16 +++
 sound/soc/qcom/sdm845.c                            |   4 +-
 sound/soc/samsung/s3c-i2s-v2.c                     |  57 --------
 sound/soc/samsung/s3c2412-i2s.c                    |  56 ++++++++
 sound/soc/sh/rcar/ssi.c                            |  11 +-
 sound/soc/sh/rcar/ssiu.c                           |   2 +-
 sound/soc/soc-dai.c                                |  11 +-
 sound/soc/soc-dapm.c                               | 147 +++++++++++------=
----
 sound/soc/soc-pcm.c                                |  13 +-
 sound/soc/soc-topology.c                           | 115 ++++++++++++----
 sound/soc/sof/intel/bdw.c                          |  16 +++
 sound/soc/sof/intel/byt.c                          |  48 +++++++
 sound/soc/stm/stm32_sai_sub.c                      |  14 +-
 32 files changed, 509 insertions(+), 263 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-spdif.=
txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip-spdif.=
yaml

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6fSqUACgkQJNaLcl1U
h9CjrAf8DbuIcVDnum4yrphk4gTfx/9QlWm5u9fGniR7ZycLpncCKEG9fZQFLdSm
jt39FbedXYVC6Fj3rA8KQ+FVjCA0CXf46RDPssmK0XmSfMVhzo96t6gxQedKZzWs
LgebmKrWXvigR0afdakh/QoybFeDmHzggNAH+B8zdz1MulZ2VH1v8/JQXBcH0VQA
zeGu5GoaHx1hlm+FF86cuhWVNyVWpkGa4CJwsN8287MQGNq1UPp7IhoGUSKz5rG7
BUZVD30g/6O9Oweonq/2ITPpe1mLrNj2pIWn/Nd18MsI/51tFUgE5lq40PkA9BvC
FnlVV27gKtww0i1UwCyfICqKlU2zOg==
=Ea9U
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
