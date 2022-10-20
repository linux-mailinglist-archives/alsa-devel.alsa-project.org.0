Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459A0606005
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:18:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9557A815;
	Thu, 20 Oct 2022 14:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9557A815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268333;
	bh=wVmcHlw2nMWp1f7t5TKKyu1OLkzG6V28/hn1UezvJGs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hePeoZ8CRV1k1LJbowYEqAoMALYIIuNdUspmo0t+c3nBuqfH+zS2VY+fVnOA4Dcm/
	 hVe7Idd5sEa+LrXfilXFnM0xH9axjiptLOmUjMhg9MOpBNzPNYJk0o59X2agzd7PEj
	 +xKRjJdo4CC+A8VVMFyartBXpcldvMNRqy5dY8u8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D256F80543;
	Thu, 20 Oct 2022 14:14:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80E15F80549; Thu, 20 Oct 2022 14:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D42F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D42F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J/TIeT+b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 085B2B82708;
 Thu, 20 Oct 2022 12:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CC3C433D6;
 Thu, 20 Oct 2022 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666268065;
 bh=wVmcHlw2nMWp1f7t5TKKyu1OLkzG6V28/hn1UezvJGs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/TIeT+b0yIYlY447mZpkCn1+wp8Rqn+KzsH9bO9Hbb4OjbO1KlQMW2E8dICUbYNq
 hNrLBOPa2rJ+uNHFUJnW+Uq/LcX/XLtE9XU+YoP+IOh+Bx3M6/kLdjPZscGzd2cWLH
 H21WQsFiPWTVH2IIH0WjD2TDHvmnopG8Z3PlRSYqqVhdkXdHKPzy7ZqSBT8o4TI//k
 1NIk7XEo+gXTZ9ZNK6ILdUnZA5qqxNRsTRsk6noPaFwTH2uiwV61YH9KqFYQIbAoGq
 EGSJBLiviN3HuS7CZIAYnrUbbYT3EsnVblgqvpJsxC2WQIVQdWTCTNgifN8gMAI+Hq
 /5HIQj6785M+w==
Date: Thu, 20 Oct 2022 13:14:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Siarhei Volkau <lis8215@gmail.com>
Subject: Re: [PATCH v3 0/7] ASoC: codecs: jz4725b: Various improvements and
 fixes
Message-ID: <Y1E7nFC9DcdqegKX@sirena.org.uk>
References: <20221016132648.3011729-1-lis8215@gmail.com>
 <166609251307.155136.11548088283059583394.b4-ty@kernel.org>
 <CAKNVLfbfRRE3O2uFH6MQxoa_cdqTUcvpGzmcxFm3oCLKFfHv6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="20Qlq5zpxv26BWqP"
Content-Disposition: inline
In-Reply-To: <CAKNVLfbfRRE3O2uFH6MQxoa_cdqTUcvpGzmcxFm3oCLKFfHv6w@mail.gmail.com>
X-Cookie: Today is what happened to yesterday.
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
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


--20Qlq5zpxv26BWqP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 02:58:51PM +0300, Siarhei Volkau wrote:
> =D0=B2=D1=82, 18 =D0=BE=D0=BA=D1=82. 2022 =D0=B3. =D0=B2 14:28, Mark Brow=
n <broonie@kernel.org>:

> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> What are mailing lists it needs to be sent to?

The same ones as for any other patch submission - alsa-devel in this
case.

> Any additional tags needed? I know about Fixes tag.

No.

> Do I need to keep a link on this patchset somehow?

The fixes tag should be enough.

> Do I need to mail a patch with the fix to this thread or
> create a new one?

Please create a new thread.

> PS: the patch will look like:
>  - {"ADC Sourc Capture Routee", "Line In", "Line In"},
>  + {"ADC Source Capture Route", "Line In", "Line In"},

This was already fixed by Colin...

--20Qlq5zpxv26BWqP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNRO5sACgkQJNaLcl1U
h9C01Af/UywbN7ofuJYAnuTxfZYjGiVc3HZXaAVqY5cjTm2P8mBTY84rQshG4OHA
x7WYG1lpu51e4oHyci+cAEIlJ8c2ptRm2v7NMk9DCZpU8VeSkSG1EmWQnKj0Q7qH
tumNm/ecmEFRehPkVliFfJ/AQyb3T1Hv3Q5JYPWUTJbIY5L09msI9QNOBHfmYi70
cCew1lfF8VT6EwuElrM/YIFBW4w2attkFLkpMSqPFsBgd6rPkjFnZf1+w/SUJU1l
eEbJdI2S+l0hPQEVA+YaPmFhwCHq1N72C239kMLX5lICmAN/yQPpOivmuKYV79i3
PWRyQloaqv8bzeknu6z2hIyAgpqvFw==
=P7gj
-----END PGP SIGNATURE-----

--20Qlq5zpxv26BWqP--
