Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D255118A9
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 16:12:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6CC6F3;
	Wed, 27 Apr 2022 16:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6CC6F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651068772;
	bh=QFg7FBwb5MhYvF30DgR/mC+Yv8yfPxKYQ4p2GxJHqL8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CAJi7iDfYq4OBjiyp1K9N5o8OXau5OFkHAr/yOP/6hTa/igP/QgTY4v5Sm06Ll9M6
	 Yim00swfKhzNZtqXhSVpQ/ornZ7RPelSYvhTANquhC5OF0sNeyi5rK9bZcTlyAL3PS
	 3SwEzypHxqKyI9Lh48A45mArWHqITFu54HIGFiio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60220F800AE;
	Wed, 27 Apr 2022 16:11:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E809F800AE; Wed, 27 Apr 2022 16:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD17F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 16:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD17F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m6eI5zyl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB08761D73;
 Wed, 27 Apr 2022 14:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36849C385A7;
 Wed, 27 Apr 2022 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651068702;
 bh=QFg7FBwb5MhYvF30DgR/mC+Yv8yfPxKYQ4p2GxJHqL8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m6eI5zyllK+Y+xTMdEHPW3BszJCgo/Q68l8tSmnnzwp9qlsRiENMSXIRO+oOOmRYo
 yF2tMozouTq0i+sz4AA8FeYW2ksHvJf0wkzhtWSI/ZZFX/dW+9M+Lv29xHd5wGkpZC
 BPTa6vq+2uOXGk5HHwksiDs76ZQb446+f1Bi9RGYr5LYRJaMNKGAUGw6yt8mW9iV+/
 OmwZ0GVimllpbd/F6+HoO6Xbuyqaa2Rg+YYDOejWQTUM7w6dyfBjoaDNVazzCIRNMj
 HfGTG/dqfxmT1+lmaOYjceKr1BihNcB6eal2KP5YueHcICfhh3F+dwdDvoYz+0+vxs
 K0cIBS1LDX/wA==
Date: Wed, 27 Apr 2022 15:11:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Message-ID: <YmlPGGGizyWkSTFQ@sirena.org.uk>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-5-andre.przywara@arm.com>
 <YmlF1JlIvY0lTaAD@sirena.org.uk>
 <20220427145234.3b33a5a4@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lW0S7O/SG+t2Koqx"
Content-Disposition: inline
In-Reply-To: <20220427145234.3b33a5a4@donnerap.cambridge.arm.com>
X-Cookie: Buckle up!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liviu Dudau <liviu.dudau@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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


--lW0S7O/SG+t2Koqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 02:52:34PM +0100, Andre Przywara wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > This is a standalone sound device, you should submit this to the main
> > ALSA maintainers.

> You mean Jaroslav and Takashi? get_maintainers.pl just returned yours and
> Liam's name, plus alsa-devel, because sound/arm/aaci.c is not touched.

You shouldn't just blindly trust the output of get_maintainers - it's
got a tendency to both false positives and false negatives.  When adding
a binding for a device you should pretty much always be including the
maintainers for the relevant driver if there is one.

--lW0S7O/SG+t2Koqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpTxgACgkQJNaLcl1U
h9CWhwf/WYQsB/EvBiSojEIiyRY66fDl/NKpwgAuO2BJ6J0QpbrBozaIt/AUUwbx
1G9ID/3Qcr6ygs37BkZRGXr/8d/TgrvNoqtv53D60QpCePKjPNJpuv770KGX+4/9
wd1EoArazkMI8mynolTV71V4jitecaWDZLDOcSgYnWaD1xpjMu7HKX2SAkz98iEl
aszHvlKF0ErwCcPRSZHVVeG1MONn5L1uCGfvo4XwEyOkuBlixJseh2+PKYmVSQv3
yAi7eVEndmj1qwwUfGBAlS2NUYr1sOkesX385QIuuG3SepPFNfwYxRm1iEKNxA3u
6xLz+N1h/Pxlm51jhEnQTTzAbTCrSg==
=9RvN
-----END PGP SIGNATURE-----

--lW0S7O/SG+t2Koqx--
