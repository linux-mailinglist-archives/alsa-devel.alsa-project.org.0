Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00D310C74
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 15:05:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6271678;
	Fri,  5 Feb 2021 15:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6271678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612533924;
	bh=KSxIMlDA6ShJiaWSByB90Lc7u1RAy7m+dFD6RcfG6m0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSxcK16gqNFT61/iZOoZgB2VY2ccfp+dIX+WUXqLJiqn3igXnk30Cva/AJYlaZdil
	 Ej7J0tOeRq3loDNTerC+jx/UaVmp/yKyvSWfqv6tdlWOHit7vDLSRbcaQPrl7kQUfZ
	 Vy4pwZ7XGwAqHwBHZrsM5/97zdWCKUYqwjL43ylU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36318F8016E;
	Fri,  5 Feb 2021 15:03:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D776F8015A; Fri,  5 Feb 2021 15:03:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EAA1F80152
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 15:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAA1F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lkoEcfJn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80C5C64DF6;
 Fri,  5 Feb 2021 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612533822;
 bh=KSxIMlDA6ShJiaWSByB90Lc7u1RAy7m+dFD6RcfG6m0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkoEcfJnt0fU9Iij7bTJMAndSCEiVurjdE9VNRGNHVT0iEDMcEINYzsKoOZL6cfM9
 GfOJuAE3Zt4Q0+xz4xEsiG0KtPOIpRIzGy2HQoc4w+IpY7+X+3IrjQ+5OZK2Oz2Uvs
 OKws/+OMqB072shE4zH+l3F/L/tjZqYciYT+BBv76qE+apLwel9okio39bY0H+AtX4
 1iLboaZ4fpMs3123JkGSuyFzsSUAkWKQi+T+Ujkfm5McF7oYhX87xXjjsu6yofnNw2
 JUs8822XtMP7hLe2CJ6fkhs+KnX7ZdVtUE6pvlcg6g9x4GXeMCQygAr80Q0MTJPXPc
 kOaNCClvv1m8Q==
Date: Fri, 5 Feb 2021 14:02:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base
 on rpmsg
Message-ID: <20210205140251.GB4720@sirena.org.uk>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <1612508250-10586-3-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, festevam@gmail.com
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


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 02:57:25PM +0800, Shengjiu Wang wrote:
> This is a dummy cpu dai driver for rpmsg audio use case,
> which is mainly used for getting the user's configuration

This is actually doing stuff, it's not a dummy driver.

> +static int fsl_rpmsg_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

If this isn't needed just remove it.

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdUAoACgkQJNaLcl1U
h9CaXQf5ATE//mi5uJVW049xtEPBycAxvAbD6dNUWYwuolWDZojNk7ks+PbhTKnA
0gUKScEIt0hL34j7/4NiKG+VZ66VHWlGKf+GOAhnku/bVm9Iu6PmTRoG72cNRiyt
/hfXxeapZaUppPdd6/QADyoGWNnc4W3+JwC+tcSbRrIFpgrZK+fp+nLkBbmvdTtm
rjguO81Wbie1P9vtAlWfiZhjh47ZACa6OhbNXXu4P7ndcwBUrOU9J0CMtLOWPMMU
E9dYnRBCJVSWIHbTz51qUzzpF7DCsb8TJYDlLmMSyzCf+OsosvVQ5gCLMTE/Wsfw
J4QgeKlJPaSNbAGIo78mYd3NJttKTw==
=oQQq
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
