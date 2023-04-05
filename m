Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF46D7C26
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 14:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A8CE1FC;
	Wed,  5 Apr 2023 14:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A8CE1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680696195;
	bh=0chTIunSmr+WHRXS+JXh64e1b6L4YpPfuEtUD4qzE5A=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qvd72KIN45kz1d149pzjzbjiYAD6gduXXOc2MkW6SHM5Dcoouan7q7ZRUYnpeikgz
	 5YBH6EdpvPf6L7oJDllo40VAusrNwIblxnaXMO/zjQKHjSI6L8UUmTP1Zs6yINs6gw
	 ogvnu0kAQKLFchw/2qp5hzHcJNkOEd1mbZynp/eM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BC9F801C0;
	Wed,  5 Apr 2023 14:02:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5647F8024C; Wed,  5 Apr 2023 14:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 035FFF801C0
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 14:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035FFF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YM0mKoM/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BFE8062304;
	Wed,  5 Apr 2023 12:02:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F1BC433EF;
	Wed,  5 Apr 2023 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680696132;
	bh=0chTIunSmr+WHRXS+JXh64e1b6L4YpPfuEtUD4qzE5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YM0mKoM/0IS4Q5Dyy5MEEcxptpUYJXzG6tav8sQV79wTciKPjtuAXMUQ6NHP5Hvj/
	 qTgcC5r5fMNiqHSgosdTDEn6/1NgySv0OcaT92rONf/e2zHQIKBVT8jR7VuNr/1gf3
	 Q3DI0omxiaShzWYUTtPnmCpnee01QMZECPaWAYTAz/kUW+he0orZq7OUtHWGY09cJ8
	 hsoJtVYGqcxcMwbuVWERzjxfC1vIDAo9B2Owj9eYfk2D5DdN6RwshJwRSbF69thpnq
	 vD5IW6CQejlecpr1Ii1tiU4dRuzqWNxOQ4UbPbikxz99mzte7TQWcinew3pvaTjgZx
	 SvO1bL+hoWlDA==
Date: Wed, 5 Apr 2023 13:02:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [EXTERNAL] Re: [PATCH v10] ASoC: tas2781: Add tas2781 driver
Message-ID: <84738924-8467-45e4-9e68-0f9633f938f7@sirena.org.uk>
References: <20230329100107.8181-1-13916275206@139.com>
 <8d0d0478-1e45-ea52-f1b7-910b747d6282@linux.intel.com>
 <7a0cfa60e2a244168edd49c3d2f6a2bd@ti.com>
 <458d7c2f-bcee-9ec3-e955-9661a06a3349@wanadoo.fr>
 <bbae9e35f2bf4cbcbc78f852041e4b2e@ti.com>
 <030c2cbf-dec3-91fb-ac82-949cf5764b78@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e8MDLbCuMChiZ671"
Content-Disposition: inline
In-Reply-To: <030c2cbf-dec3-91fb-ac82-949cf5764b78@linux.intel.com>
X-Cookie: 1 bulls, 3 cows.
Message-ID-Hash: NPV4NLMQEGXE3GRCUW5PDCBQ2DERLL5O
X-Message-ID-Hash: NPV4NLMQEGXE3GRCUW5PDCBQ2DERLL5O
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "Ding, Shenghao" <shenghao-ding@ti.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Lu,
 Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu,
 Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 Shenghao Ding <13916275206@139.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPV4NLMQEGXE3GRCUW5PDCBQ2DERLL5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e8MDLbCuMChiZ671
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2023 at 01:35:34PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:

> It makes sense, as array access reads 8 bit value, you would need to acce=
ss
> value using pointer instead. So instead of doing be32_to_cpu(test_buf[i])
> you would need to do be32_to_cpu(*(test_buf + i)) if I didn't mess the
> pointer magic ;)

> And then I'm not sure which is better, be32_to_cpup or be32_to_cpu.

The p variant works with unaligned pointers but might be slower if the
architecture doesn't support unaligned access.  For this application it
probably doesn't matter either way.

--e8MDLbCuMChiZ671
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQtYzwACgkQJNaLcl1U
h9Bc1Af/eDQye78rgNWb+jc+/dj+X+raUYc4Xq2BQbJ9RuBegejxWD1//K8Hh8UJ
spCMiiTZBMktU6pgggCwEEpkBGgMw2FA4lfLYaMw/lLBdqk3ISgcATGFn5c/APpX
qsQ1eI5FO7kfA40+xv5jg2n88okQHbLgjMzaZa8PJpU4gTY6X17QmGLfsl+3qbBz
uv4DXBbUSTvbXqHOLjSiUoWH+UBo3Ki2TIOwGi6USRkA+QnYulVu1PFqnYFsG5i8
ECmR1ms5JC05IEWOlPN4/jLOvaxycaQdOuCwsW2nf4FWGePt8JEwBGDX4tFU5mcT
7qi2zG7/UBJ34L1w7eAwy7XRzhMX1A==
=NOZi
-----END PGP SIGNATURE-----

--e8MDLbCuMChiZ671--
