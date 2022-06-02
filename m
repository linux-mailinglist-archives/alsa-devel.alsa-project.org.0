Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2038253BB13
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 16:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B5517C6;
	Thu,  2 Jun 2022 16:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B5517C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654180895;
	bh=iBt0yGuyvumHUwyuQr18kXniXAo9MJXH2585H5hKla8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eg2tCGo23I7Fxeetnrt+24/WR9fsrkaMqynxZmLuJxfFEDykdxIpumZTRE1HkTwCu
	 ACwSNIqYzEfhiuRZR6/suIMRWCQOTRIFO3cKXM8mHe2dv2q6nZDxotVHYhtiSLgsTp
	 20NUxh1jYQQF4G4MZQ2Rb8m86zrekWiZGbPAeUvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0315EF80158;
	Thu,  2 Jun 2022 16:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18FFAF80124; Thu,  2 Jun 2022 16:40:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D85B3F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 16:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D85B3F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KnA3YFQ7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF5FAB81EE1;
 Thu,  2 Jun 2022 14:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43372C385A5;
 Thu,  2 Jun 2022 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654180831;
 bh=iBt0yGuyvumHUwyuQr18kXniXAo9MJXH2585H5hKla8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KnA3YFQ7j8yovXKqZZHf98aMqPQXaKbrNvbDtD3Hh4yQcCCWr8B+DPoIiBBRvY4Xx
 QoXt4d5YFEu9rjuO7QTIhIl5mFCEg8DOn5a7RVbzn9+pmE7yzQ6EayZMg0FkLr8BtF
 vU65OU1eBFDiG6rWtaoAz+m61R2r2ciCb1o+ZUSBLZ0wtY2iwdvX2h5h8q6trmxmFf
 EDtMTstKRcHBR3wdbP6CD39z4Jbq4hwrO+64Dcdb48XGkBrCTgdSSWmuSizUhKV7uz
 boNKhT0KgtI8V1SLapZX7sXJSWX77PbYJtAIIIy45LAJPMgLhrfbwhuZVUkywmo7kE
 dFu0Y9Zo0WkAQ==
Date: Thu, 2 Jun 2022 16:40:29 +0200
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: lpass-cpu: Update external mclck0
 name
Message-ID: <YpjL3X73LyefYjI7@sirena.org.uk>
References: <1654169206-12255-1-git-send-email-quic_srivasam@quicinc.com>
 <1654169206-12255-2-git-send-email-quic_srivasam@quicinc.com>
 <20220602143245.GA2256965-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0ZilQwiK5vRHCj/y"
Content-Disposition: inline
In-Reply-To: <20220602143245.GA2256965-robh@kernel.org>
X-Cookie: May your camel be as swift as the wind.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, judyhsiao@chromium.org, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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


--0ZilQwiK5vRHCj/y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 09:32:45AM -0500, Rob Herring wrote:
> On Thu, Jun 02, 2022 at 04:56:45PM +0530, Srinivasa Rao Mandadapu wrote:
> > Update "audio_cc_ext_mclk0" name to "core_cc_ext_mclk0",
> > as MI2S mclk is being used is from lpass core cc.

> This is safe to change breaking the ABI because ...

The driver was only just merged so didn't make it into a full
release.

> Names are supposed to be local to the module, not based on their source.=
=20

Indeed.

--0ZilQwiK5vRHCj/y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKYy9wACgkQJNaLcl1U
h9Dudwf/ZQG4R79+Icg0Uh1Cmk3yjzWw6xvBIZLjQDaXBBCdISJ8tvELqQM8GFVj
IpFpKAnDC6ATOXTY+M8YK3D9Mf76ehf74T2VZt3ePnDjtmSHGWoZkvpKg1SkDtxe
8Oo7jo4nhx4Rb1ObaORZECl5InigJp29ywUhEQ9O1l4RKWYMyuW+LTsTB7ODxw9n
kI9tZkFFZNk8ZRgVqXoN/wYirD2NFkOYmt6vv8hP+tN2e1pLm2Du2yO+Tzzlw3Z1
6PJqCjVbDhxj4XtK5zDbk85DS3+6JMKKGwf+vUhkgN6JGsPR9OGT6F1UJ7zNjDYy
+Nsj7dBqnpYjZOUkWCbTW8wSbWFknQ==
=/oaJ
-----END PGP SIGNATURE-----

--0ZilQwiK5vRHCj/y--
