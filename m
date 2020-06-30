Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E9220F350
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 13:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0FE6165E;
	Tue, 30 Jun 2020 13:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0FE6165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593514971;
	bh=yq0EKJ+zwKlc5ZQq5pq9eWRJFHa8ScWog81thjg3OHw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFkzI6TeOH83HKEBrpxsBg0LosfpatmYRr68leonUTjim5qUIrEhet5w2csQGfNe2
	 SUSEDvBg8v377Df8KtnVGjpZP+6Su2cLpMfGgHeqFxDZOgCeVetR5Yk7Q5NfeKl2RZ
	 fCXoU5SNg77cezghxNIukqs/ImEhKjqxKjqgk/Ng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7B9F8022D;
	Tue, 30 Jun 2020 13:01:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4391FF801F2; Tue, 30 Jun 2020 13:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88492F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 13:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88492F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cmVCthba"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 415BC2067D;
 Tue, 30 Jun 2020 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593514862;
 bh=yq0EKJ+zwKlc5ZQq5pq9eWRJFHa8ScWog81thjg3OHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmVCthbaWYXcHgcWflGwipFqgak7qqScwUP7vj1UStWrXRF+ihacneLzao00Sk51S
 DpFQV3T4MLt3CjbAOyR+n6HpX8ugFHL+6cKHzDumRHZ1lwRsKFfRrkvPu++A47KBga
 B3WBJTz0axs4C9Nqbi+WhRi3PMx/9UnEQTTW20Fs=
Date: Tue, 30 Jun 2020 12:01:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
Message-ID: <20200630110100.GH5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Content-Disposition: inline
In-Reply-To: <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
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


--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 01:22:29PM +0530, Sameer Pujar wrote:

> Yes there are complex use cases, but if we look at the amount of changes
> required in simple-card driver that is not too much. Existing binding for
> simple-card driver would still work fine for our cases. Yes there are some
> deviations and we don't want to break existing users, that is why a *new*
> compatible was introduced and specific items can be pushed under it.
> Majority of the simple-card driver is getting re-used here. We just need to
> make sure it does not affect anyone else.

Why simple-card and not audio-graph-card?

> > Using fe/be instead of cpu/codec is easy to understand.

> I guess you are referring to DT binding part. The parsing code specifically
> looks for "codec" sub node and thus present conventions had to be used.

Remember that this stuff gets fixed into the ABI so we'd have to live
with this for ever.

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77G2sACgkQJNaLcl1U
h9DLaQf8CxFbnQfdwGWMqWzwX2nlKaR7uERgOdrildCUvaMKInQJ3nSQzOwEqxkq
NMi/PKvwmR+2xteMNBYYMvXO739dNZj9Y9vvVHOmAUtPwVMEebs45t4Km2qwLx25
t5d/6KK4UUC8RghBJr0Ls1Ywhqbp6CSieyt9ogqvrb0PrVGITmV2fpklh26gw75d
/yzh/obJaTotGhYRuCFMvB7mTNOiitRXr08p8kRJSbEWZKw7+ebUQKhiuu6Ximk6
1Uso6kJgROaHZhl896uSlbnW4odrn1t/JSHxJ9yRNedpvwV+E+8ZGHo75K6SEwRx
4NOG2mHbKSXZ3Ta+h/R4+Q4B2STg3w==
=eDum
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
