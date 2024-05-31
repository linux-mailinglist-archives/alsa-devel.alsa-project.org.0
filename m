Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1F8D6781
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 18:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39AE7B76;
	Fri, 31 May 2024 18:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39AE7B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717174581;
	bh=RH77djBrTwFxe/ywwViYLxao4C1lTcLNgr3/+jlMw7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Krw2rNqiJZPrcVAfxt6P3nyVay1sJLzbKXIH3/5/2f3/l8nMfba4WJvHU0POUzIYp
	 3Z/ymM0of8umI89VavdLWG169Y4BozdAzJF0zm/yYPdcIC+49IhlWKEGGU4mnw24R4
	 C2j3FF+0ugqwxaS9rzzXVZGyvJpuZwdD+IQjddn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E68D1F8051F; Fri, 31 May 2024 18:55:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DC8F8051F;
	Fri, 31 May 2024 18:55:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3CDEF8026D; Fri, 31 May 2024 18:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C659CF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 18:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C659CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TwJWdVwE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BD1362AEF;
	Fri, 31 May 2024 16:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B972C32786;
	Fri, 31 May 2024 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717174533;
	bh=RH77djBrTwFxe/ywwViYLxao4C1lTcLNgr3/+jlMw7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TwJWdVwEKQxLLuT2zhjCTU4ofNhZhMJQVWLYsNllbzmiMq4g+3q/az/Usq4y43LMF
	 hOqKdVWc9tUeRo8JlaOG3viw8wq3006D8Rxih/RtMd6tIkX+7jcI9m3QUyEupqHLb7
	 9/fXTCFvzSKzAnFIyyoQAJl7Sc79Wz2apuktg47kb417rVbeqJUxup0/AHvwrj5R0k
	 JdicKCg+5jWkfBM+/gO/px8hBHvP4bnvaDIlNnSzVr32iJbIuPwq+Htln1qwJS55Uf
	 rQuxZg0TrapwSzjUPs22HW6dEGALSrMySthcq4Y8XGU5ySw0hTiTJdviQTZcsl5hif
	 EoZ1rzO7n4e0w==
Date: Fri, 31 May 2024 17:55:27 +0100
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
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
Message-ID: <5d98d8b0-dd48-48dc-9552-b2906e31ce05@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
 <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
 <822567441.349330.1715936735603.JavaMail.zimbra@savoirfairelinux.com>
 <da74d276-b028-448b-bb28-295de49dbcda@sirena.org.uk>
 <1660761484.701255.1717159615755.JavaMail.zimbra@savoirfairelinux.com>
 <826f6c22-d1f1-42ce-a8d1-2d5cb894a970@sirena.org.uk>
 <1200863744.706237.1717166892907.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O3x7E8WE+Xf+WtR6"
Content-Disposition: inline
In-Reply-To: 
 <1200863744.706237.1717166892907.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: WP6HGMUGWOVXD5G4QUHZALZHVFIPK5TB
X-Message-ID-Hash: WP6HGMUGWOVXD5G4QUHZALZHVFIPK5TB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WP6HGMUGWOVXD5G4QUHZALZHVFIPK5TB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--O3x7E8WE+Xf+WtR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 10:48:12AM -0400, Elinor Montmasson wrote:
> From: "Mark Brown" <broonie@kernel.org>

> > So you're trying to use this as the audio clock?  There's no code that
> > enables the clock which seems worrying, and I'd expect that if the
> > device is using it's own clock the device would be querying it directly
> > via the clock API rather than this.  This all seems really confused.

> It's not specifically the audio clock, I am merely using this
> in the machine driver to let the user the possibility
> to configure the CPU DAI sysclock frequency.
> The CPU DAI and codec drivers already manage their
> own clocks.

I would expect that if the clocks used by the devices are configured via
the clock API then the drivers for those devices will configure
themselves via the clock API.  I still don't understand what this change
is intended to accomplish.

--O3x7E8WE+Xf+WtR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZaAP4ACgkQJNaLcl1U
h9C7Dwf/VLPq1S4H7OOi5cno1DA8yYITCEnfB9hv+QK0u+IGgQEVBH3ZIHElkzjs
Vqj1WunQBboYBEZjSS67nJ4jCvB6G9AWz8D+yWfWP+YDOs08fCFLNG4pTtc+ooME
lkLEVgJedtSHdOscDTWWlntBQJEXcWtEKccBh4BOPdqlb2zV/fJywO/shUPPksfA
ZW7bi8SFI5chXBl+xgKcYaBXfI306bBmQK3ImFZk5o/6j2izLhL703EZXBRFi0yX
2wjSn+Kxq9sMVe7igXvkQ53pQjVLz+tKaqS0YIEKGVs+nKMs/aihz0ie3wk3yexM
dDL8RGtQmKuDLwU9/pZho2FiLBkLfg==
=xMcC
-----END PGP SIGNATURE-----

--O3x7E8WE+Xf+WtR6--
