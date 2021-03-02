Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F194C329EFA
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 13:43:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E10416E5;
	Tue,  2 Mar 2021 13:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E10416E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614689035;
	bh=404VFtbFRnA8is62cN5b0XgEfmn8auKn2t/xrEm3CxI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnxGGV9RHta1MxDAvmI3KxX3VtpfwRJG7qXk7Vu6Vc0hAhH5VEocFzaWx4v02IPaz
	 ONKI5NwyyIEMI4puRgu0wPreLEjyfPHJtrY8eh3bK8HZqxgkHFmJS+GcTLpW5mBlsf
	 /ITOh7ZTD3r4APAe8/iC9jULN9Ld5nEFS7GxJq+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC678F80271;
	Tue,  2 Mar 2021 13:42:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48F64F80269; Tue,  2 Mar 2021 13:42:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D996AF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 13:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D996AF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MYTXoLFZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2194361606;
 Tue,  2 Mar 2021 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614688936;
 bh=404VFtbFRnA8is62cN5b0XgEfmn8auKn2t/xrEm3CxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MYTXoLFZ0SyFYU8zJ1GEMveMZ/CHpoSGU/VTLLmMYjJBh/Dd0kF+5MWRN8421+ehm
 U0G0J0/e2k+lztuyHdYLeW24KRHbg9v0H0YhG3q9Gz/SVpgD2NnRSGEmKttWfFNfWc
 8s+gJCa/35LTxV/JdkSrgG8NSZBnh5puw0C1JH/1gJ/n/FQ1lFiWmjbwWk4Y7OE+EA
 kYuOTxC0/cadCuDPsO6hpv8hDfWZSC1U6Bx6byzlPVEiMOf4YvVV7IMOagX1RIs0ul
 qbGoObslSJd/6yfa2g4QCVOppcu4Tgo0Vi8yEDGwC5WBsM2xFpdm3kYkXHSORGDbBo
 iwnqWHWph3X1A==
Date: Tue, 2 Mar 2021 12:41:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
Message-ID: <20210302124110.GA4522@sirena.org.uk>
References: <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
 <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
 <20210301204313.GK4628@sirena.org.uk>
 <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 10:26:40PM +0100, Hans de Goede wrote:

> Mark, does this sound like an acceptable solution to you ?

Yes, I think this looks like a reasonable approach.

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+MmUACgkQJNaLcl1U
h9AUWwf/VyK6tHGy/XwZu3fOcdtN0811bGMm7MtsKdNs8zrfXuGaDckNhEW1hJDq
PXMPfvXtxGobvqE7OHszUt/qCb2sEVp59XAII0pDlL3SqtrFDtsUHSXc8IjMcTI+
u0+VLP+q42BqYBS8NG+c+25QnLMsmEpKv9n/aisET1T3DvOQqTBNUukvIe76LERT
z8pRg26LiNX/uXBDE99UE9QziZ/tv/sv3PX+Mam5RaxeglrP1GpPgqx4C+jJIzdb
ZLG5z04GN68tyI52wrWNEEI70cxxUm+43vSxpUjNX5c1Tr7CHL6/jhQrkwRjHacI
I647VLicm4aPVjiysvpyg27Vrn5Xww==
=cgGV
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
