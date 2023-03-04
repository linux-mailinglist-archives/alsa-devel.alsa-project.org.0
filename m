Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A76AAC5B
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Mar 2023 21:17:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B1CEEF0;
	Sat,  4 Mar 2023 21:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B1CEEF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677961027;
	bh=3r578BL7TwpWHlpQ0on74A4ds7yYrKerlhknBqHE0IQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dlKP92A7Nt2JKHu+KawSI4AWXqXycpMGc0iqTaK7/+UNIqpSx7gbIwToO0pT+GEZs
	 y4ZQhNTsEx8HixGx3McHuoC/2zyVpnNgm1Rf5vKn2AYlWn/3b3NRVYhvP0LKEqecc+
	 P/FT2Kgh3BAKJaHl0S9h3NEt3fyRpOf8u07pjllM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74944F8025A;
	Sat,  4 Mar 2023 21:15:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 533E0F80266; Sat,  4 Mar 2023 21:15:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD5D3F800BA
	for <alsa-devel@alsa-project.org>; Sat,  4 Mar 2023 21:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD5D3F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Of74lGgr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D8A960A55;
	Sat,  4 Mar 2023 20:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BEFC433EF;
	Sat,  4 Mar 2023 20:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677960896;
	bh=3r578BL7TwpWHlpQ0on74A4ds7yYrKerlhknBqHE0IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Of74lGgrQfr/3MT85Mry+dk98AnwqBx/+IKkV8dz7hpunpG/juil6jblXMxLIcXBH
	 otDFXzf26WX1vIQfjtEdOfRcHdWgRJ6boGHh/XsJsH/L1/dtv7Z5jnzlaj2op2B4o4
	 nGMfOtYx0YzF4FQmz+EBu9ckLQPtV3mUYeJDCdB5elK/H55dP2tJpt/pvCT6I8ESZS
	 EYIJw0pgzfvvru+19Oo2drthgeVkF5beApFrnmEAqghgBqsbpzQmm5hoht9HFoxh3N
	 3kN6/VWB+pginmwR+OoqxqA0Q70T/VI0WywY3cn/oA7H6RmGx2NYH+NcaRO0HJUqAa
	 NE+vFF1/bWCDg==
Date: Sat, 4 Mar 2023 20:14:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
Message-ID: <ZAOmvQMn+7R9KcVx@sirena.org.uk>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DpC9JxmBtx/VM1Dr"
Content-Disposition: inline
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: EFLLCEPH3GSH34G56ZNTVLHLVF6IRXBV
X-Message-ID-Hash: EFLLCEPH3GSH34G56ZNTVLHLVF6IRXBV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFLLCEPH3GSH34G56ZNTVLHLVF6IRXBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DpC9JxmBtx/VM1Dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 03, 2023 at 03:42:23PM -0600, Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.

Acked-by: Mark Brown <broonie@kernel.org>

--DpC9JxmBtx/VM1Dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQDprwACgkQJNaLcl1U
h9AqEQf+Ki9N0115CHG31rvFs9RFMaV3z2FBkTIO1Zs9u9jJ0UFONa8aS8bq8aPQ
gm3UuhyofZ4p+tqg6Y6nKHVWZalcU4N95+sNm/ZzjCvDKR66x0O+uPlCXd8pfREU
kNoKd5CFtP+fjtXf0oEscR6C4Pu/I20EuDWUyrfNii3oFMAuDeVS2wgXadAxOJ6d
fSPFcja3GW9gJ4EE0LacuhUM5ZUtW25HeTc7vmBynRd7tTqjc4FQgPSyt8tvUe0Y
VodxCsoIvcS9vx94nDyo1USMh/HFKAtRlJNuuWj1+kWcrRUfBuJVlSSzZt6o9M+k
6cA73SE3SJ8RJIFe8Bz9r6ULWYSY6A==
=/n6h
-----END PGP SIGNATURE-----

--DpC9JxmBtx/VM1Dr--
