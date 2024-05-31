Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D98D629E
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 15:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA6AE6C1;
	Fri, 31 May 2024 15:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA6AE6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717161306;
	bh=gbORHtwfINA/7XdxHmGEDfKRg0KInm4NPfWu2fzeZAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rMmG4w9b2rCgZo6fyMwAFtJa9YGWbz6Rp5FY2k+aVpaFzzMIe12JMXmUXmXPbG9HY
	 syubVAzEh8cjr3uYPW+KjuTdK3yF136d8FhGEJnobFfE0olg8uGvirYqvIpvq70nDa
	 G/fUvlSmgIc8uyJbJIVoY35ZkqJnhoN8zGdLQfCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D194F805AE; Fri, 31 May 2024 15:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C900BF8059F;
	Fri, 31 May 2024 15:14:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8ECBF8026D; Fri, 31 May 2024 15:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDB77F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 15:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB77F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S/p5/BYH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F175CE1C43;
	Fri, 31 May 2024 13:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C100C4AF0B;
	Fri, 31 May 2024 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717161259;
	bh=gbORHtwfINA/7XdxHmGEDfKRg0KInm4NPfWu2fzeZAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S/p5/BYH+7SLVMMU5PV73oOe1faDyRKMjLR5ONU3OakdDGYY9jCufxQxC+5+R2R0l
	 u+UIe1VqdRF55y5E2DzojmYPOQLv97xTZ6akCM+kKof8vK4+q0zblr4F3moIc4M8Z1
	 hpyhVpLawfs1r9rtV3LP6cmzqBGTgciX7nTub2eopXQg8ZxMMH6T/mVWMTj1rAHWD9
	 WgpXwL/IX+7/8lUz20VvcKfGUKc8ZuiH0iYYKxxobrOGkIe6EkrbueKlazOR/Pp2Rt
	 hvN1d/fyOeFobUEZbOXT8gGTw09MrI1tdEAXc6ptHsERFuniGPiqhKvdWX89DfT7lA
	 P6jzA6VExq+4w==
Date: Fri, 31 May 2024 14:14:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound <linux-sound@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KygPM2XsMX13VSvX"
Content-Disposition: inline
In-Reply-To: 
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: ROGDMAWCN6HCGDLD6TLLSBFMXBRDZWJV
X-Message-ID-Hash: ROGDMAWCN6HCGDLD6TLLSBFMXBRDZWJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROGDMAWCN6HCGDLD6TLLSBFMXBRDZWJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KygPM2XsMX13VSvX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 08:48:04AM -0400, Elinor Montmasson wrote:

> Then maybe it's not be a good idea to make this compatible generic
> for this contribution.
> The original intention is to bring support for the S/PDIF,
> so maybe the contribution should focus on this use case?
> In that case, would changing the compatible for "fsl,imx-audio-spdif-card"
> be acceptable?
> "fsl,imx-audio-spdif" is already used for the `imx-spdif.c`
> which does not use the ASRC.

Why not just use the existing compatible - why would someone not want to
be able to use the ASRC if it's available in their system?

--KygPM2XsMX13VSvX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZzSUACgkQJNaLcl1U
h9CI/gf/Xn2/xlVXYFjqqRcmEeA+Mmby4XlBih17KdiGdDQeHIPD9tnY3ub27oEm
Uz2RM669ae1CKI/GTYYiZ1bB97E80YvV7vH92KowbeYrNnMK/un2WfCc4nofGAMj
ETU4lvrazJEj8xLQMM5XT+9zGSrd24cyJIwATqPD3NwNFOgZ0TncrCx7f7j2Hswd
WojlP7VZdmX0Ru2XpvjmnVCmDbaxZ543qbRFSp4+rIrWKGTUHowxahzaDbhziSla
BmX1BjJK0AW0+WnOS/ZaCApM8hQHxq6s/aFreHlth67DHmUtfsQtdIBUnEJJbRn7
UvwuEy+mXzr6YIXOjhrobfvp1XF/HQ==
=dJiZ
-----END PGP SIGNATURE-----

--KygPM2XsMX13VSvX--
