Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB44BDAFF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 17:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3731731;
	Mon, 21 Feb 2022 17:48:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3731731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645462183;
	bh=BThUCu0i2KzEThjx4kOkeAs58jVnLKmkyOcT/U/ZjVo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdZJ6NF4YjMfE0lUReB6nZaf29cQZ68DloEgWbPZSMXudiz/u29A4gYBWj0tZ7SnI
	 xHQ+Hj4oPJlI/TnZg+QWo0XooqkfcOLq9Kt0hdZT41UdKCOU/96lfcS1rrlEe8J/hg
	 QTefttzs5hjfMObfyQVhEdwgVFfzvYLvxnBaGopg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC077F800FA;
	Mon, 21 Feb 2022 17:48:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91EBFF8013D; Mon, 21 Feb 2022 17:48:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43C63F80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 17:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C63F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ch6hIqKd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AF3760B6C;
 Mon, 21 Feb 2022 16:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28549C340EC;
 Mon, 21 Feb 2022 16:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645462108;
 bh=BThUCu0i2KzEThjx4kOkeAs58jVnLKmkyOcT/U/ZjVo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ch6hIqKdgafNt6HMmiSruSDLFBaBsJWXFhrE1Tg7FerOk8nsFaXG7t/Ta/oT9H20g
 U9Pmk5PelBxcDLGTaaYsbX5bfG6pozHckJIwt2sSh6rrh4K27oax4iKudK9pYxk/AZ
 Zj2/eyOFVeeDWXwOBa5fRCpEEb97DzcxQA8E2o2YwQi/jg7Yld/pLXQXqvnDBI5jkN
 05aylnZAaFy3iicTK9RJSbPgTWO3KxtN7e7PuGCmLMsrgOY7TSKMW61u9f3iPRi9M0
 f6G22sCKPNlIHMFhF09gazzytZQrEWehjcR10yWrfdDACfBztUsRp1tfjr62jgsg4x
 0kzFR4+Sr5UMA==
Date: Mon, 21 Feb 2022 16:48:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 09/10] ASoC: codecs: tx-macro: setup soundwire clks
 correctly
Message-ID: <YhPCWDmS2PV/AD1E@sirena.org.uk>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-10-srinivas.kandagatla@linaro.org>
 <YhOx+nQ/G+HNRXbq@sirena.org.uk>
 <d8f1db40-33ce-671c-2041-5f12608afee5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N8HrxkquhfNLRnQ5"
Content-Disposition: inline
In-Reply-To: <d8f1db40-33ce-671c-2041-5f12608afee5@linaro.org>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--N8HrxkquhfNLRnQ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 21, 2022 at 04:11:56PM +0000, Srinivas Kandagatla wrote:
> On 21/02/2022 15:38, Mark Brown wrote:

> > A lot of these commit messages sound like earlier patches in the series
> > introduced bugs which isn't going to be ideal for bisection.

> Yes that is true, I did think about sending this as a fix.

> Adding a fix tag would not really make any functional difference as we will
> be hitting the issue only when we enable pm runtime in codec and
> SoundWire controller, so I did add this as part of pm runtime patches.

> Without runtime pm the clocks are left always on, so it worked so far.

You still need to pull this before you introduce changes that cause
trouble, not after - it needs to be preparation for those other changes.

--N8HrxkquhfNLRnQ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmITwlcACgkQJNaLcl1U
h9BBWAf+LiLVaYi+pxISHIxMrZP/doKcCZFWS0PzcOWi4Nb1xxw5zfEHUYdnuscg
iPY6VOk8AVaU84YBgus5cN2YAZNT6lbbZwMCRNyGMps7vJJNLQuCQjPeekPzqGCM
VZfsV1bTMk3tkfQlSw+sixOxX8AVtEcOFyttH+yCt6s2PB2r4MZZrGiHi7kpGJil
Yq1NMNBdlsiFPdiWFmtlndqBEJlavMB17QG9lZjxC7mpUxT0zUPVRlevMp+0Q0/8
9gguv76axuD1+1N029zWYYjpTJYHXPSSqC1Zg1Yu9+V31w9lGpLcnMJAcmcEtYjq
Bbi9CcIy8mUff3ccxwI8lShQftioOw==
=5fQu
-----END PGP SIGNATURE-----

--N8HrxkquhfNLRnQ5--
