Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB8D514A62
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 15:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423E33E7;
	Fri, 29 Apr 2022 15:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423E33E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651238454;
	bh=19u80WrRYBrn0euhR5t2IahZXsXYVRXAnPVdCH6q/OA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtXiH9tBM/K9Czhl0oCJCny0L3Hs8lCJQooyWDGIJjEQ25mm8UJV3ueG/4y9mnDYI
	 WL4/qFjHVUTDPQj/CE7hef39vaLc7+/kxwb+dkdX+uyt5yCHzpF6+lCe8Ub18hQfGa
	 DMIFJQOxpYces8BtPZQIJWfVUgRqY/XbwSF8guOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BCACF8007E;
	Fri, 29 Apr 2022 15:19:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D978FF8025D; Fri, 29 Apr 2022 15:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F944F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 15:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F944F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uzp9dNrw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2269B8346D;
 Fri, 29 Apr 2022 13:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB19C385AC;
 Fri, 29 Apr 2022 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651238389;
 bh=19u80WrRYBrn0euhR5t2IahZXsXYVRXAnPVdCH6q/OA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzp9dNrw1fq7kaRwzsuipBWIEcIQrGCJXYGUQ+EJvcUn1wqUYdAMvlbx+LuUGhAKn
 8xd69n0H8JX0CPgb6WjcW1q7XAfUofjuWy9WQ+fQO4NnJ5mRBJAAknOmVRLDPzOHCS
 OS+7RFvMnFVE+xOeV77jBorf1wah47euXafGH6skPCZhCuZrgiFz/g+Lbv5N9ZTIMu
 b5T8hbIzNmL26tDus1GewZO5h9kWYbB+tHrfcBxxkKFQIM3IS7wJgdMb+XHDJ/Xvn2
 3jABx64hHlDYm6X8MbIoOTloGjf005gkwoSMRILhEkLYoCmCClXJdky2dowXC2lUUk
 AT0KiiAs5SSzg==
Date: Fri, 29 Apr 2022 14:19:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Message-ID: <Ymvl7x9NTJor/vfx@sirena.org.uk>
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
 <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
 <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
 <cf9b425e-84ff-af12-72a7-4056b8cbf90d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qbtHrth/VF0HNcN8"
Content-Disposition: inline
In-Reply-To: <cf9b425e-84ff-af12-72a7-4056b8cbf90d@gmail.com>
X-Cookie: Are you still an ALCOHOLIC?
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org,
 cezary.rojewski@intel.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 YC Hung <yc.hung@mediatek.com>, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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


--qbtHrth/VF0HNcN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2022 at 02:57:12PM +0200, Matthias Brugger wrote:
> On 29/04/2022 07:59, YC Hung wrote:

> > Sorry I miss this mail.
> > Could you please help to check this patch? Thanks.

> Rob gave his reviewed-by. I just saw that the driver maintainer is Mark, so
> I expect him to take the patch through his tree. Didn't realized this
> beforehand.

TBH I'd missed this since there was nothing in the subject line that
drew my attention to it.  Seen it now though.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qbtHrth/VF0HNcN8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJr5e4ACgkQJNaLcl1U
h9B6jQf/dW9MqjjZQdTkinE+KFUJIRcK4SQ+e5QvdyqXMZ17f40lR3vhJ4Xo1NME
uNZx34lYDN8jy1PAvJa8HlyqyL0nVzOuxN7qjRuMr/uBlg/qhLEYFUcaxZXXc/wR
aGaaF3csCsN0+n/CMwkWP/my21AyyzhXfu8ygvhEVqhdJhetwOtYNfOB/aIHOId7
oszASoq1Jvbpvz7CRKq/Vqqk8O9ASXDpvSERh6iWSkWH4ShJMteoAipC4MndSgSI
rc0LLIZ2+wq+MAdE5KoqccPfGnx2UsJ9+6MzcYc7SbpRx/LirYjr5THGGkLWS/m3
kqvXdGrUS8RZNjj07qJ/cqGj8a/mOw==
=Hfdr
-----END PGP SIGNATURE-----

--qbtHrth/VF0HNcN8--
