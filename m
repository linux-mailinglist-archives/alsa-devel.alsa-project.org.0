Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B67C8059A8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 17:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E42FBDEB;
	Tue,  5 Dec 2023 17:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E42FBDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701792895;
	bh=ru2Yf4e2J+5cS2zc1QOY6JOr4Q5ZMrCeka8oIoe8iAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E/4spM8sLgo/2soDDVsI1h3efjUQLl7RajQpKdHrmPLUUMeJXx06foHPHXmH3mz7z
	 iSFHrXSW3j/ulF9iDj3Mz8v5lqsapu6AQyDZKl3LtgJLUG/tP1Gl9QzrBwkoV5dBES
	 vgoWD7fquL/UThlBYYfqqjad04FztadGJNkiOnYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D95D8F8058C; Tue,  5 Dec 2023 17:14:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1199DF80579;
	Tue,  5 Dec 2023 17:14:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4EB6F8028D; Tue,  5 Dec 2023 17:14:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B5DEF800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 17:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5DEF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CkA/wmYS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C43FF61800;
	Tue,  5 Dec 2023 16:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAF4C433C9;
	Tue,  5 Dec 2023 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701792840;
	bh=ru2Yf4e2J+5cS2zc1QOY6JOr4Q5ZMrCeka8oIoe8iAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkA/wmYSZZ4ekKAvd12zaT1b3VgxWrPSB/VMN5QvQQzuZh5GoehADzQVGrABSmUSk
	 sqC5OV922UTccz+YnMFpwCqWyosrrjhxs/x1f9D8H1rC+l//ey1XblksBplk4noFlW
	 L4bEs0arekh5l8tGAYd4ntf5ToSKcq+roU6Qio2IOWLj7CT0AN7QYsQbOmTvmmdGC4
	 BtjnuhDMjHv2B9o/L68tLpHFRhJkeo8sss+Bdw3zg1G1VYErimy8vCMU3U2xuZvy4a
	 2a6qKqavUaKIc+43DCIN3mWIl1Jup8yT6SBNig59OTvIV1H20NHiLDhxyiLaVSmjeb
	 Brc52So+XpBiA==
Date: Tue, 5 Dec 2023 16:13:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
Message-ID: <aecaaaff-9a4c-4d1f-8457-5afdb7803d94@sirena.org.uk>
References: <cover.1701733441.git.soyer@irl.hu>
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
 <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
 <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GodoWbeZVkkSioJV"
Content-Disposition: inline
In-Reply-To: <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
X-Cookie: I've Been Moved!
Message-ID-Hash: GPANJN475NENU37VUIPSD2ERYLY6WHRU
X-Message-ID-Hash: GPANJN475NENU37VUIPSD2ERYLY6WHRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GPANJN475NENU37VUIPSD2ERYLY6WHRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GodoWbeZVkkSioJV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 05, 2023 at 10:01:08AM -0600, Pierre-Louis Bossart wrote:

> >>> +static const struct dev_pm_ops tas2563_hda_pm_ops = {
> >>> +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume)

> >> where's the pm_runtime stuff?

> > The amp stores its state in software shutdown mode.
> > The tas2563_hda_playback_hook wakes/shutdowns the amp, not the
> > pm_runtime.

> My point was that you have all these pm_runtime_ calls in the code, but
> nothing that provides pm_runtime suspend-resume functions so not sure
> what exactly the result is?

It *could* be ACPI doing something I guess...

--GodoWbeZVkkSioJV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVvTEIACgkQJNaLcl1U
h9By3Af/UZHQo24BocMAB4/saETBOo5GGwsh7kVw55UIvFTRy65mXMVBsOnLmP3J
x6TBjezeo/Zi6COh1+dtdzCfO2wEA5j6sW95WMvsIlj6Z1rpwKIfPTk4kXI7GxIz
a3I/9acM3/W6UZizagHBWXK0QgQuCi/fL/1aVh8VYwCGKi+5MOQxNftGfiYrXpJh
X4V8p+vTxR+ex/CRNi6lgrM2vEnk9fFfhAesugBjCN+J1KJ2gPO1oL+5SiHf/sJ/
rjOebOBFlzOru4UhBUjaTSXCOoVFpgJ2eoimKQzmtgo4pHq1TmTKWlSYEo45wk4p
QKIq5JCEqxA4Vl2tZ/3/KNmkckGbAw==
=x4+9
-----END PGP SIGNATURE-----

--GodoWbeZVkkSioJV--
