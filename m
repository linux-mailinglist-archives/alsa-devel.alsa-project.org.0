Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F654FCC0
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 20:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616BF1B11;
	Fri, 17 Jun 2022 20:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616BF1B11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655489628;
	bh=bUPFzcA2bwrfrcLXD7x3oRlhBEAEkGwIHCdUjnjME3U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mTXKcL6saJKjNJInZiYPhz2q9pstp3pVvNavQ5QXpzg1GFd6HbEA954rETunzeEAW
	 9fl3RzJUUmc9JSHTvCreropIq2XALBOWHe/o+p3Td9axcWSQNun9z4llr5KHqxl4NS
	 3vV5QT4yimYaEjVCQD3SRcRMcj9QovQk2ES1aI+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B29F8028B;
	Fri, 17 Jun 2022 20:12:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB614F80527; Fri, 17 Jun 2022 20:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A752F8028B
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 20:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A752F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TzEkn0jg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38E48B82A02;
 Fri, 17 Jun 2022 18:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA29FC341C5;
 Fri, 17 Jun 2022 18:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655489563;
 bh=bUPFzcA2bwrfrcLXD7x3oRlhBEAEkGwIHCdUjnjME3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TzEkn0jgFwCR+zHucfSU4ACpiT+fNkS2SkFZmgsY4v8y5M3CnzX+KS6IUY8wdxqZv
 bPLoZOVE6WGVIg4R5nrb0saH0gbx+9qBInXQ7heDbJSX8lK99o/MiR2N3JljAbl+Oc
 CHZfNqt4+z7CCQ60+9dGyhQG57CnXBJ5hiaQBq7wd0Zn+i7HklQdvGyT+nOeCs0T0K
 nPdmfyat8StE/e95a3xGNcHoNzE8dcYkRMwuLn5EGmwVPd/8upE+ubrIKgU2QFOCOB
 JUuoF3x8Z8kSPF89Xm2v3RZQF8VoEdbTFhp7XhKPcsZWVbiPv7cJ60RiD+VZK88Ppb
 9JEPbYeNFIQTg==
Date: Fri, 17 Jun 2022 19:12:37 +0100
From: Mark Brown <broonie@kernel.org>
To: David Owens <daowens01@gmail.com>
Subject: Re: [PATCH v3] ASoC: ti: omap-mcbsp: duplicate sysfs error
Message-ID: <YqzEFX1rIRIwJCnl@sirena.org.uk>
References: <20220616202645.1645972-1-dowens@precisionplanting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="u2XbzTKFvyqRa/q5"
Content-Disposition: inline
In-Reply-To: <20220616202645.1645972-1-dowens@precisionplanting.com>
X-Cookie: My life is a patio of fun!
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Owens <dowens@precisionplanting.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--u2XbzTKFvyqRa/q5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 03:26:45PM -0500, David Owens wrote:
> Convert to managed versions of sysfs and clk allocation to simplify
> unbinding and error handling in probe.  Managed sysfs node
> creation specifically addresses the following error seen the second time
> probe is attempted after sdma_pcm_platform_register() previously requested
> probe deferral:

This breaks an x86 allmodconfig build:

In file included from /build/stage/linux/include/linux/kobject.h:20,
                 from /build/stage/linux/include/linux/module.h:21,
                 from /build/stage/linux/sound/soc/ti/omap-mcbsp.c:12:
/build/stage/linux/sound/soc/ti/omap-mcbsp.c:604:18: error: =E2=80=98additi=
onal_groups=E2=80=99 defined but not used [-Werror=3Dunused-variable]
  604 | ATTRIBUTE_GROUPS(additional);
      |                  ^~~~~~~~~~
/build/stage/linux/include/linux/sysfs.h:154:38: note: in definition of mac=
ro =E2=80=98__ATTRIBUTE_GROUPS=E2=80=99
  154 | static const struct attribute_group *_name##_groups[] =3D {       \
      |                                      ^~~~~
/build/stage/linux/sound/soc/ti/omap-mcbsp.c:604:1: note: in expansion of m=
acro =E2=80=98ATTRIBUTE_GROUPS=E2=80=99
  604 | ATTRIBUTE_GROUPS(additional);
      | ^~~~~~~~~~~~~~~~
In file included from /build/stage/linux/include/linux/kobject.h:20,
                 from /build/stage/linux/include/linux/module.h:21,
                 from /build/stage/linux/sound/soc/ti/omap-mcbsp-st.c:12:
/build/stage/linux/sound/soc/ti/omap-mcbsp-st.c:299:18: error: =E2=80=98sid=
etone_groups=E2=80=99 defined but not used [-Werror=3Dunused-variable]
  299 | ATTRIBUTE_GROUPS(sidetone);
      |                  ^~~~~~~~
/build/stage/linux/include/linux/sysfs.h:154:38: note: in definition of mac=
ro =E2=80=98__ATTRIBUTE_GROUPS=E2=80=99
  154 | static const struct attribute_group *_name##_groups[] =3D {       \
      |                                      ^~~~~
/build/stage/linux/sound/soc/ti/omap-mcbsp-st.c:299:1: note: in expansion o=
f macro =E2=80=98ATTRIBUTE_GROUPS=E2=80=99
  299 | ATTRIBUTE_GROUPS(sidetone);
      | ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

--u2XbzTKFvyqRa/q5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsxBQACgkQJNaLcl1U
h9CbVAf/bLEYqN9UltUUtE4QfUjkIThFiIGPqM6T7Lr0oitKtqpZGp9i2uqREP8Y
67Eks5a6Zs3SZr7ERZ4nYj/rurE+Jd5YgjxQ5SnGtj8tEFEe6/bzOmCzql0eyRX/
VuFTxyaDKi7QwfejecS3lQIxtWKLbUKw3rRBTF8LMH55Hnw2/oCNYL9djV80lena
GoaJVJYcxFU5Glv4J0ISgs1Oih1rHpI8SegCxqpdiHH2mPELxGB7BcyIyLS3x9yb
BL0dxS8LNRDmakViC8B2csXBjMIq310UogmzfMGyTtV2o/bijJ2eM0LiORCPOAGh
EdOyjsMBlX00w5lh3tyDdOYltpf8IQ==
=VZEL
-----END PGP SIGNATURE-----

--u2XbzTKFvyqRa/q5--
