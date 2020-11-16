Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4B72B53A6
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 22:20:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC20A176C;
	Mon, 16 Nov 2020 22:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC20A176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605561654;
	bh=SHY23h33dgv8QkmIOXbfR+0ymnh1DApjt1ZFMQXzwTI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPCSnPgTZkLH/M8EWdGce9PywkrSV/NedhaIjejkLYvnAxp6Fp7NMBgWaF9T9zRzK
	 PZnpnJo9dXBX30RW41eNEpaDrteF9XYTdl8QFvgTj0wqcmXUlZRmaUoxlffgmvyWfl
	 A2hZ5e2NR3GiEsDq2SIkTqKhn89UfYFjwU9t7/K8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B5F0F80167;
	Mon, 16 Nov 2020 22:19:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA22FF80168; Mon, 16 Nov 2020 22:19:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B312F8010A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 22:19:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B312F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MVAC0WhP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1053822240;
 Mon, 16 Nov 2020 21:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605561555;
 bh=SHY23h33dgv8QkmIOXbfR+0ymnh1DApjt1ZFMQXzwTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVAC0WhP2O+fs3GrwV/DVLOTVaTvNFQDQ1YEkTpeW4GpzoHpkC7VzoL5kimjr6EK+
 FbhVQmHdNZwIwtXDDAbZB9xI6bGzJ7wyqkxfnGpw48w5coejnjZJ5kJ6T5b4VVY8e2
 L7+bsvzJs3+ZYjIf1yoYAdUJbiVUz7pwM23hCJJQ=
Date: Mon, 16 Nov 2020 21:18:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH v2] dt-bindings: adau1977: convert text binding to yaml
 format
Message-ID: <20201116211856.GM4739@sirena.org.uk>
References: <20201106102052.32582-1-alexandru.ardelean@analog.com>
 <20201110084754.46756-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wAI/bQb0EMvlZCHl"
Content-Disposition: inline
In-Reply-To: <20201110084754.46756-1-alexandru.ardelean@analog.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org
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


--wAI/bQb0EMvlZCHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2020 at 10:47:54AM +0200, Alexandru Ardelean wrote:
> This change converts the old device-tree binding for ADAU1977 from text
> format to the new yaml format.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--wAI/bQb0EMvlZCHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+y7L8ACgkQJNaLcl1U
h9BAwgf/YWLXXnZ0TekHKPuo3Pmjs/ILWyySMjpUzT1SzSNT7QyhFeVobu6IaeBP
smT812NxLhwlQFkGneTbOJveZCqfX5qMJQ5CYLnZVyoHFOVhUL2veRA4+JWSwzjJ
/dgf/Oijz5epN5cz20Gh8mNpfjJQoPfia7hpZLO/UeWKcbCIODBr9zWEdZs2IGyR
dfPY5Ha9LbcpJhuAFg0rKu3j15hC1AHhtP+5bT6ilfwMEFnerP+2RS+yEHOJH9NX
/4t7RyOkEGbktOKHNXMYB+Or3j+NyGJP0G814M3UJtGG7QvJIeMQUhg0SEdFbnFV
ZSMy7Ozjlnp5KjN+/Tl3gncoYiOgmw==
=xNKB
-----END PGP SIGNATURE-----

--wAI/bQb0EMvlZCHl--
