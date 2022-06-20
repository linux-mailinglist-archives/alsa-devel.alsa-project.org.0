Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094F5522D1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 19:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6831D1B14;
	Mon, 20 Jun 2022 19:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6831D1B14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655746799;
	bh=jCwwSbElt83m1PQ7z2IHVu8qIm0sTyIZfWwdyaDXEQY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMa/wki33t9d+65AeIlRtcpHqokCWQClDC+GuJe8CL540vd8BVck1iKDITvR75pYD
	 I3U52Wbu8/EpaxF96nMhgzEQHa5zwB4KjAQsPDskfwxrZf7xJNca+Dcy80H65deUXA
	 SkGyboq32xxdrCCONSHmmabG4SJ6a64iSfeellX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1007F800E3;
	Mon, 20 Jun 2022 19:39:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 840AFF804D8; Mon, 20 Jun 2022 19:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FFE0F800FB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 19:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FFE0F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a2q2bkio"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22CD0B812A8;
 Mon, 20 Jun 2022 17:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FF1C3411B;
 Mon, 20 Jun 2022 17:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655746734;
 bh=jCwwSbElt83m1PQ7z2IHVu8qIm0sTyIZfWwdyaDXEQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2q2bkioPo6HKogBWHFyliQxaUyYq4YadB4+we/O/kmjDp2ubf8jEByZzv2C1QZeg
 hrO8b1Tzg74CpGc68N9s8iDq6ieZyCQT1QkyAMjcBQZ4Y3DAKcu7akqiN6I+fn/U86
 NTHNCRCwRQwl8V9dLT2oQ0VoUib8vhdriDganxqrsl10KvsvypFY4QO1+j1AurQ62U
 56raSyAcpfFlQk4E7TbEJSGMydpmzHHI68czU4V/IoOWkyuupgdgnBVNShYSda2idy
 Gqum8+7O+1hv8lzELpb3UQQ+2fMw9sWBn0h5KgZEnHECBVoIldbeAxre/5y3xmJKUu
 OrcId64AICnaw==
Date: Mon, 20 Jun 2022 18:38:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrCwqKeHQJe/Tzzi@sirena.org.uk>
References: <AM6PR08MB437600972B26E3A56E1190C0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fom1qi4IkRF41iWN"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB437600972B26E3A56E1190C0FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Eran Matityahu <eran.m@variscite.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alifer Willians de Moraes <alifer.m@variscite.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>
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


--fom1qi4IkRF41iWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 03:30:45PM +0000, Pierluigi Passaro wrote:

> Just for my understanding, are you suggesting to set a device tree property to force a fixed behavior in the driver ?

Yes.

> WM8904 allows using both a DMIC and LINEIN, switching between one or the other and this is how we currently use it.
> Why the user should not be allowed to switch between DMIC and LINEIN ?

The device shares pins between the line inputs and the DMIC inputs so at
least some of the configuration is going to be determinted at system
design time, that will fix the usable values of at least one of the
controls which ought to be reflected in the runtime behaviour.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--fom1qi4IkRF41iWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwsKcACgkQJNaLcl1U
h9CUdwf+JtglBbVYwWNdDwBJD3f6LDH+Nl/J2ZnnHyJ6UdOmqtk7L+sj0nDb4Q/U
2syrbcHJ/dHoJMRrdT/UXGhbeWCeZ4eQIbkY8hR8cRZQUteNZI73B9ccXbhMDAhf
GHiJAE4dQWqj0ziFIGLbR9uhsOL26AYd65dgKRDOnSvA1kyWM6f+UwvGH3Xs2Rfd
I8Ni+NwD2VBKJCzINFsEFqecPl7885vtD95jTnqu2eeDysBbEQ/Iuyh8h2G407gv
gSy6lMRRQUAHu8lX5vOOWKgAXi/5rv9jy+gI89b8iehRkMreEZ78kBHtIU6FnCMf
RPkRUcBSL7sTTTErsDGRhSUDVJmYBw==
=1FAH
-----END PGP SIGNATURE-----

--fom1qi4IkRF41iWN--
