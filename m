Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD53589CC2
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 15:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20218851;
	Thu,  4 Aug 2022 15:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20218851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659620059;
	bh=4UN4Sh851nEfGxs4mtdDwaJj3APw+mKwvZfqZjce8ZQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3wveZlIx/6AnJhcbHoVeaaSmlMujiO5ExZSvJNeCMvTZ8d9iVIm0Cei0u5Fgm01M
	 b2kaI4XCrckLvDAtLyBm/CLGZ2bLqCsvFzSpA19behsFmJGv55rOBaA7arQ6YRjfwI
	 rHJroYlH+Xup1Up4mL6dpDBtPijQlYNt6gq8Dxps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B460F8012F;
	Thu,  4 Aug 2022 15:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12819F8016A; Thu,  4 Aug 2022 15:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 696FDF8013D;
 Thu,  4 Aug 2022 15:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696FDF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gw1Ka9jQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 502C561831;
 Thu,  4 Aug 2022 13:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAB4C433C1;
 Thu,  4 Aug 2022 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659619989;
 bh=4UN4Sh851nEfGxs4mtdDwaJj3APw+mKwvZfqZjce8ZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gw1Ka9jQm2EnMMwx87dKHUeoy+UdaWeKnJcFzH+ufqWvkB/UIKAQPeylrazG6dB6A
 RvphiLRFHzxrQnyj/OXMm0IgsSoYtEu3gKvOkKRQ+vHGDkAhhGPSbTn0RMLsK3DALZ
 pzNMyDmjzyTO/vugVmqZDxnpuLb3L5wqtYSvNapb5/ADyPcBDSS9kXdp1IfiRmBi/t
 kpqDpJalEFzyxxu0f0ArUAKsUVggAgDUN9p8rT46mQlP/rJ41DEqi2tK12e8bUTjU9
 hUCIex+JS390PNT80Ryac2vYSt+QGBNepf6IMPJ+vQJe/NQHTeaYA0G/zcR4uJSv9g
 Ntb+B+G04n5uw==
Date: Thu, 4 Aug 2022 14:33:02 +0100
From: Mark Brown <broonie@kernel.org>
To: "chunxu.li" <chunxu.li@mediatek.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: mediatek: Add .of_machine_select field
 for mt8186
Message-ID: <YuvKjn3cW5im2Yw9@sirena.org.uk>
References: <20220804091359.31449-1-chunxu.li@mediatek.com>
 <20220804091359.31449-3-chunxu.li@mediatek.com>
 <Yuu+elYxBv3xZ1O2@sirena.org.uk>
 <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6kGedXdUenW5S127"
Content-Disposition: inline
In-Reply-To: <46f972f41a8c1bbfc2bfa42c431308f6b5fe2234.camel@mediatek.com>
X-Cookie: Did I say 2?  I lied.
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yc.hung@mediatek.com, matthias.bgg@gmail.com,
 sound-open-firmware@alsa-project.org, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com
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


--6kGedXdUenW5S127
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 04, 2022 at 09:21:37PM +0800, chunxu.li wrote:
> On Thu, 2022-08-04 at 13:41 +0100, Mark Brown wrote:
> > On Thu, Aug 04, 2022 at 05:13:59PM +0800, Chunxu Li wrote:

> > > +		.board = "mediatek,mt8186",
> > > +		.sof_tplg_filename = "sof-mt8186.tplg",

> > The mediatek,mt8186 compatible looks like a SoC compatible not a
> > board
> > compatible...

> Our dts config as below:
> kingler board:
> compatible = "google,corsola", "google,kingler", "mediatek,mt8186";
> krabby board:
> compatible = "google,corsola", "google,krabby", "mediatek,mt8186";

So the SoC is listed as a fallback for the board and things work out
fine.

> Which of the two approaches do you prefer?

I think it would be clearer to keep what's being matched the same but
rename the .board field to be .compatible, or possibly .system_compatible
or something if it's unclear what's being matched.  That'd be more
normal for specifying a compatible string anyway.

--6kGedXdUenW5S127
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLryo0ACgkQJNaLcl1U
h9AV2wf+P1McXNe47oxC4pSkB6Vp8RnE2YJLp73cxmN6fQR0tXycCwlIB4nTYrWt
C7H/h1k9T+ARv2785fTMpykEQmPUjhdAQW5TXdewWzvoey37H03oE1SkpJrqKsVh
VMDX+njYEvDzi3OL+D/JMxPVCzPQnnk8SwSRo8KUV4yxaLCZ5aJEQ73hXL7kwkYT
EK+KjGM010dcK8X79ZGDBE/0N5UgOWTbWw4WpQH6mNCzAcMhmiCCS48t25W+5fXj
BT05BMe4/RSuo6Q3Oznve6xsfjhPkAC9/bdvDszSagBZDrOuqq0Zt0gh3LayI60O
5LASb2bTbtSyzAys/ISEh1xt+33Tfw==
=AqQy
-----END PGP SIGNATURE-----

--6kGedXdUenW5S127--
