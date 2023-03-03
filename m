Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEA6A9763
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 13:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F2385D;
	Fri,  3 Mar 2023 13:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F2385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677847352;
	bh=63DyE5JUF6QupKom375epNDwu5fGTFML7abJZ4OIYuE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pi2aLgmKF9Tk3HtIYXtV9dHqSH5OJu8u7XLs0Rk4cGLQZH3z3nFVacWDQzjhwOB1p
	 Uj+QApjSmec2XuKG9sldTgwqu1QL8X4dL4PEWVYlAb9mS3e82kWBXaDmi5hEQK+hx7
	 W5n9v4W9eHlt1/Pi2V4o+fGtaibylUELKpMzjpVw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4EBFF8025A;
	Fri,  3 Mar 2023 13:41:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 527FEF80266; Fri,  3 Mar 2023 13:41:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5768AF800BA
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 13:41:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5768AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ICzPEJL2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C51B3B8163F;
	Fri,  3 Mar 2023 12:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A550EC433EF;
	Fri,  3 Mar 2023 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677847288;
	bh=63DyE5JUF6QupKom375epNDwu5fGTFML7abJZ4OIYuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICzPEJL24BmiGVbAYkUJnqwVy3kpf6H4d8Ll5H/Zb7G9WZh0MNCMfOzWuqConTEsg
	 8aW7N7KnMyE0DF5xPdIwLkXJKgJJL8GQzJGL+AsHWRgbu+DTtJC2CILM6QRfwqnzda
	 6K5H/9hkZ/nswx0+4ocC17czW8EX99/ZEXc3/sRGSmqqHpoDRY53qAk3gBq+FJdu86
	 yMiOnr8YL3TjyAVBl2LT735OAAOfoEBad/zdLXn8LZYz9vMKjML+lJ+elKXWceNuiG
	 zC7aHhP7FeAVo5oFmJmaIbmqpft0K8apBds8oTrfwMNCkge4hCk9I0H0nimkKTMl6V
	 /VijgMgJK07Tw==
Date: Fri, 3 Mar 2023 12:41:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
Message-ID: <5c47fa1d-f97c-47d6-a4cc-e20032072ad9@sirena.org.uk>
References: <20230303121206.22177-1-quic_visr@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAA2Ho7H6wvZ57Io"
Content-Disposition: inline
In-Reply-To: <20230303121206.22177-1-quic_visr@quicinc.com>
X-Cookie: You are fairminded, just and loving.
Message-ID-Hash: H3DBEQ7Y5HF4SGCZTYERRGL2ES4XYVR7
X-Message-ID-Hash: H3DBEQ7Y5HF4SGCZTYERRGL2ES4XYVR7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3DBEQ7Y5HF4SGCZTYERRGL2ES4XYVR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RAA2Ho7H6wvZ57Io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 03, 2023 at 05:42:06PM +0530, Ravulapati Vishnu Vardhan Rao wrote:
> From: visr <quic_visr@quicinc.com>

You're using a different name here compared to in your email and while
it's the same mail address it's hard to relate it to your name from the
sender.  "visr" sounds a bit like it might be a bot too.  Could you
please supply a more clear signoff?

> Actually There is no need to have decimator with 32 bytes.
> By limiting the variable with short type u8 issue is resolved.

Bits not bytes.

--RAA2Ho7H6wvZ57Io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQB6vIACgkQJNaLcl1U
h9DBIAf+O0GEiKa2+I7pScRjDCF/+T54nZH8sgtkemdIQQdR7TPRPkl5R5HISwSd
XqH4yuc0Rn2aNgLhS3Jcs1ulEjSMKHrbwn9i1xj2tShnxP8KnBoDduS4KbFP6obF
nJt7f+bOTHw2Q6iZAdxpr2jMO0RMQ5Ibf7FoR4+e3c/b9KRE+ls9GTuzi5e5Vi5C
QWPWdxkhlObXt0mHehHoBhZR/h1QJZgIDafGCJwsSRkyyQlVM9A4dakDoqGdi+dO
iRlE673TKCcnNsX9dY9Rsvi4+gGhq6WYOe/AL5FH4CeYNIfblQHwaYUduN5vxmtE
mM7FYJ17yaMFC0LLtixWUvp3obpw0A==
=2XE6
-----END PGP SIGNATURE-----

--RAA2Ho7H6wvZ57Io--
