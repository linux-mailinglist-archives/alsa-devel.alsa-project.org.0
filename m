Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7A7D8812
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 20:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A9AC852;
	Thu, 26 Oct 2023 20:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A9AC852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698343956;
	bh=zAjZWYKj0X+TeoQ8BBUh2QjPiWJbCoaFCclLInGxZek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JtHiM1HzxPWQ5ouyjFNe1JB+Vxu3zXbgOXbgjuKfAtFZ//SHIKd/Kk1cYl1WsqtOM
	 IyvgQwYTmgJ7fJkp+T9Z40Gua7NudRaSIAPbBJNccyREJ2TPjifRBu2r0eSFjb+vJS
	 7mOWe9DYOriVdvZmH2crlABYVsYIxI/hRjqBes8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03C2F8010B; Thu, 26 Oct 2023 20:11:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 993B7F80165;
	Thu, 26 Oct 2023 20:11:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2729F8019B; Thu, 26 Oct 2023 20:11:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 780D7F8014B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 20:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780D7F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U6650vGa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 073FCCE40EF;
	Thu, 26 Oct 2023 18:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3752C433C7;
	Thu, 26 Oct 2023 18:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698343892;
	bh=zAjZWYKj0X+TeoQ8BBUh2QjPiWJbCoaFCclLInGxZek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6650vGaeoBL/T54vbOKjzWtko9dk+h0R1MRIYz11PbdSkogb6xFPRiNUfo7EzXOr
	 Q4I5i0hMEFOGmmQSfsw3zDJ4mYwr+L0P/nHEhLY62GKkZSQYDHIL7EPte9QdinP5yY
	 Y9gCtybfrCmHL58tFSzbUrRFW5c001TDKk1JbbN/wzFR72hvhcPu0zKhRn3jiSZNUf
	 zB1wTIh6r4NQOo78uyain9fwBDPQvK0xSwQK6sgmBgDFz0BhSrUk5h38sl7W/oCNp3
	 y1ONym/aUFm4xmqDN8OkS1qxTnDbStIzmds5C81nr1kFbI5Q3TGunJRfSan9Se01CE
	 SsIKvsAPQ2ERw==
Date: Thu, 26 Oct 2023 19:11:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: sound-card-common: List sound
 widgets ignoring system suspend
Message-ID: <3242e162-bb0d-441c-af29-7c08e1f67d1f@sirena.org.uk>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
 <20231026175842.GA4101469-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HTcFwXshOgNI0QFq"
Content-Disposition: inline
In-Reply-To: <20231026175842.GA4101469-robh@kernel.org>
X-Cookie: I'm also against BODY-SURFING!!
Message-ID-Hash: 77LITFRXJ57ULMHHLEEOFVZO7TZE4CTF
X-Message-ID-Hash: 77LITFRXJ57ULMHHLEEOFVZO7TZE4CTF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77LITFRXJ57ULMHHLEEOFVZO7TZE4CTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HTcFwXshOgNI0QFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 12:58:42PM -0500, Rob Herring wrote:
> On Mon, Oct 23, 2023 at 10:07:17AM +0800, Chancel Liu wrote:

> > Add a property to list audio sound widgets which are marked ignoring
> > system suspend. Paths between these endpoints are still active over
> > suspend of the main application processor that the current operating
> > system is running.

> Perhaps it would be better to define components used for low power=20
> audio rather than the OS mode that gets used. Isn't LPA just audio=20
> handling that doesn't require the OS CPU to be involved? So the state of=
=20
> the CPU is kind of orthogonal.

Not really - you can have bypass paths that don't touch the AP but which
will have the power cut if the AP goes into suspend and it can be a
system integration decision which components that will be true for.
Often it's an inflexible PMIC/MCU setup managing the lowest system power
states.  The pure low power audio bit we should already be able to
figure out.

--HTcFwXshOgNI0QFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU6q8kACgkQJNaLcl1U
h9AzFQgAhv1kIvshMwNbebl4YEDMqA368X4czYNC+zO/doeKPvpLr3ox2HGnTWmR
Nyf4K8yUD5JQDrNir/c/SYLXWQAr4sq5vnn2MyQw3z3LP8TBxG3NM7AiKqEqxQEj
QDIfhI8Izt/86k0FnoS8WVOwK5wbcM8b+HJ3bdo7/b1oA00dVVc3f1dCAHQZHz+U
w+zHZGAY4BBW8gw3tFbGNvNW5AEQUDCHKZbUDECM+PXDVLAUFKrpEz4uho7A4Bq2
LzyGissKaKgzmNDlwvw7yoMEMa51n5nwYCbUSM7B1OmFqYapFpZ+w18Dzqi0KDsS
Eto0aoVQorOv0Qf3Y0rPwaHwhcW3yg==
=z+Ib
-----END PGP SIGNATURE-----

--HTcFwXshOgNI0QFq--
