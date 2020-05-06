Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CE71C7572
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74D81787;
	Wed,  6 May 2020 17:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74D81787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588780510;
	bh=61SzP6jYuIR+DjFGG/3AzUM3hopX9KA2QA96YzJI/5I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G1BvZw8O99xvTsmJDZD/iTiUOVO4EGbE2dYcvYujqMTPX9IelhIMjiRGPGDFSpmGs
	 Zz05agYt7uaJZCYngSZzF8g6bQcTgm4J8AdagEYRwBM0NvQyHXuoIPZUNFP2JRuSk4
	 WfSyqYD857TthQFAMJ131z21o5XjBibryAqDlAiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A19F80234;
	Wed,  6 May 2020 17:53:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A060F80249; Wed,  6 May 2020 17:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54152F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54152F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n02M6rTf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF25F20708;
 Wed,  6 May 2020 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588780394;
 bh=61SzP6jYuIR+DjFGG/3AzUM3hopX9KA2QA96YzJI/5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n02M6rTfUPMddeoyC4siuILDTmJjZuaqWDo9upgcwpX6XKADKRGtnaaaFXzg73kw2
 UTXti58uJIzNXeNOa9fT46C9sy4lArpmqerVdZVU4B0zSBh97JZ3U+qADxqYn/HoY0
 v5ePdk+ien+u/L70HvI+C4ynIJEXVFuEBmpFzUxg=
Date: Wed, 6 May 2020 16:53:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [RFC] DPCM for Tegra
Message-ID: <20200506155311.GG5299@sirena.org.uk>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
 <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
 <fe842d81-22da-fbbe-b5e2-9872cefb9d8b@nvidia.com>
 <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BzCohdixPhurzSK4"
Content-Disposition: inline
In-Reply-To: <1jwo5pf7de.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Not recommended for children.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: viswanathl@nvidia.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-tegra@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 atalambedu@nvidia.com, nwartikar@nvidia.com, thierry.reding@gmail.com,
 sharadg@nvidia.com, digetx@gmail.com, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--BzCohdixPhurzSK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2020 at 04:47:09PM +0200, Jerome Brunet wrote:
> On Wed 06 May 2020 at 16:12, Sameer Pujar <spujar@nvidia.com> wrote:

> > XBAR currently exports all routing widgets which can be used to
> > interconnect multiple components and thus implements Mux widgets. Fixing
> > the routing paths in driver would limit anyone to try a different
> > combination as per the need, unless driver is modified.

> I did not mean that you should restrict the routing ability of your SoC,
> quite the opposite actually.

> You should just expose it correctly

Yes, it's going to be less effort in the long run if nothing else.

--BzCohdixPhurzSK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6y3WcACgkQJNaLcl1U
h9C+9wf9FhV0+uWoqDcuQBDbDmaqyavUV8uakHgopXF3Q9Ny3WMoj1EBaIpxOOM1
nFLZGkaXGkbOEDxuixc2ptvMvML5c8WccOrS3J9Ux6K16BbXpwjFsqClUrzpix0O
r40xsg0q81/pSxIFOWU0BKmFebz8wLG3NGGV2d7ZMW//kIG7LVAb8oB6epKkeKYY
sACMClQ7QsGOeWqteFWq91phXk4OL9KJ4SileYVgTcMBoeN8xgIytv+v7unCTKhk
aJALdHiBajto60CLYG6UPUoIZ3FRLWEoybSOdI7uQz2MmWctYmzn5OQu3lGGlM4l
XM3B0/3XWGsyGhK+XM1JqWoi9cz1tw==
=tJVE
-----END PGP SIGNATURE-----

--BzCohdixPhurzSK4--
