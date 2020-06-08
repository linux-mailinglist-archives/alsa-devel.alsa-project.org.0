Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1261F1804
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 13:42:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29C81663;
	Mon,  8 Jun 2020 13:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29C81663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591616561;
	bh=x4taCFMl1JSd2Q5eNsTgPag9K1UCnAlZgI2Ug8F0LTc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1CsKTBrSc5sYe31HJtuESMQfv/73SGZd3U5aIR2OqNjDgYcY1nji1aeWzjW/arzE
	 G8eWeUja8oFwEWxMGMRNUka14MHKayDlOZU0trEj6NlLRNWYvHaoeJoTBdJrZx9cGD
	 9xi/+kTm/sfTww04Hcr4RlW+FakQqb9jfHMo4YOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFEF0F8021E;
	Mon,  8 Jun 2020 13:41:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 484FCF8021C; Mon,  8 Jun 2020 13:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 523ACF80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 13:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 523ACF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rIRuyu7H"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57A152074B;
 Mon,  8 Jun 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591616452;
 bh=x4taCFMl1JSd2Q5eNsTgPag9K1UCnAlZgI2Ug8F0LTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIRuyu7HoF2N+aUEjIce4hAevgRqJwI+BsLOC3XtBOVLmgs9MWQKZAT5QGmDr5GKf
 fu7pg5IOce3RteJB6v7iXvzw0IRjCT8RWz4XrueqXh2wC5nzznCETcsHW8GeosgrBS
 MxsLKGoQ6TbwarH19XC95Pu9353pbL+po/cfNqx0=
Date: Mon, 8 Jun 2020 12:40:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
Message-ID: <20200608114050.GD4593@sirena.org.uk>
References: <20200606153103.GA17905@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
In-Reply-To: <20200606153103.GA17905@amd>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, trivial@kernel.org, lgirdwood@gmail.com,
 khilman@baylibre.com, tiwai@suse.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com
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


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 06, 2020 at 05:31:03PM +0200, Pavel Machek wrote:
> free_irq() is missing in case of error, fix that.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7eI8EACgkQJNaLcl1U
h9D2oAf+L+75A6sm74wpOyUZsv7DPH8rJApbMWamWaaL7Zq0ZrwKsFecGUq4jP37
FvyBa8xpKWuEbPQuvtG8XwFUMjy/VBn0FgKhjbetB7+sUrQg+erx4XzY81Nq5VcG
Ov+61cWUPIKpY8Ysnj+xH1W+b5nY5EOsBfFvjNNsE3g1JadihgZrcAGdOBK3cy/7
aS/RStZcQedRmxpIIQvKhwr4j0Am1X8D2lPjFqs7hVl+g9I3t1bvKYdW/Y679FBz
HgwoXfEOkrODZtQsuMLGAqYRbyGjYKzAesmp892xPWqM07MchsB5JaMl4I81bwkO
WndnmsoTH4bOw+HPhgwcIRVT/FOqtQ==
=yNKv
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
