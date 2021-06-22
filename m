Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F483B0A46
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 18:25:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E21165D;
	Tue, 22 Jun 2021 18:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E21165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624379108;
	bh=dvnbdNnOiv03SgjtecC7Dh5JlTHc3Gn16vJg0Lm+0VQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MN8DVRKYax6CTooFoiVuz9aXmPHex3gRZwnAXIX2+R7jBltmDczG5/Vl0gmHn32Q0
	 MvrC6Xw/S3Zo9DYEMZ8ukL6CVUuZfyPRoN5J3SKkSOz9nfKiKqGGO8VbxqxfUaUdpP
	 E3Rmm5Psz3N28GV2yIjH5IOm748x2zPCJ+yUXcsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8958AF8026A;
	Tue, 22 Jun 2021 18:23:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DAA7F80268; Tue, 22 Jun 2021 18:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8227F80137
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 18:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8227F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lIZK4me2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBAF860240;
 Tue, 22 Jun 2021 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624379010;
 bh=dvnbdNnOiv03SgjtecC7Dh5JlTHc3Gn16vJg0Lm+0VQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lIZK4me2EB7vjw3OO3BFGCQ6AOkbHde3QpzQhzvTRf4rBlt0/HJ16wOBqS6XKXP1n
 Os0RgH4qcR6j+Xj/PPQkHFPoTIFuV997H5bRIahKQ8R69mAdtSL8wH6j4XD7zK04Lk
 PF3vJYOXOfHPOhrUqBSMweeLRhq4B6Nu9pCCVt+lCOrZkj4GlxFbCLe3eL1hfstHLg
 OxnR/9MoQaKyZMQHZuKbD9hsvKfgUcoC4iro246CKO0gWQ1H1Q2x3JBKuCINIWi9os
 PKHI4n4SMcyrwbm1PnubdP3LzISh0K2Xb4Cwh1x3Jn439lHLJ52qon/UgEHbLCdbkd
 UdxJnAsXiMpHg==
Date: Tue, 22 Jun 2021 17:23:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
Message-ID: <20210622162307.GF4574@sirena.org.uk>
References: <20210621074152.306362-1-judyhsiao@chromium.org>
 <20210621114546.GD4094@sirena.org.uk>
 <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline
In-Reply-To: <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
X-Cookie: fortune: not found
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Judy Hsiao <judyhsiao@google.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
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


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 12:10:53AM +0800, Judy Hsiao wrote:

> Thanks for your review comment.
> This patch is used to support multi-channel where we want one codec to
> control the only GPIO shared by 4 amps.

So you've got 4 instances of the same CODEC?  Then I'd expect to see
those all individually represented in DT.  Or if there's a single
physical CODEC then I'm not sure what the dummies are for?

> In snd_soc_runtime_calc_hw(), by creating dummy codecs that share a
> DAI link with a real codec:
>   1. The min/ max channel of  CPU DAI will be directly adopted.
>   2. The formats and sample rates of the DAI link will be determined
> by the real codec unless the real codec supports the rate
>       and format that do not intersect with the rate and format of
> snd-soc-dummy.
> That is the reason why we don=E2=80=99t specify the format and sample rat=
es of
> the dummy codec with the real codec determining the properties .

It's not clear to me why you'd not just describe the actual CODECs here
rather than using a dummy CODEC, the fact that the dummy CODEC is doing
what you want is just an accident of the implementation rather than a
description of the hardware.

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDSDmoACgkQJNaLcl1U
h9CHhgf9GyO7DmKsckUqnMgiWbG3VYozrFo/OBZbuZQ9BpW1Z1HA8NODEpIGZnJu
IFCzwNcBW9kli0vU6+PDVxxhMtuGuj3/+Y2IabUlr/f0Mq6s+rgKJAjPmyqb8MI8
7RkBXF9O0esDEhYBV5w0sMhAp/galLTCgUjPevMdSmfCuiMZHLpKnHW1cW+FgK0m
8gGcALicOwyv2nYo42vozX8jt3ujOrccNTHP0mlPuqj2ceW8IAF/yQDqkb9C7kqL
K4aUK/VJ5mcx4z0Aj2PQyFoHn1ITfSOOo4ROsOT89HdupM1TeuCv6pms0KIfHGYG
exburGtpvtRoijicCRPkG7E03VLbZg==
=UqxB
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
