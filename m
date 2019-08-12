Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97A89C41
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 13:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31123166F;
	Mon, 12 Aug 2019 13:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31123166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565607793;
	bh=tkV0IM3GZHReUyUXHCTmD1yLg3zo1I/2vT2DAUR9MQY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMO6MtLs0H2gfEVC8XH1oE484nOB9YeB2Ji2ZZGCcMsraIfeGsLVJP2QWlcwKjg6B
	 yOn3O4dEBUCcDZST05z7DbIfl/wBR3NQVTLztcwrF25YHjbALczvIh8aQ6/05jfzAN
	 NoB0V1eQnvDKRK/j1PoZHY39rNbg4c1z3z6uH4fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 539B6F80268;
	Mon, 12 Aug 2019 13:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6D34F80213; Mon, 12 Aug 2019 13:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867B4F8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 13:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867B4F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kkqMmOPd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jvTQU0/ncqqXZDApf5L3Jww+4/vfyT4p+hACaV7a4bM=; b=kkqMmOPduW+sLbd1PSVVdomcK
 Zkfy5Q6CbT3E9jxZYRj6CawNRtzGVSoW+0Z4abnGmutl7WeeYJFlKlRbNxR0meLNSCeIb378NCWxR
 d3Ms2GYtWOqD6r6VMQWwgNViFFJVaKVhyt8BwRuycxEk8oEo8InmjCfvzIsFF8h8BMOFQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hx84W-0000yA-VK; Mon, 12 Aug 2019 11:01:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B6FE127430B7; Mon, 12 Aug 2019 12:01:03 +0100 (BST)
Date: Mon, 12 Aug 2019 12:01:03 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Message-ID: <20190812110103.GD4592@sirena.co.uk>
References: <20190527200627.8635-1-peron.clem@gmail.com>
 <CAJiuCcfUhBxEr=o7VVpPROQZadQh7z1QC0SkWSYt-53Sj3H2qw@mail.gmail.com>
 <CAJiuCcc3_1jZWV7G3+fFQYRZ8b6qcAbnH+K6pkRvww6_D=OMAw@mail.gmail.com>
 <20190715193842.GC4503@sirena.org.uk>
 <CAJiuCceYDnyxRLLLLy6Dn6DLTZ+NmSaUnoX1Vmzvgiy0XvF_Fw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCceYDnyxRLLLLy6Dn6DLTZ+NmSaUnoX1Vmzvgiy0XvF_Fw@mail.gmail.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v4 0/7] Allwinner H6 SPDIF support
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
Content-Type: multipart/mixed; boundary="===============1284272997512304550=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1284272997512304550==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d01dLTUuW90fS44H"
Content-Disposition: inline


--d01dLTUuW90fS44H
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2019 at 10:45:23AM +0200, Cl=E9ment P=E9ron wrote:

> Hi,

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Sorry, I just discovered that the ASoC patches have been merged into
> the broonie and linus tree in 5.3.

> I'm still quite new in the sending of patches to the Kernel but
> souldn't be a ack or a mail sent to warn the sender when the series
> are accepted?

Not every maintainer will send those, I do but you might find they've
gone into your spam folder if you're using gmail.

--d01dLTUuW90fS44H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RRu4ACgkQJNaLcl1U
h9BDaAf+JGgo/qiKbJdNE79u2FwpthOgmKAEpcOVw6Z0Lrx2YvRMtW86kCYYDdmh
La5nF6FUWArR10NnVlhJNeSshE4iSF8iGIBtN/lNJGzb3mprdBrCReGkJzcGoHdI
LnpzXGf+ixSv5om2cqAGZ9a6Wh0l4uNdigwEmH3fNv+K+HT4jdO67g78VFHuaB96
mNlhbXTJ36FtGR6ZNiXjpbzCsRiRwT4r0WtGIoEYO5uPzL3zXV467CbGKmMBpjbD
XlUl7rNzdCRu4eqmnQNVFUcToCt4ZVZYGUZmBrIFS1FW7LVaGQRAjf46gC4WEq/R
Ui9Pyp92dWkr76RNhU29bXkdhz8tcA==
=uNoD
-----END PGP SIGNATURE-----

--d01dLTUuW90fS44H--

--===============1284272997512304550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1284272997512304550==--
