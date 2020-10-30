Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8522A066B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 14:27:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 045F31657;
	Fri, 30 Oct 2020 14:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 045F31657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604064461;
	bh=P+jMGvjIJHiVTFEarHqp4FfED29smo6QZPjm7uy1/Xw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DsBAUm0doz5C1HNrnsKp12m9NKSWE4yzrNTNG0ok47jxL9vtAdGgWbSDzT6PC9DEH
	 pPy5YWze0TzelD9HyEjyEKuL/TFXm/2tGqEJrsSawk6Ty0P85iRqRZ4tgJi+cjo21z
	 9D1CpnBikrYJ3jykRPB9WZ8CqXLiDlqX3wvYjRwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B46F800C0;
	Fri, 30 Oct 2020 14:26:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3901DF80212; Fri, 30 Oct 2020 14:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3763F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 14:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3763F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X9vV0qbH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B6D62075E;
 Fri, 30 Oct 2020 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604064355;
 bh=P+jMGvjIJHiVTFEarHqp4FfED29smo6QZPjm7uy1/Xw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X9vV0qbHAYMvtPjepkL9QkT37wNdnBJNdHsPZ6e3RAt3M+4F2noobRG0upqXnPJpe
 yCd7HL6gKy6rHIHTxgbF+XEFW9agJSeNGuV4zGdRS8qHpwjSymoj6kr57Z5rzR7NDI
 P586PLKJAiVhFTwSaM4jJ1USAroxja7uELkvX/vY=
Date: Fri, 30 Oct 2020 13:25:48 +0000
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
Message-ID: <20201030132548.GB4405@sirena.org.uk>
References: <20201030050146.535983-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
In-Reply-To: <20201030050146.535983-1-CTLIN0@nuvoton.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: WTLI@nuvoton.com, YHCHuang@nuvoton.com, alsa-devel@alsa-project.org,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com
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


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2020 at 01:01:48PM +0800, David Lin wrote:
> Add codec driver for Nuvoton NAU8315.

This has still got issues - it looks like all the tabs in the patch have
been replaced by spaces, that's going to make it impossible for any of
the tools to handle.  I'm not sure how your colleagues handled this,
another approach some people use is to send from a non-work account and
bypass all the issues with corporate mail servers :/

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cFFsACgkQJNaLcl1U
h9AvNQf/dcw7V9i1/r9FH2iqgaNto1mzvgH6WG8RIkgU55pstQKJRb3PV2dkPmi5
fLQwtGP6XoCrAAVjUx/OCcCb9ZdHyrofZvpjlgOqisgy/Cr6movk3JgDujrUNl7U
HRbkmHbTC2SWb1wiau1+WFliT4gzHAK2rp5A2zafm+TO5k7mCmMRUfMJdDDyYKZd
ziZPvsYh/ptfsTjawwdWbRLh5cJ26YaQFwL7+QzGZYUB+7X4zeWIJsiHSijn2WFu
kwXWqKx8WzDGkRhkblRjoWTbmAZNQoG2KFqGosJZw9zNpc9sUNcAvuqIVQxZ+xnD
g5/aDi8py6qhJGLYwduMkC6q7mD3eg==
=7dME
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
