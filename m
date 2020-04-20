Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA341B0B41
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F93D167C;
	Mon, 20 Apr 2020 14:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F93D167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587387324;
	bh=caw1VnqJBp4MmqQVV2viMKeXieGpJDQ6lgh7Vj0LSgM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1+lPO5rIoFlq3LKrzfTDf/yhrUDhkzAv87xeKYJEx/NksttL1yvXSUlw3DoHdQQ3
	 JOg0Xxu3oPg+k2QPLtHrglH8WhHmskXZc17LHCnNgHCNsgJla6SIC/+iXG9cU+KsEn
	 bVc+6qRslnj2iHzb/F1OakFuYgTwN140hRGZUY3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D040F8023F;
	Mon, 20 Apr 2020 14:53:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AEE0F8021C; Mon, 20 Apr 2020 14:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1723F800C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1723F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TewWD3QB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EC8E206D5;
 Mon, 20 Apr 2020 12:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587387234;
 bh=caw1VnqJBp4MmqQVV2viMKeXieGpJDQ6lgh7Vj0LSgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TewWD3QBS7jjs40MyYGUTfuWbpyyyAVRhZmUOezodYD84VT5bL/uVC7hiLSLPFrOy
 8SYQQVx52JndV9PSdr3WR5G/BqK/8pmOohSM6SZvLBLnvc0fdrDo8c2Y50gJxADm+T
 Ur/N8PFT2lKlInjR8r7E/nc8gfXRc09SYxLFx57Q=
Date: Mon, 20 Apr 2020 13:53:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Microsemi ZL38060 binding
Message-ID: <20200420125348.GC10045@sirena.org.uk>
References: <20200417221341.31428-1-TheSven73@gmail.com>
 <20200420121542.GB6507@sirena.org.uk>
 <CAGngYiWauBTnXDcP9UC1S7U5Ogy0B=bUZSdGs1Z9aKZ2+sB=Qw@mail.gmail.com>
 <20200420122534.GC6507@sirena.org.uk>
 <CAGngYiV9MxeLrERkgU2+rucCiJ5StCXN7GXxKLMfaJ-bqSpAAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline
In-Reply-To: <CAGngYiV9MxeLrERkgU2+rucCiJ5StCXN7GXxKLMfaJ-bqSpAAw@mail.gmail.com>
X-Cookie: Hope is a waking dream.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>
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


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 08:50:45AM -0400, Sven Van Asbroeck wrote:
> On Mon, Apr 20, 2020 at 8:25 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > I'd expect someone with knowledge of the hardware such as yourself.
>=20
> I claim no expertise - I was just getting tired of dragging the
> out-of-tree vendor
> driver for this chip from kernel to kernel. AFAIK, most people using this=
 chip
> have forked the vendor driver and adapted it to their specific needs.

> If my name has to be there, I'd be keen to hand it over once someone more
> familiar with this chip comes along.

I think by virtue of taking this step you have become the de facto
upstream expert on this chip!  Like you say hopefully someone more
familiar (ideally from Microsemi) will turn up.

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6dm1sACgkQJNaLcl1U
h9C0kAf/VfluleklGZwAwINGUKEsAnNMMpgzkCeC04jQeANQold1WwieTBWwOlcm
t9AoRee4bTR6kFSHkHmRfUMgC3GUl8Dy1St/+2r43UMUYbR4FP3WhrQrVNRRQUob
AjFB/5ibXcAdnqL63YRzKl/NYT0Hpvz8m++w0++NZ0JXjvD8il1Z5kgV6HnHEZq8
4zc9STyT0aZXjDCwBA82dGEXOEit8YOsUwEjTt9k/XzcC7EBZslzgBEMwNmnnCBJ
PHrUFwhx4RJrynRLDDKX4j2RXbwhmiMp6CZAj0wMfNdZdFAFSVNr3ZFA/xIT0QJD
H8Oo73IWb8FVBHM7hm/z2nGhCWl/wQ==
=UrRl
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--
