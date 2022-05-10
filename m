Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A3521610
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:55:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFB2D18CD;
	Tue, 10 May 2022 14:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFB2D18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652187319;
	bh=4PivaWWi4aEx+cxNzcxek9VaB+oZC2dWimjoWJP0lEo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZdXwoPsK97BeQgrNvjSkaX5y1k+cz8/RlNfCyllwJpzVJNlNdB7nUGSksHaMUe7g
	 s157weV16NIj9PItwWEbtXaaosUyD1Q/N7Ega89FJ1A3J9j/2Xb0mG4dl8yFTcayZy
	 6WG225mKmKuenEV7thTNws5fxTCdZqibbIyfqPfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DA1BF8011C;
	Tue, 10 May 2022 14:54:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EEF5F8019D; Tue, 10 May 2022 14:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D03AEF8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 14:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D03AEF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="prHSrTuY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97B1BB81D2F;
 Tue, 10 May 2022 12:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B65C385C6;
 Tue, 10 May 2022 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652187254;
 bh=4PivaWWi4aEx+cxNzcxek9VaB+oZC2dWimjoWJP0lEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=prHSrTuY6SWToZk1S1G9KfEht4wO8o9B6JcZav7Jczb+IsjukMdEwDYWRiBweoJo8
 YPhv3WJ1ivSV9Ogg4OcHvox5ZIRJH30+2bDQB5YyCux8FxtykmT03WlZkrzuOUXtCp
 vlUJ5lmdEl2wieeeXEHobRBBpA1RnOcCP6+5aW7Q37uVoam18/1b3cKjLjuMOY6n4c
 i/tel7fHiiz8zoiek7/ffgOHy3MZXEcARJ8reaQn1vMzUlQLazBW8RCa+yT3sjX4/3
 LOl/gKSoeIXiKB/pAEGmp4EsC1zoT0a9mUAoiqfKvktbfb9yzYrDsMroI2eIiti8c+
 HuoPtieR/WPrw==
Date: Tue, 10 May 2022 13:54:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
Message-ID: <YnpgcAVzADHoCUgI@sirena.org.uk>
References: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Z522tNyah4CHNrF"
Content-Disposition: inline
In-Reply-To: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: I've read SEVEN MILLION books!!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, krzk+dt@kernel.org, shengjiu.wang@gmail.com,
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


--2Z522tNyah4CHNrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 05:14:22PM +0800, Shengjiu Wang wrote:
> On i.MX8Plus there are two updates for micfil module.
>=20
> One is that the output format is S32_LE, only the 24 more
> significative bits have information, the other bits are always
> zero. Add 'formats' variable in soc data to distinguish the
> format on different platform.

You can set sig_bits to say that only the top 24 bits are meaningful,
though I'm not sure many userspace applications pay any attention.

--2Z522tNyah4CHNrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6YG8ACgkQJNaLcl1U
h9AAZAf9FIpl1VBhFVT54/Bc818gjoAdE0BtGCj8hJx+BkHhVZrP/j/zQDPMsSwm
MicGHeGYNhAOFvKVkSFNg+9bZkho8sFtnlEaJfZ/JqFob5427lAlk4fr1EcfqU8f
1ICz//JQzP6UAXI9UpI/JlqdBRHbW9OmMiQiVCtoGSPV4ReuXP4vQTvW6nSdFeXS
yJaa7rvTSHn92leRXDek3XAxGEuci7VJ/zvFFxbO9wPLXGEj6VkMqSSaJ+an2Rgy
bfB4kztha4PQsEPWaMZxYkbxwiLTNIDKYNMRkUWc43OpxCF6+hu5jimP18vRToGl
25szXXQxFjmC9ojtkMeYsNeOQBqYPw==
=M2n0
-----END PGP SIGNATURE-----

--2Z522tNyah4CHNrF--
