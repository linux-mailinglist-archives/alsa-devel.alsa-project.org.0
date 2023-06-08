Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBFE727C8C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 12:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FF396C0;
	Thu,  8 Jun 2023 12:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FF396C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686219405;
	bh=Quyj3jLiFjeJyIx2n6eJqoeLweuibXEoGzDmM2bwqQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iihbiblbDDUNaNXUsltxTqon+1ZTRN6oEFJAhh65v7o3dDt+zFjA+0x78VYGFNEqU
	 JBIGLHe/hP5dkRebohAb4xxRDNktq4VgOooV9TPrhZtMGe8EUJSUD77G/T3WncCm6v
	 8bbf7eG2jX3OONXP966rTrrVDCsCgyomMekB1UhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 858F5F800ED; Thu,  8 Jun 2023 12:15:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4092AF80155;
	Thu,  8 Jun 2023 12:15:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D143F80199; Thu,  8 Jun 2023 12:15:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D68F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 12:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D68F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oqtBZiNY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 304CF6133B;
	Thu,  8 Jun 2023 10:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2553C433EF;
	Thu,  8 Jun 2023 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686219345;
	bh=Quyj3jLiFjeJyIx2n6eJqoeLweuibXEoGzDmM2bwqQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqtBZiNYFkI2OsGbD89+croM5qG9ymnlvHVtkIt7eXNnzGPous6D9+O/VT3MlSEPk
	 X36PmqvNjvJ+mNR07A5IWqHPY9ZnZqqNkRJuh3jJSPqihywYxYzeQItHKvHKK6x3K+
	 rlz+6jVh4k1wn3Hx43d5LtRGie9FFGL9RZ5S6iKgNE2S46GV1V6QjWEKjlXWlEomWQ
	 UGPNFeb/6aNcs/rgp/clhLjh2ZKTwjDIaIp69s8Vu1rFgzjp8PPpLAkNKbGvzL1/sm
	 +fM8Gca1792neWsx+Tbbk4dDp0sJWfONv6y59mjET9g08hsU5dzLF6o1vRIpLIblp5
	 pNXaqh/H7H8ig==
Date: Thu, 8 Jun 2023 11:15:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: starfive: Cleanup and fix error check for
 JH7110 TDM
Message-ID: <fbbc0963-fba5-4178-b886-fbb35c0c8df2@sirena.org.uk>
References: <20230607081439.1517-1-walker.chen@starfivetech.com>
 <3eb7ffc5-a16a-4ac2-93a0-260f7cb1f81c@sirena.org.uk>
 <d941ac20-e8b3-cb13-4258-3a9a86e978d3@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PKcaVHh5qOw7fnfv"
Content-Disposition: inline
In-Reply-To: <d941ac20-e8b3-cb13-4258-3a9a86e978d3@starfivetech.com>
X-Cookie: Disk crisis, please clean up!
Message-ID-Hash: ROUHZX4EP32OCPZBVQ5GFFAAMDM3Y24I
X-Message-ID-Hash: ROUHZX4EP32OCPZBVQ5GFFAAMDM3Y24I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROUHZX4EP32OCPZBVQ5GFFAAMDM3Y24I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PKcaVHh5qOw7fnfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 10:15:03AM +0800, Walker Chen wrote:
> On 2023/6/7 19:44, Mark Brown wrote:

> >> -		  (tdm->rx.wl << WL_BIT) |
> >> -		  (tdm->rx.sscale << SSCALE_BIT) |
> >> -		  (tdm->rx.sl << SL_BIT) |
> >> -		  (tdm->rx.lrj << LRJ_BIT);
> >> +	datarx =3D (tdm->rxwl << 8) |
> >> +		  (tdm->rxsscale << 4) |
> >> +		  (tdm->rxsl << 2) |
> >> +		  TDM_PCMRXCR_LEFT_J;

> > I'm not sure this change to use numbers here is a win - the _BIT
> > definitions look fine (I might've called them _SHIFT but whatever).

> This is Claudiu's advice. Using the macro BIT() to replace these definiti=
on of *_BIT,=20
> it will result in big changes in the code.

I'm questioning doing a change at all.

> Please refer to previous comments:
>  https://lore.kernel.org/all/143e2fa2-e85d-8036-4f74-ca250c026c1b@microch=
ip.com/

I can't find the comments you're referring to in there.

--PKcaVHh5qOw7fnfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSBqkkACgkQJNaLcl1U
h9CWywf/Z1xfv//r9y6BIdrx+QwhKwPVc+ncix5QdBhiVs6lXk4evYULyaOiLLi1
uajsPVJ7VZgYRbUJpZRbb0QUqXpFiYv7IgCczTeZifvZryIcjopEm3eEaAXMErLI
r5y7LVayIa95enLcjWgyoISRLB9/1kXuBmKqo6JA7xakIyMwG5gioVte7W2B1vpu
AJ3BLVh2zZsIm03d3FagA5omPMLAKEEP6eHbZr9rYkn7oiPutgm6TN4up5h1XWrD
Ua12qPKgU5TnU9bUD4ymUojA2kz4LD69Fy4UgFLyjJ7NF9VrzwHK+iqjgxqrFLOR
WBxCnZbXj6Z+TexDiFUZAgcd2OqhtA==
=i16b
-----END PGP SIGNATURE-----

--PKcaVHh5qOw7fnfv--
