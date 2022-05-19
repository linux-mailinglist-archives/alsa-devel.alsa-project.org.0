Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FCB52DE70
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 22:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A041801;
	Thu, 19 May 2022 22:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A041801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652992386;
	bh=n23XRFUFMstCGk8mn6a//a0qUBX/Svoko9l1F+IHrPI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T57TX46z2NR/395j2MtjY2UVEBtfPOkmrSdC2zPhAFxbLqK7HM5RDg3TNOnax2WJA
	 Q/zzL+dVvFlw8cmlV/NWeTQpU6hDUMsEpvxyzi0kQZrxseIzJIRpSCdOMj03viei9v
	 C8qqe2Mgicx5FbE+kbjuk0GE6/cEtUHl5E6kUzos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E507F80109;
	Thu, 19 May 2022 22:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA98F8025D; Thu, 19 May 2022 22:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B1BCF80109
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 22:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B1BCF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lhjUgOWe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88257B82851;
 Thu, 19 May 2022 20:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB260C385AA;
 Thu, 19 May 2022 20:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652992320;
 bh=n23XRFUFMstCGk8mn6a//a0qUBX/Svoko9l1F+IHrPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lhjUgOWemoX82K6Ic18VuKLtgKoTBowUGJirOki8ui8abJaz6XBivJMANlENRZLXp
 mAx0PYNBD5andrcuN38p1V6qeXPZyDGdPv+NUGUYbE9RFoj3Xq7LLhKQ8IKy7iA+SH
 Q7FMAWRdC4hh6BriJhkZXlcXPbglugcSCfnsgppPaTi5H6/I/AaE9oa8cPTf6TSiJt
 IxK9E8ohbKMT/v8yVassG1EBSSLHlZwz3gHD5I8b7M8MONF1PaCRrYZZH1D3y0GDRp
 1DKQOKuqd0wy1ji+VgXkvcVmdMxKuIpEifAxwEtqpiCYFFYPVPFNN6nvvxjW97iwnV
 DVN+xoNVi3VQw==
Date: Thu, 19 May 2022 21:31:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: Re: [PATCH] ASoC: max98090: Remove unneeded check in
 max98090_put_enab_tlv()
Message-ID: <YoapO3yPdW6Sa+wF@sirena.org.uk>
References: <1652980212-21473-1-git-send-email-khoroshilov@ispras.ru>
 <YoZ+dmprwb5Ohto3@sirena.org.uk>
 <fd58c07c-488e-1c90-a755-194f714bbe45@ispras.ru>
 <YoaEXWGEY4s14je+@sirena.org.uk>
 <ce6853a9-6789-f151-3193-59b7dd73bd27@ispras.ru>
 <YoajesD+D1W3ZV7/@sirena.org.uk>
 <4080eabc-5e56-905d-d994-84ee57c2cf31@ispras.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fYcmQXDXRAF+pPBh"
Content-Disposition: inline
In-Reply-To: <4080eabc-5e56-905d-d994-84ee57c2cf31@ispras.ru>
X-Cookie: Some restrictions may apply.
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--fYcmQXDXRAF+pPBh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2022 at 11:13:00PM +0300, Alexey Khoroshilov wrote:
> On 19.05.2022 23:07, Mark Brown wrote:
> > On Thu, May 19, 2022 at 09:27:25PM +0300, Alexey Khoroshilov wrote:

> >> Do you mean something like this?

> > That looks about right.

> Should I prepare a patch or you will do it yourself?

Please send it, you already wrote it - may as well get the credit too.

--fYcmQXDXRAF+pPBh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGqToACgkQJNaLcl1U
h9A08Af6A1cyQi40qAdJmheJWDP8mFvjmJ336RjogFvj511AZW/XY6JzWTrpqgDC
3DisrlCMjtnhgvN3jNz43lKFwoJY3pxozLUTFMg93ZxkL4WFPgXWVo3yrTG/DMiw
qpo3D6mmEzPHp5iKGIUWsTSknhSuSmXc8RbLujDl8cEPrUf46Rd72cyCcQVqX/gU
V4yBYWMMwEhevx9e3TmMuSH/U2NGU2ad17JiUiZn/5nRhhGv/q4bScVxNGUt7hRJ
FMtLiELr/Zf4jJuFIhGKMMoAkDE/nutbG1eavHi/vlyG99Jf8EGfTUgGl7cGQRGa
sdpiKzPj1JdoFPxHMv22a50C0jVSOw==
=M3zP
-----END PGP SIGNATURE-----

--fYcmQXDXRAF+pPBh--
