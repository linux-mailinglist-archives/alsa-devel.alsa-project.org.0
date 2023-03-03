Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6FA6A991A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 15:08:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A605CA4D;
	Fri,  3 Mar 2023 15:07:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A605CA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677852503;
	bh=VfujaCEcuTjqsOwacRiHH+dYgyio9vgq+qn9GPO8IW8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oSMTfj1idG+p8aI0as6hVkgqbfNqAE88ZQoBV9QFmvJ+tMwqVKD81Ornm3jmy0z4o
	 0FjCiuVUnjbEBzOIquMaKjMbwoPxoOXKdYTRpW9E9nrAZ4pNV+sm8ADDXTZjIdp2BF
	 sdNTy+tBgntUI36+IpuwFjE5s/x7uiZ3t8R+VCDQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE67F8025A;
	Fri,  3 Mar 2023 15:07:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B111F80266; Fri,  3 Mar 2023 15:07:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADC0BF800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 15:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC0BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j1Tzn0f4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8285B61838;
	Fri,  3 Mar 2023 14:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1E7C433EF;
	Fri,  3 Mar 2023 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677852441;
	bh=VfujaCEcuTjqsOwacRiHH+dYgyio9vgq+qn9GPO8IW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j1Tzn0f4fSwObk20ywknY5A8LPQNkYi21AYRVDczCvuZ8o3Hx4VrwzYPpxhOhCji7
	 wdRqBVMirDzMIY5vrVJBETz/7hU4lPex2gnQkgjqNof36X+6eU84TsBePoUJFCiS5V
	 QzsDL4jKyBDQW5G/AvIIFFGgwbKi+ufa8wiRh/l0FLu08pOsY2hWdJH48Awo6U1lNp
	 F6wGn1AY03PCTUB0B/BQCf10QNiyHhAR6KowqIvu9eOU60D/+un3T8zEwj3LXuBvpV
	 V5NcObozuI6zkR/dtrGSve8++Iw2h/9v7iRzhWEeeKr5sKDrKjghGAg7a9CQLYhe6p
	 iIqbde4QzHbOg==
Date: Fri, 3 Mar 2023 14:07:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
Message-ID: <92201fe8-cea6-4ca6-8548-bec883337e80@sirena.org.uk>
References: <20230303125717.29196-1-quic_visr@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iGSIgbO6ukbqtcFV"
Content-Disposition: inline
In-Reply-To: <20230303125717.29196-1-quic_visr@quicinc.com>
X-Cookie: You are fairminded, just and loving.
Message-ID-Hash: 4UNGME5CBILRELMFQIQAXBQ6EPFGRMSM
X-Message-ID-Hash: 4UNGME5CBILRELMFQIQAXBQ6EPFGRMSM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4UNGME5CBILRELMFQIQAXBQ6EPFGRMSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iGSIgbO6ukbqtcFV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 03, 2023 at 06:27:16PM +0530, Ravulapati Vishnu Vardhan Rao wrote:

> From: visr <quic_visr@quicinc.com>

> Signed-off-by: RAVULAPATI VISHNUVARDHAN RAO <quic_visr@quicinc.com>

Now the From doesn't match the signoff...

--iGSIgbO6ukbqtcFV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQB/xMACgkQJNaLcl1U
h9BhuQf7ByNTjIoHAnJhyg0ugxS4CZ/zVpW9ijZICFug3NJJ1BnJi+zwcEJrvDPN
66oI2S9v01GNQwMF9ktJkFfg5UW/wDW+VARpWAMt8jZEh3uDIjocec2CIIx2V1Zk
OPXsdTbFqI05bSEy+iydYNrASmWLBKiH8/tXRMTh4tZtdF3dC29Xu49qZEpGrjJ6
dYkG6UgqmaIdw7QTnn5vEy5PwhInJt3OelNvXU6+quQ5XWKHQNhUa/EslzP8dGwX
uXkyPIOg4u9kwv5z7ntohqu4RJAjFPvOtmRFLGuMqJR6Y47YkUoEbcGSDFR1xX//
jTvjbXeoXn//DxPLPKSWYC6uKUaO6A==
=BrNI
-----END PGP SIGNATURE-----

--iGSIgbO6ukbqtcFV--
