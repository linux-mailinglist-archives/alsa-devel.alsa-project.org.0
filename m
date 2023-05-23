Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FE70E27E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 18:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7648207;
	Tue, 23 May 2023 18:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7648207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684861003;
	bh=pomwoSPiBagnqeBo1aMvvY7T/pCTXzc7pVKQDxkbTdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uc+ULhntMHZgFwdw4VNAjly3oqWtkIN1ckqTVDAO/HikJFd1XZghbPD1pZbkuFLlO
	 O+BUc/qThv1dYUy/V2Zz350vmAVkXlLfRh+cYJup9JgbIqqjQOZrjJ0+PUus8O9WLf
	 z1U1JynSFocyP9+lDe7OPMq2TSEDqEj6mnyyrC4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E531F80086; Tue, 23 May 2023 18:55:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B46F80249;
	Tue, 23 May 2023 18:55:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449B9F80086; Tue, 23 May 2023 18:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1892EF80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1892EF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BJ0MuBn8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F009634A2;
	Tue, 23 May 2023 16:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0243AC4339B;
	Tue, 23 May 2023 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684860945;
	bh=pomwoSPiBagnqeBo1aMvvY7T/pCTXzc7pVKQDxkbTdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJ0MuBn8tEKDAW+Ohjeh71k2Z/7EieejwAIdQ7soPsQyLyaqBKuRhd9TX4x/w5XmB
	 qNRZJAH0VWH+Gz7ha0agE97H0Z4A1AxQ2JQNLE0DYtrOQWziAmMoxUlBvXpF+fu6h8
	 wg3Flh+X5sjlC1GdNZXFfUdGhddTXMzvQ/iolm1McnIdrn/HgRy7DVYHk3R8MVGbHm
	 QqM+etwfEE2M2cAEyV2qfwO/W4Tq6By4WAtf5V/w6WbS+ps3Xaq4tBZ38saaRcM/vX
	 wjOaQMp1e2iKN3TMR8OAWbPpx4lRxbx98ccKOEJ4cgvxdeCTxk2L0dX6xUwPOvpmWo
	 rs9rfEjuZWA7A==
Date: Tue, 23 May 2023 17:55:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2MlvJV6gocLMBKO+"
Content-Disposition: inline
In-Reply-To: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
X-Cookie: Beware of low-flying butterflies.
Message-ID-Hash: BPKXFEH4MCHQ4YVHRIDZDORQCRC4YGNL
X-Message-ID-Hash: BPKXFEH4MCHQ4YVHRIDZDORQCRC4YGNL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPKXFEH4MCHQ4YVHRIDZDORQCRC4YGNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2MlvJV6gocLMBKO+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 04:46:04PM +0100, Srinivas Kandagatla wrote:
> regmap-sdw does not support multi register writes, so there is
> no point in setting this flag. This also leads to incorrect
> programming of WSA codecs with regmap_multi_reg_write() call.

> This invalid configuration should have been rejected by regmap-sdw.

Does the CODEC support mulitple writes?  If so it seems better to leave
the flag set and just do the appropriate fix in the regmap code until
such time as it's updated to be able to exercise it.

--2MlvJV6gocLMBKO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRs8AoACgkQJNaLcl1U
h9AWNQf+IPYCRW1gnzWLgW1rC4g+MrykjJLRYtWWmcSWeEZXIsXOZOOTd+SIspbF
xq5Zao7SjZqfhKbAzBKNw7KCRc65si32UyccKO+iIhrRUQ3kKn3cCuX4sOuiCWmk
H22WwBb93WnP51cQAMiTMtBa1x+i/W05l4f155sDsj5g/FrP8CqQK/TFxTrGYGLd
nysG9PKq74NEmvYUeOMkGxprnyGeRbfeT7PWTtQJMCfkkNc7DK3mvCWiCrmX2X7k
xDPMDocsnGHBs8b0/sw/+e7w40F77Jxn/vlZQs7jiURWnyocxMGcW9qOMhv/aZhb
GbCKKHEDuCLpeEFOQlarMbKJXRsSiw==
=qDCW
-----END PGP SIGNATURE-----

--2MlvJV6gocLMBKO+--
