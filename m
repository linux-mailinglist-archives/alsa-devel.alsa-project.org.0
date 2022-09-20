Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA65BE44E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 13:20:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4EC5851;
	Tue, 20 Sep 2022 13:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4EC5851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663672834;
	bh=gMu1L0UxD77BmG7TUXb6/TEzjsA1ibRosS8h3TAh7PM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlLFwbprSJrpBSt4DxCLz7yv+2/jsw6at5Qx6rLv5HwPcUZ/PVCbIWoShCK9zYo9w
	 lPKke/Xd5p2HucLq8n9YBaDiNF/meLW3EyWfdiYZa4aQF+LLF1XL8HZDnqrNABMNAO
	 kL+fanHn61CTBgbblJ3NR8ue/MXcFWqsxtQf/y0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1729CF80171;
	Tue, 20 Sep 2022 13:19:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28DA7F800F2; Tue, 20 Sep 2022 13:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DAFF800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 13:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DAFF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qjb4umIY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5451AB82808;
 Tue, 20 Sep 2022 11:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713B6C433C1;
 Tue, 20 Sep 2022 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663672771;
 bh=gMu1L0UxD77BmG7TUXb6/TEzjsA1ibRosS8h3TAh7PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjb4umIYGVzq1CQbQjzV7PJi8JEt3QJFmfvKRqhzpdH8xhTvryVgpwqg8sJmgVgyf
 wObiz+7h607LQzg3tBea0sNnHg/jlhoVd24D0B2Xt1AY5QjL/z6N21yuzAsuXR3jLU
 K6iqYn0Cu2vacY9Y5t+jPwClsyrSQ0kK2NC0luuWdaA/Ox+YCYVP80SeIfTPWq8V5L
 H6jQN8MDlVuwUEWUxT+1F+4b7LEBDNgUd+F9wqba8I/MbmIgmSpy0Cgcb5/FJiFOur
 wwEmpSXmU5PUfaa/jduutLnij/5tLbm1Zo046U7C0nxT2tytMiVGVh4IXBM7uqps05
 m9qUFOvBGPlag==
Date: Tue, 20 Sep 2022 12:19:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] ASoC: SOF: Intel: add initial SKL/KBL hardware support
Message-ID: <YymhvysghXeNQx8i@sirena.org.uk>
References: <20220919123617.44096-1-pierre-louis.bossart@linux.intel.com>
 <20220919123617.44096-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FFA3TuO+PYVdpLFw"
Content-Disposition: inline
In-Reply-To: <20220919123617.44096-4-pierre-louis.bossart@linux.intel.com>
X-Cookie: You can't push on a string.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--FFA3TuO+PYVdpLFw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2022 at 02:36:16PM +0200, Pierre-Louis Bossart wrote:
> In preparation of the IPCv4 IPC support, this patch adds
> support for SkyLake and KabyLake boot and descriptors
> used when probing the PCI driver.

This breaks an x86_64 allmodconfig build:

In file included from /build/stage/linux/sound/soc/sof/intel/hda-loader-skl=
=2Ec:25:
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c: In function =E2=80=
=98cl_dsp_init_skl=E2=80=99:
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:372:56: error: =E2=
=80=98HDA_DSP_ROM_STS_MASK=E2=80=99 undeclared (first use in this function)
  372 |                                             ((status & HDA_DSP_ROM_=
STS_MASK)
      |                                                        ^~~~~~~~~~~~=
~~~~~~~~
/build/stage/linux/sound/soc/sof/intel/../ops.h:551:21: note: in definition=
 of macro =E2=80=98snd_sof_dsp_read_poll_timeout=E2=80=99
  551 |                 if (cond) { \
      |                     ^~~~
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:372:56: note: each =
undeclared identifier is reported only once for each function it appears in
  372 |                                             ((status & HDA_DSP_ROM_=
STS_MASK)
      |                                                        ^~~~~~~~~~~~=
~~~~~~~~
/build/stage/linux/sound/soc/sof/intel/../ops.h:551:21: note: in definition=
 of macro =E2=80=98snd_sof_dsp_read_poll_timeout=E2=80=99
  551 |                 if (cond) { \
      |                     ^~~~
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:373:49: error: =E2=
=80=98HDA_DSP_ROM_INIT=E2=80=99 undeclared (first use in this function); di=
d you mean =E2=80=98HDA_DSP_REG_HIPCT=E2=80=99?
  373 |                                              =3D=3D HDA_DSP_ROM_INI=
T),
      |                                                 ^~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/sof/intel/../ops.h:551:21: note: in definition=
 of macro =E2=80=98snd_sof_dsp_read_poll_timeout=E2=80=99
  551 |                 if (cond) { \
      |                     ^~~~
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c: In function =E2=80=
=98hda_dsp_cl_boot_firmware_skl=E2=80=99:
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:553:53: error: =E2=
=80=98HDA_DSP_ROM_STS_MASK=E2=80=99 undeclared (first use in this function)
  553 |                                             ((reg & HDA_DSP_ROM_STS=
_MASK)
      |                                                     ^~~~~~~~~~~~~~~=
~~~~~
/build/stage/linux/sound/soc/sof/intel/../ops.h:551:21: note: in definition=
 of macro =E2=80=98snd_sof_dsp_read_poll_timeout=E2=80=99
  551 |                 if (cond) { \
      |                     ^~~~
/build/stage/linux/sound/soc/sof/intel/hda-loader-skl.c:554:49: error: =E2=
=80=98HDA_DSP_ROM_RFW_START=E2=80=99 undeclared (first use in this function=
); did you mean =E2=80=98HDA_DSP_SRAM_REG_FW_STATUS=E2=80=99?
  554 |                                              =3D=3D HDA_DSP_ROM_RFW=
_START),
      |                                                 ^~~~~~~~~~~~~~~~~~~=
~~
/build/stage/linux/sound/soc/sof/intel/../ops.h:551:21: note: in definition=
 of macro =E2=80=98snd_sof_dsp_read_poll_timeout=E2=80=99
  551 |                 if (cond) { \
      |                     ^~~~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:249: sound/soc/sof/=
intel/hda-loader-skl.o] Error 1
make[5]: Target '__build' not remade because of errors.
make[4]: *** [/build/stage/linux/scripts/Makefile.build:465: sound/soc/sof/=
intel] Error 2
make[4]: Target '__build' not remade because of errors.
make[3]: *** [/build/stage/linux/scripts/Makefile.build:465: sound/soc/sof]=
 Error 2
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/build/stage/linux/scripts/Makefile.build:465: sound/soc] Err=
or 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/build/stage/linux/Makefile:1852: sound] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:222: __sub-make] Error 2

--FFA3TuO+PYVdpLFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMpobwACgkQJNaLcl1U
h9DlyAf+L4o24UTxvDEZkJcfsO8YLwDDHcoy7QpSBn31KWn7sttqAZkQE8g3QRK+
xzbC63q0J+TvcDm4bYTOjW7X14SxD/2vBSwRSpfyj2dOBo4Bsec0Aj7KnUdlw337
xWfCJ9JVFW3n6l2J8FLuhdYnHhFLRKDl7LCPLbE2Zeung3n4PJKHJzdGsZMLj/Fm
M7KtNtZqqb+yL1VRA+a9c7y+ZGyI/FbGBaP3ZBZ5ctlNNyySZ6y3DTIVwhAaFbUX
mok7jiAgD50tRmEzsAeSi1kOXcmjCrpwDtD5UgLynG3abV74Q4/L4BU1LkxIBjbd
A+59B3wgxW5F7gZoDr/2hWjeywJqLA==
=rqcG
-----END PGP SIGNATURE-----

--FFA3TuO+PYVdpLFw--
