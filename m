Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A081B48D890
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 14:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 399DB1F4E;
	Thu, 13 Jan 2022 14:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 399DB1F4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642079604;
	bh=2qvMuUV8xfEe/5wzrqkoaNS5i0r0zXsqKgJabBS1sHA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b10IRrk3PygG7pIA9rSZPdIVxsqgmqHJxacRsJcTRMKcW1HL1h5TxwL8q+BM60eEa
	 lUI5rRLB8DCvpthsPccEsaz1ugy9/EF9n4G4i6fwsxtg1N2MEA0PykW4BuxojxuR04
	 iGownZKGfffvzJNq9z1UDt0lUTuKrxBUKVxbTmcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B44D8F80054;
	Thu, 13 Jan 2022 14:12:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63E6DF8013F; Thu, 13 Jan 2022 14:12:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD0BF800B9
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 14:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD0BF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R+o00Tub"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D755A616C9;
 Thu, 13 Jan 2022 13:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51869C36AE3;
 Thu, 13 Jan 2022 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642079523;
 bh=2qvMuUV8xfEe/5wzrqkoaNS5i0r0zXsqKgJabBS1sHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+o00Tub8uMAYeRWwU6nMs/JEW+gOu3WBDGt4P72OZUNfrerofSr8jdaEu9WaT0ry
 xRHYfNZcRlspzuNqAnWXrLGuHXlishctuP3R+fbcHlY1VzLNBqq0NklA6a6qcMjFBj
 qPSYlBjop/E1tdAYdv9bC8fgXK0kKKojSQ+YE0cp4f9TQD9Ma9xuvxbRQo2Hy7E7sO
 G1XQ8T10ku5jlUM/jEjkCOw3BmYhM9zh+IKOFPxdQ490TTzStd54qQWMm3AQXQ6bBi
 hsEi3F7hb2hkiBoJ7F4+eDTbsdTvUl/f9DzEscQRdIk5QSkSjqHsMTnVa5un/cU7CE
 f7EUN0hLeFNxg==
Date: Thu, 13 Jan 2022 13:11:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: Re: [PATCH] ASoC: codecs: Check for error pointer after calling
 devm_regmap_init_mmio
Message-ID: <YeAlHjM+Cwc3ibZs@sirena.org.uk>
References: <20220113015607.1124916-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jCLPqKH0XGfYYkr1"
Content-Disposition: inline
In-Reply-To: <20220113015607.1124916-1-jiasheng@iscas.ac.cn>
X-Cookie: Slow day.  Practice crawling.
Cc: cezary.rojewski@intel.com, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org
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


--jCLPqKH0XGfYYkr1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 13, 2022 at 09:56:07AM +0800, Jiasheng Jiang wrote:
> On Wed, Jan 12, 2022 at 10:20:34PM +0800, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> I checked linux-5.16, and don't think what I said is not against the
> latest code.

No, that's several months out of date - you should be submitting against
the current development version.  At this point v5.16 is released and
the bulk of the changes for v5.17 have already been sent.

--jCLPqKH0XGfYYkr1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHgJR0ACgkQJNaLcl1U
h9DcEAf/SCgdpEXcct6/cvLyvpiX3SkY6jR5AshaV9TfWS/4p5nnVw0/5VqzX/zr
aP/AeBS+rKjxtN5pbnPIRYA3cudcQTXmdRZGEKFF9LQOSXhU9HWlEkzermiFux7a
y4o5l1TBz16IKj88SjfI0GyOiLf4xMZcfqRFoH3OvNZAZy6lHjJZXqcEjd0jKi21
nTBEjm9oSiLYfJr5NuXgIh1aGF5GljrnO6SOqeOSvJNudjvMQBUNoIVF5If/SKCo
bTSMpNFAScAIHWA0OUymoS03vG+v6kpKrh0apehCGj64yIZI1/e3Cyys1CI9x/nD
HmKuSII5/O0GbOznsTHBfGzjXTt/Ug==
=4t4L
-----END PGP SIGNATURE-----

--jCLPqKH0XGfYYkr1--
