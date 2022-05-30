Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C08537E68
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 16:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4891F05;
	Mon, 30 May 2022 16:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4891F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653919775;
	bh=6yJwH0Qtege0fuuWHs7JPfABW5rmIkEq/jLLe+CmRzo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WvPJNgDavQHpZfbE/zDbiRKlGdqgj0DNCWX0Gx+WgPQTXNYlP+UVKB9tiaoW/2690
	 3O2nXA+Fz0DhoYZFaDuWy9MYgwH1zYz6oOzRI9qrT9d85crLRB5bRiETaThmF4flmr
	 WdEOggymh7uzr/F1WcqqiNToiF5Zw+mpiVcAE8Ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC0A5F800E5;
	Mon, 30 May 2022 16:08:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 349D7F8012F; Mon, 30 May 2022 16:08:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D84EBF800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 16:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D84EBF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r1f3GrY9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D037461164;
 Mon, 30 May 2022 14:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A30C385B8;
 Mon, 30 May 2022 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653919708;
 bh=6yJwH0Qtege0fuuWHs7JPfABW5rmIkEq/jLLe+CmRzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r1f3GrY9+U+HeLvwqqAKYP47U7iTcvJBrSMMllVaow2UUZ+KwaXx7nfmbYfSOY8Gm
 bYI+O9PH8zJG8ZpiPx8D+0f7PHTVLcZy8f1MvJSE69hEUj/DDwJNQJ220qZLXcc0TC
 4KI9PuOvrXZ+IFgYpITnyUsz5jPtJuOt+l3pYwijdU3Q4rU9D4DrkycjQY3I+SL482
 m9LWu9tnV0kW/K3g1hAwbwTvDJTA0Qu2LTE/Nm0XHhAWtjyFbhhAIY2evZMApO5XJp
 8oevlYAcegECpNW4jF3AuBUgIY1g2aoR0DCLR6B3nXsDQjrofMhc/Ob2AnpETV2/ym
 +I1MolQBkhjVg==
Date: Mon, 30 May 2022 16:08:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Raghu Bankapur <quic_rbankapu@quicinc.com>
Subject: Re: [PATCH V0 0/1] asoc: msm: use hashtable to check kcontrol
Message-ID: <YpTP2JOlCiYb3lBf@sirena.org.uk>
References: <cover.1653813866.git.quic_rbankapu@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aIU0NN+cmsmUm//m"
Content-Disposition: inline
In-Reply-To: <cover.1653813866.git.quic_rbankapu@quicinc.com>
X-Cookie: May your camel be as swift as the wind.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Krishna Jha <quic_kkishorj@quicinc.com>
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


--aIU0NN+cmsmUm//m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 29, 2022 at 02:20:08PM +0530, Raghu Bankapur wrote:
> use hashtabe instead of linear list to check kcontrol before
> adding them for improving early audio KPI.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--aIU0NN+cmsmUm//m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKUz9IACgkQJNaLcl1U
h9ChTQf/duQmG7wg4bgtA5ruZ3mBY8YxW6zE2kB6eqkK00oVcl8BC5+DLbJMf3JT
cRJrInl97+FLPrAe5+IsILEucvqReiz/Vh90tjpFYD4MP70CCyufAP5eSuyvWaw0
737IcMy/8iopHT07ME/Q4phDk016xu0G4Iz7AJOiW9ksELBo7RRvvE/HgtB1ePRM
EpWJzYamz2MYdWgWudkfEoEkHKIN+Lh/i7h+EmqoW1+cKqqzejVIBxkxi7C8ZAZT
CPKhmiamN/+xb9UlTTz1vOaswdNcr6/SJFVKNNCvubKzcMh1KTiYNuoHJVu9EWy/
b5Lx/nYA6OgE8CCdZ97av2i4n+CEng==
=ggfw
-----END PGP SIGNATURE-----

--aIU0NN+cmsmUm//m--
