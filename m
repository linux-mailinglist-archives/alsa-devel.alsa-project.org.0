Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEC9710F43
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 17:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D6A207;
	Thu, 25 May 2023 17:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D6A207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685027705;
	bh=DOzvr9e5uK6lrz/mfIuCZuW8BbAmyTO6HzleGT/iWwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSd4IoDS1qh/o96cs3Q6j/PbYO8CiQzrnq5eCaKZLJtFP8pfDUwa+lobEjyg5FsTX
	 rGmjtX8jZZ4BENH1ldhGpx3MYhkVmegxjXjLmHYBD0/WuE13fYrHVtnrsgpUG4jSSm
	 pwx2z41HgAnIog3LSbI/r15ImH/H+YeVSjAHZeKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2408F8024E; Thu, 25 May 2023 17:14:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B744AF8016A;
	Thu, 25 May 2023 17:14:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D2E0F80249; Thu, 25 May 2023 17:14:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB5DEF800DF
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 17:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB5DEF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=keIM/Ttn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 87E9261702;
	Thu, 25 May 2023 15:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C2DC433D2;
	Thu, 25 May 2023 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685027645;
	bh=DOzvr9e5uK6lrz/mfIuCZuW8BbAmyTO6HzleGT/iWwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=keIM/Ttn9errtDpHITF6we1CF8Te3YW+ROg1/Lowl1DCBbHkZloMqOKIHKRUfNGjX
	 GJiHSa7KYtOZnygF8pzpvYl+CZp/zaA8AYESm4F6sbqZr2CKDuNwxXUqUGz1gscQyf
	 P7Lx16cLfT2LfbL8YxurKinZL56Uolxgn7TFikbAe8xv18rwQT2fkC6pxtoiZq6K0f
	 8xDCWZculAhUKpe88M5ibDSGLBqaS1oqiNU6Mis7TVzAW/kqpBTgiEI2J8uitcWUp7
	 X+m304a26z/gfc5+zzO8e+d310767e3WY1CIx4m8W3cwLEEPaRrU+Nzy20Vq/WwoGE
	 4wRn0zdPitx+g==
Date: Thu, 25 May 2023 16:14:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 08/13] ASoC: cs35l56: Pass correct pointer to
 cs35l56_irq()
Message-ID: <b95b2364-c190-4c4f-8136-a75988be8ce3@sirena.org.uk>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
 <20230525150659.25409-9-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YUNpvwja1CqAaEEL"
Content-Disposition: inline
In-Reply-To: <20230525150659.25409-9-rf@opensource.cirrus.com>
X-Cookie: I demand IMPUNITY!
Message-ID-Hash: 7JONMAADJ7JWEK6BJORKE3V4WR7ZVTQG
X-Message-ID-Hash: 7JONMAADJ7JWEK6BJORKE3V4WR7ZVTQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7JONMAADJ7JWEK6BJORKE3V4WR7ZVTQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YUNpvwja1CqAaEEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 04:06:54PM +0100, Richard Fitzgerald wrote:
> cs35l56_irq() was changed to take a cs35l56_base* but the code
> in cs35l56-sdw was still passing it a cs35l56_private*.

For bisection this should be squashed into the change it's fixing.

--YUNpvwja1CqAaEEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRvezcACgkQJNaLcl1U
h9CtCAf+IEpYinky0Ea5PSxZLDp/W7ev8IhIif7QIHXfD5F2xWjMCpw6lROWndWb
Fwc1GMiR/M5S3N+aejyZ3rrlqxUoPI/ks6IiLVU9IRgZrVO6zUUuq6ndfGWNYzUp
rt2Y+D7FyZ4DY8Brp5TFWww9ohuxR0+Y1GKUES/pyPQIMxBIJqYxHZc15JaK9bxz
mUKFmnM58GD5Ia7gIJFJol2aNMk9LM8K33bV806HLY7qBy+gbdHiUU8vv/tZxHTF
L+KKGdi3/xvx47kDk7moHGGNJden1h2wT41SaVW4BHTsgHqowPkAuF4d9vauVvI1
km99GXyiyzvfV0qiuYkQ9glyb01Hog==
=XYvf
-----END PGP SIGNATURE-----

--YUNpvwja1CqAaEEL--
