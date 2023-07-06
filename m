Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19863749BDF
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 14:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CBDA7F1;
	Thu,  6 Jul 2023 14:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CBDA7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688646888;
	bh=j3Bj1sSsS6/rr623KKWCqgGRCT39zzClBMwB4l36CAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dy9GbpQfuEs/6Qb5uRASDzxu/9Lnp/NLx/M3j64RrqIH5jByWgyv4oojAsqe876VJ
	 BI981eNi7rAj9pSkwa6ZpnuY4Y2nATxc38qNUkRwEW6ceyrUyPdFgm+ubW3cwsAmqk
	 tOKUgAlWvja74vf4wa3Uyk10S74hcgkweUpdmDnM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A422F80132; Thu,  6 Jul 2023 14:33:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1460DF80100;
	Thu,  6 Jul 2023 14:33:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 629A6F80125; Thu,  6 Jul 2023 14:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ED6BF80093
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 14:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED6BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AC6iTwZb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCEDF61913;
	Thu,  6 Jul 2023 12:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2A6C433C8;
	Thu,  6 Jul 2023 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688646826;
	bh=j3Bj1sSsS6/rr623KKWCqgGRCT39zzClBMwB4l36CAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AC6iTwZbjWGrAJMvOynJCL/srgn4a2AzvqKPHWv3m+iu3rtfiroBdfVpGciZKczav
	 HZTqDgXTa5JjddDN0THlD3FcQ6bGSBYX40IEeVCMc9XTMiprF54YRj4yoUztq7jTuk
	 wyzLaqA9fMZeyKnYG3IZ1FONVUiuDXldvsPjoaQ5kVCSUmzMSzMOZkYjH7uCnBEnqq
	 ECxUOJZ5K+Y3ooRICbqk9Rg83IZ/DY5DvVNo0rD44FXax0O6tIkApcSAnJSKVJUFbh
	 LuhKchKf7hoCg62keSeUxa/4wYrEQPJlS/bzQaAR5wQ9y1LhPwI8z2Uei0UVCvlLSw
	 Mw7q1Sydr3YnA==
Date: Thu, 6 Jul 2023 13:33:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] regmap: Replace "default y if" by select
Message-ID: <a170939b-ee15-4241-ac07-bfa341a56bbe@sirena.org.uk>
References: <cover.1688643442.git.geert@linux-m68k.org>
 <525c37a568b10623ffb2d108850afd7e37f9350e.1688643442.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8w2QbIDms0NhgMtB"
Content-Disposition: inline
In-Reply-To: 
 <525c37a568b10623ffb2d108850afd7e37f9350e.1688643442.git.geert@linux-m68k.org>
X-Cookie: Don't read everything you believe.
Message-ID-Hash: 4RITEM6DKDK73C42D4S3VEHPJOJF6ZUB
X-Message-ID-Hash: 4RITEM6DKDK73C42D4S3VEHPJOJF6ZUB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RITEM6DKDK73C42D4S3VEHPJOJF6ZUB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8w2QbIDms0NhgMtB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 01:42:02PM +0200, Geert Uytterhoeven wrote:

> Merely setting the default to enabled is no guarantee that a Kconfig
> option is actually enabled.  While this works for an invisible option,
> the user can still disable it manually if the option is visible.
> Hence since the REGMAP option was made visible if KUNIT_ALL_TESTS is
> enabled, the user can now manually disable REGMAP, causing build
> failures if any of the REGMAP_* configuration options are enabled.
>=20
> Fix this by replacing "default y if ..." by individual "select REGMAP"
> statements for all users.

I already have a separate patch which will go after the merge window
that will move the KUnit visible option to a separate Kconfig since the
current bodge to work around your desire to not have KUnit enable
anything automatically had really substantial usability issues anyway.

I'm getting fed up with all the problems that these KUNIT_ALL_TESTS
issues TBH, the inital patch here seriously damaged the usability.

--8w2QbIDms0NhgMtB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSmtKAACgkQJNaLcl1U
h9BgDwf/bxvria0yTNlFgcVB47sqjg89/9bKKZ4Z60b9HloA1Ex3l68CaUxnphFt
1BUIy+pcsYDj1ph5LfEPQCHTemXXgdVbfbUrWOzuD65KY1Bbmg7MVxhdODDf27UI
RFGIRtKTgQQqDjJxbmbJ9j7nEp+zd+q5M7caDVioLGPk+kkll6SL+79blhqrAqUb
KSjlJOQnFIqe32/IIvviffVEIJU2RvVPNvup83qdeGUVRdvaSzsVOubOgGJUOY3p
60fQaYz1ejTBpOwNicfFsvGGRGzgK47V/i2Yh8IB8dJ1LaqU+L+l4t0Spmw6qq3N
Wlin1nMDR3ppHaJtZVCDELCSq2YPmQ==
=iv0q
-----END PGP SIGNATURE-----

--8w2QbIDms0NhgMtB--
