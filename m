Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0971F8FB4F8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 16:14:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C35845;
	Tue,  4 Jun 2024 16:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C35845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717510496;
	bh=iVOugYKn7JrUfO3QEOy+kzL6OYvpAfOwiffJa4uP3LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qrwWz3dfAYM/5++E3bn5Aq6lbbLghyZmnn6kcwcbcGYJTZuBzlHfdWFot5/nY0qrk
	 aae386NQG2tX850lu9jYNqRAS8WQMfDKjfTSTm9Wm1FhOFA7WOb4XL7fg1GLz4uIGg
	 mBlZv9+xU1bTiVZpdbtjwko1XYWy7rbC5y9DIfsQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A656FF805B0; Tue,  4 Jun 2024 16:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 233F0F80525;
	Tue,  4 Jun 2024 16:14:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27BBF802DB; Tue,  4 Jun 2024 16:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF715F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 16:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF715F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LVvN9rbf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6A5ACE0EC5;
	Tue,  4 Jun 2024 14:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF87C2BBFC;
	Tue,  4 Jun 2024 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717510454;
	bh=iVOugYKn7JrUfO3QEOy+kzL6OYvpAfOwiffJa4uP3LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVvN9rbfPBO/0wuL1Gxzvlr218zVOgeXZIwwXFH5yarRgJhJ0wiV3JZ9MRDJua+30
	 w5Zb0f+obcHyjt48riQOs59snxIDB7f6zRo4F0UXyVAXZlcrhp//BW/TiwU1DvN7pY
	 4dvTioW0KgviHa0GFQxUdaUNMwGYH9lEsqFYrkR2kH5NJnfh+TzRVCKRWngmYZrw3y
	 +oWWyBVhL2x4dICw4p+L5gBevRXC/ghdaRAIs2gFD3LoYL0tfjnVQj2x6DhyTEbqdH
	 ZTxgtzdYofQP2n2snyobO0SklJdqEc0sszRPeuOrPsa+dMNaSCt9BE7uh+vUHmnM8V
	 1p7oBqC5YJGvA==
Date: Tue, 4 Jun 2024 15:14:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: add missing MODULE_DESCRIPTION() macro
Message-ID: <1acb74e5-e768-40f0-9eff-06b37c0d79ee@sirena.org.uk>
References: <20240603-md-snd-soc-qcom-sdw-v1-1-101ea8bcdd38@quicinc.com>
 <0bd0a518-4d85-4251-9bf9-d056dc3d7b08@sirena.org.uk>
 <be0ee1bc-336f-4960-a54c-8bb71449fd1c@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1LT8wVf0uletdZD"
Content-Disposition: inline
In-Reply-To: <be0ee1bc-336f-4960-a54c-8bb71449fd1c@quicinc.com>
X-Cookie: Is it clean in other dimensions?
Message-ID-Hash: G67PLHC43UOFRKOE634GZXZ2WJGRF66H
X-Message-ID-Hash: G67PLHC43UOFRKOE634GZXZ2WJGRF66H
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G67PLHC43UOFRKOE634GZXZ2WJGRF66H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--E1LT8wVf0uletdZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2024 at 06:59:31AM -0700, Jeff Johnson wrote:
> On 6/4/2024 4:56 AM, Mark Brown wrote:

> > Is anyone getting any value from these MODULE_DESCRIPTION()s?  This all
> > just seems like a huge amount of noise and I'm having trouble thinking
> > of a use case.

> https://bugzilla.kernel.org/show_bug.cgi?id=10770

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

and I'm not seeing anything in the above link that articulates an actual
use case.

--E1LT8wVf0uletdZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZfITAACgkQJNaLcl1U
h9BjoAf+Pt5R2AGb3L49fmvqs4QBC7DTDl0IfBvfjbP60Ie+ncNVy1kZeGH4J61H
UnjJKq+c4rqo5OJ6/KXpHBACnpIb/Vbh4KrHPny3//T/mFaSmkAIYWLu1jH/p16V
n+LcWdJDLOGUZKptOyNVilyFnrQdrhIa1lDnlHRTK6HSMTHggcqzILghk8hHV9sC
ttLpxQ2yENnuXiyRe/UXq74Sl24O9J3pxWuFzZ5gV65Cjdr56kPTvtrWOj4pybi6
px66fMIjkGxun3KVxeimDxFY1aNRoJ1VEmz2oZMVtXfBkUndEewCNAcTQVWCFmNd
b8dWF7/eccrOklt47h6sXrkCFiV/CQ==
=XAOE
-----END PGP SIGNATURE-----

--E1LT8wVf0uletdZD--
