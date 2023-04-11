Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0A6DD99A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 13:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83C71F14;
	Tue, 11 Apr 2023 13:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83C71F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681213349;
	bh=M+aYJc9Iff65DxXoAB8ogDkq4PHM3Fa5/aSta8s9icg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bl+4ZVz18Imb75vPu3NCk2Ir5mRh+qUndn1jKJIUBIH/mCFJV9RpiKAfcvynvxRAY
	 b7vP1Npdy1Hjl7sSTfH7/uZ/b8gRqD/vN+D+OywKIdGeOKxBsHuIKFrAS6U58PKhua
	 xteXo6UPxgcO/H0vIo7dhm3sCr/Qe3RNhBtyxvfU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C21F8025E;
	Tue, 11 Apr 2023 13:41:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26DE7F8032B; Tue, 11 Apr 2023 13:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7757F8023A
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 13:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7757F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Gi+NbAYZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17E5C624D3;
	Tue, 11 Apr 2023 11:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B71CC433D2;
	Tue, 11 Apr 2023 11:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681213292;
	bh=M+aYJc9Iff65DxXoAB8ogDkq4PHM3Fa5/aSta8s9icg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gi+NbAYZ9rDCzpokSpqurcCuT1eq/pzlKgw9oq7XPjjqfjMqSMPCBj7k5Zo3eEOuy
	 kclGJkU6NJP7djkxJcJpsKF+/DdSjZftwXxjYqUhC8v5fS1vnjzxs6Cqfr7ec9QZEB
	 x6ydgrwOBgE3UFqnesLt/EpqsGwnGLeoz1fDg/yKZ0t1Zd+fA6JfMBVCGftO7/phpp
	 Pa4efvaWLRIfwjud8WpmDdG5TEuK6mxYC3NrplqbKXB9OfOsjozdq81qvq3zPJatbg
	 9nLuxXxLsz4/YtUMhW1VTicoC7ffzMO7Ebv2wS7K4KjGUW/wf5FaSIA8Jmx7OKUG54
	 hy8vPqAIY+4rA==
Date: Tue, 11 Apr 2023 12:41:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: ep93xx: Add I2S description
Message-ID: <10c3c9ab-66f3-4640-9067-94f44072eec0@sirena.org.uk>
References: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6kOB8EhJhOnUaMkh"
Content-Disposition: inline
In-Reply-To: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
X-Cookie: Batteries not included.
Message-ID-Hash: 77NXQZHVFSUTVWHNJG65VKFNZSCPCKO3
X-Message-ID-Hash: 77NXQZHVFSUTVWHNJG65VKFNZSCPCKO3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77NXQZHVFSUTVWHNJG65VKFNZSCPCKO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6kOB8EhJhOnUaMkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 11, 2023 at 12:29:57AM +0200, Alexander Sverdlin wrote:
> Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S
> controller.

Sorry, it was this one that doesn't apply - please check and resend.

--6kOB8EhJhOnUaMkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ1R2YACgkQJNaLcl1U
h9CsPQf/dGWT4nFxvehjMcRPGeTHx4TX9+eSzAofTCWEtonFqRAoibbGYxQ0Esal
ExlTGyf4U1ctu/uEzfc+wVtjkIYIcxOrvRS7GcDirQBPT4X/XjkVpQ0wZC8AsZ0F
HF76qMLqD3cPcOzEoffbO4QxPAojv+UCjlm6yzTKh1LBnCSHR283kNIN+jR8NG+M
zMW20RC6tUyv0etra8TWQaXxUFO5NkxCDAcerPNaUZCUfth3sJa5LCoj1t8TAuMO
yfduKjN+YArhgpX8QsulTDgtL1wvXZWXle2hww/kXkpJHUFkWIWOteJr2Ffn7U0K
QqG+/1/lF1f1SAohndCVIOXk4FJcAg==
=xaGA
-----END PGP SIGNATURE-----

--6kOB8EhJhOnUaMkh--
