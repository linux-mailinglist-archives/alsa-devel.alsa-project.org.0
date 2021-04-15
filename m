Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEB8361223
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 20:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EF031675;
	Thu, 15 Apr 2021 20:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EF031675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618511594;
	bh=uoR+Kr+blFzetHXbngHy4mfmiD/fgYrOO+y1Xqt+C/0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljTUD5BlUHm7HVQhPUwJ8ZXTJL2GNbI1Aut0nRST3bGqk7QH91NAc1Q8hBboy2cTq
	 UFnny8pGuYWmyePPFNGomD92b3UBtE4S/AYQK7/3gQrY2/IoX1joSq5Jjkhbd6E6WV
	 vk18QSUefSEd3JLsHLpE7DPiNt9yZ0XTzQlp4mB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CEFF8022D;
	Thu, 15 Apr 2021 20:31:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08073F8022B; Thu, 15 Apr 2021 20:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F27D5F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 20:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27D5F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hhKTV7U0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE3396105A;
 Thu, 15 Apr 2021 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618511495;
 bh=uoR+Kr+blFzetHXbngHy4mfmiD/fgYrOO+y1Xqt+C/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hhKTV7U0LomOG/BNi9C8cyHsqB1Uhayg8oXAXCsm769dhNfWkikq4igKpepvKzqAI
 feajl99wBZc+euoKIQ11dl3RY/9mAbW7nZ5Ykmu6nld3KMhbtLu4m8IAjl/1d4JlEQ
 oBjq8mwxQMNhSZlNl770Uiy055aAPHRfrhnjEWue7tjhv27pAgkdFyCbCBlccdJNN1
 y7XDWg6Lfk288excqaHEHGa2vgCMqYOoO+0k1oXql6aH7OWltiNScRAnkluOeuJztR
 blBog1m3z22qOIcRZTXDGlhrV7CAGnb0VrIdl5Ecg+arlwCCj1Rg8BMnNzMXU/HLcU
 RoavfCIwh8yng==
Date: Thu, 15 Apr 2021 19:31:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/14] ASoC: simple-card-utils: enable flexible
 CPU/Codec/Platform
Message-ID: <20210415183112.GK5514@sirena.org.uk>
References: <87wntmod33.wl-kuninori.morimoto.gx@renesas.com>
 <87v996od2c.wl-kuninori.morimoto.gx@renesas.com>
 <YHh/Y5fXMxm91Ha3@orome.fritz.box>
 <20210415181450.GJ5514@sirena.org.uk>
 <YHiFEUUfsn3ni/Uo@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q6mBvMCt6oafMx9a"
Content-Disposition: inline
In-Reply-To: <YHiFEUUfsn3ni/Uo@orome.fritz.box>
X-Cookie: VMS must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jon Hunter <jonathanh@nvidia.com>
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


--q6mBvMCt6oafMx9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 08:25:21PM +0200, Thierry Reding wrote:

> In any case, I came up with the attached. I don't know how good it is
> because now the number of links exceeds SNDRV_MINOR_DEVICES, but perhaps
> that's just irrelevant and that constant was used merely because it was
> conveniently there.

We shouldn't actually end up creating that many devices, a lot of those
should be DPCM links which are internal only.

> The patch restores display on Jetson TX2. I can look around a bit if I
> can find where the boundary checks might be missing so that we
> gracefully fail rather than corrupting everything.

That'd be good, thanks.

--q6mBvMCt6oafMx9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB4hm8ACgkQJNaLcl1U
h9AqxAf/Rx7T3DVd1aIGp8MQx37ydO3ASpzgL5t616HY7NEnY6zzHfqtQdHCgJUN
if1vBGRn9v9i22AijDI6M9Y8fOpNbLQSspdcoNiT9WYMaUx0+zwrIGkA7D+FVe1I
ILiFfFKYRUfm1j2c4a2W74wURGE4JH5mZ6Gu663iaPgyvJOyaEpgrEL6FP52mPMo
s2gPeg2pePtvZG20wFT1vDoP4Rt6CtPW4UqbUOpV33YLYZZik+pbXKApObi52PYJ
5KMuBQv+lCBnpl8m50lYPpkx5IIxsSnzbW2wBY602sMQBj4suZkVZOGOhijVifLZ
crwi0g+jmvW5au6ZICqDhu7CuDQuog==
=CDdU
-----END PGP SIGNATURE-----

--q6mBvMCt6oafMx9a--
