Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19028633C2A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 13:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4C291658;
	Tue, 22 Nov 2022 13:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4C291658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669119180;
	bh=/z2qc1uI3NebpB+3mdpORi9OgnUkruCxcihYdbzhGfo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=URBVfRJLxU8UxkG93MsLBIvc+sqGqncT76gsg8ZG3pUbOrMLg53DEmFlKSKn2qAi0
	 P4OgEsQQNPHrclHYqgtf/mfY61Sbpex1hh//vNdqrt73hjQCLD+SA1qmypShovUrA0
	 m2Ri3PN8jW33qAj4XI5mcMp6Ru5fbOFGSAQC+UDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DAFEF80310;
	Tue, 22 Nov 2022 13:12:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E91BCF80272; Tue, 22 Nov 2022 13:12:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1051F80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 13:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1051F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LCSLPsPV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E352261698;
 Tue, 22 Nov 2022 12:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0CAC433D6;
 Tue, 22 Nov 2022 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669119115;
 bh=/z2qc1uI3NebpB+3mdpORi9OgnUkruCxcihYdbzhGfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LCSLPsPV1TsmwjswLnlBTU41wJkwd41DU8kdtiaYBnVJv634uH9MOk0NoA76eC+oi
 U+46gP8aiYGvbh662QqZpD3JKN5vslPYicfa2JdHCc/Xe8+8i1xExPBi4+D5PL+Qgg
 r/aatccaQB9XqeQ7zIcWRIifspD1wk2xkDbdia71FlCG5GB2F6tAQwnvATm/Wqp6Ix
 Uju7+L5Ei4rvBK0k4elikJeTwLpDrPNV96uxJnkKYuDLgh6f+UDLNLivieY6GYG+7W
 +MmQylF8N2Rhbhm8KAeOcBCyqtzNcKtvF4XX56z0p7ktYsk67LO1Y3uyJZG7Z8uAFI
 PCCM3MfhUGTjQ==
Date: Tue, 22 Nov 2022 12:11:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Move fixed string node names under
 'properties'
Message-ID: <Y3y8hTosK8UNTL7K@sirena.org.uk>
References: <20221118223708.1721134-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lDjTxj1SUPsxEEKH"
Content-Disposition: inline
In-Reply-To: <20221118223708.1721134-1-robh@kernel.org>
X-Cookie: That's what she said.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jerome Neanne <jerome.neanne@baylibre.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Andrew Davis <afd@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--lDjTxj1SUPsxEEKH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 04:37:07PM -0600, Rob Herring wrote:
> Fixed string node names should be under 'properties' rather than
> 'patternProperties'. Additionally, without beginning and end of line
> anchors, any prefix or suffix is allowed on the specified node name.
> These cases don't appear to want a prefix or suffix, so move them under
> 'properties'.

Acked-by: Mark Brown <broonie@kernel.org>

--lDjTxj1SUPsxEEKH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN8vIQACgkQJNaLcl1U
h9Ae0Qf/emE9/oA+dPnGHlis/IeySfRJD4RM1Am+LSJBAqwrpx85Z6Q2H2bURwJQ
ZWw+Q234RANSgC5arbh8/luVB0Z0UYs21FfnyBefSZvA5FlW1JHt+jpHcM6f9fdS
vB8r+afbJpNRpfQG3OUg9uIcugKdi3uie/TGzzILDNa9OvJ+FHZG6m5RrPO31xMQ
S4CYuu/MJFRq92V7Ra2SOxHjAn+p3kjXzCizHBdcia0DQRdRGORVZPzBqVpSGxhb
QEaiE7P+yYW9oQy8sVIb/ChjUMjY4w3SJr/+IAIhrpxV4DtueO7Gc+rP47PsHDoA
I13D2nJht2ZuzW11fCfbkTnuYTY0HA==
=4gKN
-----END PGP SIGNATURE-----

--lDjTxj1SUPsxEEKH--
