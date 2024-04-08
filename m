Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C389CC01
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 20:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58AA423E0;
	Mon,  8 Apr 2024 20:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58AA423E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712602444;
	bh=yS6GxyZzqXB2+xOaIOWtiFJnwGVsW8GrqXSYsIS0f/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gjdQJDih5i3zxNZbfrmMtk5lxa1m6KjWrwmZEwcEVRz0g8jg4ZE6o1R0mMGgy9QMS
	 qW/rrpBUa3bSPZ4SlglhWXXLTDBazYDNIW9RteSvMCiKSjHcLqPhmwrpV+rUCwtTFl
	 0Dq8nDCYAbQ92ngFA4hQ+pQ5kRQlb/r1EDnwcgBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B2F8F805AD; Mon,  8 Apr 2024 20:53:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B4DCF8026D;
	Mon,  8 Apr 2024 20:53:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A71F8026D; Mon,  8 Apr 2024 20:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A55EF80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A55EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SPXRMtNI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14BCC613CA;
	Mon,  8 Apr 2024 18:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339BFC43390;
	Mon,  8 Apr 2024 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712602401;
	bh=yS6GxyZzqXB2+xOaIOWtiFJnwGVsW8GrqXSYsIS0f/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPXRMtNIsALYYJhM8h3E4vweAGjKe8MxQZ+iRE6ReyAF+BQ0nbYrjR6r32jDl9k+P
	 TZeuHRAjGFNXHgRa7hyfTtMW0Q0TZt7/uz9M3mC0juDNPxtHgeCCVnhgJAO7CAG0OA
	 z0K4I/vFqZlAwl4N0O489RTdK0H9KauoUJHU4CA2UcQyWd0qQJ29IwVG3cflU/A3n2
	 3N2bKKh1zSFGaXT2+nXt9NiE0KPuHLeG5zj2v2Si9Zn8sVVuaAlZeu6f37Mxean9xG
	 MFKQ9PJayxWDoqBhhpDR2Gr3TN86dK8wvJps/ASKAQo+lyDB73ZMd9Cd9IC5Uk+loy
	 NG0scg4BII4wQ==
Date: Mon, 8 Apr 2024 19:53:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
	lgirdwood@gmail.com, conor+dt@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	kernel@salutedevices.com, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Message-ID: <412306b3-e428-45ac-8bf5-6121f638272d@sirena.org.uk>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
 <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
 <20240408184744.nfktcppdqewurmgg@CAB-WSD-L081021>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HWk5+hm8t/wej2SK"
Content-Disposition: inline
In-Reply-To: <20240408184744.nfktcppdqewurmgg@CAB-WSD-L081021>
X-Cookie: Drive defensively.  Buy a tank.
Message-ID-Hash: N6MNL4YLMVQP2TFR6QKEVK424ZYWK7EX
X-Message-ID-Hash: N6MNL4YLMVQP2TFR6QKEVK424ZYWK7EX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6MNL4YLMVQP2TFR6QKEVK424ZYWK7EX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HWk5+hm8t/wej2SK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2024 at 09:47:44PM +0300, Dmitry Rokosov wrote:
> On Mon, Apr 08, 2024 at 07:45:00PM +0100, Mark Brown wrote:

> > I would expect that the place to fix names based on the userspace
> > configuration is in whatever userspace is using to define it's
> > configurations, like a UCM config.

> Honestly, I have tried to find a way to rename the PCM device name or
> mark it in some way (such as using a metainformation tag or any other
> method), but unfortunately, my search has been unsuccessful.

I'd not be at all surprised if there's no such facility yet in whatever
userspace you're using and that it would need implementing, I'm just
saying that that seems like a better place to solve the problem you're
seeing.

--HWk5+hm8t/wej2SK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYUPRoACgkQJNaLcl1U
h9DJUgf+PtNQ01uTKkXCzFIX0QP1JVOK6eTnelaoRvequ7E9jlgWqkpwcmnmHGcG
7JaIcW2gK6BEj0kLODIrk5HrWWvPmPzVkTYOanJ7FWeTtCV8bXJSpU3Y79Ywy5VI
+Z3BPEH11EeIFF0PwWIH4p/oeUIJ4bgZ6p6IRujoBP1hY0bMlrkAlh6u4nOAM26O
6vdyVjM1Tt1JU8OSBBwu8Yi7LwrjWkLve4fY+kr0ZmNBCpDWNzNW8SYc9Ruusjae
rINMvZMEz886w85mpZ9km4tSVJmOUg1cEUBcQuhXufjdwHvk1L0QgcvbDG/5g0ai
0q5+Vy4UezOdjjATWlHxdZEIEOh1HQ==
=AHCz
-----END PGP SIGNATURE-----

--HWk5+hm8t/wej2SK--
