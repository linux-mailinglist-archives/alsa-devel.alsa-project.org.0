Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5104329BC
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 00:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB3C16C5;
	Tue, 19 Oct 2021 00:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB3C16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634595890;
	bh=+5+FcQUycSBCcdTJVdkEdUZqNj9ZSNQUuVmNGAUQGGM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=niTsgGZ9Pi4t7+bSGgAYfsSrDKole+PpKgnTgLM5WVWbKkEv17F/McUpOwEhK/iOm
	 RIOO9nmpkncCTn9zAmEfBsMj3P04lke6ttly3bQGTqknaAYfouLmgJaDkNd7APYy3g
	 PFuSx7mddjXHii6TOXkIKW+JKmb8lctItsyVJTo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A884F80253;
	Tue, 19 Oct 2021 00:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFDA7F80224; Tue, 19 Oct 2021 00:23:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F76F801DB
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 00:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F76F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VptKryPm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2D1160F57;
 Mon, 18 Oct 2021 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634595807;
 bh=+5+FcQUycSBCcdTJVdkEdUZqNj9ZSNQUuVmNGAUQGGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VptKryPmU7qyjXCSs/4te/qeSuRiLufwujOpcXXT9iKyHTiHOaY7T5W5peaQkmZ0o
 QXZgz4EjlGBILkPvBvzu3O4q8WjrrXU8L7IX4wo4J9NlGC0Z8xyC1rk6EU3MpAk5Bh
 LOb9yivCPAqZ1+JPxs4vcyGf6GdsnU7dRlkANNqwtcc8A3fYeepFEnSW355DishdY9
 BENqomU8aGfGfK8y8DHDVhY4WNmGejS6GiYOXIzeHpAdsh3rYy8ZvzuAHNnDVL1m9H
 YK3aQCF3Z2XLr1as4NZENuQFyXEJ2xlgGbHpUc6qcnSEqUck+RgFzoy4wDUfyOEu+U
 O9z+FE9j2/ekw==
Date: Mon, 18 Oct 2021 23:23:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a
 generic header
Message-ID: <YW3z3Ehz9ZD06G12@sirena.org.uk>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-2-hdegoede@redhat.com>
 <YW2UNRAWUphJqhyW@sirena.org.uk>
 <c34cc4b8-31c8-9425-214f-2a0f39f048d9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SQ3NCdbEKKY1NF3R"
Content-Disposition: inline
In-Reply-To: <c34cc4b8-31c8-9425-214f-2a0f39f048d9@redhat.com>
X-Cookie: I program, therefore I am.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
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


--SQ3NCdbEKKY1NF3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 11:13:57PM +0200, Hans de Goede wrote:

> Does this mean that you are ok with me merging patch 1 + 2 through
> the drivers/platform/x86 tree ?

Yes.

--SQ3NCdbEKKY1NF3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFt89sACgkQJNaLcl1U
h9D77Af/XtiF5NvyxP333blY0iXME4zq1rD4DkpJluCocSzJLyILvVLQFTzOWftv
HyBDIvEKIBSZDll0aHHLjbeQkXHhq0GhQvSPZh0m2I5/CjFJbzBte/qh3Z1fYLth
nCKDxDDlILMjwCXpkr98CCzPPDu/iS6EdNX4tt4uS+IaVWaG7AD+PrarHI5FHe4t
DAQwiw6r32IIfws1C/TAiagkX6eZJc8d6OChzk23Yk5BMM5cR8i/ffUl4pVyCp9z
Ux4tGrnffE2DLf8RH/4i1734CqWI2syNdMLJEdcTNrDV6fysd64dgK0weWpzCIxo
02JYtfFDS9mSOnCR+6ud5RUETb07fg==
=TnDh
-----END PGP SIGNATURE-----

--SQ3NCdbEKKY1NF3R--
