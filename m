Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BE04514E6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 21:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBAD7169B;
	Mon, 15 Nov 2021 21:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBAD7169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637007490;
	bh=EFJ5NEEe6AqTZtAipr4LPDuaZJt/yymu0pVh28kfRjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jORt2U5lgBBDZ8U9S4X+jb1wNaEdcJdEF7JNjdJkjr8n7WtaKYNLnpv3EIqjIVktP
	 qffAjhME1u9D8Q/+1zKTaGJtBcWa6sRlnCD1m1BxZ61jbkKsIi4WWHio5Z8Kgfz9rx
	 LfQsCcOgrnwE92D7hE17zFUI3BnXSNuGsIPk4/V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F5FBF8028B;
	Mon, 15 Nov 2021 21:16:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8138F8027D; Mon, 15 Nov 2021 21:16:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6464AF80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 21:16:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6464AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gJnpysfc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ACA261BFB;
 Mon, 15 Nov 2021 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637007403;
 bh=EFJ5NEEe6AqTZtAipr4LPDuaZJt/yymu0pVh28kfRjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gJnpysfcYWDtEYrxCsNoZdd1qfgqJ0FqcB8Ho1rdMfX7WG+QHN0sqncgFGNla9aRz
 FnK0i39+cz382IXjnNWtm5LlylMv+xVkZUQHpcLsqr8eo61X6yUc8TA4qksRJVxnOg
 VjdcCpktNps2nocuOGTb6oT0l2e8fyritvyL+o0xydNDVGnkR9owKr6TJ4dZyvwCan
 xDE/dA2sesmxiK5fLgv5aadO5RHRJOctrkzmTglNcsdSm4aKzJc1IMvKObYZDqO4pT
 qLkI0OPFVZA/kMaQg+3GN6btA7njqXzUN52WtAFcSu/rorJMAMf50ndeXY3Ptxk9f4
 jfqJyak0NthWA==
Date: Mon, 15 Nov 2021 20:16:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] ASoC: sunxi: sun4i-spdif: Implement IEC958 control
Message-ID: <YZLAJi12yBLgYSCD@sirena.org.uk>
References: <20211115200833.452559-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mmo/3jm4MWZQwArs"
Content-Disposition: inline
In-Reply-To: <20211115200833.452559-1-jernej.skrabec@gmail.com>
X-Cookie: Custer committed Siouxicide.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 mripard@kernel.org, lgirdwood@gmail.com, wens@csie.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--mmo/3jm4MWZQwArs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 15, 2021 at 09:08:33PM +0100, Jernej Skrabec wrote:

> +	regmap_update_bits(host->regmap, SUN4I_SPDIF_TXCFG,
> +			   SUN4I_SPDIF_TXCFG_CHSTMODE |
> +			   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
> +
> +	return 0;

This should return 1 if the status changed, _update_bits_check() can
help here.

--mmo/3jm4MWZQwArs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSwCUACgkQJNaLcl1U
h9BB1wf/Xv2qocY6b/8HytgoXLjYqLMkxgRWEizu9WKx5MDTpypAatJEY4DMaTna
CIs11POVpXEzW/7nYBQcPMtX1y87JFQf5oAyde7FlnlDcLOuRHH9xd8fm9t6uytR
pFi52RwI8jXD+43B3hvftQIeoGczmj4eviR5waX/C708V1fxhugbJqLYZqJwReMQ
4THbpkQiy1OD5mWTGYuzFkRHyYvn8tMEkJxav5bfWGs1RBlqDhg8sY1A1MsAXOmv
2lioByjfhvxJAcddBboQGjAZybRlO6cbdI2XxHpFLglgjV8CkV6wKDyN3wqaJV+w
NEprdmOKl39kPOkyWKrfw9KDE/NFNQ==
=XKK/
-----END PGP SIGNATURE-----

--mmo/3jm4MWZQwArs--
