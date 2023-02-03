Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486A689944
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 13:58:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB47832;
	Fri,  3 Feb 2023 13:58:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB47832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675429134;
	bh=TFT27g4uUovHfdLLc/fE2de259zF/2hjH/jrxNsASh4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dwCHc7wuEPySBijV5tqs4xWmSsY+qVt+obHvq+z7eAL3Mv8tsjrDMdIQKwQxt/vdZ
	 2v4KZQk+HHmUjND90CxV5QaHIc6vnN7kDL/Vh0RByh6tZ60Pw1IC4vH1yPMCZ4RChw
	 I53SYMR9ovI0vHe4KzOMmzl3nkRXRrqCY15M5pco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E0DF80022;
	Fri,  3 Feb 2023 13:57:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA43F8032B; Fri,  3 Feb 2023 13:57:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7026CF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 13:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7026CF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l7n1kCcC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB088B82ABD;
 Fri,  3 Feb 2023 12:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAA0C433EF;
 Fri,  3 Feb 2023 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675429067;
 bh=TFT27g4uUovHfdLLc/fE2de259zF/2hjH/jrxNsASh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7n1kCcCE0g8fnnF/7altmTxLvsfpZdVlcH6JUki0a+oAMeUzxGeO7CMem8UnLMAv
 VUTAB6b0vPEhLLY7YnNqJIgfmWcbzlBbzmtH+Fir/49U7qW5QdSL3aksksgfZmvY95
 n2SZG9z/z1s66RA/46ENd0dEccDzEa+tpBq/fjr5GGIL42mUkk7AkGaekNi7Pi8zvG
 PKOoT+ic7oNtsHHhZFX7dut1NmN3CZn2Gcu2VDNrqi4hHq30VpE24StsRjHI0KTnDy
 HUsnziH+HW0/RsbIq9F/rNRAajWo/sWYrRpXPX9nY3roqncXwWdblsQc7Y2YVl32Be
 Ye/20J95z9CzA==
Date: Fri, 3 Feb 2023 12:57:42 +0000
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] ASoC: uapi: Replace zero-length arrays with
 __DECLARE_FLEX_ARRAY() helper
Message-ID: <Y90ExljX2qCsowhu@sirena.org.uk>
References: <YzIzUjUuJKf0mkKg@work>
 <fcd83e77-a3fb-9061-771a-8509ea6f5950@embeddedor.com>
 <Y9wmnfTi/p4FuRmd@sirena.org.uk>
 <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LzWOopG7OcqvuDO3"
Content-Disposition: inline
In-Reply-To: <bb43c410-bd8c-66fe-19a1-0f41442838eb@embeddedor.com>
X-Cookie: No animals were injured.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--LzWOopG7OcqvuDO3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2023 at 03:18:47PM -0600, Gustavo A. R. Silva wrote:
> On 2/2/23 15:09, Mark Brown wrote:
> > On Thu, Feb 02, 2023 at 02:34:17PM -0600, Gustavo A. R. Silva wrote:

> > As documented in submitting-patches.rst please send patches to the
> > maintainers for the code you would like to change.  The normal kernel
> > workflow is that people apply patches from their inboxes, if they aren't
> > copied they are likely to not see the patch at all and it is much more
> > difficult to apply patches.

> Yep; that's exactly what I did. :)

> scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include/uapi/sound/asoc.h
> Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
> Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
> alsa-devel@alsa-project.org (moderated list:SOUND)
> linux-kernel@vger.kernel.org (open list)

> If you're one the maintainers of that file, you're clearly not listed as such.

You did manage to figure out that it's an ASoC patch given the subject
line...

--LzWOopG7OcqvuDO3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPdBMUACgkQJNaLcl1U
h9DUtwf+MQ11j1ZhC+ukf+NA3tKIF8+Mg8xQTip4y9Z0n90Aa+SZb+mqKU4jmld7
KGs2YuwFZkj/1KpGbEcPNpXrDZZHyn31nid9VBOeL9TLXAKy2ily/XcFSwTzLcIi
NeAhYE3obD+obUIXLtGb2y8Wl1NV6doBnYti+wBAM/eStv7kT9BaNG6UW958a0IJ
eT4vWektrJaL9tfrHhZhL2VQssV5NlExtQbOMXga3bJMaM3F6MdPQPhczHbGGgjI
+QPp99QqerAz0/D+89Ru83ddvPS6cCXjtvmNfgRhT2XixIJ9nG6OScgM+7rrfCZQ
BlubX3vJ+U/lp4qy+D+bEByCFwS3MA==
=KTFL
-----END PGP SIGNATURE-----

--LzWOopG7OcqvuDO3--
