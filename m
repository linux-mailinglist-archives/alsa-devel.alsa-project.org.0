Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD676B4B2B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 16:33:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9F6185D;
	Fri, 10 Mar 2023 16:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9F6185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678462383;
	bh=nUzOTuEgT91ilSzmzilIEFK3iqUy+T792nACm/ObXo8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GyJF3bZhR59inM2iNabunX21qlkTyYmFJsPlkk2MV9atotVi5JmnhsVda/xmtBtAK
	 8uT+C1lNkfeXAGADPDP5JFt1iOtolwA3onIfVRvNaiiJpWquU+46mkhcCxfozq1G/m
	 LVo0vaXZGSHZkgICM++bLQyX8RfhJp9nA7xDSQko=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5985F80236;
	Fri, 10 Mar 2023 16:32:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91264F8042F; Fri, 10 Mar 2023 16:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SPF_TEMPERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8620F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 16:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8620F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gVDFRff3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E2876195A;
	Fri, 10 Mar 2023 15:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2C7C433EF;
	Fri, 10 Mar 2023 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678462312;
	bh=nUzOTuEgT91ilSzmzilIEFK3iqUy+T792nACm/ObXo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVDFRff32CUeg4VYZc0KxwyW7FRibHcCgOsXmEDulirUJ1Y3IyxHc+k5rgu+krn+f
	 LBLRHqN5iB4qujARfr6I9K6XSy+CpZYXKc9iBpNeqJgEQjktyxklC051kSVeXuXp86
	 JVJvV5eicKe6jDyHOv2homy93sYvRn15szXjW3Tj1/dYeFN8Wt6oinxlLREFqNWcDj
	 OiaZHKqvOX2i3j13+TXuGVlappDzZhw+hPOVsmKsc7A50KTP6aUO8ZEAsiAIbyz1QU
	 Bmga1n6munzOp/7VgWSY+hRQ5BxxIuDpQJbVN4cUcijREMpgWaikEsXTllWMHmJTis
	 IaWc+rpQsCniw==
Date: Fri, 10 Mar 2023 15:31:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_present() for testing DT property
 presence
Message-ID: <ZAtNZUifDt/Yl2qp@sirena.org.uk>
References: <20230310144732.1546328-1-robh@kernel.org>
 <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
 <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YQTqPomgC6kqCvBH"
Content-Disposition: inline
In-Reply-To: 
 <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: INM7NG57N6UDCOXOEFDU6VXBKH6YFHGD
X-Message-ID-Hash: INM7NG57N6UDCOXOEFDU6VXBKH6YFHGD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INM7NG57N6UDCOXOEFDU6VXBKH6YFHGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YQTqPomgC6kqCvBH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 09:14:08AM -0600, Rob Herring wrote:
> On Fri, Mar 10, 2023 at 9:01=E2=80=AFAM Amadeusz S=C5=82awi=C5=84ski
> > On 3/10/2023 3:47 PM, Rob Herring wrote:

> > > -             if (of_get_property(ep,   "reg", NULL))
> > > +             if (of_property_present(ep,   "reg"))

> > Bit of nit picking, but any reason, why there are multiple spaces,
> > before "reg" here?

> Only because there was before and it was a scripted change.

Yeah, I don't think there's any reason for that - perhaps at some
point it caused the code to line up?

--YQTqPomgC6kqCvBH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQLTWQACgkQJNaLcl1U
h9Ap4gf9HaaXZcTMkFjkbHzWE/oyzg7IX24irsYTqkShQjQs79+TcFLpH/R2wAJP
D5Op6bvPzyNokg0rlIA1bPuTtJxvAOgboa9LobpsLRNso9ezIW/7c+IXmDfa1ZAB
eWXBs3HN4IXKkDybSV2eyC5e9wckRJQfOAx2OTMeT7AmNs1nWTw4Ls6sIbAKxh4o
osLdFick4HeMgxdZtNeTFr9dvlGqjkh6zR78oavbu132XUlvfqctErcIQ9qh4w7Y
8yGUubnPOeOfr54Z5iT1MgcgLXXiyuziWdWaRGupAV8WqKmf8O0HySGKr1w3IVYP
vyuuWuc++z0Kg8zh15H/vsdrTSVlUg==
=7fFJ
-----END PGP SIGNATURE-----

--YQTqPomgC6kqCvBH--
