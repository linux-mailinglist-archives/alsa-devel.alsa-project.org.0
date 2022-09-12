Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83A95B5744
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 11:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB2F01637;
	Mon, 12 Sep 2022 11:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB2F01637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662975517;
	bh=sYwAOpbOCpgPoY3a4H4iIEJhDF4/GAWAQq3TELlnFWc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flcd888S8toPO7BN3y+4JQRj88bN78UjQGeAo8G3MhqAKP8mrEZVsTNZIDc+CpjoV
	 zSmHjWgR9ncgB1wXozPRiMmrwOpUSCnIcgQ39i/3bhC5rJL/7mSlX8/2qpdvn3573f
	 bTJ3ac5ztsefypK3ct/mb0gbnZQ/ChCMqdPaMcXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D40F8030F;
	Mon, 12 Sep 2022 11:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 076FDF8027B; Mon, 12 Sep 2022 11:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C374F800EC
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 11:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C374F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cqWXGk02"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2EB7AB80C01;
 Mon, 12 Sep 2022 09:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 734B3C433C1;
 Mon, 12 Sep 2022 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662975444;
 bh=sYwAOpbOCpgPoY3a4H4iIEJhDF4/GAWAQq3TELlnFWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cqWXGk02lXO9HKHbTFPwv64Gof4DhkfNqWeOU0bQ335Rgiq5ZKMDZFiwOaoXFqhbB
 aUSFq5Cb+y5p8AWdklJAwLmyDChJkZzjAZwQTtOMGr9zvC14jvdSsL6QC8NAWLPMbi
 wswB/x2WQLX8ew9fwbouve9f1fcAoQd/P4C2ZtZvNW0bdC5ejKneyadmn+gu2KDovQ
 nEqmusp6CHg0K3gNy2EB6bQfpkwe4c/DHUxutFlXW/ilC+3ega5IDtOyezfEOzkeqx
 DPctPEHnpwBQBx/bmYF0YGKJR2sX+ifksZkmlwItOIlFz5NNWOghYRnKM9NUVP+zkC
 OzYneydiqF+bA==
Date: Mon, 12 Sep 2022 10:37:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Fix the issue of the abnormal JD2 status
Message-ID: <Yx790SRDtNBrRGJv@sirena.org.uk>
References: <20220912072931.1856-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y4joK+FwJo5ud8MM"
Content-Disposition: inline
In-Reply-To: <20220912072931.1856-1-oder_chiou@realtek.com>
X-Cookie: One FISHWICH coming up!!
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, albertchen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--Y4joK+FwJo5ud8MM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 12, 2022 at 03:29:31PM +0800, Oder Chiou wrote:
> The patch fixes the issue of the abnormal JD2 status.

This really isn't a great changelog - it doesn't say what the
issue was or how the issue is fixed so it takes a bit of work to
see what the change is actually doing.

It's fine for now, but please try to do better for future
patches.

--Y4joK+FwJo5ud8MM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMe/c4ACgkQJNaLcl1U
h9CoNAf/W3U/PjKYMkkmcOI8QhgL5ofwVQYpovqAAFlR58oo573WwwQA4jn737S1
78jaDVkdYh6JmJId3zJvTHiL4DxZwkmNz04noh4DOkeyNZCiVOv1DJj/9XOx9z8c
o1izvTVzhgOJvOyWoNRGgmKc7o0Gg/tbhD+357ttLawGa4YvemCv6OjjCNXeFaUP
4cmYFgyUfXYNmX4TlsgQz1R+QsVYZeuSVbPZBJISx4V9B2Hxin3Q8/RBSomwzmdM
4IGHmTdGkxYFoT+jyGkhvxMk8MXbv0BWCieI0usLaUWqU6pzQCSzCTiyd0Wgutch
GvzzH5RaxsYuNjVIdagxQT7wEYUW+Q==
=MthY
-----END PGP SIGNATURE-----

--Y4joK+FwJo5ud8MM--
