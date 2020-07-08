Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFEB2184FD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 12:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD4BC168C;
	Wed,  8 Jul 2020 12:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD4BC168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594204502;
	bh=AhnJoMBPbxKfUgHX720jeUrzOme8kKo3MjbmvB/JDAU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2qSvHFWDqXoeuxxUsu/79fMmwFz/L4xf5JXdxYMDS/Y+G7QMafy2OCxnWdtYBMRK
	 s/ivjX62ucnys6o5TJtxjCPgJd6U8BjOsZRLj544FlLE88+m4gzaHJ+Y3zkfWpvaaD
	 sqejLMOWb0MbMWJFfUIwQSXFz5g7HzRUGFlsglZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3B9F80150;
	Wed,  8 Jul 2020 12:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DFABF8015A; Wed,  8 Jul 2020 12:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A137F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 12:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A137F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EdfRpI1O"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E852206F6;
 Wed,  8 Jul 2020 10:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594204386;
 bh=AhnJoMBPbxKfUgHX720jeUrzOme8kKo3MjbmvB/JDAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EdfRpI1OCGj1tiJyd4YF76KEhAOKiosCRz6S8D71iqM7NZYRdH3E7SJ+EN0Db1a83
 yObZEvZN6+2kxF805MnfEGD5K+lUgsguzT6g8yAsnWVZieSmcZ5kh2OfPHQq90fbCh
 zsvJSp8+oRIWVV6QQicJIi2CVqA3Q4DYLBhXRMNI=
Date: Wed, 8 Jul 2020 11:33:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [RESEND][PATCH v3 7/8] ASoC: qcom: lpass-sc7180: Add platform
 driver for lpass audio
Message-ID: <20200708103301.GG4655@sirena.org.uk>
References: <1594185286-11323-1-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline
In-Reply-To: <1594185286-11323-1-git-send-email-rohitkr@codeaurora.org>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org
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


--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 10:44:46AM +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
>=20
> Add platform driver for configuring sc7180 lpass core I2S and
> DMA configuration to support playback & capture to external codecs
> connected over primary & secondary MI2S interfaces.

I only have patch 7 here, no other patches or cover letter.  What is
going on?

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FoNwACgkQJNaLcl1U
h9BTIQf+Pzg18KzFR1F83jYFACOsU3RoGhxBsfnTFuUTgZk3ldcDm3SlAKiQ1uwo
Ol2ArxJ/AJ1llEZO3q3T5yv+Xp59WZWKaGNqIqeksbcSNQIVcmKle48bDspuaq8d
vrYuPRUmsij4QsaCBO+FZEjIFpMgN1t+hSjneIU4yvbHS5p+uphg8o485E/aqLC1
KaGwY9njulUK+BYodMNvvLz/MctN5GYaWecf9WonuXHsy0oxg/DLluKqXQpumYWo
vUgZBasWFJW0uwB/bdB2u0tbTUAH6p2YFuTrHcSfiaiGWXg4P9PD5gjHn3ND3QBp
EUYKEtftH2KYxmANHezDbVwOBrJt+Q==
=NjIB
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
