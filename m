Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 564646E6076
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 13:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9781E73;
	Tue, 18 Apr 2023 13:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9781E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681818924;
	bh=rYnQQ/FWza9WvVDMOxLnZknjJ7AOUa7tySmBrTXYTbk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gbui0h928CSwlbZb83DZX8n+rQlVTVYJUnUgTHlZ6U/XXiKp3ryCXRci7xoebjT0z
	 Xu6nFw8RM6/HpgwM1pOj0IyDoob6p22lRY7GUwr/mxvGHuID91Dpa/LgQm3SbLq/fT
	 7CvFwWbCEMHzFedjEsKVFMoBXcuaXWod3OqkXl1g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F79F80149;
	Tue, 18 Apr 2023 13:54:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55489F800F8; Tue, 18 Apr 2023 13:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5972F80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 13:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5972F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fsmsDuY7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B25BA60C34;
	Tue, 18 Apr 2023 11:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA33C433AA;
	Tue, 18 Apr 2023 11:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681818863;
	bh=rYnQQ/FWza9WvVDMOxLnZknjJ7AOUa7tySmBrTXYTbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fsmsDuY7akrtTqsERoOHNe9rGEyuNP3u787qmHAPhbw8bxq0/cb4mk90m96amxtXH
	 ftrMK3A3Kz67LbnW/gIXvu3PYRzTkK55GxSsIjrdws2f8HWRd127IZEwEyyyrqL9d6
	 0Qmw2yanD8hiIDh9f1aUTENmcowKlBJLtsTJdQAhccFc+BjRKNksCGCaWqPbMpfQMp
	 ZnoVvkk3C+GwPP53X5Dd1O535x/YAn9PIWW3bRY7zcTMf0PmDWYUhzI2Zv8GdTuSaO
	 pM80NsoINfZbkRzHrfZnC62LAE4YvGJQWjE+KGAPiX4gmaf+qJ+42LTLDB3iw26Ixb
	 ojuWNstKiFoGg==
Date: Tue, 18 Apr 2023 12:54:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: What is difference between snd_soc_xxx() vs asoc_xxx() ?
Message-ID: <542fab62-8434-4dca-9d23-04e4e7c9bf50@sirena.org.uk>
References: <87h6td3hus.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jkevzcVeKhUdQL4+"
Content-Disposition: inline
In-Reply-To: <87h6td3hus.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Just to have it is enough.
Message-ID-Hash: NWTB645GNN5TUV5IZT5CS5YDGBHIROXO
X-Message-ID-Hash: NWTB645GNN5TUV5IZT5CS5YDGBHIROXO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWTB645GNN5TUV5IZT5CS5YDGBHIROXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jkevzcVeKhUdQL4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2023 at 05:00:11AM +0000, Kuninori Morimoto wrote:

> I think ALSA SoC is using 2 type of prefix.

> 	snd_soc_xxx()
> 	asoc_xxx()

> But, what is difference these two ?

> If there was no big clear reasons, I think it is good idea
> to unify them, because it is confusable.
> But what do you think ?

No particular reason, standarding on snd_soc_ seems sensible.

--jkevzcVeKhUdQL4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ+hOoACgkQJNaLcl1U
h9CwXAf/epEk438trl0rXh6A+RYW+KIpdL1w5mjP+dla69iKFqxpvzGV6E4oZ3bH
h1XnTbJdKFYxX/kIKdbu06NBg1JftMnMByn1ktgi000uqsiHY7uoEWhTnQ21Kx96
dlmaPsDnGOi9xrKfkPN26ECn5FQ+vDep4Xl24KjDBLRg63BH3fNoA12CM1gxZAjQ
Ac/a6XXYvLlfYhDMo28klwM+l6R8kvttf5wMy1fISw2PjpCC1o1XMjArnRKIZybK
O7xC4+74t+z/TAA53QH+gfk4ebINqHT1lTC28EEXlsdi3kVFdOefLea+sS+B9PIb
3KSuTfXFL5i6MnTbp99Gqy/y3HJhhA==
=7QeA
-----END PGP SIGNATURE-----

--jkevzcVeKhUdQL4+--
