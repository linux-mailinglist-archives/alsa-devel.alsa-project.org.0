Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2333463B8F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12FDA83E;
	Tue, 30 Nov 2021 17:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12FDA83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638289151;
	bh=MZnl0m0UlSGNeDrL9sapE0g2YD1NMkMtPnbDj8SAK+0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e5Apy543N8t97+S+v5/V1ArqE4rz1t133yaXa8Q/Pdf+U5lnXBmHUms/NCOu1AQEn
	 8cnufeFVojjGOZ8zbVMh741T3V3rjVTXsgUPfcgNi9UXCrwiBY1U/TKoTVuc0d3XHS
	 WbIh8UyzhsnUkY7DtrWiNVkXxOvWTAcNQdqD0Ftg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA49F802A0;
	Tue, 30 Nov 2021 17:17:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2FA3F80290; Tue, 30 Nov 2021 17:17:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F19F8020D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:17:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F19F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gg3STzay"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 82E0CCE1A2E;
 Tue, 30 Nov 2021 16:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40918C53FC7;
 Tue, 30 Nov 2021 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638289057;
 bh=MZnl0m0UlSGNeDrL9sapE0g2YD1NMkMtPnbDj8SAK+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gg3STzay0QZRm3E9SW2UXSNlJlPrWOia6C2DHwbH1gviANhFaHenZJqyzTQYr1+Vz
 AejGr4duQzTULR+N9JM1fw3I3ymCYe0u6flainBkcRjTfvx7y22R+se3M9eODLib9l
 rwlp+udvw6zUlE9MnUY2JRgCxQhEtXPkJv3CS/nY9/OU2g8YoRlI5+nGsZjr5AU072
 5B7xQbXWt51P5fvjmRt/dZ8QE83Y2cOyMO5d27dlgsrZ1jGFDciQsV32pboynjoQuD
 eoxJuNN9GFXLU6/A3Sbv0v65I6T6Lm6H24uJxMLd9JUkEC/vHpKjCK3r77fMjQ0nwD
 LbE0nOayjqZFQ==
Date: Tue, 30 Nov 2021 16:17:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qdsp6: q6routing: Fix return value from
 msm_routing_put_audio_mixer
Message-ID: <YaZOnJIrl2bO98mL@sirena.org.uk>
References: <20211130160414.21616-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="reGMIgm/lItL/shk"
Content-Disposition: inline
In-Reply-To: <20211130160414.21616-1-srinivas.kandagatla@linaro.org>
X-Cookie: Check your local listings.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--reGMIgm/lItL/shk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 30, 2021 at 04:04:14PM +0000, Srinivas Kandagatla wrote:
> msm_routing_put_audio_mixer() can return incorrect value in various scenarios.
> Fix this, so that change notifications are sent correctly.

This really isn't a good commit message - I can't tell what the change
is supposed to fix or how it fixes it.  Which values in which scenarios
are incorrect in what way?

--reGMIgm/lItL/shk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGmTpwACgkQJNaLcl1U
h9DZWQgAhJmvaqN0eGrzB9U7ieeGabIcljlgUyilqA/VqDFY67InjYGqepeftVTD
Ku5SexhDIBYUC4VyY3aLpdmezxPMV5K7FOpnQoqrHMmyB9HT0EOWariE5DML5Dyj
C5vnHJklRawGk8pTUQWVRi0PW9thM4Bh1XyFqaP4JTutrpQbjv4cP5s+KNwlVKnO
o7zc+f3aD8QhgidTIHSgN3DRaD7/w8VcxhpoKINuHyTcPz8bjA+qeTiGCmqSbuqe
3uVpANXD1JboUIKXfgErBeQJWKCRBOHxYI3FZaeTdO1XlwLK+VpTfXM7TZv6g7uP
ZjntZxXtF6ytmDCYvP1rytMj5KLzfA==
=2i4Y
-----END PGP SIGNATURE-----

--reGMIgm/lItL/shk--
