Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D830F5D9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 16:11:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 190801693;
	Thu,  4 Feb 2021 16:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 190801693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612451495;
	bh=7BSaK+ZjIjpF5DSdO5dB49yuTQ484kyKnlv7VuEFaec=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fo7ntoyxjGHvIsem/4agnJbZaIFzn+/UCp4x3jd7inC2hrD8qEvkuGPRHYCDQcaRe
	 xzvfhGbWuYRttL9/w0u5SIGJJZFplB9GoZnkiXED9L9lMVgTbf8uCt7o5kBR9DUKJy
	 B3GKtIAkWktULQz8tUZkBN7jWF/cdTcHEMZXy69o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79376F80154;
	Thu,  4 Feb 2021 16:10:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6ABEF80154; Thu,  4 Feb 2021 16:10:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56BF9F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 16:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BF9F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="laHm4bRm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B1F664F43;
 Thu,  4 Feb 2021 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612451394;
 bh=7BSaK+ZjIjpF5DSdO5dB49yuTQ484kyKnlv7VuEFaec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=laHm4bRmvrJPYpkgTiWfZ/xHuz8b/6RAlI/QbuAn8MH9IrrGeM/CQSX8Q3wceniXw
 FRvkTjp3kg+0uwyvSeFOpCGPJC0hTh5wkjhc+kxFLZVkRXz10vptQ7oBOjKgzFgh3J
 9NLmdWdsqJY3dB04c1JOPPtqwnj3AqxRB6zpX1zdKpwcfxgGAuU2aan84JPMpWfDVE
 tII+z0gKG3+mPI/vlH1yKbKFf5A2WWk8y5As6mPS6D4cNti+61He5S7qqkr+DY39Qv
 UJzxkOLuwLZd7u8TXDiJQAV0LWp1AneJ+eRxmRLbU/VPGHg6LJaKvtUH0nlttdIjhh
 2DIII7KjpLb4A==
Date: Thu, 4 Feb 2021 15:09:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Message-ID: <20210204150904.GD4288@sirena.org.uk>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
 <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
 <20210204124335.GA4288@sirena.org.uk>
 <20210204134606.GH2789116@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
In-Reply-To: <20210204134606.GH2789116@dell>
X-Cookie: Truth can wait
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2021 at 01:46:06PM +0000, Lee Jones wrote:
> On Thu, 04 Feb 2021, Mark Brown wrote:

> > The usual pattern here is that the MFD patches get merged and then I
> > pull a shared branch in for any dependencies - at this point the series
> > is now on the backlog of serieses where I'm waiting for the MFD to sort
> > itself out before I really look at it again.

> I tend to push patches awaiting Acks to the back of the queue.

> Stalemate.

I'm only going to ack things if I expect to see them applied via another
tree, that's generally what an ack means from a maintainer.  Especially
with ASoC where we keep on having subsystem wide changes quite often I'm
not likely to do that for things like new drivers unless it's very clear
what the timelines are.

It would be enormously helpful to get the bits of the core MFDs that
create dependencies committed while the rest of the series is still in
process, as well as allowing things to be applied it also helps with
knowing if the dependencies are stable.

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAcDg8ACgkQJNaLcl1U
h9DAUAf9HROtNJ38LsxGRnoLdtz5m9eyu/zq4B961taC1T6LQlGBOqTIF1MlCVyf
8M5rdGI3N3kYlBTOvMspE0E34KWOA9IWE5CreCl9xxcZiNm0kLQtJtN3dmVBVESX
90LWORwSt7+ezT4SvMZCL7wBe13BCjQJORYfGKJxsm+rA2qNIiyijfnVOa52tyVQ
s/LbwZduYcSQXQxv24xgYhwOujAARjOxBlxhp+MedmeDWOzSWwflGyD9urxhjKiE
0+oP8NRzbv+/LCyCPKKoqbWGGQx05ce5VUCgHLIehczCfX7p/kR0QekpUBYx2rCL
1OWHZgvIArbJD/MpWfiqfcPUEgZVvA==
=prQV
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
