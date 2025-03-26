Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61321A7179D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Mar 2025 14:35:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC71C601A8;
	Wed, 26 Mar 2025 14:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC71C601A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742996155;
	bh=zCODlL20JoV0OQ6i1mNCZKlE7ItorLWts2JQd76Vhts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WUhERfzUJokVh6K4BfF5HlkLF+x7/SrWAMvfgDNa5SzjlUpZgHZHpiwB3uHYHIMU9
	 2MrkAWsK4QR6YemIGUc/JfQoULtcx8bvv6ndJiK9u1r+pc8015vTCmBq4PYw6BTHnf
	 d54W4sMoU1YX2ZbK4ZB3M1P9Mt0NIN8ONpZ2f9QM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74288F805BA; Wed, 26 Mar 2025 14:35:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5783FF805BA;
	Wed, 26 Mar 2025 14:35:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE8ABF80171; Wed, 26 Mar 2025 14:35:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F22BAF800D0
	for <alsa-devel@alsa-project.org>; Wed, 26 Mar 2025 14:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F22BAF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HJOewYLa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3FABEA4120C;
	Wed, 26 Mar 2025 13:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88972C4CEE2;
	Wed, 26 Mar 2025 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742996113;
	bh=zCODlL20JoV0OQ6i1mNCZKlE7ItorLWts2JQd76Vhts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJOewYLax+X56A+WZggkMuB7Rv2NJlxq+4wWUoAdO0IHgRq/qn5nzLNH1ztXNJo/L
	 ThMTSZR6nmF67O7LI7I8rQ7d0YTRZiCUuQl3ENl2x5jE7SBpZb2f8vUytulLB28BaJ
	 G6a2233CrNB4QJkeJiP0clAI+fmie9DX6x/OHJzjvCGdZcFT5ztcUuDZodbbcn7h1e
	 hoLE7w/0n3h7jVehTIl5WIt6k/txY6rBhzzZIsFAkaLzoeaapMBtvLCRCae2VF3B9v
	 qtKvu4/d4QGtjImxkzFLUFc1Q/nne89dMv4mDcvLGfE4A3h7PsgaqvHzBcWE9CmxVe
	 e04sxnN9IeCrQ==
Date: Wed, 26 Mar 2025 13:35:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Brady Norander <bradynorander@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Aleksandr Mishin <amishin@t-argos.ru>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 2/3] ASoC: amd: use new ACP dev names for DAI links
Message-ID: <da54ee1e-fae5-498d-b773-85e76ec2d353@sirena.org.uk>
References: <20250325211545.2099169-1-bradynorander@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZB+phuY7bPIAHuNK"
Content-Disposition: inline
In-Reply-To: <20250325211545.2099169-1-bradynorander@gmail.com>
X-Cookie: To err is humor.
Message-ID-Hash: KGI4GEC5S3NBO6YKNMH576VYSGU5BJ3B
X-Message-ID-Hash: KGI4GEC5S3NBO6YKNMH576VYSGU5BJ3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGI4GEC5S3NBO6YKNMH576VYSGU5BJ3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZB+phuY7bPIAHuNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 25, 2025 at 05:15:45PM -0400, Brady Norander wrote:
> The old names used automatic platform device ids, which means they could
> change. Use the new device names which will never change.

>  SND_SOC_DAILINK_DEF(designware1,
> -	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
> +	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1")));

What happens if someone puts two GPUs in one machine?

--ZB+phuY7bPIAHuNK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfkAo0ACgkQJNaLcl1U
h9AzGQf9Ep+teGk/235hWpGlb2PF1oOwzrK/0/jVsSVbo1lvXC0IfnEpt515QAFM
LmZ/AEIWqFa0NMH72HY/V6AXojhAuPKupGyEzNt3WAg+DCifGdS2ddK8oO7zYNNF
rFtR8roq9YyTE25yzYpvzJir6lOcply9kVzpvJ4yu/oHvgU2NjmiHWm5NbI2NhLt
b7BF9lApJbiMK6qSG+zM5m4LvjFVUsU6gCu9loBAmUO4josUG+bVzo7fwxp7jiwS
cJkdafKKbYhtrXc6xvqdT/sZGV5RUSX2k18ib2cxp/lDWWfWCsgI7o9DgJ8RHJxu
dcphT3do9BNsUugNpl9ZRVy3db/VZA==
=3c2B
-----END PGP SIGNATURE-----

--ZB+phuY7bPIAHuNK--
