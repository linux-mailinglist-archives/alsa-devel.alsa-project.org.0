Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE128359C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 14:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF04A1800;
	Mon,  5 Oct 2020 14:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF04A1800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601900172;
	bh=ss5xOBW/WUbyI+sqAnG3dhdUG/1ZeoV+/0ua+YhjLAg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZYghkDnqMZigy4TxYozGA5pXeSIMJ2S9OnJEBoksA6H9jM1+U8OQscRtX2vzCxQZ
	 QiM8HstlOveGTqFjq6epGZDwb7pbGCYsaeNM7WqC9FnLpMTbGbtO+BkV0cGMKzWS0g
	 3eCy/gCr8EdIRUecA9uiOF03NcSj+82AZwGDjKf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E010F80269;
	Mon,  5 Oct 2020 14:15:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62026F80269; Mon,  5 Oct 2020 14:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B098F80245
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 14:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B098F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="gGP4c3jX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZWwt3gNz"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 594E55800E8;
 Mon,  5 Oct 2020 08:14:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 08:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ss5xOBW/WUbyI+sqAnG3dhdUG/1
 ZeoV+/0ua+YhjLAg=; b=gGP4c3jXp33tWZ9lx4tCQFiS8zHysT4bMIV3JrQRvfi
 eAr2/liTG+jEecjMB9g/H3Y37tqWqYTLBWJL1xZ0FTc8Eor2jGsIYZ1NjjoQb74y
 s/L/9BzdxQuNYKxoNcnBIkRm/IK6AOuqX587B5DJX2zEzDpoR+IuUK3VjQ6fBFoG
 cPLHrR2rV5dHRqN73wLHyNKQ5dpwYNmMWY+L2O/L6B0hArE1fYw92LkTdNBmH4hP
 5Cqr/hsDlvw4SoiK5bcQUARVcHjqlLkxUgAx5arOKOOBctNh/iZX09a2vgX2QIVb
 dc7zDqOiaTBhVdskCROmY8RJ3hMuAqK6M9I/uil55hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ss5xOB
 W/WUbyI+sqAnG3dhdUG/1ZeoV+/0ua+YhjLAg=; b=ZWwt3gNzEbRdF1kaZEfT37
 qd5TjSXt1JBvby8q5+jqAyrNrzP+FUvyUWq6bMiHadAsuNwERW4sVXlLNZ7HrXuX
 Fq8xupZCYUBuwnLo7OJxSTR1wAk8tsKOJXwmgeCAZpXPOhiYlULsf9EN1X/rKXLU
 wUm6zyxakNRc4IcYkuOfqGunZkuuzj2OYfm0Xeazbm/dYkk7zNcT1tP6lYC5Mea5
 Fl2+F/dTjd/bRi8bPDnJsfideb13b3gNNbKuMifpjRq9qfI2pPNtjwhS+NRh+Tvf
 vnvAU3uf5Ji+x2LIyYzy2VPtAKufFPj1+irJntV2ZYQ4vGBRhN3GyIGXMUJw/SDA
 ==
X-ME-Sender: <xms:Qw57X-xgkmcbRT5VaK-FKevy-wh9Cc0QZ56I-rJlHWkt-HP5B9NBEw>
 <xme:Qw57X6Ro7eXLW6zWfvRgAOZbqWbbnU2JJZ-mEy6rLjmSncv0luZJ57HVPKe6Uyxg-
 pt8poksVLkVt7WhvGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qw57XwU-qdggpgCoRMLmX-btmWUQz5azDt2UtB1UlYMMmzFcMtCfkw>
 <xmx:Qw57X0hSRxVKGP_l4JqyKMiaN9FbRY2GgOMVr_ZCQsg6yFweeEj0-g>
 <xmx:Qw57XwB97qkEBB5YbcWpLpE1H561N0u7VW9r-2meZJcIckagqSNU8g>
 <xmx:Qw57X5LgHXOpVPEY26s8adN3g0gWtFkavI6MHaSZIGV-IHotk06EuA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5E983280067;
 Mon,  5 Oct 2020 08:14:58 -0400 (EDT)
Date: Mon, 5 Oct 2020 14:14:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v6 08/14] ASoC: sun4i-i2s: fix coding-style for callback
 definition
Message-ID: <20201005121457.akbixtzf3rqwtq7t@gilmour.lan>
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-9-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oaws3jxb46bccpfd"
Content-Disposition: inline
In-Reply-To: <20201003141950.455829-9-peron.clem@gmail.com>
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


--oaws3jxb46bccpfd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2020 at 04:19:44PM +0200, Cl=E9ment P=E9ron wrote:
> Checkpatch script produces warning:
> WARNING: function definition argument 'const struct sun4i_i2s *'
> should also have an identifier name.
>=20
> Let's fix this by adding identifier name to get_bclk_parent_rate()
> and set_fmt() callback definition.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--oaws3jxb46bccpfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sOQQAKCRDj7w1vZxhR
xQI8AP9peje1FGUYiKYyd7X0xC7UqZYUpLKKGvsYwHL5Aky1UQEAuSUPd0mxp+bS
mAn5oBpY/2OYS5TNxvsIbiEY6REDBAk=
=drfJ
-----END PGP SIGNATURE-----

--oaws3jxb46bccpfd--
