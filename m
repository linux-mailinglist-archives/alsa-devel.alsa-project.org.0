Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD18C9E53
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E340CAE8;
	Mon, 20 May 2024 15:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E340CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212816;
	bh=cyel7fIdwl4HctMWrrdTp1YOPgFDo9/NgLEnSREBmac=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tOW7L3UqmvpgPDNoP+y1jefqIDpsgP9o/8A5I+TEb0aG7gdhaAYZ7wogiK5M/0ZqM
	 kzfbr5sL4FYTobRBkX9i5RkvcYSQMhrAKpT4G0jEbSYVcG3pTEaU69MBhNVD/wWcFl
	 JMvCWr3cREX8L1Z0NDLYD3nLmkLBbTnpxdq5Ph7E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5F82F805C9; Mon, 20 May 2024 15:46:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04996F805C5;
	Mon, 20 May 2024 15:46:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7677EF8059F; Mon, 20 May 2024 14:41:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EC1AF8020D
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC1AF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lhCtg23U
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8DD36CE1A9D;
	Fri, 17 May 2024 11:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CBAC2BD10;
	Fri, 17 May 2024 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715943970;
	bh=cyel7fIdwl4HctMWrrdTp1YOPgFDo9/NgLEnSREBmac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhCtg23UXxfH8GFvpV0bBhTuuNC/yOVcyf8r+/SBwHRDykFO8ucIH2zOi4Lsfxh4d
	 jgUm1njcrxzwkFc5ERNxH12t8OuT6FilvS5TVUDj2I26qEA62JOrg9ddHttNLHU92I
	 WwwqESVPuv7qE7Dt0G1BbgYEuXiM/bp8Kp5wUtlatKoOVFCm7wjeV73X76XhNJgovE
	 jrSu3So5EIc69ImofyM9j3891OZ3tYqgklB+lrMan8iv6hEsQ/mi44SN+vCPxdjeUx
	 FK4gKAgevr+QDU7R6Lgh1WAy9nUhkn4UvE+ABj0uOQr0qIz3E3Ic29+uUjVaNb4a7w
	 1mCgljVttOEiQ==
Date: Fri, 17 May 2024 12:06:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Message-ID: <aa212906-6579-4884-82b5-6d0eb8b0b7a0@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
 <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
 <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cuAZOLW+M2wSeAZZ"
Content-Disposition: inline
In-Reply-To: 
 <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Function reject.
Message-ID-Hash: 5GGQIAB4GKUHILOLGKBNPRKSZJUK6O4Q
X-Message-ID-Hash: 5GGQIAB4GKUHILOLGKBNPRKSZJUK6O4Q
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, shengjiu wang <shengjiu.wang@gmail.com>,
 Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound <linux-sound@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cuAZOLW+M2wSeAZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 05:05:38AM -0400, Elinor Montmasson wrote:

> This new compatible is intended to be used when there is no codec
> device/driver. There is technically no codec device/driver for which
> the clock input can be set.

This is obviously not true, there clearly is a driver.

> Is it a bad idea to allow setting the cpu sysclk direction only ?
> Should the compatible be limited to use-cases where the cpu sysclk
> direction cannot be set by the machine driver ?

When I said "this should use the clock bindings" I meant that we should
use the clock bindings for configuration here.

--cuAZOLW+M2wSeAZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHOhoACgkQJNaLcl1U
h9B5+wf8DiGSZ5ltF8WMKf7h2wg97OfIIvLbAgLOdxagHZRUlW/dW/+Yb3DRoVUx
bWVR5k6wCU7A6Qwi1k/l7vnJ0gi+7ZqpHvuecyUqUZzymYsReuFY+p73Hm+4vZOq
hCopfIw0bE96SL2v3NQZKSoIiXX/yKxVU6NboIhgjeZuUWeabzwTkJczdvahes8z
Wqa5Jfd22U7vq//vQQIViaVycQujM1QOA2vIbGAP0sF2XGNUzo1UmmE5mtbDlbLE
Cn3ijtOv8bhzkca7J5XKbiWo6JmN/7ormEDq7cpF2fWvfJnxd2L/L8ciKH4ylk8z
MQjb0jAheAGAERAKoilEwWJkgcCJ/Q==
=Bx3M
-----END PGP SIGNATURE-----

--cuAZOLW+M2wSeAZZ--
