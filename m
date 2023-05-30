Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B8716363
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:14:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C11820C;
	Tue, 30 May 2023 16:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C11820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685456062;
	bh=/UJDrMEFpBwl4/IycRYuBQqR/J8yidIWp4To2yuNJFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IRIAUcDejeGxJHs0Z1cbZ3NmK2ar8ynbXI+gCFBYninK47hhlJo02vEDcnYy4JpQi
	 TZLr61IlpCh1DwT1Tj4hPBFIz+1Q9BbVOOh3mvPkqneCUFQVmuOtjmScLf/MlOuaBN
	 7ZqC+AqM+kG5aWFdFRQ3YVI5R70EEVAJCLABWVKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D500CF8042F; Tue, 30 May 2023 16:13:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBABF8026A;
	Tue, 30 May 2023 16:13:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F182F8042F; Tue, 30 May 2023 16:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AD9CF800DF;
	Tue, 30 May 2023 16:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD9CF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qjJKbfLj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F2DE630A7;
	Tue, 30 May 2023 14:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B1BEC4339B;
	Tue, 30 May 2023 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685455984;
	bh=/UJDrMEFpBwl4/IycRYuBQqR/J8yidIWp4To2yuNJFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjJKbfLjLybK5h4UYXcP+3YhCW5SMzOQphTt7FNwwVcLGn4Uoczg6GbOJz1FL/ePf
	 UE7kv5sNfKH34FoZsEoHcjSYS9kmsNPxe3xRgVhsF8cSE8b0qNE1PQBagsSJZUXXna
	 yZoVROZOT/YrSsMN0fiRe2bL8vZGE7k/qgVpcJKeLeIABtvoMLnf1iV5hrqwZL5Hxg
	 2R90YRjPaYplnUPHQu6rYYyHy0hZKFOZ2HTQtAhKEHOKT0JkNKd09fz7poA5FSrdms
	 Pgto37pmCZbo01+nVNU9xi/pTi/RUF/Sk2edSMDJTaklr1ZdX7X61p2wFKI1YNK8VL
	 j9/BMStvw9jSA==
Date: Tue, 30 May 2023 15:12:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
	lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	yc.hung@mediatek.com, tinghan.shen@mediatek.com,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: SOF: mediatek: add adsp debug dump
Message-ID: <12f075ba-6886-4916-a62f-8fb004eeb4c9@sirena.org.uk>
References: <20230523025933.30494-1-trevor.wu@mediatek.com>
 <20230523025933.30494-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HZx043a6O9IOGZFz"
Content-Disposition: inline
In-Reply-To: <20230523025933.30494-3-trevor.wu@mediatek.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: UB22KZ5LCR7DBDUIUOH7R5YV2REGAE5M
X-Message-ID-Hash: UB22KZ5LCR7DBDUIUOH7R5YV2REGAE5M
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UB22KZ5LCR7DBDUIUOH7R5YV2REGAE5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HZx043a6O9IOGZFz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 23, 2023 at 10:59:33AM +0800, Trevor Wu wrote:
> Add mt8188 and mt8186 .dbg_dump callback to print some information when
> DSP panic occurs.

This breaks an x86_64 allmodconfig build:

/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c: In function =E2=
=80=98mt8186_adsp_dump=E2=80=99:
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:483:56: error: =
=E2=80=98DSP_PDEBUGDATA=E2=80=99 undeclared (first use in this function); d=
id you mean =E2=80=98DSP_PDEBUGPC=E2=80=99?
  483 |         dbg_data =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUG=
DATA);
      |                                                        ^~~~~~~~~~~~=
~~
      |                                                        DSP_PDEBUGPC
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:483:56: note: eac=
h undeclared identifier is reported only once for each function it appears =
in
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:484:56: error: =
=E2=80=98DSP_PDEBUGINST=E2=80=99 undeclared (first use in this function); d=
id you mean =E2=80=98DSP_PDEBUGPC=E2=80=99?
  484 |         dbg_inst =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEBUG=
INST);
      |                                                        ^~~~~~~~~~~~=
~~
      |                                                        DSP_PDEBUGPC
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:485:59: error: =
=E2=80=98DSP_PDEBUGLS0STAT=E2=80=99 undeclared (first use in this function)
  485 |         dbg_ls0stat =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDE=
BUGLS0STAT);
      |                                                           ^~~~~~~~~=
~~~~~~~~
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:486:58: error: =
=E2=80=98DSP_PDEBUGSTATUS=E2=80=99 undeclared (first use in this function);=
 did you mean =E2=80=98DSP_PDEBUGPC=E2=80=99?
  486 |         dbg_status =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PDEB=
UGSTATUS);
      |                                                          ^~~~~~~~~~=
~~~~~~
      |                                                          DSP_PDEBUG=
PC
/build/stage/linux/sound/soc/sof/mediatek/mt8186/mt8186.c:487:57: error: =
=E2=80=98DSP_PFAULTINFO=E2=80=99 undeclared (first use in this function)
  487 |         faultinfo =3D snd_sof_dsp_read(sdev, DSP_REG_BAR, DSP_PFAUL=
TINFO);
      |                                                         ^~~~~~~~~~~=
~~~

--HZx043a6O9IOGZFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmR2BGgACgkQJNaLcl1U
h9Avzwf9FLeppnZUZA1Mmi2j/Dqy5Rxq8OrPGUDqqTTdwOLmJC6luZkDAsRedhwW
MsBawXkxc2BfO4ytooYHkRL9BcUiQ/ZgZ1wHkH/bpJJdKW+qQjiSUN9jG5qZAPIl
rte+OUXbWHcXGdnfGqLGT7QGzCwr9mSsmqWCVdQcKsR2rT9Xs/Guh9DjQlTICeb5
a+cRmthy1DPKwBu/QFT6J53w7mgWpRzby6qxkP2KFCAiY+QgCFjR2onFVnzEurT6
GzeNZdW2+U8A9nStkaXQbyrqqYaZXMvZS3w0sdinJv3LjUnknGqPVuxMU1h4nEAl
aLnuYTOkWcXKcWSZ+3/8Yy6wsv3weQ==
=qgu/
-----END PGP SIGNATURE-----

--HZx043a6O9IOGZFz--
