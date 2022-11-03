Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17024618798
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 19:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981961657;
	Thu,  3 Nov 2022 19:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981961657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667500434;
	bh=Hck8cjJ+4R3//xB7Q8qTKGJ9aassQ5/yidi0JVA2cWo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FblzLUsX+N9CaRrh2cg/SIpSYmFavJBDxNKFg24MT7sPIv5i4ql3T/2yiplUMQ6+z
	 5B9nPtWkjUNQr4eMLK8A8VdSZZ+wlThSXQIzSvfw7UhpqkOK6dcspeAZ4svCEEZdpx
	 Wkwcj3kFTFUi3w6/6Y5LU6cNN+TRSXZKEk5/z8L4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE4BF8051F;
	Thu,  3 Nov 2022 19:32:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C9DF8051E; Thu,  3 Nov 2022 19:32:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FDF5F800BF
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 19:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FDF5F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ejOx1hr6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C37E61FBF;
 Thu,  3 Nov 2022 18:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7F0C433C1;
 Thu,  3 Nov 2022 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667500371;
 bh=Hck8cjJ+4R3//xB7Q8qTKGJ9aassQ5/yidi0JVA2cWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejOx1hr62Urb3MPgwsvwVgy8/5u4h4hzChkyJEo5u06oUX+ssYAcJqI6cInVX1LhP
 hOpUu/zXdK9PWCBk+zBXwdNLgiA1YuPzZDawmP11vMRnXpbNoaTCdPoVmeRIn5cNEm
 TFxYWFocut+w26Wm6BgeI8uWEG0Pbin78DGlZU2cNKWl6MdEbuIOxkNHn3TRvraDeF
 HTDIGeYUPnSikE4nctDrqWgR89VPqaMOENOFCyzY7ZGnY6qgXXhXWqgDTrFDdxLB9Z
 zDjBOyxgEBIO/UY5LOuaP1JF7s44fL2UW7JNOJBbbGKR9XUY29oi/ss+9HvRJ7kOmm
 MuTW6+RXC/ECw==
Date: Thu, 3 Nov 2022 18:32:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH 1/2] component: Add helper for device nodes
Message-ID: <Y2QJS+M1xX2RaK1v@sirena.org.uk>
References: <20221103182222.2247724-1-sean.anderson@seco.com>
 <20221103182222.2247724-2-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZW7Ag/fXdrbtoky8"
Content-Disposition: inline
In-Reply-To: <20221103182222.2247724-2-sean.anderson@seco.com>
X-Cookie: Dead?	No excuse for laying off work.
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>
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


--ZW7Ag/fXdrbtoky8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 02:22:21PM -0400, Sean Anderson wrote:

> There is a common case where component_patch_add_release is called with
> component_release_of/component_compare_of and a device node. Add a
> helper and convert existing users.

The usual pattern here would be to split adding the helper from updating
to use the helper - it makes things easier to merge.

Acked-by: Mark Brown <broonie@kernel.org>

--ZW7Ag/fXdrbtoky8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNkCUoACgkQJNaLcl1U
h9DfiAf/fccSbdTPcf/MR3+HytglBkaO/HlwepPSW582YcQ2/3q5mNX8QDYVAtq5
4LQR5pjemiBDY+lWTqufmKlDBjw8h9NY0L6v/NApr7x+PK1ZUEW2Ecqc6zcZ8LRT
FzBdTQMO00sV3mkJywGQBQGuqyvZrHYNL1RWP0ZDYoRU+27RZn7zOmnNuiA1g8IQ
AoMLzEGkIxhXEF1cmblJ7JuiB1p694k+nltDrbjqc0FsuGMVbfwOG2sTbHYYZJF2
EcaVTqEpCkwmxU2XAY8lgt4SXVO9m26QvgAFqyHSXOvag/H3HaSPNmNPWpUamabu
UWfwTYDmTIOxKFZxy+b7VIfdb/ZWrg==
=igBE
-----END PGP SIGNATURE-----

--ZW7Ag/fXdrbtoky8--
