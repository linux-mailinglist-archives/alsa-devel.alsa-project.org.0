Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4E5F5305
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 13:00:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A63168B;
	Wed,  5 Oct 2022 13:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A63168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664967652;
	bh=4jMzYU24d+yMcsfaBx4vsYUmNNj3cHQ/4Qvv5atAB90=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVZy3k887geM0yDoQPxXFPMlrH2bwFjUE+lmzbEvWmAS/+JyS3K2LlxZcFsUWOxf0
	 Ux+dYzB9D1LtbcsK26BEBM3oV1WmgZ5yh8rDbq3kMkgHpgea1ambEOV/pEyIICmmF/
	 053pJqRiiOCSeJRGgU3R0X9z0Picky18qJmWUB3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F3AF800BF;
	Wed,  5 Oct 2022 12:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED4A1F801F7; Wed,  5 Oct 2022 12:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E7CF800BF
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 12:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E7CF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sTFtUD9l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C36E5615FE;
 Wed,  5 Oct 2022 10:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0837C433D6;
 Wed,  5 Oct 2022 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664967587;
 bh=4jMzYU24d+yMcsfaBx4vsYUmNNj3cHQ/4Qvv5atAB90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTFtUD9liLjl7WLjHQo9PkZqVUv1WS49na83tXcwV1XDblWGoJS9XhIxLrHsF9bkM
 J+wIT2LpUcp8dEWJ8A11qVMdMqtJOEfPI2TOFwhbetcMld3OzyXXRRPkvlL5Fm+aWs
 SRGW0Oq1eyFSu8hFPfgUQoBlVbfkN9A43/7qsfsddSxl/gWfbSZoi9gZ9YNq+6jLyI
 eqnTm+VsnAIm2SPvlTafw4kc2H/+ozTJq54/M/U7imPMSjephI7JShfTalx7rkxLzG
 430kgIwvhOEoHOzpq/HvCGT7+QzUAhAc3gNJiqiDZLXSgSHcoN2/Z7qudBcZNFC9F+
 C0fET9YU/C2Pg==
Date: Wed, 5 Oct 2022 11:59:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu =?utf-8?B?KOWQs+aWh+iJryk=?= <Trevor.Wu@mediatek.com>
Subject: Re: [PATCH 08/12] ASoC: mediatek: mt8188: add platform driver
Message-ID: <Yz1jnb03bsI06rQB@sirena.org.uk>
References: <20220930145701.18790-9-trevor.wu@mediatek.com>
 <202210011740.ZdLtxKq1-lkp@intel.com>
 <de20b79da18bde2bbe56784cf4e209894f8235bf.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FJN3P96NgRROT9Pz"
Content-Disposition: inline
In-Reply-To: <de20b79da18bde2bbe56784cf4e209894f8235bf.camel@mediatek.com>
X-Cookie: Poland has gun control.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "lkp@intel.com" <lkp@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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


--FJN3P96NgRROT9Pz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 06:50:53AM +0000, Trevor Wu (=E5=90=B3=E6=96=87=E8=
=89=AF) wrote:
> Hi maintainers,
>=20
> As I mentioned in the comment, this patch depends on a reviewing
> series.
> Should I remove the related code from this patch in case of the build
> error?

It's bit easier to do that, though it should be fine to just note in the
cover like you've done.

--FJN3P96NgRROT9Pz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM9Y5wACgkQJNaLcl1U
h9BpvQf/ViaTtdSwbnr8r5a/PKyi33v6+70ypVPJ7U7DC3iVnoob7xh2CQFQ2gLX
d0Te48W6ZDxbn1e2XJDjCTizZubyJz89RbVGCg1Wibo7MkH6k5mRlmid0tlZ2Mq3
N+9UYz7o6J3WVelnqLnjbka3ZgbDhhdK+zFzUk9GcOJ+mrum1zsSxz2DYGmyMcMc
LXO+GljHMiR/v0NkCd8is0F9CHL51VzAr2GRuCPIpZ9k0JPUicmU6GSHonnsgDkA
71QA9FB1l4mIx08vqkJONs2M6TqjVPtssxwsaokQZRNtSMW32QgFyKcqAa+MubXf
kg7ZSAzRJCdkZAO9ITzwMosQFlVfbg==
=NONF
-----END PGP SIGNATURE-----

--FJN3P96NgRROT9Pz--
