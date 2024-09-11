Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62478975A5D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 20:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC43850;
	Wed, 11 Sep 2024 20:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC43850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726079253;
	bh=SiBYQogZ7W3fgRHqvzLBeYJtjY6qqWWBd6G/SBt1mb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ADvqo5kvp1kZRp41rdfRoPoDrt0TsXWC17Vd6FXrveb5mK+dvMH7/JPTD9M3BG1aS
	 4cigRS/1Ih1c9rPJTOru3LvqxYoaD4R/nfd7ieVi3qke7Em3FqtvqhsJm60jT2H+u5
	 PA44nMQPi7i8WYRAwvI3sZL93+5kJoGRDqYx5dIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6832CF805AE; Wed, 11 Sep 2024 20:27:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67BB9F8058C;
	Wed, 11 Sep 2024 20:27:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D012F801F5; Wed, 11 Sep 2024 20:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 839B8F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 20:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 839B8F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qL1qkbsB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0BBB3A4534C;
	Wed, 11 Sep 2024 18:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6A7C4CEC0;
	Wed, 11 Sep 2024 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726079213;
	bh=SiBYQogZ7W3fgRHqvzLBeYJtjY6qqWWBd6G/SBt1mb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qL1qkbsBMTNioKNJQW7/PjCxfOT3gik50xole5xXZitc+Coxq5oqnPU8NvcU9bG0a
	 Zy8F+iNXMGYGcE76iMSYk8FI4eMq0HBF/WjsQ00THukO5Am9L4YshORV9Ji6krHkUT
	 lf2P0j9RVaMJNlsX8FsRJst0WL6FSapg2SiJGUlD2JCic3Dc0RLgkYJU+kcL/xe3kq
	 o9t7pGhsdSeKc5Hjyo+G22vKfbfaCTNBvt+/rjnmIEnWmTj2rVsnv4qgyJqaSI1gl5
	 /b5DNfjKlF/EKxUHYdjoFHMSbsWr9Hu27I+wX7+VzFxC6CekIeo9thoMFDdg9LLJNx
	 LdJvPA6Fi08nQ==
Date: Wed, 11 Sep 2024 19:26:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: FW: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <20240911-blaming-scant-9537304c2221@spud>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
 <SE1P216MB2348C5726B70913B57D8C67C8C9B2@SE1P216MB2348.KORP216.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IvHDJo7t0qbdzyog"
Content-Disposition: inline
In-Reply-To: 
 <SE1P216MB2348C5726B70913B57D8C67C8C9B2@SE1P216MB2348.KORP216.PROD.OUTLOOK.COM>
Message-ID-Hash: AKD23ZGQ53B4IRB5PRY7TXDYF45IKJZN
X-Message-ID-Hash: AKD23ZGQ53B4IRB5PRY7TXDYF45IKJZN
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKD23ZGQ53B4IRB5PRY7TXDYF45IKJZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--IvHDJo7t0qbdzyog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 01:16:01AM +0000, Ki-Seok Jo wrote:
> > >
> > > I have no intention of opposing the content. I am asking again becaus=
e I
> > didn't receive any warnings when I did the following, and I suspect I m=
ight
> > have done something wrong.
> > >
> > >
> > > ./scripts/checkpatch.pl
> > > Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> > >
> > > total: 0 errors, 0 warnings, 54 lines checked
> > >
> > > Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml has no
> > obvious style problems and is ready for submission.
> > >
> > > I was under the impression that this only applied to patched files as
> > described above. It turns out it can also be used with patch files. Tha=
nk you
> > for the useful information!
> > >
> >=20
> > That's not how you run checkpatch. You run it on the patch. Please read
> > submitting-patches document. It explains everything.
> >=20
> > Best regards,
> > Krzysztof
>=20
>=20
> Hi,
>=20
> I am in the process of carefully incorporating your feedback and making t=
he necessary revisions.
>=20
> May I kindly ask you a question, if it's not too much trouble?
> When running checkpatch, what would be the best way to address the follow=
ing warning?
>=20
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit de=
scription?)
> #21:
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sm=
a1307.yaml
>=20
> In this case, would it be better for me to add a line break in the patch =
file, or should I leave it as is?

Normally I would say you can ignore this, and that checkpatch doesn't
usually complain about the actually git output in here - but I think
checkpatch "broke" because you did not provide any commit message body
at all, so it starting parsing the git output instead. You need to write
a body!

> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #65:
> new file mode 100644
>=20
> If the warning is appearing because it's a new file, is it something that=
 can be safely ignored, or should I make changes to the MAINTAINERS file?
>=20
> Thank you for your feedback. I am learning a lot of new things!

Usually for bindings, which have maintainers listed in them, you can
skip adding a MAINTAINERS entry.

Cheers,
Conor.

--IvHDJo7t0qbdzyog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuHg6AAKCRB4tDGHoIJi
0k01AQDETVi9UGrMYKy5h2BWVOoNATobIqVmYg1/AUDG5+3P4QEA/LVmvM0ml1qH
z1FnWpjwZYsvWrt30oYaxDa/0k1dQgg=
=emIJ
-----END PGP SIGNATURE-----

--IvHDJo7t0qbdzyog--
