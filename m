Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49259439AF9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 17:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B6016CB;
	Mon, 25 Oct 2021 17:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B6016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635177537;
	bh=Fc03jTaq41qquboEh5WTbDcjROBfciaslPkCNAnheOk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMLwbq9qMNIN7AMt7MCL1rI7y9nCkKUIqPsEvqrmrSRZnItamy/v0bZV2Y+1I3C4K
	 7p47zd9ZJd4SnrinEfvNVYIyQpngVvxFx1JE6T2ZqfdCGZFM8pbqRiQYIQALOjPIUO
	 WcaXsXnUJ4SOIg5z3BdU1uWsZebwKVp3I559rm54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B4A1F804E2;
	Mon, 25 Oct 2021 17:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA0C4F8027B; Mon, 25 Oct 2021 17:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33E0EF80166
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 17:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E0EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P3+Vra5Y"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6C1460E75;
 Mon, 25 Oct 2021 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635177461;
 bh=Fc03jTaq41qquboEh5WTbDcjROBfciaslPkCNAnheOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3+Vra5YRfJnoIZTCOQlU9T3XkknMuibeNRQXw2nbpSIgkpPBfnhUEt+jbDN08MG1
 J77ULNjBH0yDrA7d0RhQ6aPxWk4V4cHBFWeDakyRC+fMaASaRHSmOcz3joW3GQp9Uq
 h/VXmeBjJ/SBxfDqJWYwOgtwLDmIKoM7csY5ofVrOrf97Uw1QRf722SzuTTRP9iXb7
 h4VO7hgSNPY3QLAThvyPPtwyfueUNUEbwKH5je8dz6BUp6b+yThpCMXI1AYaSMWLsZ
 8euyD9eRzKuzW/omL648+Rqq9pkZgPv4VPbc3veLzPWptcqMXu88DoPnRflbGBvmgk
 6ykawpf7ApRhw==
Date: Mon, 25 Oct 2021 16:57:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 12/17] ASoC: qdsp6: audioreach: add Kconfig and Makefile
Message-ID: <YXbT8pDFXXxbCdEn@sirena.org.uk>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
 <20211006113950.10782-13-srinivas.kandagatla@linaro.org>
 <YXbSHubt3Rivh9xp@sirena.org.uk>
 <0313d98f-d626-7086-8808-663dee2a3560@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YK1qolpoN9m7YYoo"
Content-Disposition: inline
In-Reply-To: <0313d98f-d626-7086-8808-663dee2a3560@linaro.org>
X-Cookie: From concentrate.
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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


--YK1qolpoN9m7YYoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 25, 2021 at 04:56:22PM +0100, Srinivas Kandagatla wrote:

> This patch [1] seems to have remove the argument to
> snd_soc_tplg_component_remove() but not in the stub function.

> I can send a patch to fix this

I already sent my own but forgot to CC you, sorry.

--YK1qolpoN9m7YYoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF20/IACgkQJNaLcl1U
h9BFPgf/Xq278R6XH6LH1mFMj2+jKIVvchsE7aU/YmwfJVOusOLEnPU/mRx3brqT
jDMJSTm9jyNQgWUn65uFHOXxvoVK7y37O87u66BlhJ7oDVI30B1UZqiaQdnSBz3L
kHHORbMYS4piac36Ux0R/ZS+8HAJa3+qlG73TT8ny9oSsDRchorsyfsBfKd3WgJG
t7D88wWV80bZpl2238E2RXat9acEC2KqrCCe0e9fC3awinrTeVzArcsE+szzZFl0
990PatCtpjzy8edlPc6BegK07m/EGO4zS4oghX3YcLmRV0awjkpAaGXTqD2A6cen
rMuRmJYQDbRk2K/TUZQiNUnDlZ2IWQ==
=lfRE
-----END PGP SIGNATURE-----

--YK1qolpoN9m7YYoo--
