Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CA232EFDF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 17:18:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E92179C;
	Fri,  5 Mar 2021 17:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E92179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614961082;
	bh=1xu77uD+VXVlvtpoK3zEEVQfMpVBOXWIwT1Mr8w3PfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1sahOAQlqdVOePVzR1vF7/ys6hd/zNhHgQViJCsH6qEPi5xIDL4OtTGf/vreW3Ho
	 Vsz7GWHJifWKhoEQ+ed28BCssNttZMdRUtMvhfrEUyenzMK6JHqaM06SyU4VFxkCwH
	 lJFFVwjHsQHJG2bgKNjJiY7LN3gQVJApFdssftxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF257F8026A;
	Fri,  5 Mar 2021 17:16:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C86EF8025E; Fri,  5 Mar 2021 17:16:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC4A5F800ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 17:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4A5F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oDRuis/P"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4B886508D;
 Fri,  5 Mar 2021 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614960978;
 bh=1xu77uD+VXVlvtpoK3zEEVQfMpVBOXWIwT1Mr8w3PfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oDRuis/Prdh8zclDMHjFE+wphzbOvt6ntWuuOlx6UUJ1ql6q0MCZFdNn6L9s48ndM
 sCqExwwyipreRYJyNMouWAIjlLr1oNZKBlhmzcwQDRxc92tSely8fcxL81VxwfLB9d
 8Da0kEZLcGjlaU8IZbgkz65Bn/EDk8nptPMNf4iBtklRxmIJdohkhjqqXzvX8xuM+h
 7/RJmPmBVILGAaO1ZEyEFJVdQDQJv6pvx+3PJlp6Z9LqNxPqPEwSzRj4oTIzhjIjXH
 N3e5DG+y6Owpbdx66DddL6d/wRVZNxzigED7dTSZ3Ei3M+ZDKLs8ZTCbUc4VdjYmwJ
 U0Ss+lJRqIQiQ==
Date: Fri, 5 Mar 2021 16:15:09 +0000
From: Mark Brown <broonie@kernel.org>
To: b_lkasam@codeaurora.org
Subject: Re: [PATCH V1] Add debug print in soc-dapm
Message-ID: <20210305161509.GB4552@sirena.org.uk>
References: <1614927242-19251-1-git-send-email-lkasam@codeaurora.org>
 <20210305095943.GA4552@sirena.org.uk>
 <3511da77c7cc3fa03837dbf9cb03b1c6@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <3511da77c7cc3fa03837dbf9cb03b1c6@codeaurora.org>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Laxminath Kasam <lkasam@codeaurora.org>, alsa-devel@alsa-project.org,
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


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 05, 2021 at 08:07:19PM +0530, b_lkasam@codeaurora.org wrote:
> On 2021-03-05 15:29, Mark Brown wrote:

> > this if you like?  I can see that the separate tracepoint would be
> > useful, I mostly use the regmap tracepoints for that purpose but not
> > every widget has register I/O.  Tracepoints are less noisy for the
> > system as a whole than tracing every DAPM operation in dmesg, that tends
> > to irritate other users if it's left in as standard.

> Thanks Mark for the response. But this is not default err/info print and
> only dynamic debug print which should not result in noise. In case of
> customer OEMs/final product versions where less options of debugging,
> dynamic dmesg logging is preferable provided faster and this print is used
> to identify issues debug fastly sometimes.

This is precisely the use case tracepoints were added for and I know
that they are being succesfully used in the development of major mobile
handsets.  They are very low overhead, you can even leave them recording
in production usage without getting in anyone's way, and they're also
simple to flip on and off at runtime. =20

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBCWQwACgkQJNaLcl1U
h9D+Lwf8CfV40VepKi5yyNLvLoj3F1TQLeI1XogmcmHCOGO/U397AUUAtgU96S9C
U3pcxVBd/9qDaqjabGYop5EH4wG01nrShI44H6kvu7ytFbbyXsxTG2wUb+3xX6ZE
z1AiJ0J8TWmPSu5ISx/wag68hUUT/pVwhYkmkBq9K69fEdXJzL1rocuEVDqYxx0d
uhbvXLBh3ZOz3TbmvJlc6C4HFN7+PIQpsZiIT9OlKGZ92hGRQ0gwxqOc8Igv3BW5
2G2FrIWtOY/KTRvpanulcVrJ+iF1glePjMgDLem7huX3cEy19H0eQnTlyZasCeRE
mSGKmKbK+3jvxWhsUvap0zj0F+ezKg==
=BVpe
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
