Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1533D3B92
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 16:02:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0CE1725;
	Fri, 23 Jul 2021 16:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0CE1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627048944;
	bh=gtOq6WhWlRMQEG1wyFj0l8XWjIydftj/Y35aNv9Ibuk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pma7AWxcJlCoscm316NN2za0leI8RUSI4B5t/VbbJDc9i+euGOmeyLEar2bHk1yeo
	 xhhc9xV9/jfGjUyhaHpRYIJZCYcNI0xgAdtN83ClO81diboOeyw+HhJH3c+3rrPnYu
	 g14g6sqDKN19s0pDkIJMyXd3zntHGGxQeu6aaRH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99FFBF804AB;
	Fri, 23 Jul 2021 16:00:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D070F804AC; Fri, 23 Jul 2021 16:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 475A6F800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 16:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 475A6F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rARwCSNR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30A8060EB4;
 Fri, 23 Jul 2021 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627048846;
 bh=gtOq6WhWlRMQEG1wyFj0l8XWjIydftj/Y35aNv9Ibuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rARwCSNRKEfbzSjpuZ6yueEkwaeCJSCWCLxUA2SGzRRqVvxsjb99HruHmX2f3ITUA
 eft2dA65etzzcg7JolVO+XM7/q05X+JndqNYUmMiLyoXOrl040R8OQIgT7L/o8d3qA
 40yIddoyRMeayS4+bmoMZqsWWiCRL9doFnGphEx3cYh4izcHctlCGWTyapSOzbuKrM
 MrTuh3XJ9r0M6yJp/OSJYdeJh+1P/wee7vb0wdFkX6WVKvyElxjB+Odh/pnBYp+R0b
 b5q8145hLKg8XSv6JBuZ655zW9YdPh5oyGn3GYPSo/4EdjhkDd+gORJFAThbW26Let
 izoulGQ23B7tg==
Date: Fri, 23 Jul 2021 15:00:39 +0100
From: Mark Brown <broonie@kernel.org>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Subject: Re: [PATCH v3 1/2] ASoC: amd: Don't show messages about deferred
 probing by default
Message-ID: <20210723140039.GD5221@sirena.org.uk>
References: <20210722132731.13264-1-mario.limonciello@amd.com>
 <20210723123847.GB5221@sirena.org.uk>
 <SA0PR12MB45103F60E23D6BE8CF7E603DE2E59@SA0PR12MB4510.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <SA0PR12MB45103F60E23D6BE8CF7E603DE2E59@SA0PR12MB4510.namprd12.prod.outlook.com>
X-Cookie: Integrity has no need for rules.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "markpearson@lenovo.com" <markpearson@lenovo.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 01:04:51PM +0000, Limonciello, Mario wrote:
> > On Thu, Jul 22, 2021 at 08:27:27AM -0500, Mario Limonciello wrote:

> > > This isn't useful to a user, especially as probing will run again.
> > > Use the dev_err_probe helper to hide the deferrerd probing messages.

> > The reason we have these error messages is that they are very useful to
> > users if they ever find that the device isn't instantiating due to some
> > missing dependency or something that leaves it stuck in probe deferral,
> > they give some hint as to what might be wrong.

> Right, but they should be at debugging level, if someone has a problem they
> turn on dynamic debugging for the module and then can see these messages.

Your commit message says that reporting the error isn't useful, I am
flagging that it is useful to have the messages be available to people.

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD6y4cACgkQJNaLcl1U
h9Dl7gf9EwtHg6Jq5Oc8xZqGS3b1Kfc+fqNmXfpv1/0NXIKa/hOJ0hBu66ssoBeE
Y6RRvEmsMMjYgyAavhPkm8fhBy9KopJkVpKx1rHoei6R4nGuxHDijT4baC6dOT9n
GKUioqcKo+E5b8zZ+CBv+pkaejDu138/RBRnjNepjwtaaRa2m5xmV7St0lyCzvnG
cuogRLKm3m65SphnfPZz3CO4TdqwtibbNUjkFbJYhmhDMoirJz2tuOO+66R+fL9c
GC5tPK4NB5JO3tu0I/ZCUwxNAe4IScjsSv3DC0q6ZR+fBsQhyDJgeXNRppvwXPG/
J+AvvEmddNGms2U09LSSWGnevgpF6g==
=h35f
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
