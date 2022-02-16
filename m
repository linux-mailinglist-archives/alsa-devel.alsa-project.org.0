Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4CD4B8E10
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 17:33:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C761AAA;
	Wed, 16 Feb 2022 17:32:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C761AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645029185;
	bh=mO5tDUtqRebDAIgJR1yd7aBDtcvTpOepMJuSEjV/TTg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cXv7Dt4Dx9HsLHgC2oHoL2MhzENmFP0E3Qit4mx5/kCCIYk/Ia0SNXHynLXZ4bN1I
	 TZDmftJHcJZxCmaK8rx1/1MyBRAxN5fw2SlyUMOXpDTS9RItMW4zc8fEc7Ko1JbEyo
	 2rIdgcERwVqv0S4zwQlqw3GTjvkuLE/sG6ISCIKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C1CF80256;
	Wed, 16 Feb 2022 17:31:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 360FFF80245; Wed, 16 Feb 2022 17:31:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D42CDF80118
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 17:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D42CDF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HdNL1qyx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9FD53B81E61;
 Wed, 16 Feb 2022 16:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771D0C004E1;
 Wed, 16 Feb 2022 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645029096;
 bh=mO5tDUtqRebDAIgJR1yd7aBDtcvTpOepMJuSEjV/TTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HdNL1qyxrc/A0gNWMAtadBYhaVYjMcVwVRM9SgputFHdU6BNEGTiBYlhTaUp/q6/E
 ZIZYcJPNYkS1VX3zz3iBWVCVqwj95OAz1fq/Cb6DWT1nrrclAm6TTDOfAh/0HknHaM
 UsVw/sxID1ABvvOR4u2ArMEAhNVKMCdZ1YC3baSyJzqOwdfObrpO8PW70Czf98RgNG
 beQhhS3lWJMM0popIFjvJxIp7tQvron86rVoghkS/+MiP+eZp4hsna3epqmyLZ4pc4
 xzB/b6j84ImCYPLlZYbhTU1QxOEx/ilahDMfJPlfns1o3iEXEP5OnelGHCD4sUxUxs
 KYZVAset75R4g==
Date: Wed, 16 Feb 2022 16:31:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/3] ASoC: intel: skylake: Set max DMA segment size
Message-ID: <Yg0m5DF59veJ8MZo@sirena.org.uk>
References: <20220215132756.31236-1-tiwai@suse.de>
 <20220215132756.31236-4-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QzYP4wgCsHAlqyPG"
Content-Disposition: inline
In-Reply-To: <20220215132756.31236-4-tiwai@suse.de>
X-Cookie: Fremen add life to spice!
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--QzYP4wgCsHAlqyPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2022 at 02:27:56PM +0100, Takashi Iwai wrote:
> The recent code refactoring to use the standard DMA helper requires
> the max DMA segment size setup for SG list management.  Without it,
> the kernel may spew warnings when a large buffer is allocated.

Acked-by: Mark Brown <broonie@kernel.org>

--QzYP4wgCsHAlqyPG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmINJuMACgkQJNaLcl1U
h9D19Qf/XziQ9wI4oItBQC1LiQqxRwkqzAJBOzFlAR8ZnaJWNTQ2yOwyYAcNDNl7
yzXggTl1wsE2d93/Qwr0dHnt4eP4z5nnmEWq5GPKnpigjD5yGs97sjH/CfTL1GyO
D5s1Wo4rZ806LCPkY5mdzw273wD5aXPM8SMmr6WQ72JkCPQPznyjXnWzizGFF7HE
8J8yu6yoCV2V3pERA26Hg6GXlFdL0e34YjzK1oFnlGolDjz3KzuBNHZO0SPDyrrX
Nhaj9FIzHAdkdoxHHo7YJasVkhtwjh3RSj5XCqjbmAndvrm6FvetXu7QNhNjzP6/
FVv136/4wVflW3dLFE3e/oEt4S24kA==
=asqP
-----END PGP SIGNATURE-----

--QzYP4wgCsHAlqyPG--
