Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8C1442B3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:01:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8BCF1668;
	Tue, 21 Jan 2020 18:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8BCF1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579626084;
	bh=nZ7dasIX6rwYCRq/VU2WN6jGwsCHNlLarYn8gMzLit8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WojQbV2qZYlq5Mr/kal+ztIgxf/31E+fEdP1mkXSIEi2JFNnKnP+mzzVaCT0TdfxO
	 3MxxqD/sOHG4f6VU9oAHV2z4jUfQ63r2ArOi1TF4ACD7Z5EG5HYUYNwoKYndjZ5Q6S
	 hWhuXOcMxtQJ5CVEpWRLmvuKTZ9Lb56iZT2hQZS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6BF0F801ED;
	Tue, 21 Jan 2020 17:59:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3575AF800E7; Tue, 21 Jan 2020 17:59:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id BCA05F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 17:59:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA05F800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38E9230E;
 Tue, 21 Jan 2020 08:59:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABA9D3F6C4;
 Tue, 21 Jan 2020 08:59:26 -0800 (PST)
Date: Tue, 21 Jan 2020 16:59:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Message-ID: <20200121165925.GH4656@sirena.org.uk>
References: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
In-Reply-To: <1579603421-24571-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: amd: Fix for Subsequent Playback
	issue.
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
Content-Type: multipart/mixed; boundary="===============6558018729216936587=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6558018729216936587==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline


--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 04:13:35PM +0530, Ravulapati Vishnu vardhan rao wrote:

> If we play audio back to back, which kills one playback
> and immediately start another, we can hear clicks.
> This patch fixes the issue.

>  	/* Disable ACP irq, when the current stream is being closed and
>  	 * another stream is also not active.
>  	 */
> +	kfree(rtd);

This free looks like a separate change which seems good and useful but
should be in a separate patch?

--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nLewACgkQJNaLcl1U
h9B1+gf8CwB3aqHMAKHEgAHRutMujXPYif+JPjkD1gl9Cp8EFmrOkjwAO8ADVa3U
IhZonqAQvpX8nuRp2yq+GMTn0M3wKQHrZ8SZzFoY2az5dujgpV9shBrcSRAQa+vM
rnYexlnHXPlr/FFYHhcSlqPFgglHcZLJUIuioBk3OxoPrlXxnAcbhBP9zCpSZex3
mMwT3vlLmOTlhHkBhWNDGH7l3z5dd8N43iFMNCQP8zMEwggCkEPC4IYrLidXVORb
YE7fkOtRgRKJQhDjKN7QaH8XRSbbGdGK+9FthNOJXteCkp/VkU2ne7Mt0etqKDa/
ulqij1ZBM43yKQAhB8WIdYCQIw7oYw==
=m2Ma
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--

--===============6558018729216936587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6558018729216936587==--
