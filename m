Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19560F764
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 14:34:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAB23072;
	Thu, 27 Oct 2022 14:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAB23072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666874057;
	bh=jB3Sy3lQh+g42Om28hBG9fQIjHlM5JaLLJYyHJKWjqU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPWcIJWLk+ZTSY8/e0B5fyCN7nE9dv1nTUNtvyUM08PRygSO86RVaxxAFL9fHW1qF
	 /BSUU7Kp/RgabEJfDyRokmv4f8ddySSWAD9lJo5jzWveURDtICZgHzfd4hVcGJgcGx
	 flDBai5ZUXhx+f9KkxJCKLibiZ9veWbLrt6xTKxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B32F80095;
	Thu, 27 Oct 2022 14:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22310F80095; Thu, 27 Oct 2022 14:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45B72F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 14:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45B72F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d4UIJiMZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50490B8254D;
 Thu, 27 Oct 2022 12:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5399C433D6;
 Thu, 27 Oct 2022 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666873894;
 bh=jB3Sy3lQh+g42Om28hBG9fQIjHlM5JaLLJYyHJKWjqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4UIJiMZIz803b/bD8pE8mTWS4jlKFxUWbFy6b/ooalf6/SBwhR2KLD013OKf2l84
 pEmCH7LGUlyOyTevHgooK/A8DOTbW6/QtvAnhcox8o3l+8SfVz2hUJDsft+TaPvqTz
 Fu025ZDYu7KNjrddMFEgmJCkmL6gyjpQGzaLkWcfhb9W2JtaBSMmX/AZQ4q6pItkzs
 D6E2/1aLy6dOk27kbUkmJxfgF9pwCM/ssEHxTGsEQr+sxZ3y7XXRXghAtT+ezj7s8Q
 paWMeMTOuE3+wQw7h/Jbm31FwNRLT/odwnS9zji+/g/nmkXZ8fPKFlmCLucfI3IY0X
 xlc83wz5aI7YA==
Date: Thu, 27 Oct 2022 13:31:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Bergin <peter@berginkonsult.se>
Subject: Re: [PATCH] ASoc: cs42xx8-i2c.c: add module device table for of
Message-ID: <Y1p6ILuOA6Dgjh7o@sirena.org.uk>
References: <20221027115057.442925-1-peter@berginkonsult.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jdB2L9eetq1D28fw"
Content-Disposition: inline
In-Reply-To: <20221027115057.442925-1-peter@berginkonsult.se>
X-Cookie: Forgive and forget.
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, rf@opensource.cirrus.com,
 james.schulman@cirrus.com, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org
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


--jdB2L9eetq1D28fw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2022 at 01:50:56PM +0200, Peter Bergin wrote:
> When trying to connect the device with the driver through of
> it is not working. The of_device_id is defined in cs42xx8.c
> but is not correctly included in cs42xx8-i2c.c. Also add the
> matching table for of in the i2c file.
>=20
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  sound/soc/codecs/cs42xx8-i2c.c | 7 +++++++
>  1 file changed, 7 insertions(+)

This should move the ID table out of cs42xx8.c, not just duplicate it.

--jdB2L9eetq1D28fw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNaeh8ACgkQJNaLcl1U
h9B8CQf8DD7owUCdSXZJtO0j/G7dVE9/97tFr5nvpkSXlsLfX2B9h8X7EB5RX9WC
6JaI0Ord7nqIj+NZXtxdakI17hpTPZ8Jxm9CDNCb5VHFp9GxAF+wh06Q4JdPysSk
IpQ4Hex72fTd3N2HyyXIf5si0GzJ5kGxwyeXinG/ScudKzngfNlA12q+Pt3bfu0H
g/9sNqirIYaqgHeacnJ/Ns6KLc/ZK9wLTrEFgu6rsn+CVo3aBmAXeyz38RA2g+lz
RqM/3xUYFWgBXtFKw0Mziw4CYMvq5EJ08FJCrbP9SEGDyg010P8YFfnkZrQP+7PJ
3W66WXwqwdbZeuUh3BIDM5bApty4Rg==
=zgpj
-----END PGP SIGNATURE-----

--jdB2L9eetq1D28fw--
