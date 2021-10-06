Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847AB4241D2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4B0827;
	Wed,  6 Oct 2021 17:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4B0827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633535426;
	bh=47gQvTqBUwVekDVQzpGg9z1YxiQhRhuibQ0ZZS8DDms=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=er8T+vhiw6KYhpJiritI5s5FTGEUSmxS01lljCY48cCuV6fKAPb414wdJRZyXPftf
	 mXhVFOzwKTH8WD5KDlae6GCAwpnH3Rl6n1X0EJL49i+rsBSiM6teqA97qSkvLdNKST
	 XggFbUNkxIxq9/ykWT/1BzA71R4t/fcei5uVEdxw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E6EF800FE;
	Wed,  6 Oct 2021 17:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43818F80240; Wed,  6 Oct 2021 17:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 958C7F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 958C7F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GROolJw0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0876561058;
 Wed,  6 Oct 2021 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633535339;
 bh=47gQvTqBUwVekDVQzpGg9z1YxiQhRhuibQ0ZZS8DDms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GROolJw06y0WPU8RbKw/7NqgAV4KoLfBV8lLaFc2FmLRCleim5MTMGzrKWQZg1AEi
 SGri5CduGoeqDIboZo6Nj2+jYGQBQ0cu8GyZktrgzSPI9ShBDDzdXoKYOK7j5ZUGta
 mDo3x7hZjst4piPdrrZFrs0QYmnrKe8MkfQHHmbMCHj+MmT3qnAFZPGAvho2smR87S
 AZ1wtSI5j27Oj8y/xLh6a5VeD7D+pnqUwT76guGybO4bAmcO4hL9gbJBEsDZhoNegh
 7Z9SKrmP3oDzBjACsjGrIFvNECLgfVQgAUPYg6vODyxs9F25tSS3Mj0jIsrR0gnpMd
 mDJeRcfhSPXng==
Date: Wed, 6 Oct 2021 16:48:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/4] ASoC: Intel: bytcr_rt5640: Use temporary variable
 for struct device
Message-ID: <YV3FaZ+afuZZSIth@sirena.org.uk>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
 <20211006150442.16503-2-andriy.shevchenko@linux.intel.com>
 <4b81a10dca78e286a9f806464b97111b5a15a91e.camel@perches.com>
 <YV3ER4uIL4aRWBjz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kyawfiakXrTSOOdd"
Content-Disposition: inline
In-Reply-To: <YV3ER4uIL4aRWBjz@smile.fi.intel.com>
X-Cookie: A is for Apple.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Joe Perches <joe@perches.com>
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


--kyawfiakXrTSOOdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 06:44:07PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 06, 2021 at 08:21:01AM -0700, Joe Perches wrote:

> > Some will complain about a lack of commit message.

> Yeah, sorry for that, it wasn't deliberate. I forgot to run `git msg-filter`
> on these three patches to add it.

> Mark, do you want me resend entire bunch(es) or just starting from these
> patches? Or...?

If you're adding a commit message with automation it's probably not
adding any value.

--kyawfiakXrTSOOdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFdxWgACgkQJNaLcl1U
h9Dj6Qf/d4hZFf/MYBhKCyGf2BxUJWrfHkBWX9kcLxCJmVG5Yz2jw9oBQKgq7pZM
pYF4EntfZ2RDTGY7/aV7ZmrG8Wk3gYHgaZSzjTYR2KcldtFHTo0VikUbSvArp5HB
gPpP2BpyO4k8+O8aNjeGAjKcQ1jBd+Buezd9jELU/IAdoeuJVMkfeI9Fkd/7IzzM
4gJw6b++c9IuaZ1m1Gz33cB6qkSqfiinWcd6sO6wOzJ9gcnYrZBHtKQwsvkf5iZe
vP7YN9Yl9yR9ngyPUGegbrk9OX9mUOWUkM0t1Z9SoWrZgq9VoUJ+QWYENo0gkt19
qqIuupXs2MN80/oJeD21JGRJlOIZNA==
=MIjN
-----END PGP SIGNATURE-----

--kyawfiakXrTSOOdd--
