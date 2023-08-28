Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39B78B709
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 20:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DAA3E8;
	Mon, 28 Aug 2023 20:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DAA3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693246264;
	bh=6qVm5eu3nBLA4L41AWZPBY7DE/hYw6IGKyR3CT1kSVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y3UmZV2iYHybmUXXw7auyOMIHZ5xSM+Le2dIdlw5HclLABPEsO1FPBSLdHlOiOT/U
	 yv/S7jW7AphAELTcUNXlPc0VYjrVVmUCSvBa+ENn8tPz4cCOenfC8YgctnrX0gw9JN
	 +48mTbXd4mbW6gJVnfAjkD3o/ZZZuc9qKlRPskX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA44F80236; Mon, 28 Aug 2023 20:10:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EC9F80155;
	Mon, 28 Aug 2023 20:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4664AF80158; Mon, 28 Aug 2023 20:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54609F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 20:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54609F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jxqp1PKN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3B85645C1;
	Mon, 28 Aug 2023 18:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE4CC433C8;
	Mon, 28 Aug 2023 18:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693246201;
	bh=6qVm5eu3nBLA4L41AWZPBY7DE/hYw6IGKyR3CT1kSVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jxqp1PKNeKqxH9XxAtGSVBbcskK8Cl3Fa1hHhIkDQtAbmWs/6QdF0b3jvXIkW+d6h
	 fGcUsDp3/5cRjwWglsH0LatFZtPIOB/fXfRzlHFyDoOvZCrNyeJrSrtKLy55l6TwEo
	 XN1ZVwjKf+sSPCd6GcYKkHrUukYYSkLw6JegCeKpRmJaztGaTW37ynHq6uWvi/Zh/3
	 zSXJMaXGLY+zVVPKnLJvjcr9xwy01mPUpVGgP6IFAzqN2e3fvkw2jP389DpzBBv6Gs
	 aiHM0LVjW8Vg9rpWmJ8EZT5/i6ffUtrNZbDqPpodPrkurL11ZeZ/l2dS+PGvYRSRD5
	 rOgBOj+lrKQVg==
Date: Mon, 28 Aug 2023 19:09:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: es8316: Enable support for MCLK div by 2
Message-ID: <ZOzi9BuTo2oXcKta@finisterre.sirena.org.uk>
References: <20230824210135.19303-1-posteuca@mutex.one>
 <20230824210135.19303-3-posteuca@mutex.one>
 <ZOfRXjuSTxSV89SC@finisterre.sirena.org.uk>
 <87msyc9mtm.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+uIW5b0/qxOBqojE"
Content-Disposition: inline
In-Reply-To: <87msyc9mtm.fsf@mutex.one>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: TIKL2JR7XMKMKDDHL32ZUTNPIP674NA4
X-Message-ID-Hash: TIKL2JR7XMKMKDDHL32ZUTNPIP674NA4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIKL2JR7XMKMKDDHL32ZUTNPIP674NA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+uIW5b0/qxOBqojE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 28, 2023 at 12:50:45AM +0300, Marian Postevca wrote:
> Mark Brown <broonie@kernel.org> writes:

> > machine with this MCLK rather than that's based on the spec.  I would
> > instead suggest applying the MCLK divider in any case where we can do so
> > and still generate suitable clocking for the rest of the system, or at
> > least hit 256fs (the datasheet quotes 256/384fs on the front page which
> > suggests it's targetting 256fs, that'd be a fairly normal number, and
> > there's mention of 12/24MHz USB clocks being directly usable).  Doing
> > this should either make no odds or result in better performance.

> Not 100% sure what checks should be done for a MCLK to determine if it
> generates suitable clocking. Would something along this patch make
> sense?

In general a MCLK that allows you to configure the dividers in the CODEC
appropriately for use.  So long as it works your change looks fine I
think modulo.

> +	do {
> +		/* Validate supported sample rates that are autodetected from MCLK */
> +		for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
> +			const unsigned int ratio = supported_mclk_lrck_ratios[i];
> +
> +			if (clk % ratio != 0)
> +				continue;
> +			if (clk / ratio == params_rate(params))
> +				break;
> +		}

Use ARRAY_SIZE()

--+uIW5b0/qxOBqojE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTs4vMACgkQJNaLcl1U
h9Cs2wf9HV5zUoSs/LvsLfOeFiaGB5ddhE+WQq3xn04EGc99oxAxAM0QC74yD/k7
lnmI75j0iaJ0fIvzw15pskMwqqbS1Ttwtqj6H69YFIHBhqKnEbwTEgDuM/Jn8dgc
0jlo28+95C4kIDbp6Lz8oFS4ObJKJ4+Ibnf0yoxiJ0Q5II2EwvUYEGGqMhFTbPDB
H9takbgRwqKbi+06fOUVeag/RCM/N929K+rLez7nd2bPHr9d5vzxnCTh7A99og6T
0c6e2ZMTB2XasURLiHWTj68voJtyucJGOn6AGJPrWAAj39bxytuYZlQTIbEQwR9m
J5O7HY/1N3xAAXWi++H0u0A1HyQBUA==
=oTdg
-----END PGP SIGNATURE-----

--+uIW5b0/qxOBqojE--
