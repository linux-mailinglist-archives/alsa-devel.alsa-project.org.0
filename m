Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C924A5599E8
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 14:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D8C1840;
	Fri, 24 Jun 2022 14:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D8C1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656075235;
	bh=ggsOaY+fSKt3PTe28f1Wmr/wTw3Af4qywUmG3HCcJWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZiH1yivPS9sq09xkTAW1Z99eyBKlo80xo09IbkLOtNNaZOagoX6u+t5BmGd9hA2Zs
	 2qtPk8CZwteKKPnNw2ERfmP2ho7VPQBCii+5KhTEsBNf/dICxBtkY3u4tQ2nt0mWt/
	 HzIGbViHIo0Badr2FBwBTtSiYRq5bhKRHE8cAJC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B91C9F80165;
	Fri, 24 Jun 2022 14:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19149F80139; Fri, 24 Jun 2022 14:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0195F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 14:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0195F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O8+ncaxI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54C7BB826A7;
 Fri, 24 Jun 2022 12:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63F4C34114;
 Fri, 24 Jun 2022 12:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656075169;
 bh=ggsOaY+fSKt3PTe28f1Wmr/wTw3Af4qywUmG3HCcJWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O8+ncaxI1U+fu7vw1l+3IDVRvBZStnGXR9fVHgColjjNPV1X9Xp3x91F2LwoZAPgR
 20SVL35XE1jyVKyMFz3u/982lLGWhcTP0p8qanlvJccgk3xasKeKvW7q389+wRxs+5
 YvJHxUqXrAP7UbwdweXtQuikSsqmKVjHK9KBEW4JgtYME/Ze6Uq9uEipoOTgTG5OUp
 P7LYA19i29HrYD+DSLhB49qewVIfU1RKJ9bnplCfdTfosi+5jXZPUlYjdrKloM4Xpb
 xKHwsUipkV+H2BzjOj5DI/16vxqW628zmyAhL5lzKlxVv4G6xDNYCNY2S59D0EFfjW
 c8hNnQOQCABXg==
Date: Fri, 24 Jun 2022 13:52:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 6/8] ASoC: max98396: Fix register access for PCM format
 settings
Message-ID: <YrWznD63aJvCLkXO@sirena.org.uk>
References: <20220624104712.1934484-1-daniel@zonque.org>
 <20220624104712.1934484-7-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RSuues7emqihzUON"
Content-Disposition: inline
In-Reply-To: <20220624104712.1934484-7-daniel@zonque.org>
X-Cookie: Help!  I'm trapped in a PDP 11/70!
Cc: devicetree@vger.kernel.org, ryan.lee.analog@gmail.com, robh+dt@kernel.org,
 alsa-devel@alsa-project.org
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


--RSuues7emqihzUON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 24, 2022 at 12:47:10PM +0200, Daniel Mack wrote:
> max98396_dai_set_fmt() modifes register 2041 and touches bits in the mask
> 0x3a. Make sure to use the right mask for that operation.

This is a fix so should be at the start of the series, ensuring it has
no dependencies on anything else in the series.

--RSuues7emqihzUON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK1s5sACgkQJNaLcl1U
h9CSQgf/YjLcTh4wZoZ4Qu7+0mKj4S7VSNdinnVymTIQHiNfn8ZPbhxMGev5mJHk
iB1ot2TSl9pKeV9ugrmaL7H5XZLrBVTOypIEGXiKumIAHnBdIVwE3n6sZeCNtjAh
fE6gsTVpCIPrxwV/Uwbrvf89+HdxEuCjDAv0u4Qo1Ra88aqUQkkArF/00w8uSYEa
9wA4mSGJLcPk74tuzKtRAZRMstolZcCpVIdev+fQHnu2KoRKi4rMWPo32Llg46vI
UNJqb/BdJkLiNoGGnfOjmnXrzvFlWqpOjTojJx0WLhUe7OH+97pAdBb6Yp++viP/
gzuvaPdj0y4r3eBIHMRNf0hrvBBCKg==
=v9F8
-----END PGP SIGNATURE-----

--RSuues7emqihzUON--
