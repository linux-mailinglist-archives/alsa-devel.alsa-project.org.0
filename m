Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15583546692
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 14:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B9351B0B;
	Fri, 10 Jun 2022 14:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B9351B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654863985;
	bh=c4gbRETkeNLzPUskI3vvk9q8WCCJ6b3wr/ztpqvVsCU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9KOWXIui42jX51/Q5kifCQqCLt7bx99TpZ2xe0iDtK7fADFsVt6xwVx6wwR1AxlL
	 ZiL2vv/g4HAVLi6HS0UVzkzdOvUJ2SjZdQP3G50HpNGczqQmxZhqIHwSz3hdpgvzVw
	 VHsWHN/oT4H6GA1Yof/tsPCTaKU27yFYav/H486M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5BEF804D8;
	Fri, 10 Jun 2022 14:25:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A738F800E5; Fri, 10 Jun 2022 14:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91462F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91462F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GOaKitbi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 942DD62191;
 Fri, 10 Jun 2022 12:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F26C34114;
 Fri, 10 Jun 2022 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654863925;
 bh=c4gbRETkeNLzPUskI3vvk9q8WCCJ6b3wr/ztpqvVsCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GOaKitbilbN4ZXIbpYOTarrxbSeZz4cuVQhVNReRYXQN3y6kILTbelOMyTF0Eu+VJ
 Q79JdK/aVBdRrrq3c/9o0lwcsQSwPcgX760GBbt3xhBwGa5HvkHnB5wDbHaY/89uXW
 LIxqkAA/JBAUkmXSiRYTQv0SJbOOgcqTK8zeYEek2x4GPSCbjsM9kGCn6rK4YqOYX+
 xMnjoz7nNR9fMxPKggqYTu9qLrATilRKaxtjhbMko2IjOGCOa6ME+a6BGmV7a2MCWC
 0iHJXRBHHNpUC1zaJCvNwzx8gyl2XL27UySrguTDBpyZpteGsI7jVCc8KebjQg5ZPL
 9JLK7lQGRwkOQ==
Date: Fri, 10 Jun 2022 13:25:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 11/11] ASoC: codecs: rt298: Fix jack detection
Message-ID: <YqM4ME38kp8D2+F8@sirena.org.uk>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
 <20220609133541.3984886-12-amadeuszx.slawinski@linux.intel.com>
 <YqIJxPFwwsbAPJ14@sirena.org.uk>
 <7a13211b-524c-f92e-8c80-a03660cdfd01@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oY1fEDU7w2pLa2+F"
Content-Disposition: inline
In-Reply-To: <7a13211b-524c-f92e-8c80-a03660cdfd01@linux.intel.com>
X-Cookie: Teachers have class.
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--oY1fEDU7w2pLa2+F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2022 at 11:46:19AM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> On 6/9/2022 4:55 PM, Mark Brown wrote:

> > It looks rt298_jack_detect() already forces the pins on?  It's not clear
> > to me what the relationship between this code and the existing code is.

> This aligns the code to be similar to other two rt2xx drivers and fixes a
> problem on our side.

> Original code doesn't reach rt298_jack_detect() when jack =3D=3D NULL, so=
 it
> never disables those pins in this case.

> I could probably fix this by moving rt298_jack_detect() call, but as driv=
ers
> for rt2xx codecs are quite similar to each other I opted to fix the issue=
 by
> minimizing the differences between them.

It would be good to at least clarify what's going on in the changelog -
it's not really clear what exactly the problem is or how this fixes it.

--oY1fEDU7w2pLa2+F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjOC8ACgkQJNaLcl1U
h9AGWQf/VO6qiooQXPzw8LPIHtdHcmNKVg+S09DL/i3Q19RoOT0N/VWEwxyFqBKT
9MyAhet8C+A8qaPojsZYi0vrzXWLZSkFQt5LqS2yb2iIWv5kP9M4BzgSAaYd8aGJ
sQO9KbWg5ODAn13p4kWGdvvPN8i6YRTg695GG7QeAyPAavvZW1O/V8Lfeda9sKl6
uLq492J8XPInh4GutXVC/0IdbhAW9svVLezDBPOKGr4TKHFDkmhPQs/9MvvsmpAC
WoWz8gFX/YAtPGb05heXV0oYK6dN1LUNbDeDqvUIEMpBVyrQe+IzBGwRfDRgTsmY
hgFF6REdMD6k6VmKbbbMxxYQGtJm4Q==
=7CPn
-----END PGP SIGNATURE-----

--oY1fEDU7w2pLa2+F--
