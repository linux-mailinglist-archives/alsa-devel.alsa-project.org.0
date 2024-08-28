Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D905A962B0A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 17:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB8B9DEC;
	Wed, 28 Aug 2024 17:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB8B9DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724857439;
	bh=Q/FWYBfhq0EfW/PW3pTyaVMwo1NEzGyWM8q4CMuLmmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MMxiKfXDq35cCzELXGUwllUPBi47ist+48F72MQtkUMHpf6XuzJ267E/a6eW8QJS+
	 a2u2sglVOystgdkXUlDnH0TloLjliOpv1ZiGVlnMC8dKClrwyjMaCSGwHfFbcRg780
	 3i/bkG+UdIKkzpa44K6hVcQBGRrM3yuS4c56MsvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C991F8059F; Wed, 28 Aug 2024 17:03:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01CDEF8059F;
	Wed, 28 Aug 2024 17:03:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64212F80518; Wed, 28 Aug 2024 17:03:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DD29F80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 17:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD29F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q6tBH1FF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13F40A41598;
	Wed, 28 Aug 2024 15:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C16C4CEC2;
	Wed, 28 Aug 2024 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857397;
	bh=Q/FWYBfhq0EfW/PW3pTyaVMwo1NEzGyWM8q4CMuLmmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6tBH1FFTxkGbyppAXiq3i3jb1A3bP52++rMmbcUB3aCvNcgdndawIqNWY2QAVDLf
	 gs21BbcbPtkPUsphg1ZK4FoZOeueWhmZMJ4Gf3MgNfj8rIQYM6p8BZGR5SPjyn4ZLh
	 n+rWR2BYesFeHSrqo1bewKrLLkKlse67VDaFJuRRzwGQnkvXH4ioG2ttb3TBgBV4lw
	 CLd3ogYNZCI7SYOnjmBOrIzeZhC1H2giUZVN9rPSVq4K95SyOGSrfKFXut+9mgz9aM
	 FliJmZ3gzTZwlXty8Z7v4w26porBNOo/CwCxDCYZ5aJSdNYQ/FcbxAV3P87amqofM/
	 vTIHuWPDTElmw==
Date: Wed, 28 Aug 2024 16:03:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/3] ASoC: dt-bindings: amlogic-sound-cards: document
 clocks property
Message-ID: <20240828-brittle-swapping-8b04379725c8@spud>
References: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m2irlymd8u+CRXoQ"
Content-Disposition: inline
In-Reply-To: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
Message-ID-Hash: DG26CLILDYJXCRVVGUW5GAHRA2VQED5R
X-Message-ID-Hash: DG26CLILDYJXCRVVGUW5GAHRA2VQED5R
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DG26CLILDYJXCRVVGUW5GAHRA2VQED5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--m2irlymd8u+CRXoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 03:53:53PM +0200, Neil Armstrong wrote:
> Following an off-list discution with Jerome about fixing the following
> DTBs check errors:
>     sound: Unevaluated properties are not allowed ('assigned-clock-parent=
s', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-=
sound-card.yaml#
>     sound: Unevaluated properties are not allowed ('assigned-clock-parent=
s', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-s=
ound-card.yaml#
>     sound: 'anyOf' conditional failed, one must be fixed:
>         'clocks' is a required property
>         '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>=20
> It has been agreed documenting the clock in the sound card is a better so=
lution
> than moving them to a random clock controller or consumer node which is n=
ot
> related to the actual meaning of those root frequencies.
>=20
> The patchset adds the clocks proprty to the bindings and finally adds the
> properties to the DT files.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--m2irlymd8u+CRXoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs88MAAKCRB4tDGHoIJi
0mjhAQDnSlMChubzH0189CmvK9fFj4PZMmpTw44594t+DOABhQD/RjBwMvnhYOXP
VRtcQF5BBGyx6BDxa1eaamYHy44Vewo=
=lI7+
-----END PGP SIGNATURE-----

--m2irlymd8u+CRXoQ--
