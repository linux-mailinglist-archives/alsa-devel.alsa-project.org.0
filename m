Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA7C2731BA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 20:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0711C16DE;
	Mon, 21 Sep 2020 20:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0711C16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600712220;
	bh=B0lTopjUsZvd6EwUQKoaTB0VIJdDhLa/FoNy2iC4GY8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJMk1tDKQJpmqC8NuL9+/B1Mi7AqrPkQbbErTnP4CmWg9AWv1CXkfZBOO7plmYA/d
	 gAWMh4QzrcLLr/tPsVJTlQa2onHSZ8NTKQTrUcn4eijBeCwwXUEWrByoE/15H2Bq3/
	 KmT9lQWLtIFitA1z5QQeaMvWJXug9VDCmGejWdAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D177F80161;
	Mon, 21 Sep 2020 20:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44316F8020B; Mon, 21 Sep 2020 20:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36270F80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 20:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36270F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WHzjkPLU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD1D0207BC;
 Mon, 21 Sep 2020 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600712140;
 bh=B0lTopjUsZvd6EwUQKoaTB0VIJdDhLa/FoNy2iC4GY8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WHzjkPLUyulhDS56PsChZaKdCQ8FBwX2TvVV4HeP3k1Z6TX3ph5zi9aJ+PWA9Bxrk
 cKJc2O09nZpKsqCYR4NlHUcwLBUcxLQO7diwaTZBVNSskN5DhdgzaA5N/6LiB6RX6V
 W8jQ/m8hjttf2HvfZJV4nlyQEPfscuuLlch8xsMw=
Date: Mon, 21 Sep 2020 19:14:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: No ack() calback in component driver
Message-ID: <20200921181447.GE4792@sirena.org.uk>
References: <fb148b74-a452-7dc0-649f-84553df6921c@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Content-Disposition: inline
In-Reply-To: <fb148b74-a452-7dc0-649f-84553df6921c@nvidia.com>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: sharadg@nvidia.com, Linux-ALSA <alsa-devel@alsa-project.org>,
 atalambedu@nvidia.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2020 at 06:32:48PM +0530, Sameer Pujar wrote:

> With your commit e2cb4a14541d ("ASoC: soc-core: merge snd_pcm_ops member to
> component driver") snd_pcm_ops is replaced with callback functions in
> component driver. In doing so, ack() callback was not retained in component
> driver.

> Was this intentional because there were no users of ack() or if there were
> other reasons?

I can't see any reason not to allow components to have an ack()
operation so I'd guess it was just lack of use.

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9o7ZYACgkQJNaLcl1U
h9DNiwf/cUqzkkB8LWl/6A8jcFhb4aX15j7nmen7pIrwuigmia1mpfhyxSVwVCyR
tYmWthtiSArNacD0qUiebEzbuxBCy7KpG5zdNo1RpqjTSiCKagjMURUt0oaL2IUn
Bf+8CI7FZl1x4DO1Jsuh6GF17fES9qZeTxZkV5ExVSDh3QMtGxvV+tGGaLFbOrKa
KXFi6oVivtJCSOvcgP0pJgZkv1bD6lyEcM2VEQ8OERUGvxWcmyo2wlvmnixyIoei
vJA+wzt9R0IPdPoqRwZC2Qk6GKiIdkwBG4IriOTl38xvv0yA1pFUywS9Lssy9Fga
7eZBpBvEhOfC/RT1fIiaWqZAIJHnfw==
=eKXC
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
