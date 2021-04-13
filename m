Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14E835DF2D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 14:45:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA96166B;
	Tue, 13 Apr 2021 14:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA96166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618317931;
	bh=qiBtcnTxT4Pf7P7KT8Oez6AX4LDmqJOiJjbynCK5Sj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfewFiTAZkTPTS1rUJc3WH+Pw8MtRbr48kJW+hMZHq93taM5Cu+zxiTO7lPvKgN4x
	 +0ciofwVHljtB6mOowks0BVTjzslDXyElRdkwMAJuAUwB1q2rAMU68EF86Ogb8vE/r
	 SFlj6pQLGjyBEucHQXX6vD0djRVFD2P5enogOTuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D25F8022D;
	Tue, 13 Apr 2021 14:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 469C1F8022B; Tue, 13 Apr 2021 14:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94C23F800EB
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 14:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94C23F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FcVngKpk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CE1D613B2;
 Tue, 13 Apr 2021 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618317825;
 bh=qiBtcnTxT4Pf7P7KT8Oez6AX4LDmqJOiJjbynCK5Sj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FcVngKpkYCCvBk30DH3rjZnD81URSc77GI/TivDJuZF+4tHYUzBHbiGRZFQKzU/hN
 ZZd7LleKkJSJSMxCNDZ81vuOBQu1iKygcACi8Kapx63xuyjRTIz3r7apROxSrIBrt9
 SW7CwCdUyk8qDCob+4+R0pnqn6t95Iz0DX7WNb1tAxwsdPSSbYhFJWfbSifPFhEVp8
 TcRw+cUQ8AgMyh8bX+XW/uCj/OnbZd8D2TWWZzotYppfUI1ta2IuFwRzffbsoyuVY6
 MSJx0kpElpiiM+/qwbeDgRIpK/aNd3L8E5zrkIN+8Z0KIgScp8hKbzPoLlglOUvUc2
 Oupbo+qQ98xAg==
Date: Tue, 13 Apr 2021 13:43:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: cs35l35: Fix an error handling path in
 'cs35l35_i2c_probe()'
Message-ID: <20210413124323.GD5586@sirena.org.uk>
References: <15720439769ba94ffb65c90217392b0758b08f61.1618145369.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline
In-Reply-To: <15720439769ba94ffb65c90217392b0758b08f61.1618145369.git.christophe.jaillet@wanadoo.fr>
X-Cookie: Shake well before using.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, tiwai@suse.com,
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


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 11, 2021 at 02:51:06PM +0200, Christophe JAILLET wrote:
> If 'devm_regmap_init_i2c()' fails, there is no need to goto err. We should
> return directly as already done by the surrounding error handling paths.

These are stylistic improvements rather than bug fixes so it's probably
better not to call them fixes.

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB1keoACgkQJNaLcl1U
h9Cv3wf+NEs2AimelvFepIXotWXQORggDNT0w9PYpIVhx8qJDau2m0VQTgfzprrE
SBxqb8RaJnOrzew3fZmzDit+EpfjT7D+X1tWwUvGY8HI/bjc0clVVzlpW81+s/FT
F1mepwHK26ct0/VZxKqiibsNoFCsf81VUDPy26KiScG7BAdrF8us25gVSepKAyIF
kh4fqhgcU8GPtUHz23pSgn0vzgA5qdWPJVVQ44tBoJRAtkJ0zBCf9pnvE5ZNZQt0
bwHL/EwG84ufa0Y4x+wzx+O3VeDaT1fv9K9Se/hIylrCRYg+o/agbgnZcCUDD2RI
v8uynYS9hbv6gYfp3hqFkqKWRH1suA==
=q+7O
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
