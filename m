Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6762529C40D
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 18:52:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A22169A;
	Tue, 27 Oct 2020 18:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A22169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603821159;
	bh=Io4n+CyKADzKAYQDY0Mgy/62InnL8NDiLm1OABgOko0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMaLWb5EsvpmtMZ+5+hhynxGQTWtwqz/vN3vXW7jirDM3S6nwS2rqwe53PmxtSvuX
	 Bz8jMqs+er+PHlThDM71NVGyvctupuvSv0KBmQYUI4UM0H1ZSVXl8tPupw544zBXCw
	 LtBcaZvus6ZNIgbjnt/CK08vqFvDkUURQnYKH7KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DF4F80227;
	Tue, 27 Oct 2020 18:51:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F2BBF80227; Tue, 27 Oct 2020 18:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A3AF8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 18:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A3AF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="jr5g5bMZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="B+ngWOoj"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 623DD58012E;
 Tue, 27 Oct 2020 13:51:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 27 Oct 2020 13:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Io4n+CyKADzKAYQDY0Mgy/62Inn
 L8NDiLm1OABgOko0=; b=jr5g5bMZO22n44VXHoFxuMjDMuQhkw2SLkbAQckSbXC
 WUk2irZ+cLU8LVe95O8HEN60UiYsTDA34CHcw4Kjlrm9i9gqcyffIu4xC7o9+vkX
 efRMox75/fLJjtuDk6D93rUKgAsA6lujmqJly31LMBC4rRz2IFfRREKpyTYzJdqq
 jPck98sQAgzmZ2Vx7kN8Qqt67WmLej0BOBftVou+dzN4VuYEyb2zJH2OIiNCwQ0A
 dlvGgq8B4Rlip0FhL20G3plVGkRLUwDLF1wcjCSL//vkH3zjYhhK0JgMdDxG81n4
 1xjcy8HDAY+XNbrwAdnxkOAEin6gJ0IOp11WOd3G2tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Io4n+C
 yKADzKAYQDY0Mgy/62InnL8NDiLm1OABgOko0=; b=B+ngWOojgg34DAxMAqAA2n
 nmjNGM9k4NLKWCrme0nBOyBfYagmX9UbEGjNGh6/JzYfsC7AbOCU1H3prvABbsl2
 iMl3HHZzO7+naME3J4+lmXx5iZrs6sbf3R7u5edK4ATnK6pLSYVAk/rfoPzlqzTP
 +RrkRxBRL9rivIAPnawpM/impuh63cNYYjZ+cHEhIMlcI1yc4qKQZpOFBp+GpVgO
 Mcv+/cMaTVe88kLgvRMSR1G8xg0XkR32sWtswwY7xQJPAmeh2QHhJZBPK1hNNHU5
 dsVCKxjqLqhNKyXrS7XDvJr4Q6xhlaaJVfwz4OP/tCqnPDPLCiJmLotf2G5mRneg
 ==
X-ME-Sender: <xms:J16YXwwEKoRYxyDd9YsY9GKqz9zzipV2P4tkFgCL5ShkUFrT0CHCkw>
 <xme:J16YX0SdjHD8r_3ZOPLgnZshcbC3eqM02kMigwEd99JjMelYIYDaOXYatr67FCqrB
 9qFc_gU9sJGk8qLLgI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:J16YXyVmOit75DXku3Cno03yb6lzBc4HPBf3NyM5XOasfidCd3JmGw>
 <xmx:J16YX-gnomSi7wZPXgTyD_yxLiJ2NSewWc3AX28cRsUjWciwIqiRqQ>
 <xmx:J16YXyAyCb-Ihur4OwW-n0-ERYr5keUMLojzxMZbYUUVqRu7nimLCg>
 <xmx:J16YX-6fXO2AaEMJg-QyJ_W8iOUCsm9PQayNdU_yexa7hjCOELGNUA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BB710328005A;
 Tue, 27 Oct 2020 13:51:34 -0400 (EDT)
Date: Tue, 27 Oct 2020 18:51:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v8 07/14] ASoC: sun4i-i2s: Fix setting of FIFO modes
Message-ID: <20201027175133.s23vdqxnnt3cluip@gilmour.lan>
References: <20201026185239.379417-1-peron.clem@gmail.com>
 <20201026185239.379417-8-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nykxctumdypzwka2"
Content-Disposition: inline
In-Reply-To: <20201026185239.379417-8-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
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


--nykxctumdypzwka2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 07:52:32PM +0100, Cl=E9ment P=E9ron wrote:
> From: Samuel Holland <samuel@sholland.org>
>=20
> Because SUN4I_I2S_FIFO_CTRL_REG is volatile, writes done while the
> regmap is cache-only are ignored. To work around this, move the
> configuration to a callback that runs while the ASoC core has a
> runtime PM reference to the device.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--nykxctumdypzwka2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5heJQAKCRDj7w1vZxhR
xegJAPoCfOhL0AZBdsPFDHQmFs//rLD9BQ8Z7l6YQkpzaQ9lkwEAvCM4h8UME2Zw
3DiJXfqs9r1JWbKOoX9i+zMbdu0b0gw=
=JYcX
-----END PGP SIGNATURE-----

--nykxctumdypzwka2--
