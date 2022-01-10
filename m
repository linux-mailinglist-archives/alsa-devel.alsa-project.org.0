Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2055489B7E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 15:43:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816FA17A3;
	Mon, 10 Jan 2022 15:42:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816FA17A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641825797;
	bh=IRWKfarB7UT3aTZ8iGKekBjvvhb6auMLdXTsZCJAKhE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XtM37DvTKf2bb+GVj6ASlVtLDyVHVPMAD6zccGsD5E3/E1wrfEWiJReG0ccWlWSWC
	 uaUf6rI0GgZbDzwgxjbMDTz269rOyIpeiQ4B732zetBA/ziZinReruUjn53IIHwDDF
	 ZQwKc+CrKP+r+KqYO5/s6vBbGyYgcEnIOOdid3i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CBFF80134;
	Mon, 10 Jan 2022 15:42:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4019AF8012E; Mon, 10 Jan 2022 15:42:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E85DF80054
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 15:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E85DF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="atyYrExP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AE57B8165E;
 Mon, 10 Jan 2022 14:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A54CC36AE3;
 Mon, 10 Jan 2022 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641825715;
 bh=IRWKfarB7UT3aTZ8iGKekBjvvhb6auMLdXTsZCJAKhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=atyYrExP1quHK/+eNzi+g41s0OBEtNuzulk6ZJTphsXFDPrNO8m8RH6z9LlRZ8EdA
 4lM/zxXN9UbiTTLTDuUpgEay+76ER0g39E07GcY0FFwny3LEc6Ygis1RhyRn8sDr/t
 FRyM3hwIjJ/M9L+NlsnZHOA9rXmgNUZsetlJi6Td4pXKc6FlXfABgGgyp1HglFEy4r
 E1c/IHOhyYbLt4A7T0ZKRAuZSE/kO7H9T5cm7Ouht/k3PyaGvmzAhFjfZ5rSLVPr8T
 IqqY3oa8e6TnFxzzubB8lSFaycBFbCL7NNQuv3YEyf8KA9HSLK4Kdg81DxESX/Zl3I
 lbPTl0rfedN3A==
Date: Mon, 10 Jan 2022 14:41:49 +0000
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] sound/soc/codecs: remove redundant ret variable
Message-ID: <YdxFrb3r/u/ZAAQi@sirena.org.uk>
References: <20220110012833.643994-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ApzzE4PXBCVGL0Eu"
Content-Disposition: inline
In-Reply-To: <20220110012833.643994-1-chi.minghao@zte.com.cn>
X-Cookie: Do you have lysdexia?
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, chi.minghao@zte.com.cn,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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


--ApzzE4PXBCVGL0Eu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 01:28:33AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Return value from devm_snd_soc_register_component() directly instead
> of taking this in another redundant variable.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--ApzzE4PXBCVGL0Eu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHcRawACgkQJNaLcl1U
h9BkZQf+OAhTmjfoI/kZdafc7EFfjT30BWUXU4ml6hWzhuflKB6oA3mrXlJlWHGs
u7r8Fn3Pb/oHQvYITKx+5kvbtNcya/d4dmCZ5cliRsVEy2SkcO9ndU3VtAVjiUt7
WAh92fwhmQVbAuSyN3iZ3uU5fWUshXPNQrCWIWyqrnINiadaNwVUDY9XqgY0hUiV
XGd3kMUHGRedOyPtstAla01QESWbWsDPGxCtatztmChooqf0MOzjsg1/kRIbJi24
CkutHEBlTI04yp0Op3cwUtLneaf7DE4U0VonHwPPC27Ii1qVEg3HpnAT9oT6MLC1
MpLp/D4ApBv9vr2/UD5dEWI9f1d91Q==
=l4Mb
-----END PGP SIGNATURE-----

--ApzzE4PXBCVGL0Eu--
