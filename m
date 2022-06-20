Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7D552169
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 805B829BC;
	Mon, 20 Jun 2022 17:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 805B829BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739809;
	bh=UowpPsN4dwRx6/3c+/Ap4rkZrDx0R5Ze0ezebq/G9JI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJz2vMXCEMlJm5RDjE1TpPzOyD2dv90lXr8l0V5ySuHSxYnpuJCbWGTN9Cg5Qzw2e
	 Ksj7OeHd6f/wwh9NBWaPzwImnsW1wkH9zC3UskNMiIQj8BMUG4CeMqqC/93QdSUa2W
	 sp8vENH86C/V/yhK1gCncXP0Re+AsPY74rFdOI08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28B2EF80549;
	Mon, 20 Jun 2022 17:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85FBF80543; Mon, 20 Jun 2022 17:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E57FF8053D
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 17:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E57FF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oavu5I/Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA4E612BC;
 Mon, 20 Jun 2022 15:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05906C3411B;
 Mon, 20 Jun 2022 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655737754;
 bh=UowpPsN4dwRx6/3c+/Ap4rkZrDx0R5Ze0ezebq/G9JI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oavu5I/YbxUqRbE8zqch6EIX41XpXQI0joby5hziQYwFeeIWNJveoetauTksx6kJw
 s5pkjUDxIHrbUvMJl+s7e42XXKBDikIs68DDJZf4HSQg0y6J3DC8Ik5UGJrO65M4Wz
 LNYUzn8xexo0ZssOhcPIC/vuo2Tx+puBCStNSyNXN2YReeF0h670DBH0+DTtfKOL+8
 RjOkUGkfPTj79Ts5qJrRVEDHJnTnB1BJYboaD/euBwpua/gu6LAbwnt16aVRCsX2Is
 DRsq3GXPwwjqNQl3dt7SG/Jp5M9k+SQBJ5sQbYyZUUL0beI3tc194vHcuTxyexU69G
 gOhT0VZsNTZmA==
Date: Mon, 20 Jun 2022 16:09:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrCNk+g6Xh7uC9fg@sirena.org.uk>
References: <AM6PR08MB4376C690036C5558058C4F16FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4wRJYg8FNZuITX9R"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB4376C690036C5558058C4F16FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Eran Matityahu <eran.m@variscite.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alifer Willians de Moraes <alifer.m@variscite.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--4wRJYg8FNZuITX9R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 03:03:50PM +0000, Pierluigi Passaro wrote:

> > Via firmware description.

> Can you please provide any reference approach in the kernel code ?

git grep of_
git grep fwnode_

and I don't immediately remember what the prefix is for ACPI functions.

--4wRJYg8FNZuITX9R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwjZIACgkQJNaLcl1U
h9DhxAf/QjS/aWkP17En2BvW+Gr3yNc/jrpVJq7UvOIWIXQbGH3NWey/fDtsW1Q8
SfV0/JZKiG69wIff6Plva4R6TMcU9FuJTlbb5wnU3Vl/IbY7sdG3tXh6epyt5UBf
xBKao3u3lpErY6OUF+xU6m9qf0MPlxGMVYgvQOOuJfE+0T6IBbS9fVSzr0assttw
199iCsBk1c+0dF/ZufZubBpZUk6Y+b+mmEDQ/4GoM2bsutX1Nw+EIqUw+HWK4YO8
CCltIK18dFjMm3bGhsEBCBcJCox0neYaCKmGhO9zb7YUTFlppaupdblWKBF58ylX
BJCFh2F9Ue/m0syfrLOvA169USrKNA==
=buGM
-----END PGP SIGNATURE-----

--4wRJYg8FNZuITX9R--
