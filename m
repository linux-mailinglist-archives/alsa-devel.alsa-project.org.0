Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA31ECDC1
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 12:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DFC41665;
	Wed,  3 Jun 2020 12:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DFC41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591180918;
	bh=rLlkn0WHucra3mhBqotY8ITULWrZDo+dbxfSOi67iCE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQanl0rMHiKptZZIc76jcyHyLAEE0ahaD5UWME9ZLtdCvKk8qZtORehBSbJmyrfcC
	 1rYA2s4pD3Lc7cxZiqGHFDHUHfUgyEkE1e3R/d2QsFidhN861K1pcg6Y770nz7+DJn
	 4ZSDV3qC7cl+zF38FUZbz12tpCHW3UPAo8HeUHFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EFE1F800D0;
	Wed,  3 Jun 2020 12:40:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06BA6F801EC; Wed,  3 Jun 2020 12:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E50F801ED
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 12:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E50F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nit2eKNL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A41206A2;
 Wed,  3 Jun 2020 10:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591180805;
 bh=rLlkn0WHucra3mhBqotY8ITULWrZDo+dbxfSOi67iCE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nit2eKNL283U3qRKqwsnKH4oFwbkPf4ECN05ennqpvcsDdCR52GdV6lMNcIAeR4zt
 sFO7xqgJwyZrq16n20+HcXJ+jiqeU1mDRifKymHMpXUW1lJJXgdvhJO+q0ikLkyg35
 5azkJlVDvC8NyWmXiZqZ6WDkBEJcI/lIjBAQ+A6E=
Date: Wed, 3 Jun 2020 11:40:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 09/24] ASoC: soc-component: add
 snd_soc_component_compr_open()
Message-ID: <20200603104003.GB5327@sirena.org.uk>
References: <87a71nzhy2.wl-kuninori.morimoto.gx@renesas.com>
 <87wo4ry3bz.wl-kuninori.morimoto.gx@renesas.com>
 <6c8189c811df911a3c697b510bcc893e53e565bc.camel@linux.intel.com>
 <878sh6xtqn.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline
In-Reply-To: <878sh6xtqn.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Your supervisor is thinking about you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 08:16:00AM +0900, Kuninori Morimoto wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> > > component related function should be implemented at
> > > soc-component.c.
> > > This patch moves soc-compress soc_compr_components_open()
> > > to soc-component as snd_soc_component_compr_open().

> > This is change is justified in one way but it also feels like maybe
> > because the functions are so specific to compr devices, it is best to
> > leave them here. Maybe others should also chime in.

> Hmm.. I'm not sure.
> Such kind of functions are already has been changed...
> Let's ask to Maintainer.

> Mark, what do you think ?

I don't think there's one right answer here.  I guess if we have to pick
we should do the same as is being done for PCM for compressed open but
either option is fine I think.

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7XfgIACgkQJNaLcl1U
h9B+VQf9Gjz8KE2WX/+HCpzTbCrDNTrLPAq21cKVbPA4UOo+KObAu7iEV1+ueT6D
2Xn0RARtn5F2IZdncbN39yfso2zCElnySy+X8yYFdYPDhaOUgBknDEGFrVWyAs79
MGSRhGYTBNDbx9IIKtaOt6vIKccY9rvaiPJBmscD+m/z3l4HmgolVqJpgvjz3CVs
+SqeVcxffclm7KgzXfUmCBbRVTm5Pg8T3ejxldM/u6BLI7gTSE/sf/EKYUBXXE2R
uXKGNVg+tXr+ulyjfKUsS4dQciQK6K+edenLIov0/KtJi0JtDg9Ov88FDtw6w7JB
ceY3oP66Q+HL3sOmqV6qr9V09ABQfw==
=ezU+
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
