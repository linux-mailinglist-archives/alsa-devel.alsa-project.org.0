Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAC5BED5D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 21:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9110826;
	Tue, 20 Sep 2022 21:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9110826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663701067;
	bh=KO7G5WxNJXJAIUz3AMugGKT/5LCjFWrXqbYdBNyWYxw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YelabgsCCb9rMa8D9E7M+E9flq4Kg57MojU02jBqixzwP1sNN6MUhdAva4K+ajgI+
	 7ng1t0efQ3HRMyNYFU8QEi1mIGaXDkkSqs95BCOJA7Bhextm4ipL4k749i++cUym7i
	 PmAO1RVnxno7L3m+/6iV1C/zAO+BYN8us3USP/Ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BF7F800C9;
	Tue, 20 Sep 2022 21:10:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A09C7F80155; Tue, 20 Sep 2022 21:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52807F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 21:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52807F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hcrkv7Gw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4534B81CE4;
 Tue, 20 Sep 2022 19:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F41DC433C1;
 Tue, 20 Sep 2022 19:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663701002;
 bh=KO7G5WxNJXJAIUz3AMugGKT/5LCjFWrXqbYdBNyWYxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hcrkv7GwQuKe4uPNCtaeep9W1E4lrkk7Mz6t0hVaAv1fAF+KJt21UeuSrLUnhexql
 m+Kkg9u3RZQ7qlVsbQ0uhWsSUV+jFL7uhIlXk+G3A0PTHTV5KGDZuPdYg0btfw9jvv
 Y9VhgggHNK/HioHocKawjkRyfAtrbgDIjb4pO3ow58YIH9kSNuLOTB8+PxX/IjnOgs
 wr0kDrPqm9znilflT96PS6Fd5bcBmkXh4Xl2HSedW8guXoGGgD7Y6HhkMIDvXB+QaD
 +0Ct+bJ1ughg//Zz58CAZYzG2OvR4OJla/7hnIfLRNjVQ6HsHFMdxOp4mVhJ+iwhzQ
 b2GutXaAPLbUQ==
Date: Tue, 20 Sep 2022 20:08:52 +0100
From: Mark Brown <broonie@kernel.org>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Message-ID: <YyoPxP9Cj2DVsCGE@sirena.org.uk>
References: <20220920171320.7776-1-mario.limonciello@amd.com>
 <YyoBjHftjG/ACAuJ@sirena.org.uk>
 <f4fea2ca-00ae-ba85-b666-9fa267961add@amd.com>
 <YyoLYe9uGNnfl1iA@sirena.org.uk>
 <557738ee-9e22-6c04-c098-0ca965e67aed@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5K1nY0l6oJaFvMYA"
Content-Disposition: inline
In-Reply-To: <557738ee-9e22-6c04-c098-0ca965e67aed@amd.com>
X-Cookie: One FISHWICH coming up!!
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Sebastian S <iam@decentr.al>, Xiaoyan Li <lxy.lixiaoyan@gmail.com>
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


--5K1nY0l6oJaFvMYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2022 at 01:56:34PM -0500, Limonciello, Mario wrote:

> I guess the author forgot to include you in To or CC.  Would you like me to
> just re-send the combination of both of them as a v2 (including the first on
> on behalf of Xiaoyan Li)?

Yes, please.

--5K1nY0l6oJaFvMYA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMqD8QACgkQJNaLcl1U
h9DAggf/V9+n8NR5Rc0p32kdD9lOyL6pcg/KHj5tIBTjsUXfnmuyzAiMxvIJK6zw
TWG3zZjOo3Xoh8Ms5C6EMhD3IhrWOoWhZARNRTNqlKKNC+EiJcjeZvAJnoWEkFLA
WX/6d5r7tIL8c/OBjNFRQLZreyNVBVfkQkNCubyit4viLCFzaGEgSwIL3uPGyV/8
ikNA6gNuBFt8vco1Z2DGYizRDiXH5t2UW5TQWFqRRJk33JEVR09yKxF1TJSuQW8t
RvmBkf/AgKIM/6Uz9LXyz1lzkvI+x4NMnUSbKeFmGIfJfEZEs4QKSHENTZj60gLs
FoiIQMMSahbYdWCqPNLFMEvj6wBitA==
=AlMz
-----END PGP SIGNATURE-----

--5K1nY0l6oJaFvMYA--
