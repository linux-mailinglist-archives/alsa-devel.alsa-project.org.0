Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0B6300465
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 14:41:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324F41EFA;
	Fri, 22 Jan 2021 14:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324F41EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611322882;
	bh=tgvZ/1z60JKkGwLoukFQodwUHj9JwIRRqSvQHwqBV9s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=azwVnybj3dtTqOTvG4me7pKWDWNfvMmSoN5GGWFH0m2YzNlFRmE5omSSqysUZW5QS
	 LP8+yK97E2JUMg41tmCgOr/hvv9khnQcqYKkqUQKxrmOq7sBKO8qFES1R+NUS3nz2I
	 PgDOqoRFv5ExbXm0W2Xn6zxOBgAkhBsSxYXJSZ3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D71CF8019B;
	Fri, 22 Jan 2021 14:39:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 694ACF8016E; Fri, 22 Jan 2021 14:39:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB84F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 14:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB84F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M4e8NgCT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A6B222D57;
 Fri, 22 Jan 2021 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611322780;
 bh=tgvZ/1z60JKkGwLoukFQodwUHj9JwIRRqSvQHwqBV9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M4e8NgCT88owiBCOeV9k/0Q0Ox9PBoBD5rNmeivWTx7paaCIEwA4fY0LquVc67OX6
 entDQsmwzFAPi5yma/J6/6xqnQzT6CxxTCyrVHgiYIzQMDWVmD+6CGYDumfvqZt3gk
 y4iq2U0PYRwrp38Gl/ZJGn1WSQ8IWw7DOi2l6pj5+Xb3j9pl16a1Sd180jSrek9MXT
 NpXRj15h1t3EpWY3h79924ulxmS8KgSzyzX8vRGivBI2dUV/XlM0JJq1GeY+r5VUqT
 XMR3+uetUuPEjZP8u0W5x2qRxpE1lau4aKikhOCsddQBkrcSV7Jawlga0hgiHumuf6
 M3ipsX2c643HA==
Date: Fri, 22 Jan 2021 13:39:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
Message-ID: <20210122133901.GC6391@sirena.org.uk>
References: <20210115203329.846824-1-swboyd@chromium.org>
 <161125795422.35635.5979635189908672108.b4-ty@kernel.org>
 <89cc3dfb-35da-3498-b126-b440c91f9a45@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Content-Disposition: inline
In-Reply-To: <89cc3dfb-35da-3498-b126-b440c91f9a45@codeaurora.org>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 V Sujith Kumar Reddy <vsujithk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>
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


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 04:56:21PM +0530, Srinivasa Rao Mandadapu wrote:
> Hi Mark and Boyd,

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Thanks for your time on this issue.
>=20
> In my opinion, It 's better not to apply this patch.
>=20
> I will post patch with changing size in sc7180.dtsi file.

We can always do both...  If you think the patch should be reverted then
please submit a patch doing that (including a changelog which will
explain why), but note that the DT is in theory an ABI and it's possible
that people won't upgrade their DTs if the fix is in there.

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAK1XQACgkQJNaLcl1U
h9Dcxgf/WSfKkfBrbINSVecpsf28YD9R64WjVLCVPS+pTZTU1ojywjwATUMT1iKK
y2j3OepqPKoFl1VDYIPuuVZ13aLmHvf/mRYp3nGBkEQ+czsnLnbwZIYJoSw4+whu
ndcJgU6jDQB7W98nkEHSxbe+V0xXxyZkEZry3MzYI5JtolF6eL9kEL17Am/9uYFc
8QyJHRL1pQcOjHQ6idZfO66yuOjk8Dib6QgJkEOw8FDSdDlUc1h+R/e1t8QirpC4
zIe5oPGVmtyLOjIfa1OTM5nHfxMWf9hS69JKK1rCvcFWaNI6wDzr2w3PESFcFm3k
OaSRVTzOxV85twthQdIb0MV2cGA3og==
=4DLb
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
