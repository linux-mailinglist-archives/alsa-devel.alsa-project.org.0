Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C563E15BE66
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 13:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5358A1670;
	Thu, 13 Feb 2020 13:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5358A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581596798;
	bh=7+WcmtACmKdwsFxQPW0z1VOy+GEVYofGDTEoAqqoUNs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWBRkAWLGVoXwchsW7jy1w5gmvoJmS7uyEAv0cCnuOjnhdj7xLNSlG2c2NaanLFFx
	 yULdO78eJYy7TMY0vbHBGwmFIVabWH8N9dqf+3JxV4iXsIYhEjMwzl2bTzkva7Ix2x
	 +1OujfhkEa2p913TS+q63T/tUy4FYx6PLruaVl2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60293F80146;
	Thu, 13 Feb 2020 13:24:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECCA3F80145; Thu, 13 Feb 2020 13:24:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 49B97F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 13:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B97F80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F0021FB;
 Thu, 13 Feb 2020 04:24:50 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 956743F6CF;
 Thu, 13 Feb 2020 04:24:49 -0800 (PST)
Date: Thu, 13 Feb 2020 12:24:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20200213122448.GD4333@sirena.org.uk>
References: <20200213032728.199462-1-tzungbi@google.com>
 <20200213112003.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid>
MIME-Version: 1.0
In-Reply-To: <20200213112003.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, cychiang@google.com
Subject: Re: [alsa-devel] [RESEND PATCH 2/4] ASoC: mediatek: mt8183-da7219:
 pull TDM GPIO pins down when probed
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
Content-Type: multipart/mixed; boundary="===============5766971951741193099=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5766971951741193099==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 11:27:26AM +0800, Tzung-Bi Shih wrote:
> 1. Switch TDM GPIO pins according to playback on or off.
> 2. Pull TDM GPIO pins down when probed to avoid current leakage.

I'll apply this but this feels like we might want to have some general
pinctrl integration, other devices could do something similar and might
achieve some power saving from it.

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5FQA8ACgkQJNaLcl1U
h9CBQwf9G6Kw6ZDBj11gcIMvVGcZ8WaCWk68WUh5SHt4WdlXG4wDDNtdy2puEY34
XgreePBsLqRaanYUxaUzu1hmfrBT1TleVoeeYCiPfMZUvUaesUUb65g/UDVexW/P
9yxMts/Qe9K92fpz/f8GbumofAz2eVW+XPsieSNVnqFHTBYJOyUPgAmeIQMXAE7+
gdMc2bLDs3MbFnT6ukMUdeTV8qn8uP+LR9IFQVXvQ3/E86YfR5ZwJHigIBlmVtky
cmZSzxw9tldEgKWE/zNgiwvhCy6Fr2z7BVS4/FgWaTJIL0NhNr+82hQZcILlmXDb
BfdqWfkkQprBwfqK3UG5B7AxmiVqOw==
=bSeT
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--

--===============5766971951741193099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5766971951741193099==--
