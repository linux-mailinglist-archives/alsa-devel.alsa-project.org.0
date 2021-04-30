Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F79D36F935
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 13:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E97C81687;
	Fri, 30 Apr 2021 13:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E97C81687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619781930;
	bh=X+CDJhE8KfboV+3/jr0bHess9R7lNxucFQ1ERm6TnLs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=niTrC3twfqDlRIRMJDXqiV9DcZWgT52rCCrpfdcE7HYro7PS9vVbUtUvUAeqyH0HG
	 ZQdbJ6ImVWYT2waArIPfWmSYlwob3W+kNJT2NFk9K/ar+2WEyK5hFQRan2IrtLYfi8
	 e2GBIbQbEHkLwFBPV8Xw8Rp406xb/WuVdYuPL7hE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51401F8012B;
	Fri, 30 Apr 2021 13:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678BCF8016C; Fri, 30 Apr 2021 13:23:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B2FF800D3
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 13:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B2FF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XG6EX9X7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ECE261458;
 Fri, 30 Apr 2021 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619781831;
 bh=X+CDJhE8KfboV+3/jr0bHess9R7lNxucFQ1ERm6TnLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XG6EX9X7TZi4D5vnQLpE7gW4B0aJD7CxwgzqwLdHGo+ahuEHLDNddejZb6UQhx5YF
 VdxLJewb6a9DvT2h8n3ctq6pBTR2wghrUDZ9kbsIAyX1rqHI0m6pyk1umsb5/NtBhx
 3d3LmQNfio1O1OCVamZI57hpa0kX3C8b6TZ0waHurlbnaC8/pzR77x35CwPVVor1Vh
 b2cBeX/Z6Ejocrgnohm1lyz0HJyFzTzDA/BQ4E6VZbhYGR9nhbIjTFToFJyRjbkMtC
 spXCXIwue2Fq0naix4mawTqgzEvrI3TPPxWz+04bmlvtepuYdkMFGhPpB80ky3y0G+
 IwfjLB/PvI1fQ==
Date: Fri, 30 Apr 2021 12:23:19 +0100
From: Mark Brown <broonie@kernel.org>
To: trix@redhat.com
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: make sure array index is
 set
Message-ID: <20210430112319.GB5981@sirena.org.uk>
References: <20210429173642.3230615-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Content-Disposition: inline
In-Reply-To: <20210429173642.3230615-1-trix@redhat.com>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 29, 2021 at 10:36:42AM -0700, trix@redhat.com wrote:

> The happens because 'ec_tx' is never initialized and there is
> no default in the switch statement that sets ec_tx.  Because there
> are only two cases for the switch, convert it to an if-else.

Add a default case that errors, that way if someone adds a new option
things are less painful.

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCL6KcACgkQJNaLcl1U
h9CHXQf/cWdl/E0EgzkmkslN9kdNSVSNk0J8PaNu6KP5kS0/hGhz2SxN0xkAxKQB
9gC0od5C5pSH3EnOu6YVt69YsNaZg0M3bZQYPA0UU4ePNI7zeCu1kgzudggcymvQ
QFaG6zyxP856E+Mak2llLI1WbuB/AGv54CPOwUHCy2WSsJMYs5WyoTruNEwVpmsl
S4O//D9Vz6+EqPhPCEaRJlCeZunhUAcCSuDgEv1Kob85SAsfz/G9r2GLylIME2pH
kYy9iQ2sYkEyVnGss+vb2nxW47s2x6d0BuATY7cS8/oI7xDa0GFKDqV4rhTuFRLc
6nEN0mBEPz139jjDvDLmJVaWUN04TA==
=9LpP
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
