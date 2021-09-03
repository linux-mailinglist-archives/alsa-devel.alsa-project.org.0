Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B9400430
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 19:31:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5E218C7;
	Fri,  3 Sep 2021 19:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5E218C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630690303;
	bh=ILOKCVEg/GU2ma2vAM0rasggdXVr/bBb2evSi/xMUA8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RjTHtWrCfL9sGGqwwx8X5JYJoAd/l0uLCfj99KGhTWC5/rprz+pD5LFGavCutRky4
	 JeImIh8L7Ok7DYMirAKjpxW8/V0RJNC00WkhBj6I4F031IRj5GEkZSXNz6OOCwA3sd
	 Osrp+x0rmq4gp1ZHA2n49aHbuNzhWpztyyddcXdw=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AACDF80227;
	Fri,  3 Sep 2021 19:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00FE7F80254; Fri,  3 Sep 2021 19:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28B4CF8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 19:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B4CF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q60iLjlb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADB6061100;
 Fri,  3 Sep 2021 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630690202;
 bh=ILOKCVEg/GU2ma2vAM0rasggdXVr/bBb2evSi/xMUA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q60iLjlbUQx1P80P2nECV2eZ/FBcP00+l9l/RSIdpiM7bmGY7OjOJc1KcK7buv3nw
 aC5EimUOv5fE5hx2VAyD5uxSVjYDSvzrAdi5nx4nfhGM4xiCKdhaJrPIsff8hPDnHG
 ytM+cdgciop3d/X3FZeCnUqb1VMKh97uxcl3+jXuzBsdv6L6UUGpTqx6AULl6dkGpD
 blavFlD7tF3PS3mIsuVIx6oFRmcggexhTwn6sborXFPtVFt5CWUN2JhW4mNEDYRVj+
 ENOrOi3ROzxpdrNGIh0DlOAVXTeoo44kOc1qTShAvoPQrxk04ZDt0RFSMAi9xeTCb2
 488BpNwirqeRg==
Date: Fri, 3 Sep 2021 18:29:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v5 14/21] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
Message-ID: <20210903172927.GN4932@sirena.org.uk>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-15-srinivas.kandagatla@linaro.org>
 <ddb4f36b-8a43-d1e9-0429-78d8eefc9474@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GEn4szYucjS2InE7"
Content-Disposition: inline
In-Reply-To: <ddb4f36b-8a43-d1e9-0429-78d8eefc9474@linux.intel.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org
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


--GEn4szYucjS2InE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 09:23:32AM -0500, Pierre-Louis Bossart wrote:

> > +struct apm_sub_graph_params  {
> > +	struct apm_module_param_data param_data;
> > +	uint32_t num_sub_graphs;
> > +	struct apm_sub_graph_data sg_cfg[0];

> I thought the use of zero-length arrays [0] was deprecated in favor of
> flexible arrays []?

Yes.

--GEn4szYucjS2InE7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEyW3YACgkQJNaLcl1U
h9Adogf8CCIbwxTLYgzK5uMCVZ7zopHEWKyCmaLinXyxUYs4/ulpK5Hzzq4UlzN2
pBfynj4lv4+V7x5XzxmL+ZOCdR0YTcODcfOo/dwz1mUn3CFNA9lIAO+PRMQnpFDE
5OX0OCi5u5ADj+cAetKrQymg8X50EW6SvUGLPvsXE8t+IgiTEUZZKUAyAO/q1ogs
lB+w1+hhY8ecX8s9rSC3SEWf6DZvVNymqqJhA/H8U/jgeHNekQk1g3dnkaTeK3Ar
MS80AqbS1roc+3+2Z/XNL0rgo6Wvr85Gk/96LEC8FEiJmjHy5ty9yHytZBBNQusj
vX39jAJAgEZN71YY1UxDVpYJRfFSmQ==
=IfNE
-----END PGP SIGNATURE-----

--GEn4szYucjS2InE7--
