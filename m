Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E864534EC8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 14:04:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB69D16C6;
	Thu, 26 May 2022 14:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB69D16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653566682;
	bh=SHqqNURW0tOPuSJZlgicE58CRfglRqKvrHRf4aGn/KQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnOkADvhj0EPjyAJUj68FCu7qVFBNptMcJPLS9x+SOZ1GamOPHMuLkSkVsToJCI6F
	 Rd+LZao6XXNSIljpyhHuvHQV4N9v7qzOVeS+0jl+KH8M9m4jBF/ABMYCa3wmzqJi1I
	 w3V7E/KMdptCisREOshTjfCWYqBp8hKisObTMtXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED51F80171;
	Thu, 26 May 2022 14:03:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E57B3F8014B; Thu, 26 May 2022 14:03:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB045F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 14:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB045F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nFhOM90U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7FF9B81FC7;
 Thu, 26 May 2022 12:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC14C385A9;
 Thu, 26 May 2022 12:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653566614;
 bh=SHqqNURW0tOPuSJZlgicE58CRfglRqKvrHRf4aGn/KQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFhOM90Uf3ORx2YP3k0ca345cTnr8wjLC/1P+VIqBbxasy12k7Y+25tNh1w1Hb26S
 mUThSla4M+oq3Aw1xnSwORP9KVIPYVwEpowS0QRmFWFbTciiy2/iJIrIfwd3N0rG7o
 dUV51RKtzbjF86DS6+rWCsiOkTNMH/BVj4gn5yHjJQPvuFeJf7vIP8+EFtIki+FdbZ
 iQo5l4ohVe9E7LKdZ2So8Lf3AtverLb2a2wXHDKH4C3B4nkAZnmFhy0Em0wXgC9dSh
 k4Q2P+cKpsrYvqXEvPJeHvwVRSqdvw4cdSJU7Hjvvtri3ykQNZ+D1y3uUJbL8g0cOS
 qFUbTlr4DKpIw==
Date: Thu, 26 May 2022 13:03:21 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Message-ID: <Yo9siXkJ5FUD0+w6@sirena.org.uk>
References: <20220509205847.607076-1-nfraprado@collabora.com>
 <20220525205346.6ik67nduv3zexl4p@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9qit21t6XD5yksAs"
Content-Disposition: inline
In-Reply-To: <20220525205346.6ik67nduv3zexl4p@notapiano>
X-Cookie: Money is the root of all wealth.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--9qit21t6XD5yksAs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 04:53:46PM -0400, N=EDcolas F. R. A. Prado wrote:
> On Mon, May 09, 2022 at 04:58:47PM -0400, N=EDcolas F. R. A. Prado wrote:
> > The Mediatek AFE PCM controller for MT8192 allows two I2S interfaces to
> > share the same clock and act as a single interface with both input and
> > output. Add patterns for these properties in the dt-binding. The

> Gentle ping on this one. Any feedback for v2?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--9qit21t6XD5yksAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKPbIgACgkQJNaLcl1U
h9BEugf7BubpYYtmW6MsYqo17GyOLuEtujTpIaBpCHr3zKHc/G1ALk3Jic2PFQm6
SB/+DOLHkLjRB/u+jrX8LqA6LIxIJru5qi8RLa0dtuae75+uLoTe8qBs8HrxOQBK
QTPYr1vlII6EKUM8gw3LcucEszhcahCvPfuyQ1w6mmfPXqV+SpyZ3skJ+YwcvK5e
XefO3Ju7mxtkSNStuKQ02By2CxSUD2gRj2lkqVk8BUN/KPFWe0la6tn5xfvt9hig
e/hDuIqgm/EsPhoQSzJo93geTQpN8ATDiKPrRod0d8xMXFu687sbquNQBQYGhVzR
6Y9ziy+V1HLDz+UWE8WzWYuGQknX5g==
=d5lb
-----END PGP SIGNATURE-----

--9qit21t6XD5yksAs--
