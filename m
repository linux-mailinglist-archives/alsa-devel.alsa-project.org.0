Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5513432A82E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:32:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBA6718DE;
	Tue,  2 Mar 2021 18:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBA6718DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614706346;
	bh=hoZukWnMn5P2+DYts201SNfUf0kubqe2JwQjXk7SHNM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0t/p7N7Rd9ip5D/eStddKCLExfYnUENv2D40LOgat49zf3seoeIoXWMDbUZ0Srrr
	 OPJxbtcV7t6WWu4mNAhr3Sbbo6H1pugV01luf/7WbqvsuAZcUrT7BORpmTk3KVSlhJ
	 DLSUOFokQ8wEZ7jX0+HMTtLxlzHzcLejgvYYnns4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B52F0F8025B;
	Tue,  2 Mar 2021 18:31:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B88DF80273; Tue,  2 Mar 2021 18:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99493F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:31:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99493F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aUir//Fc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4922464F39;
 Tue,  2 Mar 2021 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614706283;
 bh=hoZukWnMn5P2+DYts201SNfUf0kubqe2JwQjXk7SHNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aUir//FcGSs39Nv3Rp4LUGdCTv89+9h8FfKp8fC4+Ljn0VUwQaN60XIlOPhVBcIF4
 s5bAiXdplkfzg1er9edBe7nx3IVnv2HhbgIbZX4qVD6Ja1BCQKo/X+oBwPhbA3XFkJ
 xv/u2A2rZLB2oN9SJ+Ln85XRnCY+iDpBiZrDwnVokFLElZB8PSI0AB763E7XtJnyp6
 z7UOOAln4KwWjPRYLkcoK6mu0/BdwqcK7nKAT5gb6GwpsQEwOYRpAPPRPFdU6vgRiB
 Jxr4QPMs2QRhAXnGTFDBOZ1lQmRrLQ1+GTjjAk7TK6skaWrMab1n9+j/Rm61R9+yDX
 uqnbS+6OKLxBA==
Date: Tue, 2 Mar 2021 17:30:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 12/15] ASoC: cs42l42: Wait at least 150us after writing
 SCLK_PRESENT
Message-ID: <20210302173016.GS4522@sirena.org.uk>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
 <20210302170454.39679-13-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wxIXENaY2CYUgF8u"
Content-Disposition: inline
In-Reply-To: <20210302170454.39679-13-tanureal@opensource.cirrus.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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


--wxIXENaY2CYUgF8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 05:04:51PM +0000, Lucas Tanure wrote:

> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--wxIXENaY2CYUgF8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+digACgkQJNaLcl1U
h9DIbAf7BzToJ3kMO/GE8IhugTbrm92iabuHBXSvcba6ri2+NLWKAx6lzxVid1c7
DueM+3myvUwP7Ps01gziJv6ZWt+xFHFgBL1R9risA00w1oxeN/pnU2X6NKVQIcc7
CNKvkDLSyw/8uWTFh3dXae82l1WXuOkUdYAjTXvPwu+GsB3maCXjmv6GVMc6XNwt
lCCtjcUds4wMlgameb/n4fi9KwtBGOcHCZhy9MXdgZdE2dnPTNhyQ5jlQHAPRdX0
6PeBgmWifkXJ2u939VLQ2QoYHASmvHMyJwj8YKTVTe8n+P5nmqloA4QP+ZByOdRC
cSMi41OQ2ZhVXWb4AJAb5NHblHKZnA==
=WxeY
-----END PGP SIGNATURE-----

--wxIXENaY2CYUgF8u--
