Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26923E8FEE
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 13:58:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7148B174B;
	Wed, 11 Aug 2021 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7148B174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628683114;
	bh=x6GpUTuyq1LGQnUrhcBnUA32Z1gHDW6QU3OP9zxLmrI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ze35rzG7qF1rWHm4D1ti2BHcI1vKEWaCM+yAO04+DTl55va+KPCGSQr9j/q9nVNAm
	 kdd7iO8I9ytvbVglCsEGjjlgA79OULG/1xfH1oEMlKaZ3dFkJQhps6N0pfiRldHZl3
	 AfkbTNs/wiRgszQ7vacCa+aGK+Vg2Kzew+kXX0S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B011FF8032D;
	Wed, 11 Aug 2021 13:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F2B3F802D2; Wed, 11 Aug 2021 13:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C23B1F800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 13:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23B1F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MbsZr2aH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF27D60E93;
 Wed, 11 Aug 2021 11:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628683016;
 bh=x6GpUTuyq1LGQnUrhcBnUA32Z1gHDW6QU3OP9zxLmrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MbsZr2aHkFyDggkWVCAxMFQoJ0H/YdqGxFz8hLuNqG40BmJ8ePLhoy05XuYRnQlsW
 m15bbt3BzujEC4tXt6uWPf5ru66opPYSt9UA39ss95l80enILnnNQ66GU5n9e18svh
 71b29xnyS38hQJFW/l6bAY2Qbir7gIXT/w7oD0Z2JA7d7fK3v9MPWGaqjR3omW9W7f
 OOEvAmNrNX4uGNjPu94TZnhrCqjnXjirBop+XVUNH6YkDQMaYxzK2VK75DxoLAvCgB
 qJnVmPpiCOr1oBxvqDDOX5VBoy4H23fNzB/wOLjUWDi6uksjD4arvQ3sjV1dECWfbW
 a4gQ9O0LsTT8g==
Date: Wed, 11 Aug 2021 12:56:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 04/12] ASoC: cs42l42: Don't reconfigure the PLL while it
 is running
Message-ID: <20210811115637.GA4167@sirena.org.uk>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
 <20210810153759.24333-5-rf@opensource.cirrus.com>
 <20210810154959.GD4704@sirena.org.uk>
 <c194004a-2a22-5354-9042-3ce811236319@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <c194004a-2a22-5354-9042-3ce811236319@opensource.cirrus.com>
X-Cookie: To stay youthful, stay useful.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2021 at 05:27:45PM +0100, Richard Fitzgerald wrote:
> On 10/08/2021 16:49, Mark Brown wrote:

> > Shouldn't the PLL code be noticing problematic attempts to reconfigure
> > the PLL while it's active rather than the individual callers?

> It's wrong for a hw_params() for one stream to try to configure the PLL
> when the other stream has already called hw_params(), configured the PLL
> and started it. E.g. if you started a PLAYBACK, configured and
> started everything, then got another hw_params() for the CAPTURE.

> cs42l42_pll_config() could check whether it is already running and skip
> configuration in that case, but that seems to me a rather opaque
> implementation. In my opinion this doesn't really fall into the case of
> ignoring-bad-stuff-to-be-helpful (like free() accepting a NULL).

This doesn't treat the situation as an error though, it just ignores it,
and there's nothing to stop _pll_config() generating a warning if that
makes sense.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmETuvQACgkQJNaLcl1U
h9C7vwf/bk/AHt269vqKFlZ433279l7SHMz5PTCd2YccnwCotrFWmbrqCERd7d8t
lCOOnpLPu1iUoQbEj5ES+tPD28v+oHrTnGDapFXnHqKpNRURwubqH3KcI09eTVNp
+hAEVYE0EXS3Q8yYIZVDIGrWX8hcAAHNeANj+mpCcZayyKRcYEGWQIFBJ96q3L5/
5XOvRetZGTePrMOlUYH162rUJZddP0ODxg2wMKLL+XxJwaG/7fxMqfJXKlwcqaYQ
8seroVXuCzOv4HlTJTlU45/dLc6McEmMWxKqnw86Hb6AUSIgQEJMlHywyFcTlyCx
q1P85hj5vCjKMqnTlcEXxO7/kDFRow==
=PgIx
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
