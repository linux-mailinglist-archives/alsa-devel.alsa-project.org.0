Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D852DB7D
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3394174C;
	Thu, 19 May 2022 19:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3394174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982080;
	bh=i/bU0bfDloHPKyvRxaGvTgWbXFe6z6JQWAGN/Vhk5Pc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CM0RcubjCge41BRyTzQ4j95xUT4MXK+Qc4AU3Ip0087K1PQDFvYvBVZnnPFA5/7bq
	 ShHjlTy6XQZITQfa2+/sRa6wsFxROYGlV/DHSpbrTbwskUHb8aeN7LuruKvu5GCVaj
	 IpZwgs1yNIggpTZoZGUhnkW6JamIBZJZpJdMNdk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72634F80269;
	Thu, 19 May 2022 19:40:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 518A5F8025D; Thu, 19 May 2022 19:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED1A9F800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED1A9F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dYCOpnXo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D58D66187D;
 Thu, 19 May 2022 17:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FE1C385AA;
 Thu, 19 May 2022 17:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652982015;
 bh=i/bU0bfDloHPKyvRxaGvTgWbXFe6z6JQWAGN/Vhk5Pc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYCOpnXonTOfbFrdBJXmWTXnceJ1NnUiYoMMrqYMLyx6p0mcgHx+HL0vo0uj3chWc
 QHUAhqTuYbHGquSQEmorV6HW2ryh0cafLQyNUV/izbDSihgLlTHn1+FWINl0lM9K+E
 4DPCncvaZ1Ms5uHtVp/0kLGnyG7V/SJG8i9+d3Qt3wppTRRfR8qhQ9ckQswZzx0xwU
 bbKS5eTxGO6XzSMXCF9PurXELsoX/kMEtfIgXXFx5Nts3sFnUTGSWtPUyMTtPK7Kjg
 8zIq61piE8HgJ8G290KIDTFO89v2Cm4OW9uejsaNwydpYHlvfP6zvetlhxO1Hhvx8p
 ik2i5vAvRAUXA==
Date: Thu, 19 May 2022 18:40:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/6] ASoC: tegra: Add binding doc for OPE module
Message-ID: <YoaA9ob5CRxyA+fD@sirena.org.uk>
References: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
 <1652895372-29885-2-git-send-email-spujar@nvidia.com>
 <049173a1-0fa6-510b-9169-ebe869b8a3b3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xjIce6nHQZ0dcLVK"
Content-Disposition: inline
In-Reply-To: <049173a1-0fa6-510b-9169-ebe869b8a3b3@linaro.org>
X-Cookie: Some restrictions may apply.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 catalin.marinas@arm.com, Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-tegra@vger.kernel.org, jonathanh@nvidia.com, will@kernel.org,
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


--xjIce6nHQZ0dcLVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2022 at 01:40:54PM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2022 19:36, Sameer Pujar wrote:

> > +title: Tegra210 MBDRC Device Tree Bindings

> s/Device Tree Bindings//

> and then you have enough space to de-acronym this MBDRC.

I suspect people rarely expand the acronym when referring to this device
so it's probably clearer the way it is.

--xjIce6nHQZ0dcLVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGgPUACgkQJNaLcl1U
h9CIUQf+J47qRJ1T/hXpo2PrxjE+DAy/H24LMvtJ0gv6tuwLslEqSPmvNnX5AQ8H
XredwBG+ouBdkkVKEx+kVbnClXuFSrGX3YxzBTxcHsbOXUGgvIbYSoKaDloX+N1H
v1nVvsh1/6viUNyeS8W8sRjQtDSP8mE3GtyWnoTt59Xmrg39ub/QekuPfNBOeXaR
/uyMAFxZKmLaM+VnQKHXHXJgdeRbwWXjnZNTnz8ncGcs/Augj/dJoaHRaOArirDw
2kWSvFv/hxoJWI0tKtq6F2uI1Dk2CODyHCaDcyEuclATNmqH48SVFqwVyBDxA639
6WOmhU7cAmme7vmLkJ+Q3NhA8Gd5Cg==
=T8z4
-----END PGP SIGNATURE-----

--xjIce6nHQZ0dcLVK--
