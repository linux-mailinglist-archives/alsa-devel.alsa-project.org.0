Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B1544E98
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 16:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE4A1B50;
	Thu,  9 Jun 2022 16:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE4A1B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654784437;
	bh=cyI1slCYp2ulOMR6QOZVzna724c2/fZa6OlRtiC3eOI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T7eoT8ghAdHwI0MTNXOQwvyXuYwKWWKLoTUSZZITBGF9hsgWDhF2CPwt7PKNKrxGZ
	 nWXAYPuZYsAXP4ruZC3jC+P0V+oANkBHxH58JjMs3srh4dha1KkRLG7ZQeO8Mvnpmx
	 lqAyHG9iYT/CWfAsO+BATwjb/l0txPmmZ56qnXwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB84AF800C7;
	Thu,  9 Jun 2022 16:19:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00545F804B4; Thu,  9 Jun 2022 16:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB4DCF800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 16:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB4DCF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rLpFv04+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A71261DB0;
 Thu,  9 Jun 2022 14:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E9FC34115;
 Thu,  9 Jun 2022 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654784378;
 bh=cyI1slCYp2ulOMR6QOZVzna724c2/fZa6OlRtiC3eOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rLpFv04+W/H73neyOgVi1+ylHGerJnTn0IG0LBG1z7WX2oKgSLiwQS/b7lH1/Qvxc
 AsOZNraYR1mOj3wVECimweusPz7sE1X/vb04Sbp0NorGWoP8CyUBOXWp0iadNKczNC
 g57YLb1xumDT6HMAKIxuAyp5lWhv3XC6blcPB02+kkkjtPdd8kVUlMgIkmjZrWdT7N
 lRzvhwgza/LFiDBGPh1RTikIoHmWgQJz4rTKpn1qmLCGmFE1e3OKKJ8blk+3QkHHb0
 AsD2yPUsGWHwvSMm4IkoNvbarRkYN435VlwsGLP2dKgeywtrartEbRQQfGJm8YtQ1Y
 sTVxXWYVQZqwg==
Date: Thu, 9 Jun 2022 15:19:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 10/11] ASoC: codecs: rt298: Fix NULL jack in interrupt
Message-ID: <YqIBdg5mNBQKRV2K@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-11-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TFiQHeaAmuCof+XI"
Content-Disposition: inline
In-Reply-To: <20220609133541.3984886-11-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Space is limited.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--TFiQHeaAmuCof+XI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2022 at 03:35:40PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Set rt298->jack to passed value in mic_detect, otherwise when jack is
> set to NULL on next interrupt call, we may use freed pointer.

This is an actual fix so should go towards the start of the series,
putting fixes at the start of the series avoids them getting spurious
dependencies.

--TFiQHeaAmuCof+XI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiAXUACgkQJNaLcl1U
h9CdaAf/XXohGR4D9bm6pp9MM8kxLUsXSzljiQc7ZZ2VyoVyxzP+UPpc4eeXulrJ
GOGaZVfQFHV5IXOJ6oOT03gvzpeMWG/WZGRUHLvUD8py7cOTaGMvo7ueP67njOTr
xLp6POq4STmYuTxE1R4fD0l0R3mzQQw/Qmi4X+5pvlbbpnpOxwbKjbrcYrjHU1hX
K6+m2z6KNLQypgxUMHcjsfLvNajJ7GWgPQAMjf9lgbDxzo5nX4EssPSD7byr/boH
offbl583Cx2FXkJkoHXPN0QYrsWnAt7UTPewTJW/Ro5ZRujN1CgikowwPF2oA/Ec
venL7sqEbq2sz+5a1bCsM4dm56BEvQ==
=ljpp
-----END PGP SIGNATURE-----

--TFiQHeaAmuCof+XI--
