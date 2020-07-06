Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D202B215220
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 07:20:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6718A1680;
	Mon,  6 Jul 2020 07:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6718A1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594012817;
	bh=rGGHBY0t7206Px54Uw3pH/xzhBqrSWNKVMJbEBZQGMs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vqc+KI2n8QFTGxG4UjitK5IwJe2c5tQIDVIYS7Lp5UyAw/SgLDXt7WIINMb7EA+VC
	 pvQgY9LE5PLxiAdfBm0VbCXtdMqKh+R+BTHdgW8XUv9yazrf4Y9cYljhKExVpsvYJg
	 x2dkHsTntG3hzCQ3FCeTh+1/qxNTadTMGkqxH1S0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03CF6F80161;
	Mon,  6 Jul 2020 07:19:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62009F8015D; Mon,  6 Jul 2020 07:19:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 894C0F8011F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 07:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894C0F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="TSzOA0uy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OVK4r1Zj"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 609DD5804FC;
 Mon,  6 Jul 2020 01:19:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Jul 2020 01:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rGGHBY0t7206Px54Uw3pH/xzhBq
 rSWNKVMJbEBZQGMs=; b=TSzOA0uyoppHVhoKTrJ2KfN7lbTGR0pPVFgjnc1R+yc
 NkNC6oOcsbuZLY2REZro7soO5gWXiVCafJ6So8Rx/eUBXSzwM7C53fmezW7C0FqR
 3kdII8O/RIZyslvNIhYVgP0wsSo5su5csXrmGIVk85/vYcBshfqkUB3LcPcFv7iL
 DEPRXdRw86bPa1jdD9fdirhhwS79tAavOqfANnfUiyyZ8R3b1XeZX6wRYP/X0Ixp
 aMIbdDqguqIH4LrBlz2EylppdouYxcRw2fJz4c4lpNez7fn2nWBiELbSEGnxn4IB
 jjNDwpS9xE5/9HXeV+E12JyJ9EVU0+yjIVOC09vr8RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rGGHBY
 0t7206Px54Uw3pH/xzhBqrSWNKVMJbEBZQGMs=; b=OVK4r1ZjnH0qOsM0n7hkRH
 VSclHgikLx9m9BRfRr2fgS4dZQt5qq/jL0XJsFRpIx3nqPnCeG2OQ96dyBub3r7X
 11LJP4xoLP1KK9j4F+9o6751CSjqmcX+4a3NzGalbkAzrRMqjzCZ38MTZKQwR2m8
 xSfisq53AmuUjnc8hO+SUlR7mdpeS7cHBOKXKWOD0YTh6tj7jnQh2aiKvtLsPT1t
 0F3jWwjDZs/EjSJGHJ6PcrjE2dS78vso/Rjytb1DS8GY55OfyiQuO6JMerozA9yz
 +cyFE2jJgL6UURjyikC0pt6zzy0oSUm6quyTqeDTYFURz7f+T73nbsHtiZBhC25g
 ==
X-ME-Sender: <xms:RLQCX9_Bfnyirb9wvdZar7olax7tgrqI9Vg72qWBFH8oCmwWTjR0dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RLQCXxsCsUfM-NgFtiu32ZVLIPIBx_d3YN1D05VtuMbE9J5BtRXdIA>
 <xmx:RLQCX7B_huDjMyygRDdhDmqk42IjQJ5cjUOj-WyHdYQAl3bY_eoP6w>
 <xmx:RLQCXxfqHwtX4KTQuuOAL2NVUbYe0aFR7QWvnfTW7XAXw461RltbrA>
 <xmx:RLQCXzF7nMK3bF4kkjp0CQSAOA3ddtrWfY8z-VcHyTtwHKA9vFGXAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1CE93280059;
 Mon,  6 Jul 2020 01:18:59 -0400 (EDT)
Date: Mon, 6 Jul 2020 07:18:58 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 05/16] ASoc: sun4i-i2s: Add 20 and 24 bit support
Message-ID: <20200706051858.an7aefursbhmyfua@gilmour.lan>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-6-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i4rg5zukerkvlxuj"
Content-Disposition: inline
In-Reply-To: <20200704113902.336911-6-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--i4rg5zukerkvlxuj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2020 at 01:38:51PM +0200, Cl=E9ment P=E9ron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> Extend the functionality of the driver to include support of 20 and
> 24 bits per sample.
>=20
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--i4rg5zukerkvlxuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwK0QgAKCRDj7w1vZxhR
xU2iAP0X8H8HDjI4TzDvrLbBY+AIrjYxkkX8cwNdewYnYRW5dwEA48sP2HBp2mI0
mjrnRZHppq39Ga3G/5KihHPVji3SLgs=
=Tc9o
-----END PGP SIGNATURE-----

--i4rg5zukerkvlxuj--
