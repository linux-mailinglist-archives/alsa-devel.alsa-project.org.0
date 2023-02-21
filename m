Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1669E2AB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 15:51:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21BD1E72;
	Tue, 21 Feb 2023 15:50:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21BD1E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676991079;
	bh=6Rmm14YsNUOlzop3ry9TteVVt0q20r8lVganoeDtVRs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gu6aZhnf3UtXCWSU24aWbkhkJp9Da35EjfyfAt0A5koWc7/7gvj0JWekIeZ9CjLzp
	 3oh8HQWEooQSUYse+qIq++Rmqb9JuXL3lRwQUki0O1BQfrEvjbv/X9vSM2x+nALJAy
	 mVJ/SjV5MCCouS3lQ2oXH/uczOoPkcnqthBEr3Z0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76A3BF8025A;
	Tue, 21 Feb 2023 15:50:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7348F80266; Tue, 21 Feb 2023 15:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE330F800B6
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 15:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE330F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GS3zj5+S
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33DC9B80E88;
	Tue, 21 Feb 2023 14:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FBCC433EF;
	Tue, 21 Feb 2023 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676991017;
	bh=6Rmm14YsNUOlzop3ry9TteVVt0q20r8lVganoeDtVRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GS3zj5+SNUzEYS51gxnY3MQeic9ALJOdf7wOftKHZ/dMg6Pi2kxsZeCkBZFJrN3lH
	 VlVENIBPYM1vkDgwHGquSSLr40hfg2/detwLBQCMeoQSKhdO1YT2KiSOw3OAOoacdW
	 ZGfb6JmRFk0Z7sWjQmUh8vO5X08ePylZl0C0A6Dt7Tm908oN6Xkkz0Cf6RInkrnA5E
	 srmxUAZILWstOXYV5RSQG7PyekVeshzX42io4u4ZcxYss5GOu7C5po0zrkcjqlrgXc
	 1GUugepq/GQw2W6Lj1E7Bvwk66KlZPWO25LRGhqEwRLMPS3h/L9nExVAF+dM6KT/7G
	 qtrMYsWL+3qZg==
Date: Tue, 21 Feb 2023 14:50:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Claudiu.Beznea@microchip.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Message-ID: <Y/TaIELG2HY/zvNJ@sirena.org.uk>
References: <20230217124151.236216-1-claudiu.beznea@microchip.com>
 <20230217124151.236216-3-claudiu.beznea@microchip.com>
 <20230220225601.GA545317-robh@kernel.org>
 <69c4eccd-9d81-ac0b-802a-8e4e0d57589a@microchip.com>
 <cbe2e397-7044-277d-08a8-93010de339ad@linaro.org>
 <d607c1b6-712e-5c8b-8cd6-86673f4b354d@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v1GqRFSqxa3haDVH"
Content-Disposition: inline
In-Reply-To: <d607c1b6-712e-5c8b-8cd6-86673f4b354d@microchip.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
Message-ID-Hash: P3VA55UWZ7Q4EO2RHSMPVWPO756HR5VD
X-Message-ID-Hash: P3VA55UWZ7Q4EO2RHSMPVWPO756HR5VD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: krzysztof.kozlowski@linaro.org, robh@kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3VA55UWZ7Q4EO2RHSMPVWPO756HR5VD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--v1GqRFSqxa3haDVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 10:52:54AM +0000, Claudiu.Beznea@microchip.com wrote:
> On 21.02.2023 11:23, Krzysztof Kozlowski wrote:

> >> PDMC can work with different kind of microphones, thus different boards
> >> could have different microphones. Depending on microphone type the PDMC
> >> would need to wait longer or shorter period than the default chosen period
> >> to filter unwanted noise. Thus the need of having this specified though
> >> device tree. Would you prefer to have this in commit message?

> > I believe you also had explain it to me, thus as you can see having it
> > in commit msg would spare you two questions...

> Right, I'll add it in the next version.

TBH this is really standard stuff for audio hardware, having to leave
board specific settling delays is very normal.

--v1GqRFSqxa3haDVH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP02h8ACgkQJNaLcl1U
h9DVAwf/c/xfXkzb010seOik1EdUxRwGBKH158yesXV5nUZKs+BBc2sTL/rOEimi
VYP/38OzK7S0/9iPZkoLtPhalZwbiDFwGXOH+eivs3p1+qqg07azQ7Jb0shReSa5
uASjUxZjD0oiBb2CKcm5WAT96uflBqUDFgeKuEXQHKWr9FaoO/sDyUSVdkqKU1u0
zhLMyqpu4LWbbQRRIVzBwMn0IRWk0zlahtiDuSl3cjPeLtygqLmn2Wzcrm4nbJOM
EdYukt1imfPV2edcdMlEEay7hY2EoTUN8OzD0n/qiKJTBu18j9/U5OGIckQXzBA5
Ymc7N2+iwo6xRtz4QBCYRUBpVpIPCA==
=ln4v
-----END PGP SIGNATURE-----

--v1GqRFSqxa3haDVH--
