Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 216D14243B5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A266784A;
	Wed,  6 Oct 2021 19:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A266784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633540260;
	bh=6LoZCnmfOdawk8d/mbX68ZiV45Qa8iZUAtYUzJb54hk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SB3V6ELTALPXbh7WInYAffZ1Gy0E7FaQz9CjGcPe1eu0/ghgzdWgTnjnUEWnld8+H
	 HFLogLGB7tvQCFSK29oqwOAr6V4AZK2GL5ezmuwCo5zExNNwcIR2cy2Dd22ZGm5jIQ
	 Nw+d0miF5PtWtScdzGxqKzWZwklK0ovfubyXcITA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D6BF80249;
	Wed,  6 Oct 2021 19:09:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 916B6F80240; Wed,  6 Oct 2021 19:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7898F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7898F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fM+tppge"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C44E60F9E;
 Wed,  6 Oct 2021 17:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633540172;
 bh=6LoZCnmfOdawk8d/mbX68ZiV45Qa8iZUAtYUzJb54hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fM+tppgeJW/+zgG/sYdllNXSoNpCQGKqIA/F5bi13ESDssalUZ3h94syUU9d7hTTJ
 tQtb3zHcJjuCrU8t1ghyPI3YjKf5zKD0Sg6XwUJl2W+cikrE1qILLzvHO9ihw4cLVb
 18uwOADiU5pZwB63/UH//os/FU7JFGuzKawdVr5ymCJFXs87sHbARZdxsFkICy2CKn
 1JVaiapTc4Ol4Fbx1bWWqPXERnsVll0iAhosryhrAurGFQLHyDBnmCoDjk0gkJaMIA
 fZ31chl6X316JjMq8Z7YiNLg38uWIfDkmVG2JWnY3PwMNtf1IWoPOyc7dSLR/i5Jiw
 UnBqcNc8lzw8g==
Date: Wed, 6 Oct 2021 18:09:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
Message-ID: <YV3YSkowPpy9xYSo@sirena.org.uk>
References: <20211006165228.1692-1-andriy.shevchenko@linux.intel.com>
 <20211006165228.1692-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IcOuXY1o624mX8Lx"
Content-Disposition: inline
In-Reply-To: <20211006165228.1692-2-andriy.shevchenko@linux.intel.com>
X-Cookie: A is for Apple.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>
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


--IcOuXY1o624mX8Lx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 06, 2021 at 07:52:25PM +0300, Andy Shevchenko wrote:
> Access to platform data via dev_get_platdata() getter to make code cleane=
r.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Pierre-Louis Bossart <pierre-louis.bossart@linux.com>

Not sure that's what you meant by adding Pierre's tags...  :P

--IcOuXY1o624mX8Lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFd2EkACgkQJNaLcl1U
h9C76gf/apERD2LCsA/qRYAncIQkaP714egkph2JhEdQ3juDQYqZ2FDEaILj6YgJ
L9NaUmFYq0V5C9jEgPkB6rwiS75/44Fobj6AjCGQbNN9eTT/fm6GttJ+ZRrN7SW+
086s4FksY6JOsYoI5aBks1qZPv5H/S1ZCm8ZSwH8fzCfmvqNpSLngIq9kSfwN+2h
ddIs28MuSSiegH+jMNo5Q4QBNfv4sokj1HAI5Wea++nFSq9d6P26OhNJ4UzU0anv
8+9sCMqUivgKlYXabSDQstu0fXIhCGUgIrxGdu4Gz4//8SxmdKHyOo5RLfvPsCeV
j1BWpJppSoio8lEwveILllmB/B502w==
=ASKS
-----END PGP SIGNATURE-----

--IcOuXY1o624mX8Lx--
