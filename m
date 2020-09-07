Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA72603B0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 19:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05DB61765;
	Mon,  7 Sep 2020 19:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05DB61765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599501220;
	bh=YMxZ0LBQubRWUql8kN4D8NLNlVpvgs2xsR5mya0rxqE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oilqBrkivIBJSv91tbJNtKz3Jq3pkyIt0Jp3Hs5KvyoJGZfQpdDNdkL8/OmZZM99L
	 zPYeq+1NDc4C6R2U7RSHRI+3xeeFDFwZldAUfv89q0E+7smfFJhdJp/ProX98M7Ha/
	 zBVlYlzp3QBtOIL/qKJD60PXCkMssxnvJ8eqgFVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A15DDF800B9;
	Mon,  7 Sep 2020 19:51:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BDAFF80227; Mon,  7 Sep 2020 19:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8527F800FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8527F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v5Kb6di9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F3E2080A;
 Mon,  7 Sep 2020 17:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599501103;
 bh=YMxZ0LBQubRWUql8kN4D8NLNlVpvgs2xsR5mya0rxqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v5Kb6di9323FGcnbwasyBMt/IV3HEFuAzbUF+APrbb0SwX1Vz8+6BIvEfNG1YP0Sn
 4Yyl9nTx4dUPvO6OfOBYrJ1/CQ6/Pxtf7VpWZ80gfFV/2K0iRzWwK1P8y5E1vPxDz7
 L+SR/HeAepqOnh9a29zkFo5IyF4a3NjkhA+slzaE=
Date: Mon, 7 Sep 2020 18:50:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: mediatek: mt6359: add codec document
Message-ID: <20200907175059.GD4907@sirena.org.uk>
References: <1597644455-8216-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597644455-8216-3-git-send-email-jiaxin.yu@mediatek.com>
 <CA+Px+wXSbGLb+AZnF8ETRycRUVjqk4xacm5DH6MzuMw0vh6Wzg@mail.gmail.com>
 <CA+Px+wUMXoSL6w0wBduE7obJRWgCteeT8=_=U=8LR34JKTTGZA@mail.gmail.com>
 <20200819103730.GB5441@sirena.org.uk>
 <CA+Px+wUV89KO8JJd3+HpOrgFRSc7sdg-DBW44C31262Qx9NzVg@mail.gmail.com>
 <20200819194005.GC38371@sirena.org.uk>
 <CA+Px+wWMH6iUzFq0g4BFC5qA993r9UBobmNAyS2ie+xDwci-yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
In-Reply-To: <CA+Px+wWMH6iUzFq0g4BFC5qA993r9UBobmNAyS2ie+xDwci-yg@mail.gmail.com>
X-Cookie: Elevators smell different to midgets.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>, howie.huang@mediatek.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 shane.chien@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, bicycle.tsai@mediatek.com,
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


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2020 at 09:37:12PM +0800, Tzung-Bi Shih wrote:
> On Thu, Aug 20, 2020 at 3:40 AM Mark Brown <broonie@kernel.org> wrote:

> > That's for binding the MFD subdevice to an OF node, you don't need to do
> > that for a device like this - you can just use the of_node of the parent
> > to get at the properties.

> There is an issue we overlooked.  In sound/soc/codecs/mt6359.c,

> After removing the line at (1), mt6359_parse_dt() cannot read the DT properties.

> Here are a few options we can come out with.
> 1. adds back the compatible string in the DTS
> 2. gets of_node of parent in mt6359.c, and iterates all children nodes
> to get the desired properties

Do this, but instead of iterating all the child nodes just look for the
named CODEC node that you define in the bindings if you don't want to
put the properties in the root MFD node.

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9WcwMACgkQJNaLcl1U
h9Dp0wf6A3eiem9QGqgDURjl9QoxRQnRXVafGmdx8S4QioV/mf+/xBOc7cNzYri6
keaJ0K+HFWRqk4GwYx4JhRYez80iQmT6TWszym6iv0bCB5UeGXXvhsxsnAm06eKi
FgsY9Wx48r9hxEvDr6S46HYR++HLQI2cg3krRvm6iyQ/jLc1tm1zGfRSOXYenfSJ
HuJydCwg8AUxd0o486d5K6v8md9EK7vtFqqNTEi2NLcfLNlXhR+7L8Ft5LfhvYDk
ScJydi1HAyayykul+n7w4r6ZlP8H5I9Ha7O7HTZMEmpWufiNAl4l+yn6vL2l73xX
77G/jtTLhxwpYEW45hLguvCN6asf/A==
=CY1J
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
