Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 363DD60620B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 15:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B4D1B9DF;
	Thu, 20 Oct 2022 15:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B4D1B9DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666273466;
	bh=1DUrxhNsx1qHKDjYucDDGXHLJxD4TwRyGlKIU0XNHIM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEX0COax2UaS+g/l/yf/ZPhL0C17g3QhNDrYhc4pBXxI4Pw4HezLuvYWSv7CjJito
	 ZJM42ajv+Y+cIsGmw7+QinDY3ek/6Ap5cMRoz3hIWn8cp7kQ/lb6EVEIE10U97YQVv
	 GIFGx4XIrqvDzKla6C0VIib+zbkNLviu2THaszyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D87F80515;
	Thu, 20 Oct 2022 15:43:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A631F80137; Thu, 20 Oct 2022 15:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32580F80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 15:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32580F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oBpm1Y3Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 698ABB82661;
 Thu, 20 Oct 2022 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCE8C433D6;
 Thu, 20 Oct 2022 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666273409;
 bh=1DUrxhNsx1qHKDjYucDDGXHLJxD4TwRyGlKIU0XNHIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oBpm1Y3YL7OHliMDe4P1ML1oftQ7IhPmMivjKaK02wdx3Y54CTRe2XQ5ibULGoJcI
 2zaxmovfYRysYoj/h/5cs5Na5Jupqe6WxQ1X6hOgVRT1iT2sP+Kp58OcfenFkaxkUq
 3fHkXAu27Lc5Fp1x3npJYitZT11/Id5TCTydOASZ4t6mM7u9hrW2ZY054FmJ8hPpIk
 uCCPIOKv/vQ1PU63/1ibCEe/QExMXmC7W+3wKCfkQ5g0/SPWieF+NhFPf1/O3qZFeq
 u8N1C5QvHe9W6xH5moibp7YlPhRvJV28WCZveD+RYGN7gon811zyPZ5KtDzb8sLuFL
 JT65ShwJP/p1g==
Date: Thu, 20 Oct 2022 14:43:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 06/10] ALSA/ASoC: hda: ext: remove 'link' prefix for
 stream-related operations
Message-ID: <Y1FQe3XFPM0UMpl4@sirena.org.uk>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <20221019162115.185917-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ipLQf/RhsfQf9qZk"
Content-Disposition: inline
In-Reply-To: <20221019162115.185917-7-pierre-louis.bossart@linux.intel.com>
X-Cookie: Today is what happened to yesterday.
Cc: tiwai@suse.de,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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


--ipLQf/RhsfQf9qZk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2022 at 11:21:11AM -0500, Pierre-Louis Bossart wrote:
> We should only use 'link' in the context of multi-link
> configurations. Streams are configured from a different register space
> and are not dependent on link except for LOSIDV settings.

Acked-by: Mark Brown <broonie@kernel.org>

--ipLQf/RhsfQf9qZk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNRUHoACgkQJNaLcl1U
h9BcTwf/X3lwH1JMA6SH3/P+zq4sMae3yqfkmbSwx4nTBVDzrGzM2f7p4OCzjWTO
MDGeQsO5GNL0VJNuaJYbV4uaFU+f+8rvEkYyHCDBdtCKe9i6Dc0iD1klbnG4fjQt
vGhDmzY/Jv/5aFHGwmubPdkUT6MaR/SwcYiL8VitgorDWTwl+wxelhccDPbglkbd
fU4vWIsMsBWf791grcu09jFiTQU5LukDECp5q6+XyBkQu6tEINHCCseOAQ6mFQzV
QsbLpw1MGQVZLfAaIRc9UYB7tdIi/g+778ZxxkEzUwEf2sM+z2BsKk8if7JeEAnn
voVmaQledu3EMcIl9mSTjxPpBeKPMg==
=TlpP
-----END PGP SIGNATURE-----

--ipLQf/RhsfQf9qZk--
