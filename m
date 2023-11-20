Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6FA7F1878
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:21:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19A88EA4;
	Mon, 20 Nov 2023 17:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19A88EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497263;
	bh=zPI+e21nyYjzMEzKo0SN9jHwcF4lz+sz54brvdC2b8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+WyMFbdyNshq54RORy2XEdVXw18TswXPN6D75qec0CaGIPrcSJPbmmqzlEQLZxOu
	 wX+0sDn6VJ8ONCqnlfENWz7q7o8AyHWAIZEXdPWPenwJ2yQTByFlHSR2TIqpkjUust
	 ub/sBzTsM9AxTAmb/SuTmZvCU7bpT0uQVrndTgZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F439F80580; Mon, 20 Nov 2023 17:20:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66ECCF80567;
	Mon, 20 Nov 2023 17:20:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1D35F80567; Mon, 20 Nov 2023 17:19:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31C81F8057D
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 17:19:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C81F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qVfwlp5S
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15688CE140E;
	Mon, 20 Nov 2023 16:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A59DC433C7;
	Mon, 20 Nov 2023 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700497154;
	bh=zPI+e21nyYjzMEzKo0SN9jHwcF4lz+sz54brvdC2b8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVfwlp5SdtqhwP0I976PJXdYckjEzGyjN+RE3ELyFK7teO6jAbhxVTrCooKQB9nng
	 zCfdh+UNzp9UCbPlQY9B/BCMD+iD9ioAll3bUx6eMkBbImbnJBwA84uOMZwzUox+Be
	 WZ+Ah2o2yJAc5A+WiBCz2abU+qU/N3HEPgh3c2NVY0Z7gNnxVTN8I0n4Z0HU4oRQ8+
	 zcOK6BnRK9ERuCnol1itwwR4wKHne7OGHiIvuNZn2bTCuITKekA8fLKlMRLRniMSGQ
	 Aud55stw529Z91f2S4F2Qai/Ss8MkHxxETyz69isFfiXRx0F7uH/xIYDTKcmcth/1j
	 Mz2x3yEeSc72Q==
Date: Mon, 20 Nov 2023 16:19:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <d13f5857-f386-46b0-9bdd-d832b35617c0@sirena.org.uk>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
 <7248897a-0b59-4cdc-9915-d3297f2d6efe@sirena.org.uk>
 <261e118d-529b-0ce0-5524-d24d767fa92f@opensource.cirrus.com>
 <c031657a-a1ec-44eb-8885-afee68d7523b@sirena.org.uk>
 <20231120161638.GJ32655@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rzS+1eaHwgk3+pb4"
Content-Disposition: inline
In-Reply-To: <20231120161638.GJ32655@ediswmail.ad.cirrus.com>
X-Cookie: <Manoj> I *like* the chicken
Message-ID-Hash: A2NZBYRQJZFZJLCRAB4EBF732KOVLMAN
X-Message-ID-Hash: A2NZBYRQJZFZJLCRAB4EBF732KOVLMAN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2NZBYRQJZFZJLCRAB4EBF732KOVLMAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rzS+1eaHwgk3+pb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 20, 2023 at 04:16:38PM +0000, Charles Keepax wrote:
> On Mon, Nov 20, 2023 at 03:54:14PM +0000, Mark Brown wrote:

> > It seems like a clear code bug if this is ever called with an unknown
> > completion, I'd expect a WARN_ON_ONCE() there.  The lack of a delay is
> > potentially going to affect how any error handling works which doesn't
> > feel ideal though the users look fine right now.

> I guess perhaps another option might be to not stick so strictly
> to the wait_for_completion_timeout API. This function could
> return an -EINVAL here and a -ETIMEDOUT for a timeout then the
> callers could be updated accordingly.

Yes, that'd help with clarity in terms of the interface - the completion
API is a bit non-standard here.

--rzS+1eaHwgk3+pb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbhvwACgkQJNaLcl1U
h9DTugf/Xo+maNejN5Jyb9v31+Y+fHdHGg1J8zN/OqLLyg4DRlqQvEHLQ0Z4gc2O
bFjezKAU1O/mblEtNuyzjXwdnSIsDlEs0eeISe+iaHEJo9OLpvObin3ChBrVbT4o
lmFIYeP5eWNcNlAKZd9y+tr+S9puRpVPZASSH0/QUOtfQYpO5vmlNZyynqqSUhdg
NKi2XzdLK3xLKDM55bP2RTS4TDhOe4O5VJWdVRDu59m+6Und1K1rIubf0GRaIpHQ
h9SycOlh0X2BRRBBQEqoCgE2R/vWBS9NhCban4yRN2ZOfdlfAqsEFvEWJ5utLkpR
yAEkAerxrkLam35ISNijLA4euRO1Uw==
=Qcqi
-----END PGP SIGNATURE-----

--rzS+1eaHwgk3+pb4--
