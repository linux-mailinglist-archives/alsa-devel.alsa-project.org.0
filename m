Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E568D213C9D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 17:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BBEE16CE;
	Fri,  3 Jul 2020 17:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BBEE16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593790468;
	bh=E5WBMBWpc0DU8roMGj9Z8eOIghgWwVOfWI+Jkv8oYHE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XqgKp6N6WZFe6l6sOzLmzMtv07XwuFRx1PaKJsc1NsSmud5DLedBxWLe+Kgop/V9S
	 VCOMmnHedHnzHbiK+hrIf95i0HaRNn4IzhQ0GAGkzImiohznnZ6Y8Py1BnZZhjr9Th
	 a6xGFoNfqe+fNOUAyI0zQUAzQQu5aK7vD0gMWGi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A257F8021D;
	Fri,  3 Jul 2020 17:32:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A60F80217; Fri,  3 Jul 2020 17:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D6AF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 17:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D6AF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NbF7K+rP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8D6F208C7;
 Fri,  3 Jul 2020 15:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593790360;
 bh=E5WBMBWpc0DU8roMGj9Z8eOIghgWwVOfWI+Jkv8oYHE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NbF7K+rP+Lo7TK7VAT8lb6KkN5ajc8sINPfixyJa21OL3wnZEL5eag5gC7uqJkddx
 ZAyrCNVXLTqcjI9X9xFQbNqTSFQjvyc+xZnxCOrhwQ45IAzfPMuwXTARz0dgB4jAq4
 nVsqvwd2vB3bG/qxclE1tWY187qwflM5vN2SNO0M=
Date: Fri, 3 Jul 2020 16:32:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] ASoC: core: Remove only the registered component in devm
 functions
Message-ID: <20200703153237.GA16747@sirena.org.uk>
References: <20200703074935.884736-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200703074935.884736-1-maxime@cerno.tech>
X-Cookie: Without fools there would be no wisdom.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>
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


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2020 at 09:49:35AM +0200, Maxime Ripard wrote:
> The ASoC devm_ functions that register a component
> (devm_snd_soc_register_component and devm_snd_dmaengine_pcm_register) will
> clean their component by running snd_soc_unregister_component.

This doesn't apply against current code, please check and resend.  Looks
like a genuine issue and sensible fix :/

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/T5UACgkQJNaLcl1U
h9CblQf8Cyrz/i6w3dI9uFuMBRAn8YEfVAoLAnWIIdNku8olQBF8OVzq8h6luaBy
EqFNggt9cdVR146AImJEXdxJZgwig1sC9li1fMtSSiNKW35/5+IZsH28Pi+/7BTJ
Y2mJbLi0s7gpd1XsNj7UsGuR/JELG+bpVPhf4vy+LcCbjJsFYniybNlzElYR/uux
5YTbnzPGgXK3uMUHRnA5c2ehu+af7V/TgVnrtlbyQAA/8d0IPAyXQ1nYzX8NRslV
4i2lF859MNZROH8t5J6eApiecWQprbXADzzvXqO63G4Cc0Qj6/b2wEj/p2W9chwe
mULcSb4O9IOPOEcQpU1fs12HfHYD0A==
=5nPY
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
