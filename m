Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C11D84409F
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 14:32:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1689FDE5;
	Wed, 31 Jan 2024 14:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1689FDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706707946;
	bh=/wX6XvVShZF4f+RJM2tJZ0XC0594GygcaRPbj/ixCk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u2sYiuwwlXlSNn0FRLbGlqDGPWL0UBofIFELh3Qn5RwnSxjv/4dvmlEDQDKATnL7J
	 bip771A3wqAclQcmeCnmHNgG1u1rPrOTFF4pkHSVvQrPiuSQHw0jFEm7YiVFhHWZXJ
	 7ZCTC7pLGageeETQEWAvnOoBWpY8kaurcizaFT9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8791BF805A9; Wed, 31 Jan 2024 14:31:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B0DF80587;
	Wed, 31 Jan 2024 14:31:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84009F8055C; Wed, 31 Jan 2024 14:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 391CFF804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 14:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 391CFF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FZ6rqX4H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C959A6175F;
	Wed, 31 Jan 2024 13:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85D6C433F1;
	Wed, 31 Jan 2024 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706707895;
	bh=/wX6XvVShZF4f+RJM2tJZ0XC0594GygcaRPbj/ixCk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZ6rqX4HHl5QPe4BXP9ckVtW/dcev6Rq6IzWVYJDhFivWx7cFifDs1+R9FdydacKM
	 CLnyPI/uws4gRcxB08g8zmEwBYedkXliswtYEjoK/YMTOeTE7tiCBwqigWCrAo9o1L
	 AlrLuZRsk/28HfWdPg/FiADJxaLl3Ze8Xg3N896RV88GixeqJMj/AXfgA3mXIK2XbY
	 KLwTYK7Z/sqitkr8m9Gg4JXdZLnT/bXByYRaP3zxHaT2Fr8s1NmfAuGU0yzaSGn+u8
	 GRH0BLK1sPMhdlu96cWuBrUYCVX/3De0cQKgX0NhIt7fh8qU6Q5KcozDtJpSjCfT8s
	 9/AXjhzoQG96w==
Date: Wed, 31 Jan 2024 13:31:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Message-ID: <7a65b551-817d-4f51-8eb9-bd8b2f93dcba@sirena.org.uk>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5U5lAS5lCFVLuVnC"
Content-Disposition: inline
In-Reply-To: 
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
X-Cookie: I will never lie to you.
Message-ID-Hash: CVJRKNQO5SJ6ZOJMAPOSAMGDRO7KEI6N
X-Message-ID-Hash: CVJRKNQO5SJ6ZOJMAPOSAMGDRO7KEI6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVJRKNQO5SJ6ZOJMAPOSAMGDRO7KEI6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--5U5lAS5lCFVLuVnC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 02:17:54PM +0100, Linus Walleij wrote:
> On Wed, Jan 31, 2024 at 10:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:

> > This is a different problem: it supports many users enabling the same
> > GPIO (in Krzysztof's patch it's one but could be more if needed) but -
> > unlike the broken NONEXCLUSIVE GPIOs in GPIOLIB - it counts the number
> > of users and doesn't disable the GPIO for as long as there's at least
> > one.

> I don't know if the NONEXCLUSIVE stuff is broken, if you mean reference
> counting isn't working on them, then that is by design because they were
> invented for regulators and such use cases that do their own reference
> counting. It's also used for hacks where people need to look up a desc in
> a second spot, (perhaps we can fix those better).

Their own reference counting or whatever other coordination they want -
the deal is that users are responsible for their own coordination
whatever that might be.

> The NONEXCLUSIVE stuff was prompted by converting regulators to
> gpio descriptors, so it was for the greater good one can say. Or the
> lesser evil :( my judgement can be questioned here.

Right, previously we were working out if a GPIO was shared by looking at
the GPIO number but with descriptors we need to get the GPIO before we
can do anything with it, including figure out if it's shared.

--5U5lAS5lCFVLuVnC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW6S64ACgkQJNaLcl1U
h9Bm0Qf+PFOwuKiFI40ez5qHeItPwuHuhqbENB0dhjJvdchHy3Bdgsm1MCOMCTZd
6/cO4FuB77KP/slLSj7ICXs76V7dBj+b44PHcYb8WLCekOT8Sqj5Q4CJTjdw0qSp
fAHhiisIim79bkwRPZgsDDqBg3tPk84eHCE5ucSRJKd620AHcOMT5TNPUWLsrREg
btTfJTz5iioUdkoMfH1nbKWhhE9SeSP7DDnQ1EHb4kT8GEe9W7rvxtiky7BVK0FP
FkXKDzVduVT1NWiWk6tBtoowFaiiG9r5Oj1xQh0W/o7MBJPE5GqAEMMWrgaop/93
k0CRefl+PXGzcKCbK0TE9DN/8NVk6w==
=M89N
-----END PGP SIGNATURE-----

--5U5lAS5lCFVLuVnC--
