Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D8891BE7
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 14:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E522C238F;
	Fri, 29 Mar 2024 14:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E522C238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711719421;
	bh=jnwxTsD0edotBFz3w9snQJc1F0VCr5E8otP3pm+q3rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QtduFLqCN3NhVDXyd77tyy23dGlCTyrHe9QzTdDnXtbY8EPi73+Ku8xskKtJIufFB
	 WqbfVwlyS/UBM0ixmX1HevY8OFTXeNofSMgGjEWvFC+ig+uLd9MrXH0sbKcV003wUl
	 fnXXkYniKKXLijD4g0yJGzXKYy5vZPqUqFkIs+fY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99548F805A9; Fri, 29 Mar 2024 14:36:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12301F80093;
	Fri, 29 Mar 2024 14:36:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29D44F8025F; Fri, 29 Mar 2024 14:36:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 451D8F80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 14:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 451D8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E5O8A5+e
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0BBFCE2F75;
	Fri, 29 Mar 2024 13:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D93C433C7;
	Fri, 29 Mar 2024 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711719375;
	bh=jnwxTsD0edotBFz3w9snQJc1F0VCr5E8otP3pm+q3rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5O8A5+e3T43C4JS0f9c3DLZ9ZjXZy3qEsRyEXX6aPW8BQiW5BoK+MPaqWwr88DUh
	 2YfchZgt+RbH4RumlTdWmx+3JghKVlgyRQHvi/rCRQWqVTQ0MVWZN6LPdaDSqAi44b
	 qKoIGqZcdpQ1eMbM30rb4H2UCLQ87ebkutaTdCRgMjDr9kL0deJtx7fx6t1sCviAQw
	 I1xPsFwQ/Kjv4JH2fJ4ohOI/vKXFQbQpkmIVVrMvLY3BQnjcibWNy8SkSDXp/C/Ug2
	 JSPrLcpih4WomBB0W7jmCoewNHmNoGZYeFO9Qg1kxBQEEX/fuM4dxAXz4K6639zNy9
	 tNbiDn3C2Vrzw==
Date: Fri, 29 Mar 2024 13:36:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMS8y?= =?utf-8?Q?=5D_ASoC?=
 =?utf-8?Q?=3A?= dt-bindings: Add bindings for Cadence I2S-MC controller
Message-ID: <ZgbDx6oD+mMUIvH1@finisterre.sirena.org.uk>
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
 <20240320090239.168743-2-xingyu.wu@starfivetech.com>
 <9d9efb8a-0b3c-4e7a-8673-07cd3b1f5f87@linaro.org>
 <NTZPR01MB0956BD6189974378958562D99F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <9b1a5100-8536-4b59-b2e7-d6ebd2ba9e66@linaro.org>
 <NTZPR01MB0956230296D881F112F92D119F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <16f72b4a-2aa9-49d5-a4aa-ed94eea1f32a@linaro.org>
 <NTZPR01MB09563633F5C3B5FBC95D61289F3AA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <7b4a35d0-6764-4c6a-9f1d-57481324c680@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iIGHYhhokfc75u7X"
Content-Disposition: inline
In-Reply-To: <7b4a35d0-6764-4c6a-9f1d-57481324c680@linaro.org>
X-Cookie: You might have mail.
Message-ID-Hash: YFCUSHDJLDQDH2JHCYRSNENY6FCDC657
X-Message-ID-Hash: YFCUSHDJLDQDH2JHCYRSNENY6FCDC657
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFCUSHDJLDQDH2JHCYRSNENY6FCDC657/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iIGHYhhokfc75u7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 29, 2024 at 12:42:22PM +0100, Krzysztof Kozlowski wrote:

> I stated and I keep my statement that such block is usually not usable
> on its own and always needs some sort of quirks or SoC-specific
> implementation. At least this is what I saw in other similar cases, but
> not exactly I2S.

I wouldn't be so pessimistic, especially not for I2S - a good portion of
quirks there are extra features rather than things needed for basic
operation, a lot of things that might in the past have been quirks for
basic operation are these days hidden behind the DT bindings.

--iIGHYhhokfc75u7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYGw8QACgkQJNaLcl1U
h9AoCQf/b7CetVNUQ04OVH9f281N1evjEGVDKNvmj8TAvLEoUEG4P3QSQCXLRTFL
XCqgLAxCUPBrhC1vZfv7x1NMf6FZtqXyP9O7mW6DwydE8RGlKZM+G0TrP3mkLs8g
y6+3eKFU0bo2GJTgJRsVtNtLNzTXsTUGO/tU9khE7a3mJImQucQlJJ57EG/qMxXa
As1WC+LHJ4fGYDQFYBEaL5kvjCd/K4/nxrUQIR5GGMpM4q8/MHNcvDVXColvnACD
ts0VNnwgkNiNEHiarjuIq1Lsx3kfPLCeVu3sbydAzszYi/mSC2AIcvzFqUCwy8Y4
SnpWS7wTOxtWTnqr1WykCbx0Tf7cDQ==
=kO0w
-----END PGP SIGNATURE-----

--iIGHYhhokfc75u7X--
