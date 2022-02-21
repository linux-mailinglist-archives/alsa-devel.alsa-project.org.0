Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0FE4BDA8B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 16:26:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA58175C;
	Mon, 21 Feb 2022 16:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA58175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645457185;
	bh=Jh3WfvAvBXogRJ7ujyOvL/ueVXcl228Lr1D062RBQ/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUpzqRWPjQtusZL6sMZb7A2kMznuwN88TwGb2MIfxcNSyYIUOojRIOwWG6mD7JWUq
	 9VkKHp62bSNBz87lJg8SEVE5gUibJyM1oUvzGCwhvTqzpv6v5oMLPg1xY7PGUC+fw+
	 PJ2PvQkBfjWuxdA6VGvpqda1N2PXt4mzUvyZmjhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF3AF800FA;
	Mon, 21 Feb 2022 16:24:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8048F800FA; Mon, 21 Feb 2022 16:24:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA0FF800FA
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 16:24:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA0FF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KF6bzMsJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F258A611B2;
 Mon, 21 Feb 2022 15:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27B8C340F3;
 Mon, 21 Feb 2022 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645457090;
 bh=Jh3WfvAvBXogRJ7ujyOvL/ueVXcl228Lr1D062RBQ/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KF6bzMsJwTram2lkBwsTL2ygkZflGTjMucCCbJAi8HWhz4U+9po4cD/OVHZSEl06y
 Tt+BgHtuCLBYJYDW1qOQsSnlCZd+/6vlXjD3yNEsbGNdlkOT5I3fF5fP3/6TByy5TO
 I+h0DHElB8lOfBaiKpK13WBSXSY4s1unbEGJFwe5yEBeuzBYL2RoHNCVeCdlpurT/r
 BBwdmYPNB/h6dr7+/+GxREDmBQHxWIpGZ0BosKAd24ILn5H2hL62kojvwTifM3JZIu
 B/Bjdol0NMCFoVbh8NykKWtXhrqkOElHEBVzVuGUT8ig3K4VU33SWL45CTfaCSZcbL
 lA+P33g6J2UZA==
Date: Mon, 21 Feb 2022 15:24:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 01/10] ASoC: codecs: va-macro: add runtime pm support
Message-ID: <YhOuvdsKu6zOg2p/@sirena.org.uk>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lzsBWC75ma9I+8BZ"
Content-Disposition: inline
In-Reply-To: <20220221131037.8809-2-srinivas.kandagatla@linaro.org>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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


--lzsBWC75ma9I+8BZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 21, 2022 at 01:10:28PM +0000, Srinivas Kandagatla wrote:

> +static int __maybe_unused va_macro_runtime_resume(struct device *dev)
> +{
> +	struct va_macro *va = dev_get_drvdata(dev);
> +
> +	clk_prepare_enable(va->clks[2].clk);

This magic number stuff is going to be excessively fragile, and the fact
that this is sometimes managed via the bulk APIs and sometimes not isn't
going to help either.  Either all the clocks should be managed here or
this should be pulled out of the array.

Also consider error checking.

--lzsBWC75ma9I+8BZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmITrrwACgkQJNaLcl1U
h9DUzQf/Xclajinqx6lEXYTioZTqh3OgffcF+xcHskvifhNxeZMgwPF15gkDNEQg
QKJu5aq74J7s22zdsH3Q7JzoUbSIpaU8+y0/86tKW3iMcFRWZVV2yNGhpkcFgUbl
eij0F8BPSwCXBo0zJbVJ3/0oHAlerYX0wiReicS5j36QDOGUuwqsfWie2aO9wSq1
pdmI3sgkpyE00u88xZHml6/FcSLSNprXPpShHFKLeRp2nSOxE9kYSePZ9G0Itk8/
kX+YLl62BHJKnKdjTaQO/hjllNRqeJvda61AdqTMD8+zqX3llEBYzZvIDQmR31Kr
r2aSKCOjUvzXhKLlEkMloAkkORyqcQ==
=ljEt
-----END PGP SIGNATURE-----

--lzsBWC75ma9I+8BZ--
