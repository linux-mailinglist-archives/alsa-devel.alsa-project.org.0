Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0E8733080
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 13:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721CE82B;
	Fri, 16 Jun 2023 13:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721CE82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686916579;
	bh=ACpTR9SBV3aPtqJMQnni7TkSIEUIkE5zHWNAvE8mfrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JdK9gHP/jszmMfuW8D4jAwSnxzpt4Vt2/TUAuu2CSuyqfBLo4I94jP0WgkuA8YN3d
	 dxODYZ2JN7/CoRppRdpQ98GwbejXgQmvbM82klofQ7FInoBJPHw53WMeXzvx4DR04/
	 Yi7bhZDiWKvo4JDyG0AtuiBZhK/TcsESWNKXCoBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C25B1F80544; Fri, 16 Jun 2023 13:55:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C00CF80132;
	Fri, 16 Jun 2023 13:55:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F548F80149; Fri, 16 Jun 2023 13:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F204F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 13:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F204F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HAcsLlGA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD08061F81;
	Fri, 16 Jun 2023 11:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71187C433C0;
	Fri, 16 Jun 2023 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686916494;
	bh=ACpTR9SBV3aPtqJMQnni7TkSIEUIkE5zHWNAvE8mfrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAcsLlGAzFFj7Sjbi2jWa/66JhCkAaVi/XldgpBQO7C1DAktA9XeZCvc9/PnB/d6D
	 OfP9qVPP6sVrtxFEeUqBcGSOwYktQ7SlL92nD67+bCz0SN6kAXa9oG5VityZejfrly
	 xIDtUt6UfgQawu+N8ue6SQ0OR/mZf2Ht06iR7qT/3EPNPAdlhxnecJzWpLXM9PRq6b
	 yqE0EE5P3hvQr9/jvd2H5sAVO9+5hTIZ5v/WzRgReDXH7T1ZyMmGaBKavOOK4bCrIR
	 wTILVVRN4DoM1uFU99AEvlg9++qanl1G/G+xTkBvk9ynrkBi3k5h6APd6YOTuKjwiS
	 HcOTv4kUlUcpA==
Date: Fri, 16 Jun 2023 12:54:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Message-ID: <5a562bbc-9bba-4829-8998-af12041a434c@sirena.org.uk>
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vsElv/D6vtd1CJEQ"
Content-Disposition: inline
In-Reply-To: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
X-Cookie: -- Owen Meredith
Message-ID-Hash: FCGKO2SLBKRFWTTSAQCA3QGOCFKLJUIF
X-Message-ID-Hash: FCGKO2SLBKRFWTTSAQCA3QGOCFKLJUIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCGKO2SLBKRFWTTSAQCA3QGOCFKLJUIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vsElv/D6vtd1CJEQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 16, 2023 at 10:35:49AM +0200, Alexander Stein wrote:
> Convert the binding to DT schema format.
> Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> clocks & clock-names = "mclk" is mandatory, it has been added to required
> properties as well. '#sound-dai-cells' is added for reference from
> simple-audio-card.

This doesn't apply against current code, please check and resend.  This
should be an incremental patch perhaps?

--vsElv/D6vtd1CJEQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSMTYgACgkQJNaLcl1U
h9D3dgf/X+L0zgKjEpviXcu69nZ8E5ELzKgl1XtMWaQQTLn6eCnUJuaZAAIkqHpr
6yfgu3Aqak1UgM8bRT5je1dJYpB2xG5zxSZmNSfia1ENlz+tVWGLGo9sBFJLP1GZ
+4wnVUNW5aFjUiELxWVJRTUFn2/02H7p9RhwsN9ZH5NbbtlynYHDjDSvZ49rHAYB
7m7/wHCY2DuXIwaxZCtGRpt1UKJDOt+SXQBgvrYMp6YqdNSUg7LAzh1RtGuMT4mH
gcL+nI+PNBW90gEUY2ovo7+0LlDgkkAXCqZD0GMJZK2s3JlB1GghH3sORNlTEg0g
8s9Eo7Rw6oT2VEIljA8hV1xKTwM4BQ==
=YWF8
-----END PGP SIGNATURE-----

--vsElv/D6vtd1CJEQ--
