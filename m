Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC246F9D68
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 03:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B5B1370;
	Mon,  8 May 2023 03:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B5B1370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683509504;
	bh=71tKkv/u71avtNDi58s+M3G3sV9kmPvH9mDaj5alk/A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nAwHQErpExMWYZ/7WK3m9tCcbD5GMzXvB7JPsQdh3T9nINbG38BqI4rcqgV41paoD
	 nRVzkRXutWANlC6Kdpc5PfnMAZ2hqIZTJlkSkja+GdecsoriK0dWXFA+1WJrfdu2tU
	 So38QPzzuZeVXmYjpKkxOKmAVOXpvNvg1b7Hm+Sk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53352F80310;
	Mon,  8 May 2023 03:30:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D580CF8032D; Mon,  8 May 2023 03:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A3EDF8014C
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 03:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A3EDF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IdvBvb3s
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBDEE61DD7;
	Mon,  8 May 2023 01:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72C2C4339B;
	Mon,  8 May 2023 01:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683509437;
	bh=71tKkv/u71avtNDi58s+M3G3sV9kmPvH9mDaj5alk/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdvBvb3sKdbaCJubt4senOcamv3ec20kFlVjpx22nVFzwX6sfJtAbNPbJk+dW6+nH
	 0Ff+MRKmezq1AfMxuO3SMNsZKbFqghzjJAFuqA63SGFHxBpBs6XIbyQfxL5J9Srra9
	 1QJgjwVAEB5OA/xVpqcLHpQP+nBGIjBjI23Jyda09T8QVv4GdvomrKqaldYS12SuIq
	 6Ht+h0GwHpHGJ6YgUFx+OHs47oCAP6Vkc3HLLhZDbdme0t5Omrp8Av4x47VAG+Dhng
	 n+Ex1plvYWG6XxOiR2l8+jZIyVHuj4Te7T2Yp8Kc5WV0hEWNBhyMp+H7YWtvMD3Rsw
	 Y/6zf0NnRHtIA==
Date: Mon, 8 May 2023 10:30:34 +0900
From: Mark Brown <broonie@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Message-ID: <ZFhQujhpbt/7yGGc@finisterre.sirena.org.uk>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-2-walker.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWpif/cLlKqgWzLh"
Content-Disposition: inline
In-Reply-To: <20230506090116.9206-2-walker.chen@starfivetech.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: GPVHFNISE7FIZB74LROS5G5SIA4PDWZP
X-Message-ID-Hash: GPVHFNISE7FIZB74LROS5G5SIA4PDWZP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPVHFNISE7FIZB74LROS5G5SIA4PDWZP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qWpif/cLlKqgWzLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 06, 2023 at 05:01:14PM +0800, Walker Chen wrote:
> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qWpif/cLlKqgWzLh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRYULkACgkQJNaLcl1U
h9BS4Qf8CgZlP8jyB6NeLlBTyYs8KyQY4c35cBZLLJ+/fu2+EGGCptpPCtHXkrnx
jPTC4V5et4pWy2E4Aqk5vHXKmsR/cvXdjXM1VrdRwculFef0xWwV29F6ru8WrW5J
pQxXzgHn2PpZrdybJ4RFmABz9V9Pe9NotLtP5yxVCqHemsg09MZSmnqObikbqXi6
eqXK/b5HAkCHQUEJyisSCY4Fcxz8XaIc1a0bP6+++bwFdnVN0zk6WS499QQWgXc8
hZNcb1x6hXYav4LKZETl4xFYUHdopNIpL7cbdsvcyF8mRGI68qK84TFxTx9kXqS5
9ZCLw0ZkIwMad6/JkDdSGqETIZ0R4g==
=TbwX
-----END PGP SIGNATURE-----

--qWpif/cLlKqgWzLh--
