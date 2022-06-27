Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8E555BC47
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 00:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5680167E;
	Tue, 28 Jun 2022 00:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5680167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656368761;
	bh=Dz3HpkUv4fKNgIq7sc2kWxwjKmENaIL6SD0TXzXDuLc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KSaMIs0/76rL4euias7UTAKYhAS+lMzFA+IupAwU5SPx3BrDQzsI7KSZK3W+Xvgyi
	 y+tFV/d9xfZ2VSd/dEPgnFvNOHRYAX+311ahKkupdQd3+/LjiIh6aAmvIb9RnKPiSJ
	 WtRRPARhjF8ZQG/bKC7/q+I+6ac6zE4IHuCPJXuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D37CF800E9;
	Tue, 28 Jun 2022 00:25:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03611F8012F; Tue, 28 Jun 2022 00:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97958F80128
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 00:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97958F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f0/Y3grr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C729612BC;
 Mon, 27 Jun 2022 22:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4264EC34115;
 Mon, 27 Jun 2022 22:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656368693;
 bh=Dz3HpkUv4fKNgIq7sc2kWxwjKmENaIL6SD0TXzXDuLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0/Y3grrCnDj9Xmfj4ZBk9NYLU6/TA9juRAlfDg3I3ej5CF019Ynei+4RnZ6nsEIh
 O2M3D2VHasM122LfoFnFu+KircbN84k0vX9GCL86lLnTGAZUB+C94ilPJyDVj2+vXe
 cDbHRYw+zjQqGboRLke8eMkd6Q1k8mCKlvlcFvSSAZAxFhmfN/fTmUxt3EeNR6Nqcf
 GU0Tyi3yYiVvhI394Gg93ReSJ4zNTt+5N8i83HmcCRYWdj+KdLcACXfOX+eQWFy587
 hyeK+fO2WfMbMkbk0TfHZ6uKZseXJPktTzye9Q4ifeCAjXGys/yYqRNgFUxdqPhrS3
 xFhiX7bFn90Jw==
Date: Mon, 27 Jun 2022 23:24:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <YrouMMYhzpUb0JzO@sirena.org.uk>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
 <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
 <YroVtj4zXXcHygxD@builder.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d+VUBwpC4ge/k0B2"
Content-Disposition: inline
In-Reply-To: <YroVtj4zXXcHygxD@builder.lan>
X-Cookie: Your supervisor is thinking about you.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 krzk+dt@kernel.org
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


--d+VUBwpC4ge/k0B2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 03:40:22PM -0500, Bjorn Andersson wrote:

> On Fri 29 Apr 17:03 CDT 2022, Bryan O'Donoghue wrote:
>=20
> Adding the sound maintainers to To/Cc, please advice if you would prefer
> Bryan to resubmit the patch with proper recipients.

Yes, please.

--d+VUBwpC4ge/k0B2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK6Li8ACgkQJNaLcl1U
h9CF3gf/WXKPaL/hczugrKTgYGim6uhugTHPvAP2gc3nBogE2cIhiv2gHJHJsVGR
II6zquLLRRUGD1r6CjN6IOKvtYZ9tAMauhluTfAHclZiLmnv0po28f3wIbVf4zns
ImdPUcJ2ipJ9nKLHl5pi5LDINEmSSbZwj/xehxT8D7JUKleVjq5yElAGLWF6ThSp
Gwe0KbMBI55gDQJgjM6xJrT5mDBC/0Lt6uv6PsD/IDCgjJLuQ5t/O5gRwUKTrJai
G47F8J39CkmhO1u2Tl+McqbZ334I1UrPsG92AH+5FgQSaiGnO2AZayL3IliHL1hW
Oh3oVKv4Qk5QzIGi+FCai8qecbT89Q==
=yy0D
-----END PGP SIGNATURE-----

--d+VUBwpC4ge/k0B2--
