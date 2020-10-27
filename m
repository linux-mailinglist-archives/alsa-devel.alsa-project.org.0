Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B465429ACFC
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 14:17:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518799F6;
	Tue, 27 Oct 2020 14:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518799F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603804624;
	bh=CKo8KOUMplKS1VrSLuvL8FxdF3DDU1PHkPmmeQygRn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X3Q21okNKHqSvRMyi10BcZHaUh1WBcVDC8WttWw7XiaC3qdsAw/S3V8Gok49t/OTx
	 os0fMJj2E3/uemirzQZq/WTyFWlnNGH6Z9v2Z0i7/n9IPDPLD1PU/mlBxwjqwdxHy6
	 uZzHMmfhP+tM0K33zNsLxoXfYw1BtxtvulKPTUPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 915C3F800FF;
	Tue, 27 Oct 2020 14:15:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F11AEF800FF; Tue, 27 Oct 2020 14:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A4C9F800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 14:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4C9F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qpaowbDK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC2FF20754;
 Tue, 27 Oct 2020 13:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603804524;
 bh=CKo8KOUMplKS1VrSLuvL8FxdF3DDU1PHkPmmeQygRn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qpaowbDKPCL8ZKLZ1CYaRphl4mwuEjsn3wuN+aR2nQeUruLgKyg7rAyYNG87W2d9N
 qNkTdA7YHzoPo0U7Uqmo5A7PtTwlgeMwVNcIT+HWZ/62sOStwIJmvzo7JTfahx2MA9
 TnOSpkOqUYG9TenOaH0QKJ2Yn/HutoXiIeEjf0+o=
Date: Tue, 27 Oct 2020 13:15:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning
 of DMIC recording
Message-ID: <20201027131519.GA4895@sirena.org.uk>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
 <20201026123325.GC7402@sirena.org.uk>
 <1603794538.26523.6.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <1603794538.26523.6.camel@mhfsdcap03>
X-Cookie: That's no moon...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 06:28:58PM +0800, Jiaxin Yu wrote:
> On Mon, 2020-10-26 at 12:33 +0000, Mark Brown wrote:

> > This seems like something that would apply equally to all DMICs so
> > should be done at a more general level rather than in this specific
> > driver, for example it could be done in the DMIC driver.

> So you suggest that we use sound/soc/codecs/dmic.c to control the delay
> after recording?
> If so, should we add one more CODEC('dmic-codec' and 'dmic-hifi') to
> dmic's dai-link? It looks link dmic.c has helped us do something to
> control dmics.

Yes, exactly.

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+YHWYACgkQJNaLcl1U
h9A9lgf+PN31doFGHC7Emm3X2bk/3W8+ZvprGxuARbGdn20d4mbHrGrDUmP90wIU
dhB4VL04Mr+t2/7qLon3PfOWlzlCAyZ58pelvYwdx8Uqj5w9dBhGTobHXnadx53w
0cMC+BuJWDhr+J+7ct0y92v1V6hI23e4PCOk7QA2pLuE4iH6TQ6btK/olmXW9aDr
SJZxGryZCzriC19M7pxkULmHrk1A6DlDDpumT1dJ8/EUWw6SZVlzgt+cQykC0xhe
ZgE1HacS2EDS4CaUXj2mbUzaC+xDcfv5puAZoLDGKeVqxyX7/iTr9jCOidoZueJu
HhB1EDSlvibPjviYgtFncqKRdEcN/A==
=5+cB
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
