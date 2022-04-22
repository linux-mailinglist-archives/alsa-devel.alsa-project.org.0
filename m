Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EE550B63B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 13:34:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F66172F;
	Fri, 22 Apr 2022 13:33:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F66172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650627275;
	bh=3jfuEAzvI+fireVbhLAA89FI7cLlXG2gLVIt5mnBIg8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HasrxyqBvxaebNlauu2IGGfaKvMf9po+uIuKgSzkFYOQcgotGIj0iUr46zCbmJ/Ba
	 ZICF9GIWxqPslj8SNt4Ehx4UJ0sgAT7E3pwaZHytop8I4LnPtt5XQe3U9v+zGeohf/
	 OFAKf/5OLJy4IJZ+nNvmnWh8XD8VJtUyg5BD5vVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C870F80154;
	Fri, 22 Apr 2022 13:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AB98F80245; Fri, 22 Apr 2022 13:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74B1FF800D1
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 13:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B1FF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N4xc6sPb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2DAA9CE28CB;
 Fri, 22 Apr 2022 11:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4348C385A4;
 Fri, 22 Apr 2022 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650627206;
 bh=3jfuEAzvI+fireVbhLAA89FI7cLlXG2gLVIt5mnBIg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N4xc6sPbo+yCUgMVCAfbmL9aaI0wq2uWC3lRyQp75hx9AB4KcChx7EvF3ADbYj3re
 gjC5jcLuiV0rrYIRHI2hV1QJ9RN7Wef3noIirHog3grPtVx9m2FkUUx9dP+R0qYwNV
 G6m1sInmZfIGXe5R3kzj6N0QL39ugPMBC63JxbP3xL0Zi5tcYr9i4g5MxxEInSG30o
 VR5rygxQY/QCxUbIAi/iZxSHWejn0IhHm1atF2cWDlA3JlK077bU5reZv/HUHaFLZM
 lOp9ohClb795LjV5CoLtPsIFEU/5EVPXXXFzitBgXBLis95T1yA32uKghxdnjcCuGH
 P1lrjqCWbiDTQ==
Date: Fri, 22 Apr 2022 12:33:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-ID: <YmKSgHrbb/7koM36@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <YkWfziQzprEsWL72@sirena.org.uk>
 <CCE4A06E-6D6F-457D-B3C5-C36209BF38D3@cutebit.org>
 <YkW4MPh8VWc8eSGg@sirena.org.uk>
 <6D199EAB-FE14-4030-96A7-2E0E89D25FAB@cutebit.org>
 <YkXKmxJ0R3qpUoH4@sirena.org.uk>
 <DB0255C3-C9EC-4EFA-A377-C4BB1073D9B3@cutebit.org>
 <YmKPQ6kLCPz+2XTJ@sirena.org.uk>
 <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HUPCgzDyOfBhsa/5"
Content-Disposition: inline
In-Reply-To: <B68302F2-3D77-4065-8A16-A9CC690AE10B@cutebit.org>
X-Cookie: Whoever dies with the most toys wins.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--HUPCgzDyOfBhsa/5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 01:28:20PM +0200, Martin Povi=C5=A1er wrote:
> > On 22. 4. 2022, at 13:19, Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Apr 22, 2022 at 12:43:30PM +0200, Martin Povi=C5=A1er wrote:

> >> One final thought on the playback routing controls: On systems with >2
> >> speakers, the codecs need to be assigned slots through set_tdm_slot.
> >> The macaudio driver RFCed here assigns a single slot to each speaker,
> >> making the effect of each speaker's routing control this:

=2E..

> > I don't quite grasp the difference between the arrangement you're
> > proposing and assigning a single slot to each speaker?  Possibly it's
> > just a reordering of the slots?

> Ah, maybe what=E2=80=99s missing is the fact that the way the speaker amp=
 drivers
> are written, if they are assigned two slots with a call to set_tdm_slot,
> the first slot is considered 'left' and the second is 'right'.

> So in the arrangement I am proposing the 'Left', 'Right' and 'LeftRight'
> values of the routing control have the nominal effect (within the left-ri=
ght
> speaker pair), while in the other arrangement it is as I described above.

So previously each speaker would get two slots but now it just gets one?

--HUPCgzDyOfBhsa/5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJikn8ACgkQJNaLcl1U
h9Apfwf9FyqYZwZ2D2ZxnG/lVxGl4cjqMmJe5FgwZCDKQPzM3Y9o4137S0U7kLTz
QM1Jf+3LJgVkdvJN/Hj3GaJPazdeXB6mMQ5o3p28PEe/ASqNKJCa6Z1UcQ5zdcaZ
D89JCKjmGPoHjNWiZCSRE6k7kXhtJO5MyXxNCgXAf5bk7352nedgPmg/4PapUL82
sEV/b496dYNV/EQ6HLGey/73P3cKc6w+urEcUQKaPcFlLWjK1J9ZP+TQuBdSxBNp
MjkcoQoQSNrw0PJ/rQWd++JkLimYQDwFEkaNeLWmh+K/L3/vCdun88ZtIbdeM3NL
VwJzyNbDoxmUu+IBEFgYIa+SP/YvUw==
=k+NI
-----END PGP SIGNATURE-----

--HUPCgzDyOfBhsa/5--
