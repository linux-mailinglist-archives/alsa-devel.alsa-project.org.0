Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A74520E54
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 09:25:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B3817A5;
	Tue, 10 May 2022 09:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B3817A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652167553;
	bh=nGD+FBryu5NKyFIDRl1o3d1KctE4+zP9BG9OHKy0puU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D2HsHLw38jpAVpMox6kDIMFjD5tAUpxsfQVyuz74HuYtMkHJXqcjFu0tgy4tG/7wu
	 7ObKuT8c4mwiNzhWoylp/bImzfDi6NMw9qZblH2UCGN67ACZqPPb0TGw4Wc0YdTbsf
	 DMdk8AYjZtNn4Ndze5sKHKTX0QBRZtIcLZcX6R9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E2CF801F5;
	Tue, 10 May 2022 09:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEDEDF8019D; Tue, 10 May 2022 09:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7DEEF8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 09:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7DEEF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="WyEiuVPm"
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8029D83E3C;
 Tue, 10 May 2022 09:24:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652167485;
 bh=v42t0wrj9GqLV8s127IUUQybanR9QIQ7nDnaooUBt6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WyEiuVPmuqAvc8fU/hGB1RC/6cdq88pwNbCQ56Twj3dgvkpv2U8DnGIHoJMsNBWYI
 h9w61x5ZZUi6J9b+UqTjXUHkQJxu61hJEt+vpn1cOxfeQnlCdx5QHJtD8XzqRejwyr
 fKSGf11dNu4CtxO6+TXS36b2OUbR3KWViWKO1Hpcc39NI4xh7C6yplBr3SvtU2OjrY
 W8h+lEZBKNfxEfqjkL8mgm4V5j1fddZXnF9dY2uvshKFQBWyujCTFf1gVp8SSwjIgW
 9OBuDO+adZYMlFoYInwYx8pyAdTyAllI4idDxDTrYvbQFoziUco90NzZvJrsvTK9Qa
 zTrZjEv4IotUA==
Date: Tue, 10 May 2022 09:24:38 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: wm8940: add devicetree support
Message-ID: <20220510092438.528ef474@ktm>
In-Reply-To: <YnkxIe1nVUiKNmdq@sirena.org.uk>
References: <20220509121055.31103-1-lukma@denx.de>
 <YnkxIe1nVUiKNmdq@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/l5EeiAB24OpqNCHm+5Ik.br"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

--Sig_/l5EeiAB24OpqNCHm+5Ik.br
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Mon, May 09, 2022 at 02:10:55PM +0200, Lukasz Majewski wrote:
>=20
> > This adds devicetree support to the wm8940 codec driver.
> > With a DT-based kernel, there is no board-specific setting
> > to select the driver so allow it to be manually chosen.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> >  sound/soc/codecs/Kconfig  | 2 +-
> >  sound/soc/codecs/wm8940.c | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-) =20
>=20
> You need to provide a binding document for any new bindings you add in
> code.

The second patch in this series adds proper *.yaml file to Linux source
tree.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/l5EeiAB24OpqNCHm+5Ik.br
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmJ6EzYACgkQAR8vZIA0
zr2ipQf8DYNUBWhZGVEpcwS7FiqcW87GPw7EDy7MupmT2l/ScAHov2l3ICd+jwWL
sEZrUl3xdsXFxnUnqe2e35tr59srJoCZdQNbrHLJYZhO3BhDIMS5XHvEiz8UARkz
KqW5qfk5yHQcw7H/0qOh97K31M81BjuaGCoQW1TRz5O72RTqRwjOWFCkQ0XK9j84
OMPIrCLKdLMVuyZZ7SVrEa8iNMgY/GT5i7b4EE++gXkZ6dYymbpX6WMLsP5+wm8T
HE392Fld406Qi5bCkt2cx5YAc/a/BGBOfbyc0yuXrMhNRUZ8OhAyE0egmI+sJp0c
zD0j/vk2FjCMlpj7o+FdTzGvcxNhag==
=Q5fm
-----END PGP SIGNATURE-----

--Sig_/l5EeiAB24OpqNCHm+5Ik.br--
