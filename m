Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F266561EE3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 17:13:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D942E16E4;
	Thu, 30 Jun 2022 17:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D942E16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656601989;
	bh=DsKx7qJYAZc8pCFUi88zo7N+A9VkypzdBBKTNbewnvA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhSrXpYaXd+s4rpn6GFLWQBJxp5uxuav15+pqW2stmKC1qtwi7t+bj/q12AXqTD5d
	 GbHc8d4El/4/kJKWwIU4YIYDpgxJ7kmDCIMR2CJZ1F3Ydm33RHNjzqJxsr9lyMLqkf
	 kyGS7O0fZcx0TZdMGK+3JnQui2wt9cR1WBJl5CTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51754F804EB;
	Thu, 30 Jun 2022 17:11:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5688AF804DA; Thu, 30 Jun 2022 17:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A98F800F5
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A98F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NQdxBkxN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 86806CE2F39;
 Thu, 30 Jun 2022 15:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F42C3411E;
 Thu, 30 Jun 2022 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656601895;
 bh=DsKx7qJYAZc8pCFUi88zo7N+A9VkypzdBBKTNbewnvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQdxBkxNkwqSdkoqMRNhni8Jf02Fqt++uqcnEnKzYElv3cLlmZfd2Ax9MZzby7vFW
 XnHgxe7fHT9B+MYQ0YWJO7HYz3FtIy6y5OqdU2TLWH/wpHyqCK8Z9fo0WL+/3hvZJZ
 LJfdAChaGHKTHuBuErMnZvsiHznPAU/pP4C7PdMPFh+RD5Whn3go4YaWcAHblt335C
 YZWsCU7JLr5gFaZg4oez4p+dkoCGeDrkLZfDIGkVwfTEuRjh2myjztEyHGETvguHZA
 9mOMky/lfBiwjAZHspNtfkqp6Ei32/W+8cYttn7cDrsccrqhAqiymT+1DVJBr5EeJw
 +JCiUyU5zXB1A==
Date: Thu, 30 Jun 2022 16:11:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
Message-ID: <Yr29I3BmBOFAACA1@sirena.org.uk>
References: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
 <165469532489.615471.10019728812817999193.b4-ty@kernel.org>
 <Yrvyo1VtiXai4RM5@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DMYWlbI3cWfhG8JW"
Content-Disposition: inline
In-Reply-To: <Yrvyo1VtiXai4RM5@shikoro>
X-Cookie: Today is what happened to yesterday.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, geert+renesas@glider.be,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--DMYWlbI3cWfhG8JW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 29, 2022 at 08:35:15AM +0200, Wolfram Sang wrote:

> Can we have this as a bugfix, pretty please? The warning is really annoying on my Ebisu
> board.

It's already on the way to Linus.

--DMYWlbI3cWfhG8JW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9vSIACgkQJNaLcl1U
h9BybQf+JvBzaQgnx492RNuxyVbKjL5UWRSeaxj+Es/1i0bFZaOi52znw7sU93L2
hRuENY/vo30dsIxOtdNqU6/4tzvJ5NVyKfv6CU3o2FPLV+gB9c7wiTGparhHo3rX
0qoM8+y0+IFb6xYlWwGAv1/ESKeh6LPzU1Au9G5X9DT1V3GH8nB3bbxfHPVouWu2
8m9tpjgwc/ywnWXkUKuhx3oROSZ61F0v/WHIcLkyENOpBymI2PY0CYwh+X8YsF/M
e41y+E9C2EFbmMSDR5SuSSf/L9VUPvMWgTobCCGx8lwHg00ZiSrGo4nfa1p8i2Et
e2lzEmwue1mN+dtf/LSeNgp/X+dLKQ==
=GOO5
-----END PGP SIGNATURE-----

--DMYWlbI3cWfhG8JW--
