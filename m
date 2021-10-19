Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195694335CE
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 14:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81E616AD;
	Tue, 19 Oct 2021 14:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81E616AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634646020;
	bh=wCIcwvoJd4spptMcCYgIR/4TmnYg3S+BO2UT5K4fWVw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U9po1yc3Rwk3ngYLi+DZAdnVxPnwxy/VYYKIQ6e8DY7S3c/JqzTrIpVahkYwAp9Ev
	 YTPpib/t+d46OEcZN+GKs6Tf223JRbxVbqDp4HLSmUoEoiLFWPEj9pc3854CgxDUyD
	 /zDNX3wrJHLSm0Wnmfb3Whfk984GFBy5s7fJ3cZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03F99F80155;
	Tue, 19 Oct 2021 14:19:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95128F80240; Tue, 19 Oct 2021 14:19:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 434A9F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 14:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434A9F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jHSmWihi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54C9260F25;
 Tue, 19 Oct 2021 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634645928;
 bh=wCIcwvoJd4spptMcCYgIR/4TmnYg3S+BO2UT5K4fWVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jHSmWihieDaIN0Y1fAWtFmHjpDnSCIBT8+OEcb73Knw3qKdyO944Pr6qFFqYoTjZP
 yMlJG/hvF46TMZ7mR6SYVS5uF6twMhjS59qUXUeAisw8BN87u70aE1WsloxTSgQ0NL
 Ll/T/PH8mZ3ksXpZ5ILuxdBtuEZCSioCQW9iFBOk/OZYJV6arAhL2vp+rJqcQwgn3Z
 Q1M9/e2y0AF9D5osSbB5HwM5/SNQNg9idJFxBdcPFbqCfarbvu5RVFvI+M+vDBAhBP
 mgxeFy5cvWIZbg1vNZLPH/3CEfLBo/kotmQcHc8Ff9WDGWklH9I3E6dHmga27s5UAu
 cRUZJHH14Rn+g==
Date: Tue, 19 Oct 2021 13:18:45 +0100
From: Mark Brown <broonie@kernel.org>
To: sugar zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH] ASoC: rockchip: =?utf-8?Q?use_?=
 =?utf-8?B?Z2VuZXJpYyBETUEgZW5naW5lIGNvbmZpZ3VyYXRpb27jgJDor7fms6jmhI8=?=
 =?utf-8?B?77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcytzdWdhci56aGFu?=
 =?utf-8?B?Zz1yb2NrLWNoaXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQub3Jn5Luj5Y+R44CR?=
Message-ID: <YW63pduAGW01PUoj@sirena.org.uk>
References: <20211018114844.1746351-1-john@metanate.com>
 <YW1svMVSgBJygfpV@sirena.org.uk>
 <a5eebd60-da6f-cc56-b1fe-221dc827e097@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ezt81brnuxSWZqCl"
Content-Disposition: inline
In-Reply-To: <a5eebd60-da6f-cc56-b1fe-221dc827e097@rock-chips.com>
X-Cookie: I program, therefore I am.
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 John Keeping <john@metanate.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
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


--Ezt81brnuxSWZqCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 10:11:27AM +0800, sugar zhang wrote:
> Hi Mark, John,
>=20
> Actually, I have submit patch[1] to do the same thing a few weeks ago, and
> explain the original purpose.
>=20
> [1] https://x-lore.kernel.org/linux-rockchip/1632792957-80428-1-git-send-=
email-sugar.zhang@rock-chips.com/

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--Ezt81brnuxSWZqCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFut6QACgkQJNaLcl1U
h9DB9gf/RZVy+523LzSVJYBk9szCLUA5EDcqjGgHOk+IVjtaKqN33yr/3aY9haqa
GhliGqlmI4kGCJIOQkLQdzuPbR06KSjhRDO1F++YxSs4oteFXmoIHBU3JW839lVW
9tkKxnRt14oMuvg2OB4mTrY8WaXNZB00fM7xI42I8YvO1vmUvxqxu4iSdVcfbrsW
Eoj+XlvwnNyesulfY6u28ZHq4m6nM+DeJ/2A68ilyYo/2EzIoqsp2aG31Q/thm8u
fFOyaLekuQc7WndqoWjnA0u0fwzChlrbJLteFSELnfWvYHA3Ca0ASAly7GvVoIbl
n6DJt1BkDmUvqn3B3Hv9kT+2s7UK2g==
=8z1n
-----END PGP SIGNATURE-----

--Ezt81brnuxSWZqCl--
