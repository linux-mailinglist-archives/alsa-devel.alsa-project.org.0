Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C9053B758
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 12:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EAB8173B;
	Thu,  2 Jun 2022 12:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EAB8173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654166058;
	bh=JeCZWmYqoi9EEJv8I6HL0Z/IggBQe6DeEaQMNIJSQf4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4DtXyjJfOr1GRth0BACeGzBBrhmQQwGh7MdHnk3JQaRJE3s36/lqqjCaUL8nRYV2
	 VyikiSU5oLdPzMHS9tz8I7IRrgMl12VDzO+nVbh785q9osqpD2JRTmuEpriKGOUdGW
	 48n/sicUXnwyfKZtM7DoxE7HBnsVFwOQ4kmg8Ux8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAAC7F80089;
	Thu,  2 Jun 2022 12:33:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDE13F80236; Thu,  2 Jun 2022 12:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC0F8F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 12:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC0F8F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W68RLrKt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8F63615B9;
 Thu,  2 Jun 2022 10:33:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5419C385A5;
 Thu,  2 Jun 2022 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654165992;
 bh=JeCZWmYqoi9EEJv8I6HL0Z/IggBQe6DeEaQMNIJSQf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W68RLrKtGotXNkegs3FqM0Lt28cnTn9J2m92ygZhS2WZ4AxAiF0n30wIdOo/UGWTi
 aCn6/m0ouOCB7u6ZzERHwE4Swo1KhGtuTLFYiMW7Q4T4R8D0os3uj5mUu+h/C8K9yr
 jHAPpUzdcCi6C7IkKMxC/axEYbq5fps2iHXM60Ht0nmx3BhF/RGD0/GCHLpcWhLhNi
 +QXWcMkNqeAxUUhfyUJ9pNOIoGELjyzti9kT+ozzpv5rsK/xZXh7Rc51xs3ZwebMc3
 fi9WusMBqMeiqFw8UjzLdI1lf57JDqrHnM1lUcJfnXtoG6ZArsHDwDjOiNg66SyrEp
 /FAMcAQBVOUaA==
Date: Thu, 2 Jun 2022 12:33:10 +0200
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off
 and on
Message-ID: <YpiR5ov8X/5yQACT@sirena.org.uk>
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
 <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
 <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5+sDAvOzRJe09QOV"
Content-Disposition: inline
In-Reply-To: <817ab950-db61-9d48-f51f-41009c8bd23d@canonical.com>
X-Cookie: May your camel be as swift as the wind.
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, alsa-devel@alsa-project.org,
 ctlin0@nuvoton.com, David Lin <ctlin0.linux@gmail.com>
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


--5+sDAvOzRJe09QOV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 05:57:43PM +0800, Hui Wang wrote:
> On 6/2/22 17:24, David Lin wrote:
> > On 2022/5/30 =E4=B8=8B=E5=8D=88 12:01, Hui Wang wrote:

> > So when the playback/recording starts, the PLL parameters from Reg
> > 0x25~0x27 will be always set before Reg 0x1[5] power enable bit(PLLEN).
> > When the playback/recording stops, the PLLEN will be disabled.

> Thanks for your comment. But it is weird, it doesn't work like you said,
> probably need specific route setting in the machine driver level?

Is this triggering due to reprogramming the PLL for one direction
while the other is already active (eg, starting a capture during
a playback)?

--5+sDAvOzRJe09QOV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKYkeUACgkQJNaLcl1U
h9AO/gf/Zi+0iTv81wCpwsOCXDuBVrbDwFJfF5aNvk2ep1nFWsBmUQcMMKmE0NqC
z3HzDp+nRQvhhxLKpk4NBvTVpDQyhZCj1SeGuk7U3TYjWL8MmHjQZX2MYenL4gDJ
udwEbB3rKjteBWYzzGdAf3erog+cyTMzPf1R2uJo6PFg8A0Ej0XaEor5pu3zDvEL
6s5AcS4/laAXyDliqC70jEs4QQpaK6O7GYJLPvz5BGU70FvuoFdKCBSPxOJQGsQN
H/A8QHwD9M2XvbD+uCtsik78QP5BWu2Hgh5U3ucw0nJvo/dYBjqPeJZK0gSOFlLT
RI71HVGFXyOOHeFMx+UAbf36jv7rKQ==
=2lkA
-----END PGP SIGNATURE-----

--5+sDAvOzRJe09QOV--
