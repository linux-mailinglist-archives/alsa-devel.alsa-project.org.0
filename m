Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA774F90FC
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 10:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19053185B;
	Fri,  8 Apr 2022 10:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19053185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649407104;
	bh=Vh7/Aw62bJPPW9qMlk/IJaaJBuBRuzQNqitXUrJDUxg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwIbQ0dmrBeA59XxSWonTqznZrAF5Jf3Tg3IbvvWSsJqZ6Lk7KktpwKCiEhyulc9Z
	 pvPOXX+QtClHoKU5oGQfnv+iuafTLQL/qMTAfunvxYyPbkLZzxEe8fjWR5VbbqFAvO
	 mJ5SBd+phFEW0J/+pb5StC4Rt/pMmeu6NfzBMNK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE5EF80128;
	Fri,  8 Apr 2022 10:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FDCDF8014E; Fri,  8 Apr 2022 10:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD4C5F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 10:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD4C5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pZqjBUiq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE43761A55;
 Fri,  8 Apr 2022 08:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F0DC385A3;
 Fri,  8 Apr 2022 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649407032;
 bh=Vh7/Aw62bJPPW9qMlk/IJaaJBuBRuzQNqitXUrJDUxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pZqjBUiq/UDAi2+3sVC4Om2fyqh1AJRZKyp+OzM80UV0NQj2ufkmhjrqH1U88s2Od
 lkAHsUyG5fj/t/mtd63ZEFpNyRgMttRGOmGSrnPOJ1S3UFMhf9MLTz/lezZB7uVNHM
 YueCYrOM9kkmULE7E/4NHSUquByAQGXeJ0iZjgoWxfTvue8LCkIuXT32NRrhNREeo8
 CW0OeEgG7vGkI3+fWdG0aBqBleeDpzm/HYn7WvoQdsbF85ZLfPmbqjJsx24H+jskz2
 c/Wnh5989Vnt6zVaqWfg2p7t2JEbJVednoYYbseILodlV4Zw7D8Ze+1Eifv7lWgoj2
 w/3MQ7pPVrfMQ==
Date: Fri, 8 Apr 2022 09:37:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: Add psp_mbox_ready() and
 psp_send_cmd() callback
Message-ID: <Yk/0M59OO3VdKfrf@sirena.org.uk>
References: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
 <20220406194048.289787-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="itSEVMqTJtOSaPkd"
Content-Disposition: inline
In-Reply-To: <20220406194048.289787-4-pierre-louis.bossart@linux.intel.com>
X-Cookie: From concentrate.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
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


--itSEVMqTJtOSaPkd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 02:40:47PM -0500, Pierre-Louis Bossart wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>=20
> We need to ensure if PSP is mbox ready before and after sending cmd
> to PSP over SMN interface. Add method to check MBOX_READY bit of PSP
> with some delay over ACP_PSP_TIMEOUT_COUNTER. Replace psp_fw_validate
> with new method psp_send_cmd() to send command via psp mailbox.

This breaks an x86 allmodconfig build with GCC 11:

/build/stage/linux/sound/soc/sof/amd/acp.c: In function =E2=80=98psp_send_c=
md=E2=80=99:
/build/stage/linux/sound/soc/sof/amd/acp.c:176:29: error: unused variable =
=E2=80=98sdev=E2=80=99 [-Werror=3Dunused-variable]
  176 |         struct snd_sof_dev *sdev =3D adata->dev;
      |                             ^~~~
cc1: all warnings being treated as errors
make[5]: *** [/build/stage/linux/scripts/Makefile.build:288: sound/soc/sof/=
amd/acp.o] Error 1
make[5]: Target '__build' not remade because of errors.
make[4]: *** [/build/stage/linux/scripts/Makefile.build:550: sound/soc/sof/=
amd] Error 2
make[4]: Target '__build' not remade because of errors.
make[3]: *** [/build/stage/linux/scripts/Makefile.build:550: sound/soc/sof]=
 Error 2
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/build/stage/linux/scripts/Makefile.build:550: sound/soc] Err=
or 2


--itSEVMqTJtOSaPkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJP9DMACgkQJNaLcl1U
h9A5Vwf/YAj5BPEzo0i3mV1WZOall5etaoWc5EKTUn5IFdLU0j2IIbDVAiy7hlT0
kQAm9KOd6Z2+BZS0qBNQDLNP/mJ5wyMlKwMnqcEx4rS4JldlyZS38zxZblfh/hlz
3vLqYPr5ZvnZTi+F1IcL1KOtpQduAfONqVYGLa4+wo9ACrYUtnYx7wGs6cAAa2ys
yMIA9m99Zm9SXoivZXhghGHXCLEgfigVCzgWszX18kmcRloWiAGWJDf7r83i3jzS
slNnKuRLfW5euBcGhp8oiF23SzGrcBqN3n3Rgo8xm6mci/A1EY/RKRO3NFijupIu
OquzdJmxBGhyWmJub66R0c0dxZR5aA==
=MJSx
-----END PGP SIGNATURE-----

--itSEVMqTJtOSaPkd--
