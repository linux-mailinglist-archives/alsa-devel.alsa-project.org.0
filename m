Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70C44995A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 17:17:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A3E168A;
	Mon,  8 Nov 2021 17:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A3E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636388272;
	bh=ZViGquAcSREf+WCVyvRS1/EQ7NWLBVKUIUxVQpvu/Vk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0RCmF9kF1qqznudwPCzHddDz8ZDsnuoBwOffjpO7NCbeavW/Tc8iCMlBHLtSkoab
	 9Wajmmgw7e0lnRPplpAFOsZkdOM8EFub322fg4DKHwH5Yf/bh4az5fVFXEN67DC3m7
	 5p31NYA68ASTLuX/9UEmVn2/+CqkwsQfo5eAYHwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF0EF804F3;
	Mon,  8 Nov 2021 17:16:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F37AF804F2; Mon,  8 Nov 2021 17:16:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3133F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 17:16:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3133F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qDbi4k8q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91AAF61360;
 Mon,  8 Nov 2021 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636388168;
 bh=ZViGquAcSREf+WCVyvRS1/EQ7NWLBVKUIUxVQpvu/Vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qDbi4k8q9+LR+6Xqi95afw3Ov2XCJtgQsoPXbqWGwgqOO6qNkaFhBAl0mvjhMmCUc
 BIcFHDyB5TiDpg1vGgCQ7hfumwZCLduUiFoBOWwJa67ftfBNYrveblFgfDRkuqVWrj
 o9qJQiXy4gqxwoCDF2AQUvtXpeVlQTJbSP3ychXOQeQg/YhtD6Irk2DGPcvxh6j9OB
 HsZ+l8XDu+dG9hs7vV6m0+3RpxH36DzeEMzxZk6F3krj5wp77OKAHG6pvchC+qywhv
 W6ESPfwY1BKiFDk8KzELS3xm/wqc+0iyR6Ey3SWiPKPOx492ubZEYx41nQZCbBprrD
 Y0L0GtuSI1aBQ==
Date: Mon, 8 Nov 2021 16:16:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 01/10] ASoC: tegra: Fix kcontrol put callback in ADMAIF
Message-ID: <YYlNQya+YVg1JCRq@sirena.org.uk>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
 <1635947547-24391-2-git-send-email-spujar@nvidia.com>
 <s5ha6ilmiiv.wl-tiwai@suse.de>
 <0e2d89ca-84e3-9427-5ce1-c0224d4db089@perex.cz>
 <d27bf513-6f16-5ad6-59cb-79fad5cc951c@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hSCBKJ2X0AP7XGaR"
Content-Disposition: inline
In-Reply-To: <d27bf513-6f16-5ad6-59cb-79fad5cc951c@nvidia.com>
X-Cookie: Kleeneness is next to Godelness.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org, tiwai@suse.com,
 jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


--hSCBKJ2X0AP7XGaR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 08, 2021 at 09:33:25PM +0530, Sameer Pujar wrote:

> With separate callbacks, the string checks can be removed. However for most
> of the controls, the common part is minimal. So there would be multiple
> independent small functions depending on the number of controls and the
> local variables are duplicated that many times. Would there be any concern
> on the space these local variables take? One pair of callbacks for a control
> may look like this.

...

> Looks like having separate callbacks make it look more cleaner. If this
> appears fine, I can send next revision.

Looks fine.  It'll result in more code but hopefully they should be
smaller, especially if you're using substrings rather than the full
control name to identify the control and we need to store all them
separately to the copy used to identify the control to userspace (I
didn't go check).

--hSCBKJ2X0AP7XGaR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGJTUIACgkQJNaLcl1U
h9A7OAf/crR93uqsfMvOX0QdbKKWE3VrliVv3O3XEdi19d7/wUTGNbdqm0547n4L
oyi9HGmFL/pXYpGncL5V+UIqWRftYJ9oy2GIYxRe/eH6RFGM0vthFI+Z8ZJw3D+i
Rtx7WX9gFANilArMSXwILu4K8CsAeoDF8Tibjh4K1+k5IcO2tNcTnSNA5xlT7OVc
uzpDDAe9c6c1X0mP2D42MoHJ4RtEcKvue0GxpN+/PKkCAgmpGMsQb+RQ25n9npHv
8w7lMDaddhi2MQMuBPYDmAHboFkhsCVyVJFKJOPgMzF55SC17iDFHW6QyxT4FimW
0p60A9ZtmDNkiKXjOo2tj3JEpqQmgw==
=Xs1h
-----END PGP SIGNATURE-----

--hSCBKJ2X0AP7XGaR--
