Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA68488D4
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Feb 2024 21:49:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469F2E69;
	Sat,  3 Feb 2024 21:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469F2E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706993340;
	bh=f2I8gWEzkwSZbGGlhrQHuwLADXjkshYxOtnScKHw11s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nJDoHY+qAvH0Fud4j6l1Q9836d8t6ee/IfQK6UsnsfD3Y/cJCZFwk8gdtxjU4vVej
	 WfvKnmynUWJxzkRTBWsWtk8Aj4u3QmCBW9Qc/JOI8hDiF/GFlvGu5o4QDuuewuDj08
	 7M4oyqK1W3hBdcLlT+/NV6dFOgmVNO3iOYnqq4ZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C19DFF8058C; Sat,  3 Feb 2024 21:48:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C13BDF805A1;
	Sat,  3 Feb 2024 21:48:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B46DF80564; Sat,  3 Feb 2024 21:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DE0FF80563
	for <alsa-devel@alsa-project.org>; Sat,  3 Feb 2024 21:47:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DE0FF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GN/4T/Rq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6310BCE0946;
	Sat,  3 Feb 2024 20:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2F8C433F1;
	Sat,  3 Feb 2024 20:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706993263;
	bh=f2I8gWEzkwSZbGGlhrQHuwLADXjkshYxOtnScKHw11s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GN/4T/RqtAM5pPUfQihjK3Wa8sAV3pUsmPhYvA/cg2Mt2nro2ZyjanWbrJsFNV3X0
	 z5BUbR+pQSMZAeHOP3sXKHIURcwPfLXvK10KTL7JVV6BMqAtJcWeBZZaUNH8BgEZwr
	 WzCvc/4pSyEOOKjimaGiYIRPvzhm5cFZkClqVzDoxmb/PXTafnKB5XS5SvdpzINgmK
	 q/IJVnPabe73UT5UmIzBjjFDfb7yi95qtdPjsD2ng69sNJ9Ox97m8liHEvjdKMoKE0
	 QcQjfDe1BO9oUeMuwNyLPZn3s3kiyHosGSbJT7/8lpjlfsPnQ91fjVkcMwRyGM/tUl
	 QPqwMl+qAzuzA==
Date: Sat, 3 Feb 2024 21:47:39 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, lars@metafoo.de, rcsekar@samsung.com,
	wg@grandegger.com, mkl@pengutronix.de, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 02/13] dt-bindings: treewide: add access-controllers
 description
Message-ID: <Zb6ma9lHMu3SAe0U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
	peng.fan@oss.nxp.com, lars@metafoo.de, rcsekar@samsung.com,
	wg@grandegger.com, mkl@pengutronix.de, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-3-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VPm+VxExOC+V7OZ+"
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-3-gatien.chevallier@foss.st.com>
Message-ID-Hash: OVWAU6ORB7VTG5T2Z2RYO5V4Z2W6NOFA
X-Message-ID-Hash: OVWAU6ORB7VTG5T2Z2RYO5V4Z2W6NOFA
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVWAU6ORB7VTG5T2Z2RYO5V4Z2W6NOFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VPm+VxExOC+V7OZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 04:23:45PM +0100, Gatien Chevallier wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
>=20
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controller. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to a firewall bus. The firewall can then check the peripheral accesses
> before allowing its device to probe.
>=20
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--VPm+VxExOC+V7OZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pmsACgkQFA3kzBSg
KbY64RAAof4Gx7h4jhXu9UFvGgxDMB7nucJwU2vnrWAQqslpX78IIuHnDzQGSdx4
YeqQnv3x5PquSqBz8x/rnE1ptR0LqnAgeJdEOQB0AAicQ+VFy75kPngr9dtiCJuf
SrCwaIYQ13qIhhC6pa7HTEUSQN/KX6DVSffmeJmOJoHIqGa1L1ldEH5tujF71Plb
q5ugpGi2Jkmb+UU5/EaXadNKZ5b3BSp/xWur8Eemy9Z4DqqoipzJRzSJHufFNZDR
pRdNn14JQlzQ948vT+YdpGqPE6jrVpd48rygAjaXsPx3cVQx7ouU6tKPnFLjtgyp
tb0R2ZIQNXVaQV36XLwhvv0qFqHEiY36q+GjYSEbMHbO1b0+zneKgmZXNSwCclEp
WQ8DrD3UEKTXcDHmoRV5GVgzZyk7wmK8zq3jofTemYyfKhSvsmAiufzZCQLV/9GI
ScuNib34aJrsiIXiD40DsFNcutPh2v+aBXQmtfpkA++3ZvY9aBQa5KeEqzrKPaa0
AVXFtXPN4hnNkUzTogCTHEvL7dYtbi0h7W5fun3D5kOLdZuewR8vFAotIaDRG7tB
S7AWJDu+x2RT2xAs2yJEfSHMwoBZRdq3nJVugmRDb+VELZmIDBdN4vwBRXfi+cHr
ouzPgt76DcQhfF6JGRUhloWtVuWW3QRQ1uYMpWUrKztG+3WiqBU=
=nMRV
-----END PGP SIGNATURE-----

--VPm+VxExOC+V7OZ+--
