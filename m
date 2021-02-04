Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD830F5E6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 16:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE211658;
	Thu,  4 Feb 2021 16:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE211658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612451646;
	bh=G4jmW1klxSDhuyqLVoj50N0KykhbrDTq8TJm7ElTHpY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNodxr6vdGFytRMtBVG8hfFaW57FjcOnUfwNVjKzjgFiBnIXYQTgt6ZARvdgzE5cA
	 lKZ6ehwcKVyvs8CuYwSPbs2EFy6nVt1U/nfhQ3jVxLZAJwmNZXDVjAhRSL8aKqKicA
	 rPH9yzflGO3rFxbNt32vgYafmTOdl4Ij9X7r9d8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1C47F80154;
	Thu,  4 Feb 2021 16:12:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4593F80171; Thu,  4 Feb 2021 16:12:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B255F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 16:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B255F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h1EODtEG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 584E964DF2;
 Thu,  4 Feb 2021 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612451548;
 bh=G4jmW1klxSDhuyqLVoj50N0KykhbrDTq8TJm7ElTHpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h1EODtEGbjMAIDkq072psv/urRdZPDKRVv6TZJAOxW+XAnE6Vb5Uwjt0aMx7AnstA
 j7n0VVxrsfX2rFgn0P1Sd/nf/wEvgGKKuTkXvEueJkjKh4fzyKlgzSH0n69EG1P04w
 KVO0UNXhRj6FebbVfYiUg69guvDqpmZ30p2Lq51rF7gu3rPePkdkqF7+b6C9zYST5C
 9wZsrVy08GhsDx0yLQGhmlB/N5p7clax1eIu41pfFnxZQldhFgD7wkCl2SQpblZdh4
 tDvRmUtzKwcHYSmqMmTlxHv8sGh+mhPkW6G8OoV0AP5GdwBxe4lmETKSS1tYj0tE3o
 BxGljiI5oxnYw==
Date: Thu, 4 Feb 2021 15:11:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210204151139.GE4288@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
 <20210204150456.GN2789116@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Oiv9uiLrevHtW1RS"
Content-Disposition: inline
In-Reply-To: <20210204150456.GN2789116@dell>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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


--Oiv9uiLrevHtW1RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 03:04:56PM +0000, Lee Jones wrote:
> On Thu, 04 Feb 2021, Mark Brown wrote:
> > On Thu, Feb 04, 2021 at 01:56:16PM +0000, Lee Jones wrote:

> > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>

> > > Applied, thanks.

> > While we we were just having a discussion about what to do about this
> > stuff...

> We were?

> This set has all the Acks we need to proceed.  What's blocking?

There's the subsystem maintainer...

--Oiv9uiLrevHtW1RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAcDqsACgkQJNaLcl1U
h9AqDgf/XzyTNV0AwXM8ECOYYqs8avg1zJ118ZJf4W3sf0LRQzsUidYaLfh7btT6
ax+t2Pm1s145XuvGeFEJFAx9UDaqWQRa7/WPGTveZmnPYgSHryMK8pmtWyc1STcY
iQKV0b/kLwUTn9V9Hu/jejpRl+a3N87j2hYIKK5Y3o+3wVjvFPj9FHSpdKFNvy0k
HKrV9GhZzMOHM30JfgBvAjNOoutBAhHe8agmQOcvK526XY3JBw6DctrG5vSXaj9q
w8yLcOmdv56laLX76e4dzXPCjGTqxlDop2MeyaNg3fmZ99kxLGumgMmNdggRU/xa
QPHYEKBU4bfMkXhTYk1yqct/Y4O5rA==
=1Vn6
-----END PGP SIGNATURE-----

--Oiv9uiLrevHtW1RS--
