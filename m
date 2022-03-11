Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C4E4D6695
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 17:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA3D181C;
	Fri, 11 Mar 2022 17:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA3D181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647016879;
	bh=uE49kQ/uxD3OY0VmbZybvo2c2BzV2pt0y/AUIzscw+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mW2kfrLBds/RdQJKLvPybS5jBqyOSThehJhhpTUKEfFL/NNgv35Yx5q2dSOEpJ+D8
	 dwbruMZOB0ntECedfBsEqZSVspJ5aXnfbs+n4pYiHidMaFRsvd09y9W1svV8ZCny43
	 4BEkgZ7hlnsG5iVwGr8UDlDtz1QlhFZy+wMdCHcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9053BF800D2;
	Fri, 11 Mar 2022 17:40:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE753F80227; Fri, 11 Mar 2022 17:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4092FF800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 17:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4092FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LlFssjff"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2057361D08;
 Fri, 11 Mar 2022 16:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A59C340F4;
 Fri, 11 Mar 2022 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647016801;
 bh=uE49kQ/uxD3OY0VmbZybvo2c2BzV2pt0y/AUIzscw+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LlFssjff/7YsNtTj6agi6u4KcGJIqHGWJETI/eHy5Zp1CzNee9yJGqZd2F8nmUU+i
 47Ry7KjgHfPdyHWuBzFaO51yQwgujTrCNVODyYcSXOZYeM7/AeFvm0XBVjfXBUknGy
 wrbcr2xoO4GAEUH+QqK1WRLFX1++mEDjD4/TBf9KJQG0dcuXR8h05a0so9h0pkRGV7
 Zl/dfpk4egOkr+g+ZgsDvwn3QrzdlV/51GF/uCGTEDEJqFg+0Y0VZI7KthP+SVQ4RB
 7PmjczNVPtc/IuitVU3Rv3Q7T2wO48K9wwtOJL/p6LBhsNC7B9rGEro5DzGdT6PuTM
 qev1wgDEXWabw==
Date: Fri, 11 Mar 2022 16:39:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: core: Add new SOC_DOUBLE_SX_TLV macro
Message-ID: <Yit7XQaVm+QY/iJ5@sirena.org.uk>
References: <20220311163258.175627-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X30CwsilUipfmKq1"
Content-Disposition: inline
In-Reply-To: <20220311163258.175627-1-ckeepax@opensource.cirrus.com>
X-Cookie: A fool and his money are soon popular.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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


--X30CwsilUipfmKq1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 11, 2022 at 04:32:58PM +0000, Charles Keepax wrote:
> Currently macros only exist for SX style (implicit sign bit 2's
> compliment) volume controls where the volumes for left and right
> are in separate registers. Some future Cirrus devices will have
> both volumes in the same register, as such add a new macro to
> support this.

Have you tested the bounds checking on _SX controls with mixer-test?

--X30CwsilUipfmKq1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIre1wACgkQJNaLcl1U
h9DTpwf/eNTSCFgpBZfFqcRBfuUV8e1LEbfTVIPReTJ/SK+q9Gs0jT6FR6fnzsjS
zznCnOy6kgeGj5f5I/lYE9mrPTBevkcpKYD8jH98Loigivq8aPDhXIU5Pzg7H208
14sO29u2fljYEq+EgiCyzlQ9n6atWivQb8CXZXqB/ndZ48GhJcoThMDZxVB6xG05
n5l6/P+qqt+scK8yewUJtTUb31uyXPWDZz2xn47UucjnlfzGjBezHiBbkXIi5K2w
1/tiGh5PGV5qYikedDdOU7Ymioj6Fv3ZBGQEv5LPgUOMDbF94DFdncqiL13Tt+dS
wxM2RCRyTUN9dmk/cMW/Jz+Qw4WX4A==
=TQ4E
-----END PGP SIGNATURE-----

--X30CwsilUipfmKq1--
