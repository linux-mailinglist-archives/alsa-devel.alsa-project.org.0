Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7070957D6D5
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 00:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A6D1849;
	Fri, 22 Jul 2022 00:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A6D1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658442152;
	bh=WhB1PD1kMyLRf+42xJ1wMh8BKbH3xsmCONTEx0+eMh8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQE7C1KvAjm/26j/LYR/zo8lo/yp/5kbCodDzfrY8Zeo7pwDq/Lqy11YrOaDka6DS
	 6XkxPcX7qgC8Ar6PeiTlvpGyQ9idsO/kJyRBkg+2bPvVBfp/krOgldCeT4kF6Daf/x
	 KkY+XqyVQYhjaWBuoc/QyP1mcZhcCrXVauQckDoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76480F800ED;
	Fri, 22 Jul 2022 00:21:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7857EF8016D; Fri, 22 Jul 2022 00:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31811F80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 00:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31811F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BEZ+jC0r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5D9C61D42;
 Thu, 21 Jul 2022 22:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D09CC341CE;
 Thu, 21 Jul 2022 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658442078;
 bh=WhB1PD1kMyLRf+42xJ1wMh8BKbH3xsmCONTEx0+eMh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BEZ+jC0rJiVM+zeUWTx6V2ftRHpCjVGuE2uRsAyTcxM5rv/coRx4w90PZ8fReg8tg
 blGghO+x7ozDoMwI15kEx5/XuOSO6k2ta02eqRqazL3PVazjiJLjKWytT6yYBjg5J+
 YUlxbybDmg7HJH3qJlLOMcTIE2JPLVCbqk0fbmUDiOjVGks+zTK1OUhIhuNr6f1S5P
 P9TV03QOzXRoHybEa4TJqop8MuQ3WifqEM5VkjcsPi131EdS8FV/7b1XpaymqvUy6I
 LTYzlF8sIOHkfnDj1Nw4N/PyI8HpZAgjidS+k06pNZkcuKxO0MiwoaL2Owkw3ut7bx
 8UuEpfVNBQZag==
Date: Thu, 21 Jul 2022 23:21:11 +0100
From: Mark Brown <broonie@kernel.org>
To: syed sabakareem <Syed.SabaKareem@amd.com>
Subject: Re: [PATCH 5/5] ASoC: amd: enable RPL Platform acp drivers build
Message-ID: <YtnRV4qQoUkLN552@sirena.org.uk>
References: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
 <20220721061035.91139-5-Syed.SabaKareem@amd.com>
 <YtmqzkUjhKDIg0d2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oOv3QA6AufJZt5bU"
Content-Disposition: inline
In-Reply-To: <YtmqzkUjhKDIg0d2@sirena.org.uk>
X-Cookie: Do not pick the flowers.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, vijendar.mukunda@amd.com,
 Alexander.Deucher@amd.com, Julian Braha <julianbraha@gmail.com>,
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


--oOv3QA6AufJZt5bU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 08:36:53PM +0100, Mark Brown wrote:
> On Thu, Jul 21, 2022 at 11:40:02AM +0530, syed sabakareem wrote:
> > From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> >=20
> > RPL Platform drivers can be built by selecting necessary
> > kernel config option.
> > The patch enables build support of the same.
>=20
> This breaks an x86 allmodconfig build:
>=20
> /build/stage/linux/sound/soc/amd/acp/acp-platform.c: In function =E2=80=
=98i2s_irq_handle
> r=E2=80=99:
> /build/stage/linux/sound/soc/amd/acp/acp-platform.c:108:31: error: =E2=80=
=98struct acp_d
> ev_data=E2=80=99 has no member named =E2=80=98stream=E2=80=99
>   108 |                 stream =3D adata->stream[i];
>       |                               ^~

Sorry, this was actually a different commit earlier in the branch
triggering this.

--oOv3QA6AufJZt5bU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZ0VYACgkQJNaLcl1U
h9C4qwf+LvXEf1DhkBwwKhCvfZyKKK9YVzwpry417epDVJnvaorf84Y6FyGJjm6D
x++atMwrYkY8N6Ro0ls3a8jmHBlozUs8m0uJ9Hlo7k81zANGPzZ5Pyb6VDrdVM/r
js1NVEvqRu3inNtQQjLu5UjcXISHBUjOWzMVSEfCQ5K2cDklTaItFviXX7ZtA9Fj
KkE+cmaj5EOk1y5h0MRBITwfeFYcgAm7pviqPzKpXi+h8n2ycutgCjdRztB5C33Q
bjN0YODYLtm5EinD8u2h+mWk9VmDDmY/t8SrpJ4PE126FsKL2icNoo7sazfHyIiY
rmdtIVCRSeF7t7Ynvdc1Gf4Z0aYPLA==
=ujmp
-----END PGP SIGNATURE-----

--oOv3QA6AufJZt5bU--
