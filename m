Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 519154D2FF7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 14:32:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D199E1728;
	Wed,  9 Mar 2022 14:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D199E1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646832774;
	bh=gsS5cRgldnuxZAezSoBJuvEEol4eNludlAbg3VTEF1o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfujMcAaOgTv2AMDfoFUIaaXHdrQwAqMBdo3MyEDCP9cCXsymIozxLVG2mSwpM5CX
	 n0Q2vY72QbSHpQr2+wS82gnEYoSZEBQydtt8QQZ42qlnxRKOxzrSFdmMV0LzNAbbrD
	 ruaazYVwtkmVYXDQXAaCABKotVvERUSmmfhWCZ7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CEDAF8012F;
	Wed,  9 Mar 2022 14:31:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68630F8016C; Wed,  9 Mar 2022 14:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29B26F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 14:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29B26F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B2xT1tNQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 274C9B820BE;
 Wed,  9 Mar 2022 13:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F2DC340E8;
 Wed,  9 Mar 2022 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646832697;
 bh=gsS5cRgldnuxZAezSoBJuvEEol4eNludlAbg3VTEF1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2xT1tNQM+/AqoliEO4iFOckPn9Z+WvH/LteeXq+/IShe7WT1zilF2QJUcmuIur9O
 oPkCwnmatbGWCXBxKppkgF/yr06/H1/+aKaD4M6wBl7gWVp573xk0wMRrZ9S5ZWa0b
 myfC8Ih3AbuWf8PZBVlpGXngdMReIooEDXn7nttZd2kXhARHbkaBOt0+1PMP9/TTaA
 T5Yys2DrLryw1tVaXfgUdDBFI6lgkS/oFYE0nxeic0gaNCdz2J2HjNobJllcOlDhFD
 adMPvo+7VR4NzJweC8MwnfhQus30rfqitM9aj/aoKSIJG18bBw8MF5RaBbfrHjuBzo
 dkWA/T4dKipFw==
Date: Wed, 9 Mar 2022 13:31:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: fix Kconfig for SC7280
Message-ID: <YiisNOT2AjGX7S3K@sirena.org.uk>
References: <20220309124453.25841-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m8WzhEHmoEep+AhC"
Content-Disposition: inline
In-Reply-To: <20220309124453.25841-1-srinivas.kandagatla@linaro.org>
X-Cookie: Caution: Keep out of reach of children.
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--m8WzhEHmoEep+AhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 12:44:53PM +0000, Srinivas Kandagatla wrote:
> select would force the symbol to value without checking the dependencies.
> In this case selecting TX and RX MACROs directly without checking its
> dependency on COMMON_CLK would break builds on platform which do no
> set COMMON_CLK.

This doesn't apply against current code, please check and resend.

--m8WzhEHmoEep+AhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIorDMACgkQJNaLcl1U
h9D97wf9EPYIg3qvPojrTzttroxLFn9j8boMx6+4sAcU21aSI7iraIA7gYj8ZITy
/PgkxQnRh1Ifva59LFSkACqyEetgfmQpywD5tJFRbQrYwewXfOvrCY1P8Q4ALqs+
dCnF9+hNLSLSrCPsranzmQ2P9qhJPQoP+KMHd5Zy65nF0AdEXigWEneTPOn8jZe2
tU07eZCgV1wI4+RbXrN8AnM5BTNOdbNnl2jGYKgy9BOVQTaeJUiAXOAxtfjTlA+o
otms0m0tJuT7mhvDAYEvfR0KbszYRYjRU7hYMe6Kc4gm6HMoqMTIfi0KRfGvjZWM
weYqWTYNAVL3NFHx+UCaxWZowx4LLg==
=KG/+
-----END PGP SIGNATURE-----

--m8WzhEHmoEep+AhC--
