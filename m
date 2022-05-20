Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185AA52EC6A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 14:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3E6173D;
	Fri, 20 May 2022 14:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3E6173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653050583;
	bh=YTSPkgizOL4W7LCBZDtItpCzMG0NI7atPraoBzO31lE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjdKfZkdsA5jPUISwEFLqQyVSh0YilUEYMn1XK9viPmBmLck9dE7J41f5nwyONwCW
	 UDMKCsTNgfcX5Jdq60DaDTIoG0eArywvL0t5h9T2vwvi00rSwLGt8FZngXT3H2+mhQ
	 2S0GBQ+tRKKtebGuStJCL53Wldhxw8JzQbnikydA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4CBF800F0;
	Fri, 20 May 2022 14:42:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9A02F8019D; Fri, 20 May 2022 14:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04257F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 14:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04257F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bs9TH57J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D65C60A52;
 Fri, 20 May 2022 12:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1601DC385A9;
 Fri, 20 May 2022 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653050516;
 bh=YTSPkgizOL4W7LCBZDtItpCzMG0NI7atPraoBzO31lE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bs9TH57JxrUxnFTqhxwoioJG4z9M8pwS8Oe3EmUEQerc2sYvLs1JNdvDtYJJ5+IDz
 qV0QYbgsN/VLqxq9JPwed6ss1Zk4D3hM/G1BxaHK7IS3BhGYbi4GCGcr3C3QriAzUF
 vG0Qvkx7aB5Pfnrw491KrbxiS3+IA0NLy07QRjz2vZUcwvVVJZUWydIPo5CdQ/WiCd
 FqPrUCOJ5G5F42fqq+7hB2coKDXB4PpVbJIZzYUD8XkluuPmIUtOVu65Zr2429LzSY
 7NWuMW/VLaekuh6CGLiuERrvR+JrD5I1948xhUm+N7z50AG5fBLY+yjlkj0V1i8OpS
 eW+f8GIomXBkA==
Date: Fri, 20 May 2022 13:41:49 +0100
From: Mark Brown <broonie@kernel.org>
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH v2 1/2] ASoC: amd: acp: Add support for nau8825 and
 max98360 card
Message-ID: <YoeMjUJjOzDTOtbM@sirena.org.uk>
References: <20220519055522.1613813-1-Vsujithkumar.Reddy@amd.com>
 <20220519055522.1613813-2-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T2P481YcpmerEUHv"
Content-Disposition: inline
In-Reply-To: <20220519055522.1613813-2-Vsujithkumar.Reddy@amd.com>
X-Cookie: Driver does not carry cash.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, ajitkumar.pandey@amd.com,
 Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Vijendar.Mukunda@amd.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>
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


--T2P481YcpmerEUHv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 11:25:21AM +0530, V sujith kumar Reddy wrote:
> We have new platform with nau8825 as a primary codec and max98360 as an
> amp codec. Add machine struct to register sof audio based sound card
> on such Chrome machine.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c: In function =E2=80=
=98acp_card_nau8825_init=E2=80=99:
/build/stage/linux/sound/soc/amd/acp/acp-mach-common.c:479:15: error: too m=
any arguments to function =E2=80=98snd_soc_card_jack_new=E2=80=99
  479 |         ret =3D snd_soc_card_jack_new(card, "Headset Jack",
      |               ^~~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/sound/soc.h:1362,
                 from /build/stage/linux/sound/soc/amd/acp/acp-mach-common.=
c:20:
/build/stage/linux/include/sound/soc-card.h:18:5: note: declared here
   18 | int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id=
, int type,
      |     ^~~~~~~~~~~~~~~~~~~~~
make[5]: *** [/build/stage/linux/scripts/Makefile.build:288: sound/soc/amd/=
acp/acp-mach-common.o] Error 1
make[5]: Target '__build' not remade because of errors.
make[4]: *** [/build/stage/linux/scripts/Makefile.build:550: sound/soc/amd/=
acp] Error 2
make[4]: Target '__build' not remade because of errors.
make[3]: *** [/build/stage/linux/scripts/Makefile.build:550: sound/soc/amd]=
 Error 2
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/build/stage/linux/scripts/Makefile.build:550: sound/soc] Err=
or 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/build/stage/linux/Makefile:1834: sound] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:219: __sub-make] Error 2
make: Target '__all' not remade because of errors.
make --silent --keep-going --jobs=3D14 O=3D/tmp/build-work INSTALL_MOD_STRI=
P=3D1 INSTALL_MOD_PATH=3D/tmp/build-work/modinstall ARCH=3Dx86_64 CROSS_COM=
PILE=3Dx86_64-linux-gnu- modules_install
sed: can't read modules.order: No such file or directory
make[1]: *** [/build/stage/linux/Makefile:1467: __modinst_pre] Error 2
make[1]: Target 'modules_install' not remade because of errors.
make: *** [Makefile:219: __sub-make] Error 2
make: Target 'modules_install' not remade because of errors.

--T2P481YcpmerEUHv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKHjIwACgkQJNaLcl1U
h9DS7Af+NaA0kEk6Pz/LFvpVhZ8s9UWwsne4neS/3i1TgAbX+/D/grVXyXB+bgl6
b2ETIdiJSDR/eYGPfYKOZSooH6O1luCEuNMnH3uTUS5eFX37PaWXGTw7/cOIsLIy
TV1L0jMYwVeKx1yfqbevmq04KE82PAgVSmo1BAUcmwt+sQpsLI34PQBmEEj1zzLd
nYY1wMWkQnRV7LUqfwCR+XgAC40OMoPB4sO7rPfuUDQdrG3mc3/3bllkkWJ0Nala
VkfKxZVkU+WapPyE9JB2tc/u4FVlzJJtX/k23KypZT9WDKb4BQd8qWOxIYVr9sNI
JsIeFJUA0I9kN81ATYMfqowtTyOSjQ==
=jmOi
-----END PGP SIGNATURE-----

--T2P481YcpmerEUHv--
