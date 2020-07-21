Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53303227BDD
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 11:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05D50167A;
	Tue, 21 Jul 2020 11:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05D50167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595324164;
	bh=wRyOkf5BPZx5EhcERYgIJKjB6OMOn8b6JxT3/6io1uU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z40YPxRCrgmjG6HRUa3+pQuNArbI+UxG3KBXuiLEdCekAZ6RcYDOj9W/JXvkVO/2G
	 6/b5qZdZuLotHGNIgr1ncekel2pBFOonIpOPHvJnPl1ORwi2a9pHxl0b79WN6RmUns
	 Gg+U3IgVYLPfgCCPREqFhKsz8gebUFIYkRdRH7Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4752DF800CE;
	Tue, 21 Jul 2020 11:34:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F534F8024A; Tue, 21 Jul 2020 11:34:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED42FF80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 11:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED42FF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VUwFh+ak"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 826942070A;
 Tue, 21 Jul 2020 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595324052;
 bh=wRyOkf5BPZx5EhcERYgIJKjB6OMOn8b6JxT3/6io1uU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VUwFh+akV6bxsDn1GyNoMZEn5p+yDLf684CgGe64T4TJEu3GBLxg5yF/U6lpq/WaL
 GQLmWOpZNlWyaNxTNb5pzRNCM4xaf1PoLs8EXchYcY2Vf3N1gibdrtQ6s4beURmhaj
 tFa6EcHUBwm2QtdO6rG3ewL86ougrM7mBa6nSOls=
Date: Tue, 21 Jul 2020 10:33:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: tas2770: Convert tas2770 binding to
 yaml
Message-ID: <20200721093358.GA4845@sirena.org.uk>
References: <20200720181202.31000-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <20200720181202.31000-1-dmurphy@ti.com>
X-Cookie: I'm also against BODY-SURFING!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2020 at 01:12:01PM -0500, Dan Murphy wrote:
> Convert the tas2770 binding to yaml format.
> Add in the reset-gpio to the binding as it is in the code but not
> documented in the binding.

What's new about this version?

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8WtoYACgkQJNaLcl1U
h9DBiwf/VkRD3CE9qEXZu/H6d/cKccK78cdx+xjg+aPRtBQUNd1d0VuGIfe0j6MQ
Prpam9rnYKQkVwea4g84t9758PLwMQquSokeMUBhOEAF4a1opT33TKEZxIe9LR2V
43HK6V5NZX/ybjlw3Oeos7OWvJmMfpACqL5C4ceQQ2phEPGpe3TuAKx2+o/Dnk0Y
7EHHI+RqWZB82rpeOCngyKUWjxaetSBt+k9k8QxvP9ubgbQzXvn40rJt0VivIuna
uBqdWKRTHHaev3IGr+cpBRRiH/TTZzZroQhVN7ydhYdtXsikuGBKg2/Xd9OJ+L/J
3vTgCaWBlVkpMLU6PaREZwy7rvUS3g==
=LJIg
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
