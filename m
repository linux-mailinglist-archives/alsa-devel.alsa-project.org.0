Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE9C6C1CC6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 17:51:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 204B91E0;
	Mon, 20 Mar 2023 17:50:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 204B91E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679331096;
	bh=E0ClaU5YCHQBfzgXU30uuxfmPFXZyvuONYhWTPogYUE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DnLJypC/JEClNIF7FKLFCJ6px3I31iwzdNo24FQLamUK0P/V8OK8DJSOSRMbdSyjn
	 RV290SlTECpFzTH28lzH666YrIwEMGm0QuMpJp4bSr74q3UIy7vAfDK3QcIPGaoZ32
	 /pm92iYGClk1Gxfwfxg2X4XIgOmMRkXhVAa1Rm4g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7827AF80254;
	Mon, 20 Mar 2023 17:50:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3B5DF8027B; Mon, 20 Mar 2023 17:50:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 172E1F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 17:50:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 172E1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H0EscW+D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 00D526164B;
	Mon, 20 Mar 2023 16:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C5BC433D2;
	Mon, 20 Mar 2023 16:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331037;
	bh=E0ClaU5YCHQBfzgXU30uuxfmPFXZyvuONYhWTPogYUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0EscW+DR0mPhT3QtBlpDa7AOZkr5gLAthRiYn5FTINn2m90qil1B2yyqIHijePVs
	 zspxjDzllLPFn1fdAITUAWbNdv2DkFYdqY++kgTjz6l+QY3K/pzAWQo0WVmp2+JYLN
	 Cxpyo4zAmRvMEPOry+Dm1/XLc6WjmyBrFi/X0ma0FOZro2f8vpMFy316vH1PhzSNqK
	 JmEAketSXrwiWemVSyfGFg9u44CtxUxoQA82N+E/nV5QKERvDTWQCypTMrRMQBP1/N
	 oAjgk+pSFFOSaR5o3iWB3PKg6+9be1t4OoWxEEGlSOPztqHMfNef9QloTia7GwcCRy
	 NTnghhXpPkJ1g==
Date: Mon, 20 Mar 2023 16:50:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] ASoC: tas2781: Add tas2781 driver
Message-ID: <160416ce-a262-4012-84af-16873588cee7@sirena.org.uk>
References: <20230320150726.20573-1-13916275206@139.com>
 <aea0c730-898d-7326-d245-79bc124bca0d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kyRgx4I2BnEQBwi+"
Content-Disposition: inline
In-Reply-To: <aea0c730-898d-7326-d245-79bc124bca0d@linux.intel.com>
X-Cookie: Keep away from fire or flame.
Message-ID-Hash: MAVDUTVY7HHDD6IAYVKAPZ7W4XYLAFAD
X-Message-ID-Hash: MAVDUTVY7HHDD6IAYVKAPZ7W4XYLAFAD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shenghao Ding <13916275206@139.com>, lgirdwood@gmail.com, kevin-lu@ti.com,
 shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAVDUTVY7HHDD6IAYVKAPZ7W4XYLAFAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kyRgx4I2BnEQBwi+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2023 at 10:47:08AM -0500, Pierre-Louis Bossart wrote:

> > +#define BINFILE_VER				0
> > +#define DRV_VER				1
> > +#define	PPC_DRIVER_CRCCHK			0x00000200

> indentation after define?

That's a value for the DRV_VER field - that's a thing people do, it's
fine.

--kyRgx4I2BnEQBwi+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYjtcACgkQJNaLcl1U
h9DHXAf/dpmPmlYmze3xNFrCCmS8YhPy8RbOsqEPQQtXoRhNxk8Jg8Pb2Tc//eSh
kogvV04aaVs0dDKiU94nsGwPT1nR7FNjMXEKCS/OIgcLQajxRHNnvESp7gFSWzFu
igWlcABy646MPtds6ttgiakT97/SX9bOKyyXi1YPWCYN+5Isr6IpJed++oY2w2k5
F4gJDthUKk8S2FgJyDqvlwcLgY/iJ+5TMb7M2ZbR7T8Ot9gXXiUEEkzbZRjuAg6/
LcNibrXeY429OZqT6Qw3jxApz8RiNlSKEA9EECOIIQJuBb+ARKcg5rAXyoDnpCbh
wu/x1va0GRzwvK2OEOA/93T0XqdVXA==
=GzKh
-----END PGP SIGNATURE-----

--kyRgx4I2BnEQBwi+--
