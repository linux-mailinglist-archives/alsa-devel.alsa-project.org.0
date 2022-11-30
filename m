Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B663DAD8
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 17:39:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B1F16E2;
	Wed, 30 Nov 2022 17:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B1F16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669826373;
	bh=ziAezTC/XJaHP6qbnCJoSnoYjw7ChhFLmDQu0bpkmYs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0fxxA7eHXry0353RvZBlq9p4+Bo4Mb8wI/CpC1+ag/dAKzKfeSfk0KycSgIfJl2I
	 peCdaECy7YC7ycXxnVfQFTLp8YGC4CCGiyRDP3YobE0N+KdSDHRuAzFTL9UruqBlml
	 e8Bc9jz9eGLE/6NXi5vNGmcXoEi7S5zJ673z9oVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8CEEF803DD;
	Wed, 30 Nov 2022 17:38:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E305F8023A; Wed, 30 Nov 2022 17:38:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77176F800B6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 17:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77176F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DJCKyBmV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58A75B81A79;
 Wed, 30 Nov 2022 16:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F53C433D6;
 Wed, 30 Nov 2022 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669826306;
 bh=ziAezTC/XJaHP6qbnCJoSnoYjw7ChhFLmDQu0bpkmYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DJCKyBmVcO1A/uh/4j2HQD22TEQfqy3k2ekP8t9F8cAXEHtYcylzMbl4KG/g//wz+
 gvQzghw58Z6RjWDgdOSbS9v8vitslsbJhJ9MpcO0AsqSd91GKBAmVu308rIpsTvMw6
 0Vq46/0qZ9BDNStivxL3vaJgatJmoABa7ZTlBtPLFwjq6g1LAPjwYpjSHlDW0FIxH0
 RSJgex7C3GkG5XUbv2gjkR8Buyb3qNRNmjcTaJD1RQQFPcRhfsw8ksbNaddzupZ11w
 8yb+c9CUcmDgeKyrVOIT7Hw24SJ3/coLpKBhw32js36+XB64Wuj+kpd6dUSwTVt7Ve
 GJQXfrSqL7zQw==
Date: Wed, 30 Nov 2022 16:38:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v6.1-rc7
Message-ID: <Y4eG/F/ZjHxOGL2S@sirena.org.uk>
References: <20221130162338.BF2F5C433D6@smtp.kernel.org>
 <87v8mwo178.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ce3jzlpf9l1yd+16"
Content-Disposition: inline
In-Reply-To: <87v8mwo178.wl-tiwai@suse.de>
X-Cookie: Jesus is my POSTMASTER GENERAL ...
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--Ce3jzlpf9l1yd+16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2022 at 05:29:31PM +0100, Takashi Iwai wrote:

> I'm not sure whether I'll send a next PR for 6.1-rc8, though, as those
> changes don't look urgently necessary.  Let's see.

The ones for soc-ops are the main ones if you were to pick some changes
out for a smaller pull.

--Ce3jzlpf9l1yd+16
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOHhvwACgkQJNaLcl1U
h9D9UQf8C03C8OktAHfQdixNFTh3Fs1vgF5F2SMLLnES+DnjeYLefqFkUAJWZQEZ
Y/gOnjTiiKbjijhZUncpkwUviH0GaRiWvHCyEuHdrlgJSfIsVVBSmn8+jJGGKzGh
jBAPEBxx2g23zb6/738fmLGmdOr+dlv8UI7gRbbsTkVn+2TXUokoAXVyqLyeq7uq
31SWKg7nxh8H49HA0gC9MfTddCaN73gcNaRH5JUtyQ3sA6lMpmkbm6oGJfuFKUlR
6mauL4BDzZUNB4dupF4o2KLu6DN9p5MDhicBRG1X9mGtRLkdeYjrPhrS0d1lOt+S
jrkKZg12KYd6KO3jN08BMwcDZZKI5g==
=KkJ5
-----END PGP SIGNATURE-----

--Ce3jzlpf9l1yd+16--
