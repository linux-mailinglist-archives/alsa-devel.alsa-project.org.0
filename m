Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7E9426E2B
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 17:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CF9168B;
	Fri,  8 Oct 2021 17:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CF9168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633708574;
	bh=nUWjT4wUb0IK0j6a8d3b/5OiGz04FfnKRAh3vVtwpIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afdeQi1hYFm1697Spi4owxnIjuCgzSjmbmGYm8v91zusxt9qQLuQ3eLZf0SU+sh26
	 TKCsNkEwoQPD1/o2tGW8SiykKqPzLXij6h8N9Jm5mK6SXF8Q2y1K/bc3zobOyfA/gq
	 VD68MR7IIpWqIybQsWiZgBA+F7DslMAPB7AEQdVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A606F80249;
	Fri,  8 Oct 2021 17:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E019EF80246; Fri,  8 Oct 2021 17:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20E58F80124
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 17:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20E58F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P9aCQhj2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10D806101A;
 Fri,  8 Oct 2021 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633708489;
 bh=nUWjT4wUb0IK0j6a8d3b/5OiGz04FfnKRAh3vVtwpIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P9aCQhj2Kcov64hnXreigpScydYtI6S31x0s8NpE/mAR8bK9UwPxQ7YEaJLcNSMA/
 UlCcFixk6PEN7WOSHdhOUG+0nxpf2LMoi1XB68FUWOIlrlIn4XdSwH4ecaxxBde2yy
 NTTl5YVsq0wCmPhS32tAQesRdgIu6sMpk6CdWikBgvjDdtpu5flylMEbQttrADA5Np
 5vgb+fHqWNKzixQKu/5qvq4041IoniubDWWVffWWuEbHjKdJ8yURNL0BJD48Cp+upo
 W1pQiS/ejphaljEDxxEb+X5puhFEYE49qAz6egs/LoX/Fy/EjTTWOiSqrILUBjiGkD
 ew/aM7LeP9okQ==
Date: Fri, 8 Oct 2021 16:54:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH 0/8] ASoC: Add common modules support for ACP hw block
Message-ID: <YWBpxkYPkaT1mwR8@sirena.org.uk>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4q9YnXvcXFOxpy5S"
Content-Disposition: inline
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
X-Cookie: When your memory goes, forget it!
Cc: Alexander.Deucher@amd.com, alsa-devel@alsa-project.org,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com
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


--4q9YnXvcXFOxpy5S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2021 at 06:54:10PM +0530, Ajit Kumar Pandey wrote:

> We need to support I2S audio on various different platforms SOC in near
> future. At present we are creating new folder under soc/amd/ for each
> platforms support with separate I2S and DMA device modules across each
> SOC. Actually AMD's audio coprocessor block commonly known as ACP hw IP

This seems basically fine - I do think you're likely to run into
issues going forward if you get much more board/device variation
but only one trivial issue with not using a GPL symbol export
that really needs looking at now, otherwise it looks good for
merging.

--4q9YnXvcXFOxpy5S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgacYACgkQJNaLcl1U
h9AZ4Af/dbAiL+q+WzKfZTK7FRI7OpVBpbfHIvQ0jF6l1gBb49I5VS7YvijlcWM3
E31oqpkyI6W6tVnDbeSGe37CGcjfAS900KB/3kZlTiswbopodBivHLAyk8p3THtJ
3IqIfA6+t7SAy1CyaZl67G9wuzcHZCW4mOKUF7vkCvH5yczP33Js4T/OYQaocdDs
BIbSPRI76L88I7Dd6eCxRAIrdtr4Uh9dVVqBoWhwj+ajf53KihSa6y2FjK+62zDb
RepZ6zqzXYhJUPaNiPYngku4TN1fMXlIwfpqaoABe/zhjD+VSFuKUJ0TflnkT6g7
4hoy+lAeI9bkv/rN3+hufE3AhMwO2g==
=4Gmo
-----END PGP SIGNATURE-----

--4q9YnXvcXFOxpy5S--
