Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617B32503D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 14:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980EC1687;
	Thu, 25 Feb 2021 14:17:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980EC1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614259097;
	bh=y4q7DSUGlBQUICw0FwSwYXtR63BB8Vic54PlMbyGgxk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ePE0YDbPVv7qR4QUeL8aUh3wAP3RnLVpxX/7oNxC0GYNe2bqTPsKz0RPOdJkIdhOr
	 0q+o7WAhovbLQSL8oCz7llBhmc7AbmLQDwQVGA6I/tRKJqTbX4sfkBKogJDZid7Cdu
	 mofvk0pes163lDe6wpLhJMNubhx8Q9XwgXMSdulI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3BEAF8016D;
	Thu, 25 Feb 2021 14:16:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CB61F8016A; Thu, 25 Feb 2021 14:16:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C449F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 14:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C449F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ulimUF6b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C13E564EC4;
 Thu, 25 Feb 2021 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614258997;
 bh=y4q7DSUGlBQUICw0FwSwYXtR63BB8Vic54PlMbyGgxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ulimUF6brK0QCnMrCWNDuFuqQZVnD54Ifk6Rc4FzYX3HfTBgIxS5OG4sgFEFm29x6
 dZUTU3/tRBWwbUJYD3MyBQ7N8iOsTlcln+m41OU6f2N6uLJk3Tk0MFlaFzRzUZZtWy
 qtNIBO+TkCKVp5gdhewL4/42fARp9Jp4wL1nMjVm+Q1q65//nh/C2mRkd73ZIykNV2
 VBNjGqrbq4LBHzYbbyESzqyFOLaT8+aN0sz+NPCpZSp1c5+VyuVmt3n9X487FUf+Ab
 kd86ffax9/jQDOhKSu66ZPxCr8k7npPDcS4ZZdNDySYrTNvYGhtYcHt2QjeKu4IYMC
 uolvmY4VgsVFA==
Date: Thu, 25 Feb 2021 13:15:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: simple-card: Add dummy dai support simple sound card
Message-ID: <20210225131533.GA5332@sirena.org.uk>
References: <1614254912-15746-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <1614254912-15746-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: A fool and his money are soon popular.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, stephan@gerhold.net, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 25, 2021 at 08:08:32PM +0800, Shengjiu Wang wrote:

> If sound card doesn't need specific codec device, just
> dummy codec is enough, then we can link the dummy component
> directly.

This is a big red flag - what circumstances are these?  If it's a simple
CODEC with no control then the general approach is to provide a driver
which announces the capabilities of the CODEC and can be bound to as
normal, the dummy component should never actively be used.

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA3ovUACgkQJNaLcl1U
h9B75Af/RM+n9PtBClq9XnVctQ5C+2rTjwsTw5SWRQpJKoGqV+BZ19XdE5atakxV
poNqc+zVttDIfzRisPmKrc+2d+YwqqlDoyeONNTcvvW2P8dxIRbchVAl9mOFlw8S
JYTsZKt7XeHC3oPJja6Zv0wOg8IazlKy8gVKIJwSc5SsRdZOmofZolKlLvuPwHss
q4iFWA5veqiV5cECEUAVbdGasY4kr0us/pXu/akJK/dL8MH15P6OyejrZgRCwYzf
8Y8B33i/n/H3iT3J4AFbnDumStuAHcYUVjWI2BzP44YCXFj3+657ODLb/FuFL7Fi
3bi/Uo7UlU7lRPxqteaOYji9ECZ9TA==
=gnCO
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
