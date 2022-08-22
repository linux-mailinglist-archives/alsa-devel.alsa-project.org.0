Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9540559C3C3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 18:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12309E11;
	Mon, 22 Aug 2022 18:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12309E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661184713;
	bh=gCwhkp8J3xaZGPaqVMWBuR/OwEF4x6qUJE6qmrENXoY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMxQwE/95vwWy4cBpG58HabDJb70UN9nFzZrtxab63N8CbSxSDjXYp2Iid3C5OmDC
	 yndaIIUIg3NHrjTXwIMpG6v74gPcMNWZgX6BIOboG3pvlTjHt299X4LQbNo7gNozst
	 bLmINjTKfr21FhX8ejFsCSELok2u2gXZHElaIHMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 812DBF8026D;
	Mon, 22 Aug 2022 18:10:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4821AF8026A; Mon, 22 Aug 2022 18:10:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD103F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 18:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD103F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KA+jLmi0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E8CEB815EB;
 Mon, 22 Aug 2022 16:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F115C433C1;
 Mon, 22 Aug 2022 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661184646;
 bh=gCwhkp8J3xaZGPaqVMWBuR/OwEF4x6qUJE6qmrENXoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KA+jLmi0nplH//vaycJ8J3O8N5Sjiv6P1hDWJjIT+uOGDTmC87PSOU/OPr2KvAVTW
 8/ersCZW7VCT6dZch2V1RrGZUubBY7boyWmqCzy2duR4FcFqPDCFbCnseGtp8VxIu7
 kK5vIzZDyv2hWW0AEMKktnU0U274pFL3cGd+ZgnhNc7Ck1Vl/QX8lDCuVKP8sN1Fjo
 6NH9Xfgs7w7xdGBO3JpUfQwkb7zgHsKsHffaEthsyFU01yiO4Fdm8/p5MBSMHFSXQW
 kMyFrAPwafb0InFNZ+bN7MccWt92gsqu1PtYeptN5dQI3EVDUqzszUxy77IO6D3KOp
 dLRhqkr7wXIpA==
Date: Mon, 22 Aug 2022 17:10:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Message-ID: <YwOqgSrs6YC6yPm6@sirena.org.uk>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
 <YwN2Pd4Ez08yDFno@sirena.org.uk>
 <3234D74E-0DFF-4BB5-87ED-6135BAC1F31D@cutebit.org>
 <YwN+0yHSOSC2aD+J@sirena.org.uk>
 <6EDC1D4B-4B84-49A2-A60A-EA15D27251A7@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5yPmWPqk0dnkKzey"
Content-Disposition: inline
In-Reply-To: <6EDC1D4B-4B84-49A2-A60A-EA15D27251A7@cutebit.org>
X-Cookie: Do not write in this space.
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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


--5yPmWPqk0dnkKzey
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 03:11:48PM +0200, Martin Povi=C5=A1er wrote:
> > On 22. 8. 2022, at 15:04, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Aug 22, 2022 at 02:38:09PM +0200, Martin Povi=C5=A1er wrote:

> >> simply having a =E2=80=98graph.dot=E2=80=99 at hand, especially since =
it requires
> >> little code. (Although sure there=E2=80=99s the danger of it growing.)

> > I'm also worried about people going in and wanting other more tool
> > specific formats adding, if we didn't have anything at all it'd be one
> > thing but we do have something.

> Sure, although I would argue DOT is by a large margin the standard
> format to represent graphs in.

Well, the debugfs stuff there is more a general tool for introspecting
the current DAPM state than it is indended to draw a pretty picture.
When I wrote it the scale of the devices I was working with was such
that I'm not usre a full graph would've been terribly useful, and
there's even larger devices since then (though also a lot of systems
like yours which do use very much smaller devices).

--5yPmWPqk0dnkKzey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDqoEACgkQJNaLcl1U
h9D9VAf+MnEV02nZUZwb9irIJfZY639DB1FaV+ttrHkW88nPvWzx6hoWWjjtJWwY
AacOlqdh12ZlKYkCWyUkWODvfcaY+/OZmEFX5o8QTCsaScpWIDFcp4FugRb5vkUc
Q9XVmiTAuhlRrmbH27mZaRU9NGygI9gx2uuAbbL6IFg2+EV8G4amfgbptVVhfBQo
nOhlsC1oVIN3W4Tsedb8W4IWzWokGBxtXyyNZNeSH7mY2e3A0Y0Xz7UhOofmzhfi
hyVMHxT3qUVYr7t9EHpuXoX5lPZPbGH3c7rqMBHaWgQSh1Z9pbx7qIoMkIFUn+M0
ah2+kGm3Lybw2GO+SOtB0qHIs2JNFw==
=FQWw
-----END PGP SIGNATURE-----

--5yPmWPqk0dnkKzey--
