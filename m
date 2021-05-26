Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E40103914EE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 12:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582461746;
	Wed, 26 May 2021 12:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582461746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622024980;
	bh=mVhY2zrOCTQ7rwrJSQSxXGaCaMx7JRKmVJUoE3G6wG4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fs2m6/U2388tTwuHt41yCsdPqMgUbvvd/fdr5uCThVKnajzxJ7CnBy+F/V5YsoxfH
	 tnwQZnGibD/9nAYcDXCD4fOo1klai9/8/VPDbIQa6tkkC244tc5x1T0NqMgutuFfqm
	 kwAvERnoQzY1fldyhrbZnX6sJkUcQRNADX2RZRgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88561F80260;
	Wed, 26 May 2021 12:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1021F8025C; Wed, 26 May 2021 12:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D84BF80212
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 12:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D84BF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kmeIv1LG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZwwLrwCegHrLx5GKTnmoyVo0Tv+Y7Dud5Ty5poKbYU=; b=kmeIv1LGbHDCxb8Mjo2hY0snwo
 sEDrTwLDila2cu+dT0o8E009Z2OaWRYWAKhZxQVPDmY9tB2h+FnTg0lOXCcRMGi00dnZXkrIhxc5k
 MrUSK5Y9EAAG97ePlsUdCfk0bcyo+J/zeadqYYEwmJ5Wi6JN5yRi3/XdGsqaKq4y6Viw=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llqla-005xcI-Qm; Wed, 26 May 2021 10:27:58 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 75837D00386; Wed, 26 May 2021 11:28:33 +0100 (BST)
Date: Wed, 26 May 2021 11:28:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Phillip Potter <phil@philpotter.co.uk>
Subject: Re: [PATCH AUTOSEL 5.10 30/62] ASoC: rt5645: add error checking to
 rt5645_probe function
Message-ID: <YK4i0e6M6lEIP6rj@sirena.org.uk>
References: <20210524144744.2497894-1-sashal@kernel.org>
 <20210524144744.2497894-30-sashal@kernel.org>
 <YK1w+H70aqLGDaDl@sirena.org.uk> <YK129caVtNBthNDG@equinox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cHefsDBJIH1f4L8H"
Content-Disposition: inline
In-Reply-To: <YK129caVtNBthNDG@equinox>
X-Cookie: Ahead warp factor one, Mr. Sulu.
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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


--cHefsDBJIH1f4L8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 25, 2021 at 11:15:17PM +0100, Phillip Potter wrote:
> On Tue, May 25, 2021 at 10:49:44PM +0100, Mark Brown wrote:

> > Now I've looked at the patch I don't think it's appropriate for
> > stable, it's essentially equivalent to a patch that adds -Werror

> So I frankly don't have the experience to disagree with you :-) Your
> reasoning certainly seems sound to me. My original motivation for the
> patch (after discussion with others within the mentorship process) was
> that some other sound SoC drivers do this, an example being the Ux500. I
> defer to the decision of the community as a whole of course, and am
> happy with whatever is decided.

Right, so there's multiple bits here - there's checking at all,
there's adding the checks to mainline and there's backporting
them to stable.  For stable we want to be fairly conservative
about what we're backporting since we want people to be able to
just update without worrying about things breaking on them so
something that increases the severity of existing checks is
particularly risky, if the code were already there and people
would've seen any issues it causes when integrating the kernel
it's a different story since the risks are different.

--cHefsDBJIH1f4L8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuIs0ACgkQJNaLcl1U
h9ANlgf/YvtO5pFfMXUqJYLeaHKLC1Xsohk8h5NtPTRN/fESqo0ZfEQdP/M2ejpN
7oDLiALRDp5c4f9ygaJT9QpG/EJE5WaGqUGXXxeVYzGPabt02h/vi0i5ezzAE2W4
sje35kkEZp+i/jWIhumEyaTi/agjBUMxKNvqMFi0iBxB0KMvU2sDAkIhOtWF+J6y
J8xSFDr2JX+S/6Ce/VPfsXk78gK6KIbTGC6m69Yztu/tmmyXFP0y61ZyoumBsLYo
7JU0tzNiF83jQ0WwqMJGtlTrqDTx/jQX7SE1J/edA9YxgkPPMGswTGTXb9Tstitn
+B7giMv5oQf05+amDyayED62WKtgHQ==
=Rqpb
-----END PGP SIGNATURE-----

--cHefsDBJIH1f4L8H--
