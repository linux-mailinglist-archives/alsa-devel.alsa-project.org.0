Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7B2833AF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 11:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6B317ED;
	Mon,  5 Oct 2020 11:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6B317ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601891782;
	bh=NEXXz0XWlTZiojHNQZwM3xMl3xD6YBVV2lteJc7KS8E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sBfJvZXN2h8Pm0SknyFqKvyr9bYK93iT9/xFufwltm29HnQq35EOPNEH7QKOFuGOm
	 TmbZZJUlMSm/ng7auuc6tXs7Ltb03dF5LmT5r+GMzEtUrn4VpqR+ZnSHNHijVbyL3Y
	 lXIZiBbfv+J/vqRp9Y23+8ch7d175ZYdYxhh4wtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D757F8027B;
	Mon,  5 Oct 2020 11:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF85F8026A; Mon,  5 Oct 2020 11:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABB51F80260
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 11:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB51F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="u6sqDfvo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DLKEkhwq"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 45C385C0134;
 Mon,  5 Oct 2020 05:54:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 05:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=NEXXz0XWlTZiojHNQZwM3xMl3xD
 6YBVV2lteJc7KS8E=; b=u6sqDfvorC1NsWeqC/FKPDc+tdazdKlqZ42RWHSDggf
 MFGvfsf+YJIEycWcguOrFuM9c1+vDHdbvMnNXtRYyNQTM5Pyu6OyxI6aIs0a8any
 3qPPhsdGFdYMebbSvd3qcNzyZ5t8tjTP+RKo1L1QqRD46qTGXDJlY2eobYuEt7jX
 z8gGsBF4gV1s5pDTVYhdIyI9k//6VQ3EC6BvGNaTFQvx/Xlqqpi6Sy/SOOra0FfK
 LGXrwg7Xeq6aAxZPKYB1g0lT31imCbdxKWX2/H/HBNkxJmXMuwanuFAjuFIlxOUy
 hbZeOk3Sv7l8mQfJPKm47/kIqzG/N9KxHXPpZttZ2Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NEXXz0
 XWlTZiojHNQZwM3xMl3xD6YBVV2lteJc7KS8E=; b=DLKEkhwqAtW1uS1zJza/qB
 yly2MNJ1YOgyKGylqJoWhEAdGkH4N84FfUgXXiCrruVASa7ujx3m/rH74NrVpk62
 9ITKSK8YDQ8cpaI+zVGjtSu3O5bbCVUrrjaeRNnz/SrqK06Cmudq/hNaO9fCd8aA
 1myLpMHWatssBErRdIBsfhzR3v8DRjxM977V64Gq0WnJ2Byf0VErWBEiPjRSLj+a
 pqICxm0Cc9Sm9ymVsijncDBDW76PPCkAKm1T5zP7hdws7ug4gUIF7OnXkbennZSa
 YggNILkGEXe1uL/Ojlioy/fji2/YB7aLntiaIoC6vI4MgdK84PRyMFQdO5m9P6+Q
 ==
X-ME-Sender: <xms:U-16X7YH0JS0XGYRYC_83frwQhlvmqlvRngmf4SlgNEXgqeVG2FmZg>
 <xme:U-16X6boPnuf_G-3Ksb1-UY70xG2OGVgQtM-mHI6N_kbS64wEPTSRI0t8NbK5Op7g
 6mkdDsvAEVscwlZtew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:U-16X9-KNmPv2EZ0NwFvO55SehWVzD5US_V_qgJdPZeJ-Yy0sZcHbA>
 <xmx:U-16XxrndOufnx_s2_b1yqwIUK0OrBxXXuomO62-s2CYLlwZxuz9SA>
 <xmx:U-16X2qGoxxK_IcGWM5yJ8zkC49WJZLWx65v3TOHEm20Pdy9qSkL7Q>
 <xmx:U-16X2Loa2ao4oWTK1NMjCox0QyTeLesSve_F7vg6idv4PRidpuoXg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B5AB2306467E;
 Mon,  5 Oct 2020 05:54:26 -0400 (EDT)
Date: Mon, 5 Oct 2020 11:54:25 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 02/25] ASoC: sun8i-codec: Swap module clock/reset
 dependencies
Message-ID: <20201005095425.uqpd6fn3bmcqmj2u@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ajk663v4iqcqgffc"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-3-samuel@sholland.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--ajk663v4iqcqgffc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:25PM -0500, Samuel Holland wrote:
> This matches the module power-up/down sequence from the vendor's driver.
>=20
> While updating these widgets/routes, reorder them to match the register
> and bit layout of the hardware. This puts them in the same place in the
> widget and route arrays (previously they were at opposite ends), and it
> makes it easier to track which parts of which registers are implemented.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--ajk663v4iqcqgffc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3rtUQAKCRDj7w1vZxhR
xUBXAP4pHOdiB4ixCet41wFB1s8FTReQl6H2FtLwlw4PVDJrLwD8Ckm37XYge5Iv
yBhx2mCwvaPJqijjiVM8OsttbXY/AAI=
=uAAt
-----END PGP SIGNATURE-----

--ajk663v4iqcqgffc--
