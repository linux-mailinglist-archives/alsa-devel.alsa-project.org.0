Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3B5FD9E9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 15:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41155B03;
	Thu, 13 Oct 2022 15:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41155B03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665666432;
	bh=JHAw2W7prYpOOgCccUOYji7QcBQLE5R+0+cCc0zhULY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eS+qaSMTqHNvm3tSTY3+FAoqcdGMVfQNKWn2cPr0HHnI5VGY2/bP4KDLdSXf6Wiwc
	 qTudSjJvhjGo8XSfRW++X882um/1r9YRJF8w3W+65CdAKsMiP3goRTlVOzzEIbcJtt
	 B01bwRbluzMqCHc5g3udbXMc7He8L/KSa3VFVEnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68885F80115;
	Thu, 13 Oct 2022 15:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6498FF80269; Thu, 13 Oct 2022 15:06:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47A33F80115
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 15:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47A33F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uStcIrFq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54389B81E23;
 Thu, 13 Oct 2022 13:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B706C433D6;
 Thu, 13 Oct 2022 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665666367;
 bh=JHAw2W7prYpOOgCccUOYji7QcBQLE5R+0+cCc0zhULY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uStcIrFqZDyUctkzYCTRX6VjcmLA682Ex50GQLamZqei2XpT3BV9rInyEAfAFcay0
 NCcBfJqru0qoAu7fUzgTACNygIQkaEEQ2e1r6KbmpUfngdy1R/wPnjyqrAwSEu8YOi
 r0a8shHWYfrMDPQpAuMokkuWOqQO3/7kvWcw/IaTtnhHbMytyhVYF7Qw+R2xgbDY82
 XD8CeR+9HUV4G8/uuc7f27QKoj8AgrhL+ua+fTO45WOpRyZPxn5t3c0jS4HJeAx8sp
 iv1lxCWMCLatC11zy0tZHdarIbJV0k3PpuE0Ce6gOCZpXxIFcuJZIcdkIvCePlDydF
 2alM4N0xle84w==
Date: Thu, 13 Oct 2022 14:05:59 +0100
From: Mark Brown <broonie@kernel.org>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Add Richtek RT5512 Speaker Amp Driver
Message-ID: <Y0gNN/HB53ISvwI3@sirena.org.uk>
References: <20221013080643.6509-1-richtek.jeff.chang@gmail.com>
 <Y0f98d0A04f8dzQV@sirena.org.uk>
 <f84e2722-ca56-8440-a5af-550080bd1f8f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1DqoBQP/S/2TsyJM"
Content-Disposition: inline
In-Reply-To: <f84e2722-ca56-8440-a5af-550080bd1f8f@linux.intel.com>
X-Cookie: Do you like "TENDER VITTLES"?
Cc: jeff_chang@ricthek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Jeff Chang <richtek.jeff.chang@gmail.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Jeff <jeff_chang@richtek.com>
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


--1DqoBQP/S/2TsyJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2022 at 08:46:26PM +0800, Liao, Bard wrote:
>=20
> On 10/13/2022 8:00 PM, Mark Brown wrote:
> > On Thu, Oct 13, 2022 at 04:06:43PM +0800, Jeff Chang wrote:
> >=20
> > > +config SND_SOC_RT5512
> > > +	tristate "Mediatek RT5512 speaker amplifier"
> > Looks like there's some Richtek/Mediatek branding confusion with this -
> > it's a bit unclear.  It's all the same company in the end I guess so it
> > doesn't matter.

> Interesting, the naming of RT5512 looks like a Realtek codec. ^^

Yeah, exactly.

--1DqoBQP/S/2TsyJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNIDTcACgkQJNaLcl1U
h9C8ZQf/Wg+lRkhpkE6ejB/Grl8dHwI6yoskSk9Bxa3ybD4gTRzJxgl4h63BBm+q
yiY0Npm/r59c8/nAiVucxEQBzNYqZ3jVuS/XIRkZYlDl0FJtwnqmYwOkFu4r37Rq
5eP6UG6xxBhQOovHRd0Von68ofEKC0UIqFogaqQeivNrCZFJ5URcOzZ9eeMFbs5y
bdejtGzvggeS5I+sUfw9Uja8I9eMQxn9phHeLObzwQmJVScbAjGwor5tf9pbm7G0
qyYOAaGVyBcRMQHPg8CFiLXjy1Vl4GcOhGzVgX8B9plEVx3uuVxSx6N3dkV18gS0
gcVZu5wqfcejMC6IPyfjc0bt/UYU1Q==
=ACP+
-----END PGP SIGNATURE-----

--1DqoBQP/S/2TsyJM--
