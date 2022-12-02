Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BA640637
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 12:55:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBC1517F0;
	Fri,  2 Dec 2022 12:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBC1517F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669982139;
	bh=hB6zfCssJVkF0TN8E8VJKn0Rz8UlY1m2XDx9yl5ZrzI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrOUVYawWtpzb5V35b9G4pGNYxgGWYbp6yH7Iv1yvf7sVFQi6T7EdWZiCaKFjXy8r
	 iB168n/ETrJOkV+pRBBFVvNkGOjvn+RtUGN+qwiD/uwNwPFnW2UHIN0SXbZbPs+4js
	 orkTwiGaOP+nIRBnB/KtxQegwSELDkgtaNhY+N/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E54F8026A;
	Fri,  2 Dec 2022 12:54:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D5DFF8026A; Fri,  2 Dec 2022 12:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB807F8026A
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 12:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB807F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N0eQtL+K"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 082DCB82128;
 Fri,  2 Dec 2022 11:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36702C433C1;
 Fri,  2 Dec 2022 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669982074;
 bh=hB6zfCssJVkF0TN8E8VJKn0Rz8UlY1m2XDx9yl5ZrzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N0eQtL+K7gatW52yt8mqb23TwCB/AT4sheQBYR79ssIvR3S7yDTQNyKVuqjFyYQww
 Z/ca2BldYI3PVQjO7bdnOh0XjNtDPPegU79BsKyGIqYIMSq/5xBYLAwtC8DQK1Tbgt
 /Oz26UnorVIL2oKMFR/X9sqIJjkgoKJUxKnkvbwf7UNBN0foLM8YNFo6Rd2aauvZzn
 IMDKlHtyoo6oSN7+WkD0KZ5xFPZ1mlll29A0p2A9JkNhSy2wJS/LCXW8k0Bdkh7Amg
 RwZ4xC87HeUWBcLErilI8F8eke83tbXJLxFOiGv37ccpTYjIaPKzzQrBAvMSx/fJZh
 UOQIExNSMPr6Q==
Date: Fri, 2 Dec 2022 11:54:55 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?6rCV7Iug7ZiV?= <s47.kang@samsung.com>
Subject: Re: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
Message-ID: <Y4nnj74owGfNIjon@sirena.org.uk>
References: <CGME20221202080032epcms2p68f56a6b43d7d6a4f0d2de9295c0e4ab4@epcms2p6>
 <1983025922.01669968181916.JavaMail.epsvc@epcpadp4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fan2fmy2A8y24QLu"
Content-Disposition: inline
In-Reply-To: <1983025922.01669968181916.JavaMail.epsvc@epcpadp4>
X-Cookie: Ego sum ens omnipotens.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, CPGS <cpgs@samsung.com>
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


--fan2fmy2A8y24QLu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2022 at 05:00:32PM +0900, =EA=B0=95=EC=8B=A0=ED=98=95 wrote:
> <p>commit a385cc2614c17ba3002b263c0ca47dfbf6395c78 (HEAD -&gt; fix_compr,=
 master)<br />
> Author: s47.kang &lt;<a href=3D"mailto:s47.kang@samsung.com">s47.kang@sam=
sung.com</a>&gt;<br />
> Date:&nbsp;&nbsp; Fri Dec 2 15:45:16 2022 +0900</p>

Your mail is HTML only so unfortunately I can't really read it
and none of the tooling will be able to handle it.

--fan2fmy2A8y24QLu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOJ54sACgkQJNaLcl1U
h9DXvwf+Lnr5Y/bXDfNtRxN3kWfqD92BCXJc05tQ3VKzXmvSsc/W0fCztUMcQNrV
wAFK4URtUg0GsnsRGL3UpeJwptwc3l8gizRVZIA/qiGHkcm3Svojn1Tth6nkMwzH
6mCGbN8GXfo8pZ2e9X5TW96dAjSTSW2JmTpPO/fmABgWQV1KoaT4QqEm9PyN9Uc0
n1gj31sy22vK64JrqVXft7mM2e4Z5regFps0tJ4BXq5NmtuFG419YyVhT3i9Ym1v
f1TcMjTbcKaq552Lv+hS8EY1JqgaZOUVsFiVmcJdXi7cHQIYLMgZ9Z23G5gcHe+/
qitDtQB02H18rJgzw8ONHHlWy+f/jg==
=ibuK
-----END PGP SIGNATURE-----

--fan2fmy2A8y24QLu--
