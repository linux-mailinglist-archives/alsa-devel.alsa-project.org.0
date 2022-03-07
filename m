Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA8B4D03E0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:17:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 288661719;
	Mon,  7 Mar 2022 17:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 288661719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646669872;
	bh=8tjddFmERVub+eJeodtYbStmrrQSVt5R8T5mKB/8hxw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DozBvP67NYDHn2RhTA67GYqJZeafoLoxKojIAj+FhznRJv8uygMmTIJDNq16+UGQg
	 QgTjFOawZRZU4u3jY7lx8EzQNgoKwTEyumiFJyweczL6WaVpmB23DYHyJ89iii+0jR
	 j0g1nRVDiCVDR8Yf9gSWkkqCMJw5RCbZD1EQWEwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51652F802DF;
	Mon,  7 Mar 2022 17:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6562F80271; Mon,  7 Mar 2022 17:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 635D6F80132
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:16:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635D6F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t7xUG4Ja"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CF4360C58;
 Mon,  7 Mar 2022 16:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE714C36AE5;
 Mon,  7 Mar 2022 16:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646669785;
 bh=8tjddFmERVub+eJeodtYbStmrrQSVt5R8T5mKB/8hxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t7xUG4JaGuaEIgWxfFOunf5ycNgeq7Zdo4Yvt8CDhYQt91/PFY0sE17x7YrnNnYCN
 /1ZTy7VQREK8Tig2yKhrsLU9aE+NbthGUC0KmrQUVFvpHhKvKG+uHWhyhAqZ2xpkyj
 FKbBIMOePuBO0thU4zG9Fk4BvRWQRrDydLJkqA3ZmvzHlQ+2Wz3SjgF5XcmnLavP53
 CFyAmzGCxwXxasc85l334HJTdkxByQVj3Qc7OlfWXyshcfqKhD2Zoc0b2MZ8InLQ/s
 Ed7TpFuOFBWnPjBqnzHAeEdObsuNTJUL3YIGJjSgcNmFVwoV2r1QhLqlaFgXUOcsG7
 IthLpKFApUKZg==
Date: Mon, 7 Mar 2022 16:16:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Message-ID: <YiYv08yef4eIbAXz@sirena.org.uk>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-3-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9yotZ5uYT3fHlEJd"
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-3-alifer.m@variscite.com>
X-Cookie: Whatever became of eternal truth?
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 robh+dt@kernel.org, patches@opensource.cirrus.com, festevam@gmail.com
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


--9yotZ5uYT3fHlEJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 11:10:40AM -0300, Alifer Moraes wrote:

> +  - num-drc-cfgs: Number of available DRC modes from drc-cfg-regs property
> +
> +  - drc-cfg-regs: Default registers value for R40/41/42/43 (DRC)
> +    The list must be (4 x num-drc-cfgs) entries long.
> +    If absent or incomplete, DRC is disabled.

What is the purpose of having num-drc-cfgs?  We can tell how large
drc-cfg-regs is so it just seems redundant.

> +  - num-retune-mobile-cfgs: Number of retune modes available from
> +    retune-mobile-cfg-regs property

Same here.

--9yotZ5uYT3fHlEJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImL9IACgkQJNaLcl1U
h9D0nQf/e94yrWlNJbnJEWkZM5yQ9NWqCSnHkn9vGfNqeP08qmHuPx5rKMPsJlQE
U3iaSMsrPstH1JbpQM4gp9uh+Fg6VvM5/qWyJo1MgSaaMV90p9JUzhnyWGx4JiHq
/i7xUGfwLOBdC3jP7IxCeDnXlTfgdp/4XgTTzjlS1iOnQbnFUCV1LBCFf4KF02/5
F74oQX80r26mdT9BlqXSM9FpuiVJq3E7Ckzo6ilYR1u5C8MCtzZmR0LGnb3mihWs
f46WBAlRgZqIWd56ISFJlOyCuM8oXNikquhN20NGRraagoxbvQQeC7zvBIDAMuZE
YK+1RvyQrlT86QdGrRg9lBdvKY+14w==
=gOHh
-----END PGP SIGNATURE-----

--9yotZ5uYT3fHlEJd--
