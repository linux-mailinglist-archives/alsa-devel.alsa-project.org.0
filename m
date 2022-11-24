Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B74637845
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 13:00:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95C3C16F8;
	Thu, 24 Nov 2022 13:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95C3C16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669291254;
	bh=l7DaCNiMUsTU+8Mbnq0TywSMMevkwblT77MNfBfjHsI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0VnbE2Yv7Ca1CnGRbkg8g2YVQRAQCAFeDmxiSMn/6jyAKLmYS/Tt4FUabhe4pRLn
	 9HnFIC12ok4XVfI3V2jqMSU6it8ZaFtGLCw9EYJFpl+OMEJNV/rz6NSS5mEpG9l2Tw
	 egsHzqebuc/XIM5N/m9IPKdXFoagNSLTDKzswTYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2629EF80115;
	Thu, 24 Nov 2022 12:59:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F027F80431; Thu, 24 Nov 2022 12:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8F9F80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 12:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8F9F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="taYZ4KZk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AEE9CB82777;
 Thu, 24 Nov 2022 11:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CFAC433C1;
 Thu, 24 Nov 2022 11:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669291193;
 bh=l7DaCNiMUsTU+8Mbnq0TywSMMevkwblT77MNfBfjHsI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=taYZ4KZkp5EqiELaEAIJzn9GdLhDj8aeXHb86fJ9gj27fxvFEgwJlfR7xoR2UAo6a
 JakGWIScmXmU3gO1LzJn4jgSw/1FH+izQwEPaZub5pL7Nq67qUTG3paabtBVyyOqQX
 moUs47VsyZ6BEQd7n5svoSxG+AoRvCKL0m0Z98nplmfN584m2Kp7ZInbkxVkB+nbgl
 oyre4dLsI22nnuZMxzAjtiH+D2LlPCQFJqAO+2QqlpSy+RTXJIYjvCSxOLwb1n8nbW
 2A1/djbROnGP4N87O3TZbLk38f8NDfV3g+KOMGqeBWu6IVce8HRkVRGIJe4y24ANQA
 O/FYgXZofD/xA==
Date: Thu, 24 Nov 2022 11:59:48 +0000
From: Mark Brown <broonie@kernel.org>
To: AS50 CTLin0 <ctlin0@nuvoton.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add compatible string for NAU8318
Message-ID: <Y39ctE9nErS1WUXQ@sirena.org.uk>
References: <20221124055658.53828-1-CTLIN0@nuvoton.com>
 <20221124055658.53828-2-CTLIN0@nuvoton.com>
 <Y39Y7yqhgtGa1Rt2@sirena.org.uk>
 <63b619b3-e784-ba9e-d745-cd614a398017@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NCMNPut57k4ESZ4l"
Content-Disposition: inline
In-Reply-To: <63b619b3-e784-ba9e-d745-cd614a398017@nuvoton.com>
X-Cookie: Apply only to affected area.
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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


--NCMNPut57k4ESZ4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 24, 2022 at 07:56:03PM +0800, AS50 CTLin0 wrote:

> OK. I will follow the order patch 1/2 is binding document and patch 2/2
> is new compatible.

> I will resend the patches again.

No need, it's fine - just try to remember for future changes.

--NCMNPut57k4ESZ4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN/XLMACgkQJNaLcl1U
h9AH9wf/XME+ZRfVCWN4crbmYcitxERAXtRi2p7S6vCgK1LNN5sYHuLL/3YwQp7M
j3ZFawqpkhJsySI4gXUd/ZZ1lhXNiIqIduI4BLfMqf4af7ObBLjMazX/dRBNIcxC
9BNxsX2zdLjaNpj2qTkcnZswVMiTFBki0Xuk1zg4NgYqEP+1xPxXtnGIaSm/ZII7
9WSEXwl0ac6nMgmzGXIJ6j2D0R0gcrgnsivCvqsVMdH2RZZbdN/PvEO1npcAc83k
03bALLhR2OCfnR60ZloUo2hw9tQTcpXIY56B4Jl7wwz9ktJMYNuYpoydU3rajY20
nygIKQ/1H5IQTcgsmml32Y03FH3wzA==
=dMFv
-----END PGP SIGNATURE-----

--NCMNPut57k4ESZ4l--
