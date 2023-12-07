Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A994C807D94
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 02:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB92A112;
	Thu,  7 Dec 2023 02:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB92A112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701911190;
	bh=PhP+uu7t6JuPWVqx6etM+fzkzYI8jOaC1jNPqGhOACQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=orLmf81Wevwuj9nVPgGTCu2+nDTyDI276d6JV8E91uIS/xJOFSzXmKF+WlmiVLsUn
	 +Ki/t9U8GFAWu2oyaC0ZfH4lUty3pN1DEd7/SvJLCdOAP8lYKT0glecXFBvHGPiNRV
	 mjSlT9EhjzykWE+PpTvzKkgXf768o6kqGNEdpu08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F91F8056F; Thu,  7 Dec 2023 02:05:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D36F80571;
	Thu,  7 Dec 2023 02:05:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 205F8F8024E; Thu,  7 Dec 2023 02:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 613DEF800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 02:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 613DEF800D2
Received: from [192.168.2.4] (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000007171C.0000000065711A6C.001192E6;
 Thu, 07 Dec 2023 02:05:48 +0100
Message-ID: <4adaf4d4a0b4baf808697fb644889410dcfed948.camel@irl.hu>
Subject: Re: [PATCH 0/2] ALSA: hda/tas2563: Add tas253 HDA driver
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Thu, 07 Dec 2023 02:05:47 +0100
In-Reply-To: <cover.1701733441.git.soyer@irl.hu>
References: <cover.1701733441.git.soyer@irl.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: BEA6KR656AQUHBRTXMEGMQRERF4PTBX3
X-Message-ID-Hash: BEA6KR656AQUHBRTXMEGMQRERF4PTBX3
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BEA6KR656AQUHBRTXMEGMQRERF4PTBX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Please disregard this patch.
The tas2781-hda driver will handle this.

https://lore.kernel.org/all/cover.1701906455.git.soyer@irl.hu/

On Tue, 2023-12-05 at 00:45 +0100, Gergo Koteles wrote:
> The ta2563 is a smart amplifier. Similar to tas2562 but with DSP. Some=
=20
> Lenovo laptops have it to drive the bass speakers. By default, it is in=
=20
> software shutdown state.
>=20
> To make the DSP work it needs a firmware and some calibration data.
> The latter can be read from the EFI in Lenovo laptops.
>=20
> For the correct configuration it needs additional register data.
> It captured after running the Windows driver.
>=20
> The firmware can be extracted as TAS2563Firmware.bin from the Windows=20
> driver with innoextract.
> https://download.lenovo.com/consumer/mobiles/h5yd037fbfyy7kd0.exe
>=20
> The driver will search for it as TAS2563-17AA3870.bin with the 14ARB7.
>=20
> It uses the default program/configuration, and has no controls for these =
yet.
>=20
> The amplifier works without firmware, but I don't know how safe is it,=
=20
> that's why the firmware is required.
>=20
> Gergo Koteles (2):
>   ASoc: tas2563: DSP Firmware loading support
>   ALSA: hda/tas2563: Add tas2563 HDA driver
>=20
>  {sound/soc/codecs =3D> include/sound}/tas2562.h |   8 +
>  include/sound/tas25xx-dsp.h                   | 100 ++++
>  sound/pci/hda/Kconfig                         |  14 +
>  sound/pci/hda/Makefile                        |   2 +
>  sound/pci/hda/patch_realtek.c                 |  22 +-
>  sound/pci/hda/tas2563_hda_i2c.c               | 508 ++++++++++++++++++
>  sound/soc/codecs/Kconfig                      |   7 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/tas2562.c                    |   2 +-
>  sound/soc/codecs/tas25xx-dsp.c                | 282 ++++++++++
>  10 files changed, 942 insertions(+), 5 deletions(-)
>  rename {sound/soc/codecs =3D> include/sound}/tas2562.h (90%)
>  create mode 100644 include/sound/tas25xx-dsp.h
>  create mode 100644 sound/pci/hda/tas2563_hda_i2c.c
>  create mode 100644 sound/soc/codecs/tas25xx-dsp.c
>=20
>=20
> base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa

