Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316D625B19
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 14:19:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15131672;
	Fri, 11 Nov 2022 14:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15131672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668172791;
	bh=3W0We6bvkqvck0Fwxhddi219G09n9OSiAxfjMvFiwgo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pH4l4/LLyEuPerGuGv9sTQC50CsSPriK5CPZPFfPENQYM9rikgTe56Lq4fTBYcLUj
	 TD7vKc+kfFEbMHo93HnriZ4Tf1ENQllIK9GebMhv/vXBCqloKpyjwFZVyrIcT6wFVZ
	 k6T5ArnhGKiqwvVzN5Ia3gDGEZ+GaG1sKvocAXpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FAB8F804AB;
	Fri, 11 Nov 2022 14:18:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0F70F8028D; Fri, 11 Nov 2022 14:18:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D529F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 14:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D529F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uVballsx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1982261FB6;
 Fri, 11 Nov 2022 13:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32C9C433C1;
 Fri, 11 Nov 2022 13:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668172729;
 bh=3W0We6bvkqvck0Fwxhddi219G09n9OSiAxfjMvFiwgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVballsxGbVjKHm5k1p+Owfj3LwgaSWZQyauNizaB2W7MevqMmIY5j6O+J4tDEEh3
 GXHE2YabbH+ycqXsqPPB67kwCpfgYaWKpELK+5LZDk64IsLpQ0WC3QBMaDgZ3BCFj+
 UTbzrLVzUCN+gv9FPlsVUtQS5kUtv/I0NBRN2IguRMnb9poecz3knhV0SUvN97a0uu
 VEo6KvzxdHI2mWAVP+k6lpoCASIdJEPJIv/eoPtMmtx4OO8UQJb2Z9AlXzRe2hFo+z
 u5RlOj6EzIYaOl2jB8KJ4RpkVrd8Qud5DOtdJdraFSAdak9M/Vm1qVudk20Prony8h
 j1vgku5aREkqQ==
Date: Fri, 11 Nov 2022 13:18:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v6.2-rc4
Message-ID: <Y25Ls+Dw+KAwTJGl@sirena.org.uk>
References: <20221111131610.17E02C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yVQHLyk2N6iHMSaz"
Content-Disposition: inline
In-Reply-To: <20221111131610.17E02C433C1@smtp.kernel.org>
X-Cookie: Should I do my BOBBIE VINTON medley?
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--yVQHLyk2N6iHMSaz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2022 at 01:15:53PM +0000, Mark Brown wrote:
> The following changes since commit e9441675edc1bb8dbfadacf68aafacca60d65a=
25:
>=20
>   ASoC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_devi=
ce_init() (2022-10-21 13:04:14 +0100)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-fix-v6.2-rc4

Typoed the version there, sorry.

--yVQHLyk2N6iHMSaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNuS7MACgkQJNaLcl1U
h9Di/gf/WOCaR42fMraUF/E87HC8fWq+69ycbiHpiXP6hKt3xofSSQuNkpfuEvsd
Fs+r5Oa0IHF1v372hnSlO5JPH5+yKnQp5ZRm6tXlTm8VXpdGfs3Spmph9NfTka69
xnO0dFGSEyJYWHGKxZqKyMSVYVp+jQS7dZIlSoBOSucqIOJYcOrB0TGqOhR/TADb
Glxeu/qURUitwcbqDUEu549lbDxbANmhauVqg4oXfFOaJ/FGDUmcoyy0WVFT6t0/
txjEJ/kDkZBInn2yzSAfEYEyu/p8a+hGceAtQbm9V8jvyoefcd6NEfjr5Xuy6R4v
xfsYgpdZ0eSbXNBu+mGWuw0XjpW+2w==
=/K7K
-----END PGP SIGNATURE-----

--yVQHLyk2N6iHMSaz--
