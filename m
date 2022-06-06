Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B053E594
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 17:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795D61742;
	Mon,  6 Jun 2022 17:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795D61742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654530663;
	bh=vhd5my6p23hzPqpYXTafX+9Xs19bDMxSRZYPH7CeDlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pb49njZ3WbxjzlqKs+qp4cFZb9QJATteP9mbNGtemg1BTdED/deZtw52+7knv0k4g
	 sOGI3mqDmM2yYimjZy3tV6u8uYob4jVrtno5YzhnIbH+dVcyxkkkCNCfevca66s8Lq
	 tFu9sksh4Jr62kHAShj9q2IL7+XBVggTvAdEPg4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7DF5F80310;
	Mon,  6 Jun 2022 17:50:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41AA7F801D8; Mon,  6 Jun 2022 17:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24992F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 17:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24992F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u1UwXXIe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1DB1B81A87;
 Mon,  6 Jun 2022 15:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E37C34115;
 Mon,  6 Jun 2022 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654530591;
 bh=vhd5my6p23hzPqpYXTafX+9Xs19bDMxSRZYPH7CeDlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u1UwXXIe6PMVX+f1UufErS7LJbgs9RYdhUl4Is9wM3UnmxSAfwqgSLLa96U/2Mglb
 g52qJI5Rn7mbjk2b7cBf/BlXDrBLa8/+wMo6H/ddwk5ByzUZthj1SVOUz01lkf6Qdj
 FrJMyqa8noqzZhIiwRYTPuieKVnfp5d2Z+1vTtiXM7ErOsNVhxHZ1qQw81hwzmN/HZ
 8q3U5HCcwHNU7szMY5MSLLUDPlD49MBtN+PlIZil2tIRojdjHbqtfxXAA9lws/sE/c
 mzBTZiXCQXTQeg0gkoOocf21FZlSrYbUk5LeI0+MEQ85innUjvMaSDxgRN+SJDPZbN
 3MS7FqGnH9aQg==
Date: Mon, 6 Jun 2022 16:49:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 1/3] ASoC: wm8940: Remove warning when no plat data
Message-ID: <Yp4iGvGFD9jo4WUP@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SMfXIdWXQXrCzSBB"
Content-Disposition: inline
In-Reply-To: <20220606154441.20848-1-lukma@denx.de>
X-Cookie: Bedfellows make strange politicians.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
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


--SMfXIdWXQXrCzSBB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 05:44:39PM +0200, Lukasz Majewski wrote:
> The lack of platform data in the contemporary Linux
> shall not be the reason to display warnings to the
> kernel logs.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Given that the device requires configuration and doesn't appear to have
any other firmware interface support that's rather a strong statement...

--SMfXIdWXQXrCzSBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeIhkACgkQJNaLcl1U
h9CQawf+IvjMRjYTtlCxj94jZmQcyXcO4QjnvuR2CTFXHZXSO7Su/6NpQz+9eGpm
D/dhru7Esj1HAPzHx+6XIcK1JauvrxbOfPH6Nrzu2ZgV30No/XI9s6/wO4wIwE3e
McZ+A90coMQE5oNukg85LGp6B7xrzIuoAccZkw9EOR4N7LUkQBVJOjPMlqXW3moV
uyAa+wWRFNBiNzPp+l07Tx6znMlzPunwa7FBMJdrsEn3RNCty3US0kE1LMuuxSLz
3j3SvZSISWeckk/aMXvfxyWJtZWmNj1sZ8R06wjY62IbWAFxoxwZ/50jo0h6yunS
n7tiOGDHYntybspAABL4q89tdQtXEg==
=T/Bx
-----END PGP SIGNATURE-----

--SMfXIdWXQXrCzSBB--
