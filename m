Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027978C234
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 12:19:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E611E3;
	Tue, 29 Aug 2023 12:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E611E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693304368;
	bh=3U//VkyeA7gvf9F/4eNSaraGKYNwzJlaVqPQO9Pzkws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JaQSXl11JYv1rQD2HC4f8sUoC5OVSKToIbsGh6fmX3ckwtXEkTduhFXZWOhl0s7/m
	 +YNiek12MA9uwEF/pOYKVcM0mKsRAaJumoTc//Jd5AuJeLRVrZdlj9cF+x1i/FNJT7
	 N4pnkEIHeRr5kNBnsey8nMLsokrB3UKT8byF0tLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC316F804F3; Tue, 29 Aug 2023 12:18:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73133F800F5;
	Tue, 29 Aug 2023 12:18:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3857F80155; Tue, 29 Aug 2023 12:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E268F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 12:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E268F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NqDFvlrD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACA8063DCB;
	Tue, 29 Aug 2023 10:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733C5C433C9;
	Tue, 29 Aug 2023 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693304304;
	bh=3U//VkyeA7gvf9F/4eNSaraGKYNwzJlaVqPQO9Pzkws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqDFvlrDqaKOxENjrz7fM8vJkS1gd3nNowAZcS03ANSA3zQo0u2NhY6xdlVG5Vpux
	 K8WdDEcZuaCjCVflNU9kkVDR+4IbFBIMNQC4pVCRoou/vm/KH16WNQkUroxfpIIevN
	 Z+5tW+Pqu7UjSXYA+LVRAtlFhgCPpREq1sisXFrOhowDR3+/HkXVIVoG1+IKDU32B5
	 mIQjgI3f0v/k4UxjrkwPSxusivRMZ0dQ+X5IkvXlnOGGAluXxL5O2b0NpTaSxrUfoJ
	 ElCu4+76l17/rQYeBPcY2fPfmze/wx/NIJdbuyt0TcxRSJiaa0pvP2hrZV09z/f2Y2
	 uolhqq5tsda3g==
Date: Tue, 29 Aug 2023 11:18:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: es8316: Enable support for MCLK div by 2
Message-ID: <ZO3F60iHQzxfjyTT@finisterre.sirena.org.uk>
References: <20230824210135.19303-1-posteuca@mutex.one>
 <20230824210135.19303-3-posteuca@mutex.one>
 <ZOfRXjuSTxSV89SC@finisterre.sirena.org.uk>
 <87msyc9mtm.fsf@mutex.one>
 <ZOzi9BuTo2oXcKta@finisterre.sirena.org.uk>
 <87zg2ax6h4.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dW7tNzymBfs/to0u"
Content-Disposition: inline
In-Reply-To: <87zg2ax6h4.fsf@mutex.one>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: ECCF4GVG4D7C5HUFQKHZWSK7D6O7UPPH
X-Message-ID-Hash: ECCF4GVG4D7C5HUFQKHZWSK7D6O7UPPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECCF4GVG4D7C5HUFQKHZWSK7D6O7UPPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--dW7tNzymBfs/to0u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2023 at 11:22:15PM +0300, Marian Postevca wrote:
> Mark Brown <broonie@kernel.org> writes:

> > In general a MCLK that allows you to configure the dividers in the CODEC
> > appropriately for use.  So long as it works your change looks fine I
> > think modulo.

> Sorry, maybe this question is dumb, but I am not familiar with this
> expression. What do you mean by "your change looks fine I think modulo"?

"modulo" means "apart from".

> > Use ARRAY_SIZE()

> Do you mean instead of all instances of NR_SUPPORTED_MCLK_LRCK_RATIOS?
> If so, it's already defined as:
> #define NR_SUPPORTED_MCLK_LRCK_RATIOS ARRAY_SIZE(supported_mclk_lrck_ratios)

Yes, that's what I meant - it might be as well to just drop the define
then since it's prompting this question at use sites?  One of the goals
of ARRAY_SIZE() is to avoid having such defines and keep them in sync.

--dW7tNzymBfs/to0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTtxeoACgkQJNaLcl1U
h9DBywf/Ztb7aqk240fVfAbyhar0LXYY9S3yQivzajAIk2FdRW3pNGnEByYYE7Wk
ZDWeG9DFBxyW1OJDnwii9gHWJzarqhBMtRodJXHy9urDQ7lmGza+QWehfD2WULZG
CiM/qfKf042oSFW0b6lr59xCkeT9juIhNKoc7kchyOyaXCC0veBbiVGooeKVmCQK
/JSI5iuZvCyMi5TumBydKnqKRcD2nhH1+RqaFJU+//EGnzDWllEGHEBg44jNyVuw
HFGXaYIt13z7tlp6wseAIKE1Nig4Hj77BpaGyF7mBPqMDd9RHAZxHMWCxu+X42vS
c2jqS5LU7ermkk7bJD3UvxBzBHOufw==
=lADU
-----END PGP SIGNATURE-----

--dW7tNzymBfs/to0u--
