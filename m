Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739564F847B
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 18:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147F31848;
	Thu,  7 Apr 2022 18:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147F31848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649347328;
	bh=mbr3tWvPXS+7oc88iMgsYe6AtOVAw2C4CiflUG3/xUM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ey1pseTcCDI/S3DmmzDthbywGLnjMEYXgaH8j7ri8Ccd+a48tHFO5r/nks6Ep8jt+
	 TCX8SHnZBlhTMieY9XfF2G1T6ViBI8+7PV4UdQAGs+IT2Of2y3GEE/6ro3+G0eZHSa
	 KYHHMx15BrqvrPsvf3IQfAN81rbIXu+4SN3IgWTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D8ACF8026A;
	Thu,  7 Apr 2022 18:01:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49026F8024C; Thu,  7 Apr 2022 18:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF961F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 18:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF961F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bMga4QKm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C91BB826CB;
 Thu,  7 Apr 2022 16:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6067AC385A4;
 Thu,  7 Apr 2022 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649347260;
 bh=mbr3tWvPXS+7oc88iMgsYe6AtOVAw2C4CiflUG3/xUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bMga4QKmJ1LUTPMP+vjb2fbuJfIVFrhIocSnkYmNw90qxt1AxJhgRJmJvsUVERHfT
 pkQLtGuYL+nPxTHy37QfE2LNLIaDPB0rCArhW9RF/vGc53Uy1TiO65Q3b7Gbg7MKPE
 pNMg5uplzmYVhy3AUb/lq0qQk95DFZBEs6fufii9AB3cAom5l6t4uLb0DO+YABGexn
 Y+XXJ244SwKEnwGgQOkeLgSdiQyPLHW+bMKgexkevwKINm1f2SZe60PsfO7HWuXW5+
 op6mIRRgWGrjju/k/WItloVn93t4Vud8fXq3UIoMMp+t6iNF3ipcsYJID/ygcYNp4/
 u97uqcrT6fjGg==
Date: Thu, 7 Apr 2022 17:00:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ASoC: rt5682: Add jack kcontrol
Message-ID: <Yk8Ktyyt0veW4g+j@sirena.org.uk>
References: <20220407141316.5099-1-akihiko.odaki@gmail.com>
 <Yk7+jbQ0KBM0zVh9@sirena.org.uk>
 <96dae189-c0ff-4054-3d00-41c3b44c2cd6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8xcL5lOc7SqbwO08"
Content-Disposition: inline
In-Reply-To: <96dae189-c0ff-4054-3d00-41c3b44c2cd6@gmail.com>
X-Cookie: Look ere ye leap.
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


--8xcL5lOc7SqbwO08
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2022 at 12:46:04AM +0900, Akihiko Odaki wrote:
> On 2022/04/08 0:09, Mark Brown wrote:

> > Why not use DAPM for the jack?  Note that normally the jack is part of
> > the machine driver not the CODEC - there's no way the CODEC can know how
> > it's been wired in on any given system.

> It seems it is an unsual case where the codec knows the source of the jack.
> RT5682 has interrupts and registers for the jack; see e.g.
> rt5682_button_detect in sound/soc/codecs/rt5682.c for details.

That bit is very common but there's still machine specific aspects - is
the required hardware wired up, if it is wired up how exactly are things
wired (separate microphone jack, headset jack, one of many jacks?).  A
lot of the machine driver part of things is about labeling things so
that it can be displayed in a way that's easy to connect to the physical
system.  Generally the machine driver would define a jack and then
connect the CODEC to it.

--8xcL5lOc7SqbwO08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJPCrYACgkQJNaLcl1U
h9B83Qf+NEFoAdBE+er4vf/cVC387DUBcJVgFBUYuzcHoWp6kYb1ldpbXWV9l3u/
hnAyX4s/YzH7Eiw6D8Ws9KNmhUSUz02gPeSm8wr4r1diSSSYnSxoFuCjzcTZr465
/pvLVzfuYXjFiA0DF+FAjZknY4xdorErZtg0iTh3nRPo0cbl7SPlsa99mdrKtzQO
5tW53mM3uRCcie+j4B73D1tFnBALby3bcOjsb8OMss5wttOg9X1fT67LhszzY6Mc
XLD5OcGD1/esuJXBydM5A8Xqt4P6kuyoR63uFcZMpMZrXDUQ3eQFbz0SaU0g9Pia
+xNp4Lv55FQgnksYvtPlhPThgdHkmg==
=cC3L
-----END PGP SIGNATURE-----

--8xcL5lOc7SqbwO08--
