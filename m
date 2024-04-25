Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B928B183B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 02:59:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F3C61D5;
	Thu, 25 Apr 2024 02:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F3C61D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714006753;
	bh=ieGhYtG2g3/12L0LUEaCPkUzRxfucBkJXELVtQElB/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JNVR5ONz5B+YhvfvyMuZK++tZaFKLuQZ6cXFMzR4d6QRg35d9Ip43JnRn4eKjWabm
	 DYxSqZA8W7xhE529d3IJT2dOjUJ/dN6sV2B6X2fxzYw3wJ0toid2Ys1TBtJhAnsT8a
	 NEKnKNfMnlY0RIH7sosGT86d8LlRUixdg+m3cGcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B6D7F80589; Thu, 25 Apr 2024 02:58:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32721F8045D;
	Thu, 25 Apr 2024 02:58:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6930BF80423; Thu, 25 Apr 2024 02:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5447FF8003A
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 02:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5447FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MMS5vYGQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1245FCE18D3;
	Thu, 25 Apr 2024 00:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0139C113CD;
	Thu, 25 Apr 2024 00:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714006702;
	bh=ieGhYtG2g3/12L0LUEaCPkUzRxfucBkJXELVtQElB/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMS5vYGQrb2MZA3RaQKbV4Lqduqmsw0+pthcKCXdHnk5eZjGAIeJuFdehFXXDgN3N
	 mVn5m3c09YpyiKpmgV8fuwpLvJw86pjSv4QwfUIHRHUIXRFEF20zb/vXKnO8NtunWA
	 U+UdFaiMpQnK4ScRnpIXSOE0dgbuPw93SHm1OI7L0TwIn7IdJarFwa9ujfIYY0ZYPO
	 4iaLSsRmco0v44yGiEJTGHwZBt3NjOTzg0XvFpSUH+j4wir7xemKOqM8aCG/34Q6TP
	 n5bqe00/vF9QXBUD/G7NPbQ6MO320goTVlMB6NSlL4KnYl3LBVw1DPcX0uXyhNLoVE
	 Gn14ep6aClvnw==
Date: Thu, 25 Apr 2024 09:58:18 +0900
From: Mark Brown <broonie@kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v4 68/71] ASoC: Intel: avs: es8336: Switch to new Intel
 CPU model defines
Message-ID: <ZimqqtNxeNPAYnJe@finisterre.sirena.org.uk>
References: <20240424181245.41141-1-tony.luck@intel.com>
 <20240424181550.42466-1-tony.luck@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E32mvQqMNueXGFVT"
Content-Disposition: inline
In-Reply-To: <20240424181550.42466-1-tony.luck@intel.com>
X-Cookie: TANSTAAFL
Message-ID-Hash: 7SZ3X5HFMKFBKLUZGED7XEXUXOTJAVTJ
X-Message-ID-Hash: 7SZ3X5HFMKFBKLUZGED7XEXUXOTJAVTJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7SZ3X5HFMKFBKLUZGED7XEXUXOTJAVTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--E32mvQqMNueXGFVT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 24, 2024 at 11:15:50AM -0700, Tony Luck wrote:
> New CPU #defines encode vendor and family as well as model.

Acked-by: Mark Brown <broonie@kernel.org>

--E32mvQqMNueXGFVT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYpqqoACgkQJNaLcl1U
h9ACyQf+PzrGpxX4H1xd/ifpOXOFK3ZiBbC9zJKm4uNj/qbml5F6d8h6jRi9JDdt
YLMES3X8Xb/XwviletXFrjCKPVydEuEovntVr7zrIYHB8pT3pLiUKO8i7+oRWs8M
6dULTZe1TctUQdGigUzHdnwthwifqJhKztgOF7aRzfoH6XSh4X1ukIVdjQhpYJf1
/zpsaWmMzZOaAqCAmVVXElrTdm8U46jONmC/i3D5V1S0Qyq2ohNFLNHcK6Hhv6fi
7aIe8Unn49wJC2bCu7ex6RPe1ucoMdNRISgNWfKgV0XpuduAKwmIDqO1xyvk5Fw/
+ZGemR5LPlZfdV8ye9x0wHyv8aL2Bg==
=CCkV
-----END PGP SIGNATURE-----

--E32mvQqMNueXGFVT--
