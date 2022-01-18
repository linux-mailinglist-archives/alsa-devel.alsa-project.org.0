Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEEE492C41
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 18:25:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE692C02;
	Tue, 18 Jan 2022 18:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE692C02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642526755;
	bh=0i0HALl5CElF6itWK4Xy0OfN+GttciYs6AltWZomMco=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8qMMMxsCRwQoyrWNVMGw0NPgOyoYgYSVsqoQMPmA2DmEZ3Vlwsr/x3SqVhggOC/+
	 g4wK2Ubl/+rGsAXSEVrPZKXYqAKIlux2ZrDH+dj7b8tjTUdlEQAj/lS+FYUBk8w+fy
	 0jpDJXmbBTsencURsltNP1HIBwJ7Sd61eYihi1MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF06CF80240;
	Tue, 18 Jan 2022 18:24:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99436F80100; Tue, 18 Jan 2022 18:24:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96FB6F80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96FB6F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rsGEjOwZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB3F06148F;
 Tue, 18 Jan 2022 17:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F2AC340E0;
 Tue, 18 Jan 2022 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642526678;
 bh=0i0HALl5CElF6itWK4Xy0OfN+GttciYs6AltWZomMco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsGEjOwZOk5i1sLuSbsh1LxofF510yXoBH/XuBlF892ZaeApOziGnm6+axqdDvfqy
 quLZPPQTCl7hYNaxvNQzn9ORzzbBPmXeRnGIONwl50YNVHEofWgHo754dja+AJRy7b
 EoQ7dVBEwxSmvIj227CcVycHrVwF0Z4X5tP8mcaVN3k6Gip1BZvzMWNPzYo428Cb9o
 saVux0NmrM87yJ6L9vUB+aB+o+Vw8lSbBQ8lW7VaV32fhgmDu5TUds8V2Sv5uLMOTQ
 MLGk3HsK+vN2I9EJh9LN2gKemtBr4MuO5AK6osEbL7GtnaiY2rEjbnzkVZuIeUodk9
 Xfe0dUs0tcruA==
Date: Tue, 18 Jan 2022 17:24:32 +0000
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] sound/soc/samsung: remove unneeded ret variable
Message-ID: <Yeb30O1vtFp3f+32@sirena.org.uk>
References: <20220117110357.863990-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n97Ndc2+f45Gv264"
Content-Disposition: inline
In-Reply-To: <20220117110357.863990-1-chi.minghao@zte.com.cn>
X-Cookie: Do YOU have redeeming social value?
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 krzysztof.kozlowski@canonical.com, tiwai@suse.com,
 Minghao Chi <chi.minghao@zte.com.cn>
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


--n97Ndc2+f45Gv264
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 11:03:57AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Return value from io_remap_pfn_range() directly instead
> of taking this in another redundant variable.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--n97Ndc2+f45Gv264
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm99AACgkQJNaLcl1U
h9CdiQf/cnwAHPfUpdi2ZcXMAIQm5U0l8eYevcDqjxNLufpObRVWCnvxnC8ifOq9
5f9LNKmNG5ZHg1NL6s78jKmIECpU1eltowb+52BCOkTX11QPrAx29q6PllczRWqX
PSmDJTkAqNLC6RFX8Z6xD06xiNfRwapsZT3Ywmo/AQcAySKceNi4gEz7POTHWfZl
Hl06im/X/knMu3j9gg0gJ9LWgScmXyWKCN1fShKFOWI0C0eGYtV8/KmE/ITjJ0q5
KsUBQR4ZKNz+7xou/azWgCTj+NVB7WzB7OfZnd7VrAVsG5mThW+ALsFd2dm3ACkO
P95hTOdPbff+pteD40441nxhPgbKXQ==
=Y7G+
-----END PGP SIGNATURE-----

--n97Ndc2+f45Gv264--
