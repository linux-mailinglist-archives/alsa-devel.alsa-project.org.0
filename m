Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91E7992B0
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 01:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB5684B;
	Sat,  9 Sep 2023 01:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB5684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694214597;
	bh=salNxs9lLXGL2pFylW72b0vqlDDT0L/9nFvYDSD1rbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dtMRcfSnA8cHte7p9YVoyQIqefncNLzH5lCncdCFH6n+VkLicmDF50dogadVviYY1
	 Ull5G/8ELkgg1dtpjgWCEV8md9bxhRu7GLIsbjF4j3luEi4XJd56gqKSaCcINtgHUY
	 aiZMTD9DIopLYvYsA9QzRfAXYdA/1cjabo6ovaNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 619A2F80558; Sat,  9 Sep 2023 01:08:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB784F800F5;
	Sat,  9 Sep 2023 01:08:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E622F80494; Sat,  9 Sep 2023 01:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D849F800F5
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 01:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D849F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S8RRs1uH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3BB97B822DC;
	Fri,  8 Sep 2023 23:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BB2C433C9;
	Fri,  8 Sep 2023 23:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694214507;
	bh=salNxs9lLXGL2pFylW72b0vqlDDT0L/9nFvYDSD1rbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8RRs1uHRBIPCSTgHYjQtew/XHYwhLMbUDo9UgQCZZo4Iv+G749bzuWbRhOSCfZWs
	 vTgCcTxEILQTlnhn+v/7D+m+21hTND3K4hCQEIis9xxqUs+/+TSLtfdcyrAMQR8QvC
	 p4MOqgPKvYAZxSbAPBvnfveCl2jjCsYfjaLPHBACeKVN7oBdkG2btDt1gTC/W9Pcsc
	 jLEhhB2k6Q2dwNSjWgwOClW10q80c+PFz68ZqpNrbWi+1CH+Dm0+zNzp6pBrsEz4p8
	 kLX9ttCPsV9qZReNG+0ipRr4Lh75Jqjzh6/0iZkSWksXQFLSUYiguoO/OkL9OvhC77
	 +kkmLFojF97ag==
Date: Sat, 9 Sep 2023 00:08:22 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Takashi Iwai <tiwai@suse.com>, kernel@collabora.com,
	Jaroslav Kysela <perex@perex.cz>, Shuah Khan <shuah@kernel.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kselftest/alsa: Mark test plan as skipped when no cards
 are available
Message-ID: <0fa0901e-d271-438d-bc2b-11399ad3b07c@sirena.org.uk>
References: <20230908181242.95714-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gtB/MfxvGH0d09GU"
Content-Disposition: inline
In-Reply-To: <20230908181242.95714-1-nfraprado@collabora.com>
X-Cookie: My EARS are GONE!!
Message-ID-Hash: T3F7WKYMPUHNGYHOGCBMVP627NHO55VL
X-Message-ID-Hash: T3F7WKYMPUHNGYHOGCBMVP627NHO55VL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3F7WKYMPUHNGYHOGCBMVP627NHO55VL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gtB/MfxvGH0d09GU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 08, 2023 at 02:12:40PM -0400, N=EDcolas F. R. A. Prado wrote:
> When no soundcards are available, it won't be possible to run any tests.
> Currently, when this happens, in both pcm-test and mixer-test, 0
> tests are reported, and the pass exit code is returned. Instead, call
> ksft_exit_skip() so that the whole test plan is marked as skipped in the
> KTAP output and it exits with the skip exit code.

Why?

--gtB/MfxvGH0d09GU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT7qWUACgkQJNaLcl1U
h9CVNgf/bknC546PS9Qi9kytQmrmnRIck4p3/Yv2zeKVVypqZ+T9VGGd45Z5yOtF
lRcilGo976cR1/xT4LFNuDyrUIM9d3fqf5HSQ0RT5UlYnJ1YExjD5DZvdZsqRr9C
79g6q2UjiLMqarkMkiML1b3+w5pgJqPp5gpHtMuFl/aTWO1js0SXiJYEvnm7g8p1
gjApPBitF8CVuS9XzqR0caAPUBkJSfRqWfVJYNQXnuF9+/bzZa+qChKjOxZ7GMY1
328IIC47xB/5Yu8N672MYqwmtN4PF0lxXGH8l0/5SC4NHAs36XK+Kdwr5hE5nzwo
q4w0VkZAwxSF3wCCH1LNKkGnVDmXeQ==
=Shz6
-----END PGP SIGNATURE-----

--gtB/MfxvGH0d09GU--
