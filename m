Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE60511871
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A875D16AB;
	Wed, 27 Apr 2022 15:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A875D16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651066850;
	bh=CmwInyW8+Oe6kiq/PB0kUNrRENslXv0ZrYfN7MqxIa0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rt7JgNPb3J1K7oNTxv5Fp8Zir1UEq+SFvHiqMwTm/CHMBhC981I/twUBnHbIKxwLI
	 Vd9pAzyVDGwnRPR68GAMEEkfbZ1TSbcFZCAvvCegKI694FkB9UCdOuEby/2nwVoxbR
	 nyljgPm0jpasTq+QKbt/VZV3U0/e4l2rwXC/h5LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21575F800AE;
	Wed, 27 Apr 2022 15:39:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 175D3F8016E; Wed, 27 Apr 2022 15:39:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D99D1F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:39:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D99D1F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p/icx8L3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 083BAB8268A;
 Wed, 27 Apr 2022 13:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B39C385A7;
 Wed, 27 Apr 2022 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651066786;
 bh=CmwInyW8+Oe6kiq/PB0kUNrRENslXv0ZrYfN7MqxIa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p/icx8L31CpxaFBmV2i6NxtoQ6IpZwLWokLZtYlHZGsNbJ8v7xbG+wcTutkFCDIPI
 0zAVUGcCviqtztZLuDUwIl0jyKkh+Qm1if/75jwVi5vLvlA/E4ly28NHf0ROUDR1zb
 uTwe5iCjcOqmjvmYwFs+FVDn+FQi1A/s7rmoeIG6GJ2KXLG5OqnACNDlIhGWP0wp7S
 yhX/ug+nTc1p1AtPsLHja+9Xwy16ndXw1tuAF/hK+R3zOmkmcl5Vaumwz6wBc0aEwv
 s9wznuLzargRbnAErJih5zU8mUoM7EZ4+G2+V32JMBZVUoSUH2lFMM1oUbHoh237Fc
 8fH32vsOxWe8w==
Date: Wed, 27 Apr 2022 14:39:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Message-ID: <YmlHnahS+Gxbt/YX@sirena.org.uk>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-5-andre.przywara@arm.com>
 <Ymkr8dFjbzEonXOO@sirena.org.uk>
 <20220427143345.73d81a91@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3MNGj1XKwnnFh1tK"
Content-Disposition: inline
In-Reply-To: <20220427143345.73d81a91@donnerap.cambridge.arm.com>
X-Cookie: Buckle up!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liviu Dudau <liviu.dudau@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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


--3MNGj1XKwnnFh1tK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 02:33:45PM +0100, Andre Przywara wrote:

> I was assuming that Rob usually takes those binding patches, or do they go
> through the affected subsystem tree?

Bindings usually go through the subsystem.

--3MNGj1XKwnnFh1tK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpR5wACgkQJNaLcl1U
h9C0zgf/VfPY4PkwXjCy10oLlkI3NzSeNlJMXfz5ZHBDHayEauBbRLJE3imBvZMx
0VmaDOKo3jjTgm7M7FGVJf8Jl8JhyWuG8hBjJ6ClNdSGtknDFhB6UUZLen1cHM7X
UxyxSq8D01L4gOwft3S5mUSe3yV7wThzoGAnCM1kEAbjJj8gcXTXS8F8UhcXbZXY
glVsdKT9pVvT3rWxFzF5hzygMRsMKT6ruWtKZodrA947+2xS/pC5AKqBrPheQid1
EmLQ2XVJynt4qBFYi4u5AJHHKYzUCm2M7JlYd7UEz4ojG1teKDOyZnLjcvaIgYO+
TJrADMStqytXUoUseGyIBmn2LuvoSQ==
=3wfO
-----END PGP SIGNATURE-----

--3MNGj1XKwnnFh1tK--
