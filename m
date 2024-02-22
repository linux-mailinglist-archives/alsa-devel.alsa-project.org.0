Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28249860333
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 20:50:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C3A820;
	Thu, 22 Feb 2024 20:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C3A820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708631416;
	bh=/biIcgNJEP7ZYJvfwCxGBQX0PKEdb1APj1B3+4z4jGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9xm0Hxt7Ftlmjq+DME+W5CNdgFvXWnQ/m5Anre7bycO8rjf4HhV8iVLGuF1byCRG
	 UCaaGR7V1SMTGbR6NpImr+4YbzGuBh0Hkif11gTYh5XFFcz4vpSaNDrLE2Hq0KVxx4
	 NKJLSuQo2Wi4un7DTnzQ+/FbqaD6btUIqtkg9xSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A95F8057B; Thu, 22 Feb 2024 20:49:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E910F805A0;
	Thu, 22 Feb 2024 20:49:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AFD8F80496; Thu, 22 Feb 2024 20:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D970AF800EE
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 20:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D970AF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RL1TsQWi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92CA1632DD;
	Thu, 22 Feb 2024 19:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C85C433C7;
	Thu, 22 Feb 2024 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708631368;
	bh=/biIcgNJEP7ZYJvfwCxGBQX0PKEdb1APj1B3+4z4jGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL1TsQWi5zLiVHME7COnSIm7aEWD8sYvD5440/Bytbd6H+G6yqDboC3Yu/A027Mt4
	 sN3YRz4h0cwJeRZd6bVXL4+dZAdDS9DKmbkxDQ20617oHXC+s8OiYBbLNrM7iuyr41
	 PzmAb5fryB41hQSPt1aJz66rD8PaOV3RsbfT8rew5QEDckmMcgz3pKT8HPu78gzBU0
	 r9PGXvK+RLbvhBeVb0zwUaSlTZMpusogfU9plTUoZgRb9f9S9rsL1/YEm0egsViat9
	 +65YURcbcbbnUf/+ZVnPxK4qD/PGaFKzRwCcUS0+15vPxG3li214z9NY3oF78n7L3N
	 Do01hRalwESFw==
Date: Thu, 22 Feb 2024 19:49:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn
 widgets on SM8350+
Message-ID: <cd300d58-bb6b-4fc5-9170-66b5df89b9b5@sirena.org.uk>
References: <20240129143534.109196-1-krzysztof.kozlowski@linaro.org>
 <20240129143534.109196-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EWbHII0jzV3QWW/B"
Content-Disposition: inline
In-Reply-To: <20240129143534.109196-3-krzysztof.kozlowski@linaro.org>
X-Cookie: Don't vote -- it only encourages them!
Message-ID-Hash: L6WHSZJNNZHKDFFHUOVC6R6R2ROVJ7Y4
X-Message-ID-Hash: L6WHSZJNNZHKDFFHUOVC6R6R2ROVJ7Y4
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6WHSZJNNZHKDFFHUOVC6R6R2ROVJ7Y4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EWbHII0jzV3QWW/B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 29, 2024 at 03:35:34PM +0100, Krzysztof Kozlowski wrote:
> Starting with Qualcomm SM8350 SoC, so Low Power Audio SubSystem (LPASS)
> block version v9.2, the register responsible for TX SMIC MUXn muxes is
> different.  In earlier LPASS versions this mux had bit fields for
> analogue (ADCn) and digital (SWR_DMICn) MICs.  Choice of ADCn was
> selecting the analogue path in CDC_TX_TOP_CSR_SWR_DMICn_CTL register.

This doesn't apply against current code, please check and resend.

--EWbHII0jzV3QWW/B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXpUIACgkQJNaLcl1U
h9D1Zgf/RcMhNetO2ATzqWBDmwci8+KCJqNljcildSvTVmLjLeJDddwfFFNIeC2e
4wcYVVXcf4+Or3oref1uYZZl2azhRSeZ59ZM8DBEq6r5w9jxLcSVf/dNQXgg8E5r
DLh+STU0FrGHTcJAw1wtf1UpV4XQMUHBwT4nmc3mCfZt5AyJ4gDI42xYR9u32Cfs
dEbYWH06O/7uplxQxEPYCRt/g9BB9nl6xrO8F35bTUF+6iC6o/MIbPEXVJw3pFJU
+xM/TUDbYb2mEwHmYFffBqDfVRMbm+XPe/vvlfsQRpQTMH3vpNpDQdDJ8HGpoaKD
jwf849zak/JTRbxfypp61rHNd3QgHw==
=lyOj
-----END PGP SIGNATURE-----

--EWbHII0jzV3QWW/B--
