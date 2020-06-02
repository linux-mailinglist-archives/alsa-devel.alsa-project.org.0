Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 463001EC201
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 20:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA2731665;
	Tue,  2 Jun 2020 20:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA2731665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591123263;
	bh=53pu/k9AJVkJx59AFkp+EA8AesvG4oSX1PiYX9YmRrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iyO2oZgzmJFZk0vxt9e6BR17TTv809IDi0XlDs53FK+Dlr+LTJ2eZwoyOexuk3Mzl
	 pRBKlFUmBqUmafV7E4hQhg6bG3YrxrkK2mN/46y09HDq4/iWdlkXCWdlHmIBY8Q7G/
	 njfat3jN7A/cQbk3oJAQUm3qTIuLlab6S6t2cR84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB133F80272;
	Tue,  2 Jun 2020 20:39:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F29F0F8026F; Tue,  2 Jun 2020 20:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74370F800BC
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 20:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74370F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lwHN4syA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68C1A2072F;
 Tue,  2 Jun 2020 18:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591123148;
 bh=53pu/k9AJVkJx59AFkp+EA8AesvG4oSX1PiYX9YmRrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwHN4syAxg6nptQ9jpEg2QkYFq1Ywzq2/BY8ncojiudFlDxX0tGS1W8HBgrZDlxNH
 oyAs7/vVXhmtBlurfFFrlUeE9PKge9vZfw/2Wck5uFDfTKa/as+yPjdO074MdOm56Z
 Gw8+G3iUCLK1Hpc2/CiCeAbD7zlA+Uy37gP+U7+k=
Date: Tue, 2 Jun 2020 19:39:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: max98390: Fix incorrect printf qualifier
Message-ID: <20200602183906.GJ5684@sirena.org.uk>
References: <20200602164453.29925-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nywXBoy70X0GaB8B"
Content-Disposition: inline
In-Reply-To: <20200602164453.29925-1-tiwai@suse.de>
X-Cookie: We are not a clone.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Steve Lee <steves.lee@maximintegrated.com>
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


--nywXBoy70X0GaB8B
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 06:44:53PM +0200, Takashi Iwai wrote:
> This patch addresses a compile warning:
>   sound/soc/codecs/max98390.c:781:3: warning: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 4 has=
 type =E2=80=98size_t {aka const unsigned int}=E2=80=99 [-Wformat=3D]

> Fixes: a6e3f4f34cdb ("ASoC: max98390: Added Amplifier Driver")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Ah, thanks - I saw your mail this morning but just getting out from
under a pile of other stuff now:

Acked-by: Mark Brown <broonie@kernel.org>

--nywXBoy70X0GaB8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WnMkACgkQJNaLcl1U
h9C4cgf9GenuCGnGeT4jnDDAdSHIlMsvHeXrIKe5MOBjugEHn430azcTM3Nz8CIG
kEQDe8BprbCNr+2a8HtR+iLb8yEA2lKsMPGtxkyrzaNDuHgaPK0N61ZLSTJLGOzH
WzcpQrtIncCibAQeKFdFT3JT0tquKhSPeLbzS8BBzU+kIp9+xF2dRaje4dmUbT4V
lLtSd/pFysKbaRmvq+k8n4wDWDJYWbxEEu60OdDESNo7KE30mB9yY4Yjfn3rAD83
uKO78IW/XvD0nsjKtj6Ku0jJ6CoqrYJaNWFbyuZxQAyNyFJGQnyS/dEOeqMUyYmh
kjHcID0ectu+5iwcagyrozt792RD9A==
=NZSz
-----END PGP SIGNATURE-----

--nywXBoy70X0GaB8B--
