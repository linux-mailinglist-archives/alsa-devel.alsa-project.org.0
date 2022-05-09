Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3CF51FB93
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 13:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C5F170B;
	Mon,  9 May 2022 13:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C5F170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652096967;
	bh=cd1eyufqewLBiozYF7IjayD6HKPYr13nvygC0lANLlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGXxIfeSFlgIMAnJosVf9nY2oisKjiUty19tfvTkQtaguSOArUiaepmV8p+Nv3BWl
	 f8bvf9kyaiz1LxrFOmbiMudIqxZUV+eGN3M8L2SCWfhd7+JB4k88zEbNGIMTgOP1t4
	 ITG9cJ8ZMxTFor2cqqtRf15K7DgWcqqZEqk3Whi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA01F800D3;
	Mon,  9 May 2022 13:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8F4F8025D; Mon,  9 May 2022 13:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92803F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 13:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92803F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dCCZDMBg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7045611CA;
 Mon,  9 May 2022 11:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B8EC385A8;
 Mon,  9 May 2022 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652096902;
 bh=cd1eyufqewLBiozYF7IjayD6HKPYr13nvygC0lANLlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dCCZDMBg6ReQTD29fQLdwgvReyi6b6WtcFjPlJ2lZ8vxL8RZHqdRybT4ZV3DgskMn
 +BOOgda6YecpkLMiStUHe1bDTIHuhcuTc9A8SUSu39UhMX0yLnFHsM3zoCQULWGJpg
 fm3vvO9yuPTIbObPjLt4p2wo3pAS6mdll6TlecHcs0JXpO7CBqXlVGuhZuvyepuiSn
 QVhethMwXyjAanyl2PdIEtjsRpXx8hnvYpkMPaMnjPZOQXmSIFyhmCR0lUjbu2rim4
 vDdPS3PYRsY1RaogYc6ckuTg+rmkteeXZj8V4qRphjjEmtQj5Gk8l0B4eh88cf/aFx
 dlNyPrB6rqeIg==
Date: Mon, 9 May 2022 12:48:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Register a callback to disable the
 regulator_disable
Message-ID: <Ynj/gQQbQ8JFEcQL@sirena.org.uk>
References: <20220509085925.1548328-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3fbrUoSA93r0CmS5"
Content-Disposition: inline
In-Reply-To: <20220509085925.1548328-1-zheyuma97@gmail.com>
X-Cookie: To err is humor.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--3fbrUoSA93r0CmS5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 04:59:25PM +0800, Zheyu Ma wrote:
> The driver should register a callback that will deal with the disabling
> when it fails to probe.

This doesn't apply against current code, please check and resend.

--3fbrUoSA93r0CmS5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ4/4AACgkQJNaLcl1U
h9D+Ewf/fxATUeYh+xRG7Mylx3kTcxLKKYB0GdYAv/UpVPmuJS5Ad12vOZiu93Ep
nRuiuUCjOWqsavf7eUawKkqL508SemrhLvpP7VIejhtF9LbSopnZxKmpYU3nGmJK
dAq9rdg92EqderFmy4pBlMxDST8fuuJgyeouyP6KTsWv0GhMYlZQ+wCK23opkDc8
HL6SOWLvQz0stZUIWahiuonfCgtg7/vULv/7FiKvPkVNvnzBgVQ9ba1gE23SmUBZ
CGbdMsGz9cuwxEvvFTODcylKp/VK6jo67wUaFvO8OH3rzjKYEciXFghyGosGunUf
LItiY6tIhtkUDTyNSPDUVAkrXEAZtw==
=cWs+
-----END PGP SIGNATURE-----

--3fbrUoSA93r0CmS5--
