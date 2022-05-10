Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 580675213E1
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 13:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C0711707;
	Tue, 10 May 2022 13:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C0711707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652182474;
	bh=ZAWLbAkZYWiN88dtJ5gxkyBwowKlhRJppEaDB8zssaQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMQ4utvOgkgpfo0cTu62m2WZ0LoHYqi4bTAQ4CEjH5r9NOFq7XDamoiNwBy2GZGEC
	 YshOJDoDo1nUo/OnEYN8oXnHXUi7wHmc/mE8dpKgKKucPjlBwCWiXuQINAVgqOojXb
	 iwFheQh7f1JC0CQG04H2prd8TRIIGpmBgh+LS5TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9610EF801F5;
	Tue, 10 May 2022 13:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8111EF80116; Tue, 10 May 2022 13:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A3C8F8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 13:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A3C8F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="H8XhQxHa"
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5C5D184245;
 Tue, 10 May 2022 13:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652182406;
 bh=ZFo927e5FInTbURE9yWoxLxrY0CAVoAwYdbjul31wsM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H8XhQxHadPKetSG5ktZXFJgUXytoZ5rqH6ZHBXorAJO0s8MoZtrJMmbXcQNeAqNEt
 S1RbjPuGi0mFIFfxvRYP1cJS7YW1yElGv/eLV+qQyDFrT4K33kBLvkVf7pBj0ih0BY
 KEnSYGC7iDiUq3skG5oIdaUr120T1XSigkUVJS68vsfPsq6+jCIxfnnM/2AxHGRrqF
 DOlO26ax2r9Hiw9JeQoyQ2GwL4epK8j/4bPA6Pz9AOWBKZiNxvUpPalcQrCHCw0JT9
 Uqhr0dzaqTGsBFxvFQxAH5sptt5cKDA20rbxUcRb6rYEIy+kzz2S5mE0RDjY8KNSZy
 wlixoikveI2GQ==
Date: Tue, 10 May 2022 13:33:20 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: wm8940: add devicetree support
Message-ID: <20220510133320.52f1f934@ktm>
In-Reply-To: <YnpI7CTiXzCYn918@sirena.org.uk>
References: <20220509121055.31103-1-lukma@denx.de>
 <YnkxIe1nVUiKNmdq@sirena.org.uk> <20220510092438.528ef474@ktm>
 <YnpI7CTiXzCYn918@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/CzcUOznd1uIj3ksgQ3evhl3"; protocol="application/pgp-signature"
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

--Sig_/CzcUOznd1uIj3ksgQ3evhl3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Tue, May 10, 2022 at 09:24:38AM +0200, Lukasz Majewski wrote:
> > > On Mon, May 09, 2022 at 02:10:55PM +0200, Lukasz Majewski wrote: =20
>=20
> > > > This adds devicetree support to the wm8940 codec driver.
> > > > With a DT-based kernel, there is no board-specific setting
> > > > to select the driver so allow it to be manually chosen. =20
>=20
> > > You need to provide a binding document for any new bindings you
> > > add in code. =20
>=20
> > The second patch in this series adds proper *.yaml file to Linux
> > source tree. =20
>=20
> You didn't send the patches as a series, you sent two separate threads
> so they got totally separated in my inbox.  I did eventually connect
> them.

Thanks :-)


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/CzcUOznd1uIj3ksgQ3evhl3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmJ6TYAACgkQAR8vZIA0
zr16Mwf7BLc80ZONSnv7u0SrL/p6P7EKRzUbTFz3niaxGTph6E38ggtVgyNhm0L3
ll229or66g9c3e2zjkccHaWLceyrn6nladyy1oczecQSrJLYazBmzjSJZkJO9tMG
4N/ofOslQzJ5mlIrYTEZu8gVSNdl0k52Vxu1aHXHaf5sfRYLbwVc/wkrd1zvxg9T
MqCXmJuYXA78bGTfqVeW8HP3jbmtHVBM3nq2S2ujW6ucT/ZzNThyTPr2g+ZnT7kc
dG2s+lNla5+l38z4ABLxtBYO/r90fYiYz0V0ht38sYRkuvbRbayjxHxacXjUaU5M
KHNRLUNSr3yy9dnA2Yb/1z1yP+gAkQ==
=3UW/
-----END PGP SIGNATURE-----

--Sig_/CzcUOznd1uIj3ksgQ3evhl3--
