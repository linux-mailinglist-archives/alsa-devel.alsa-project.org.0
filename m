Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C1565333
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079251716;
	Mon,  4 Jul 2022 13:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079251716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656933764;
	bh=54G0TnkyP3R/V8HJ55+lpVcBMr9dRxIZvwXjUc/RfmY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3mEdMrtMUx7FPcPVkAaDNz2huILhLq48jev6NnQVZy5+bw290Z2/e8koRUO/+37y
	 0yFKG6XxAf2hGcp5vmjZuYbRHsxcE926EPyGoRW/jhScLD3XhPBEjORHMj1c+uSJVR
	 XqkseYCCrXSzSxa6Vf8M7jZL40Uws5TAzS8Ki5vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E232F8016E;
	Mon,  4 Jul 2022 13:21:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C48BF8014E; Mon,  4 Jul 2022 13:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 151E0F800ED
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 13:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151E0F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bsMg+1nN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B4AF4B80ECF;
 Mon,  4 Jul 2022 11:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9ABC3411E;
 Mon,  4 Jul 2022 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656933698;
 bh=54G0TnkyP3R/V8HJ55+lpVcBMr9dRxIZvwXjUc/RfmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bsMg+1nNSbZ0ds8EUOpB2EK0KIXuT+zkJRlJFa+WBg3sPTe1CH4Zy0zuET/dNVv/J
 2mS/qUZd+Sa9e95bjch0pRqLpvEKBxilUnA2nPvPdnShVMPMiM0xSkvkvfrgmRSh34
 SFBgo+UgUzHIMieyPeSwqORy0clK+xrrLd3mwej2/hIpnxzA2bWjtOMMBixuUuCJyk
 ummwvgoV0hXTN2rB3+Bv3mFPZywPWKrngXb6gAnKZsQOpsuO6B1d2zXEcXeCsprB+N
 MEi/aRZoFhtaL4n4S7DYDKG+YIiv4SIU4rzbIx10ykR0Cb0HDwTvEmnzoxoMoxp8RL
 i1X4ndXI5S5Ew==
Date: Mon, 4 Jul 2022 12:21:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Liang He <windhl@126.com>
Subject: Re: [PATCH] sound: qcom: Fix missing of_node_put() in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <YsLNPbY1snYon8xL@sirena.org.uk>
References: <20220702020109.263980-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vv7KQyG7fjVMMpCV"
Content-Disposition: inline
In-Reply-To: <20220702020109.263980-1-windhl@126.com>
X-Cookie: MERYL STREEP is my obstetrician!
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, linmq006@gmail.com
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


--vv7KQyG7fjVMMpCV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 02, 2022 at 10:01:09AM +0800, Liang He wrote:
> We should call of_node_put() for the reference 'dsp_of_node' returned by
> of_parse_phandle() which will increase the refcount.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--vv7KQyG7fjVMMpCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLCzTwACgkQJNaLcl1U
h9CVjQf/Yo5Yr/xqNFXCTcfhWs32jaM5WoATcxPluLUk1qLv7dstAUnF+xjLoLht
OIk1tnOnB5xUrIHP1TzB1EG6xBzdGZyoX/WVpvWUgObmuZZMgOPZV7VgrafEZ9oD
cxnPLU0tlctu4rfN1cVaAub/04BDarDNrkAa/BXLBsut0FQ+kM1F9cobf/zr6nEd
r1Qu0R5qC3NvS7c21vhebjDv/Y7PUzH4U3cVb2NbyUEATErAhb1D6+J4h6f6x9wi
ThHwseLpRSiTKVUJajD0fkJsg4oS7+UJEKQOUkDjmZnNR0gcNFrn8SMh19qSzZDu
jsImdimn1FCzAe6Gg1APzps0sKLqkA==
=wHQj
-----END PGP SIGNATURE-----

--vv7KQyG7fjVMMpCV--
