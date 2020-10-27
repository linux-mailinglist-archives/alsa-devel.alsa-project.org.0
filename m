Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCD29C3EB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 18:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08CB31689;
	Tue, 27 Oct 2020 18:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08CB31689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603821082;
	bh=SoPfxx2oik+qKdyMuP/1zfe19eO7ppN9RekIgp6vhlw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=grobISJFTlx+qYoT9EA8y1Xiw0+49nc3onyNhGzRFWjXwbUtWOn6V4uEMXN09mrWB
	 NWIgI3BA3aaso4/HxaNlvros/TEmwDIFFPcJxT+K7k6KAFq1NSBY9CdV7MoKPOiLxg
	 6fbqCXA9A9MWzqNaL6K7pBFL/POBs3uN8k3dTJXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37976F804BB;
	Tue, 27 Oct 2020 18:50:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63DF3F804B4; Tue, 27 Oct 2020 18:50:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A7AF8019D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 18:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A7AF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="BdGoAhwj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Tz7aCWr+"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B143E580477;
 Tue, 27 Oct 2020 13:49:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 27 Oct 2020 13:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=SoPfxx2oik+qKdyMuP/1zfe19eO
 7ppN9RekIgp6vhlw=; b=BdGoAhwjsCzkCG4mDq9NmB86rVpuaMvLO9ayWVZ85K4
 IM2iBiSsNB5n1q/XlAKkveQM9Y0aDSRNNHcqLys8xqRYz9NRyMEdYlLdDgvwkxup
 jOv6sbi/ZO3QbhrtU2E1MYKwEuClgdk30Ln+HWGcnP8hGMRuAlTmJwQJEWqk5l7U
 SnJ5ACRgsqywnhMV6RU8iP9vWUIM8GZ4hq34GvQ5gHdxYaRlf2yUmIbmOxx2fjgG
 DrHCqaUitAoUUKPW9E0DmXV5O5M/we7cOQony0OH551htSSVSfgfjVC9lh++0T9D
 HeOTnel7qEZyHKgdrWv040GCEGZyd4yEu/6WT+f8yjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SoPfxx
 2oik+qKdyMuP/1zfe19eO7ppN9RekIgp6vhlw=; b=Tz7aCWr+1Do9oUCd/WtjDl
 UxVxsS3fFTDjWkM76MvyYhb27+maRdtIrET0vchwESn2el6r6cj93lStE1Wsdu9n
 aSpxCG1e//ocgJL3vEJ8NGjvU584cj3zjZtB4ZL9juS0FfqG5jE3LVm84eBD54+z
 t6OAcux5UsbFq+NjLZzSRDlmKm/5g6KgkN6QM8Bb7xmhbaT8o/q0/I3B2Up56A/v
 fOLDKIogCfVyReCDJ+FKJYgS6bmSA3swWrdqe8nBoQzddbe/JaB3Ssa4+p03Gl67
 UR7uAmUQR0QPSwF05YsRzxJAHx0+ewhgCjQZzznBjFiAcmmeJemwG/W0L67cd+iA
 ==
X-ME-Sender: <xms:x12YXyXsj9a5uVfoR-jq5y72b4eIKA45LNlLgl76fx9HirIjyrMQig>
 <xme:x12YX-nlgrllZZAz8mN3UmvFYNVfn-Xgq-sUJvqb1vestlyb6UA1aLoImIfz663l3
 KTXfvQ1fDP_MwLF6H8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x12YX2aSd49wEBYL3oZn5Q7f5D83rcjKlc7OymGKnQmY2Bxq9h90Ew>
 <xmx:x12YX5VlXDLXdZA8Ai_8qhvudWlryWmw1vnD5zCibbh_sdYozojBYg>
 <xmx:x12YX8niOozogfraXlAimIbIcDMvWuUOVVbJhOPQONy4IYYWBvyMrQ>
 <xmx:x12YX2ccPIXCfFpNSRXeM_XCfDFojm9qilXJmBtv6jVGH7td3mMVqg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 280FE306467E;
 Tue, 27 Oct 2020 13:49:59 -0400 (EDT)
Date: Tue, 27 Oct 2020 18:49:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v8 02/14] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20201027174957.ui4ootubgb46dqgv@gilmour.lan>
References: <20201026185239.379417-1-peron.clem@gmail.com>
 <20201026185239.379417-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2cpe5wngdf44cto7"
Content-Disposition: inline
In-Reply-To: <20201026185239.379417-3-peron.clem@gmail.com>
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


--2cpe5wngdf44cto7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 07:52:27PM +0100, Cl=E9ment P=E9ron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> H6 I2S is very similar to that in H3, except it supports up to 16
> channels.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>
Maxime

--2cpe5wngdf44cto7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5hdxQAKCRDj7w1vZxhR
xfstAPwNh4kC5XbQtUCP4L5Gm0B2rKNz/cw4/UvvSrad7luH5QEAugCk5XMoWfrG
uIeJcwrL897i8RZAX7HB/GTMzQqh6wc=
=2/aQ
-----END PGP SIGNATURE-----

--2cpe5wngdf44cto7--
