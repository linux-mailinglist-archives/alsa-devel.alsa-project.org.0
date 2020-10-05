Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67D2833C5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 12:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324C91845;
	Mon,  5 Oct 2020 12:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324C91845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601892164;
	bh=Tv5YsCcWo6WRZv1PwSAUDS7tU6QJqGqQ0fFfiYO4WrE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oD+uTLT/psJzUP9tL4JojqIaVafD+X12XRFa4QCEI2lga4ALkY4lYzu8mKuDdzC/v
	 h2J5JP0GcC2Qqjhfi/mwr9S64QQa+vu21M+hNYhY2iVJyvpMvKdbr2w1yPAoLscs9k
	 njK6i0iGXok5+CvVNuIuM0cF+6Myumzd0om9pU3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFC1EF8025A;
	Mon,  5 Oct 2020 12:01:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1F18F80269; Mon,  5 Oct 2020 12:01:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D61FF800EF
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 12:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D61FF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="pX4VZaxn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="W/BoJW+3"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 802135C013A;
 Mon,  5 Oct 2020 06:01:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 06:01:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Tv5YsCcWo6WRZv1PwSAUDS7tU6Q
 JqGqQ0fFfiYO4WrE=; b=pX4VZaxnwok10dcaM/wLhs1hJqAyvUPlh9jizRPpXAk
 kYgMcWMIbq1dn9ARMnYGdfXXcJP+7HEmWSZ4ZpUMSYxR5Uwnsx+uaiJKvHd72VV7
 +0h93gzRwHMIfl0FNurK+ynWjOZLJNrf947bUn1VdeuYUqH7GKiaBqI9mmODfIxV
 kYdGwtYfyeQLt0sf1EjXcOqA1fEoEt8gqzpWR/eCh9vbkFTJvPvzkYBmFtv3u+cn
 CGkrgscMY7jOMgHUnd6IkF4Ga/n8PZsZEnkmfnsqVk8yVa9doTIxSCOFicSOTaXh
 JJpDCdj0BDA2zsQotJd3Ukj0u7f8wxHngwSA8B0vOcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Tv5YsC
 cWo6WRZv1PwSAUDS7tU6QJqGqQ0fFfiYO4WrE=; b=W/BoJW+3U7M0/LjqMpDo7X
 RZb7yITwu+MRYSMyd9L/okfuMMrctJzGYsslFtCVtHcTs/8RGzZi6MgjnhgblE+l
 z4Gr923jLQp5w76BrCmf0jJme7wyWeGWzzNnCaEZkurvyGnJL6fx4l1HASoadazQ
 aZbaWgnMZeSIij/mp1efnXIwzeZ10pqyIUx+JfH19jQxOYFpl+u9cShs11Vy7MJb
 ocOhlJMyh4NewhY89TpKVZ1U8KHBLQkOHpxoV04oPi8Pfh0R6CHhNuYfXF/2clvo
 F6rstuHrza1pEUq56fT5OFkZz29SKqIqhwCGkrpno4c0oPBhntU023J6IqpdrVpw
 ==
X-ME-Sender: <xms:Bu96X_li5-X48d6gp7KOST8GWKOFfBIfKiftx5ypXugmT_uy4PUppw>
 <xme:Bu96Xy328jkg1ibFJQf-nzYRj4Ew7cMGVIj7a-HsE0Lin_xUZLfbWob9GsF-wy8iq
 zDue1SXJArYvlBFSN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Bu96X1qXe-R2Uejs3uNPy9xNaZHpMl7Z4qqUDJwGF4ZmvvyTzRdi-g>
 <xmx:Bu96X3m5dSr1ZafVU6HhpDV2pD2oP0ovWCHqOIdsk7QdsCwSWnjYLQ>
 <xmx:Bu96X91ykv4kLM1nSvBrKovuq0I8K_MJEeGL_Z6FRjvjk1oSK-HIqQ>
 <xmx:CO96X6llavvbdjV2Crnjkjy4yyF1B9daKSqrsU9St8cMlaRdG_3zEg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9E825328005D;
 Mon,  5 Oct 2020 06:01:42 -0400 (EDT)
Date: Mon, 5 Oct 2020 12:01:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 08/25] ASoC: sun8i-codec: Use snd_soc_dai_get_drvdata
Message-ID: <20201005100141.oqsqotrwm554kyg6@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-9-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mkyrlyq2ktvpl2wp"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-9-samuel@sholland.org>
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


--mkyrlyq2ktvpl2wp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:31PM -0500, Samuel Holland wrote:
> Remove a level of indirection by getting the device directly from the
> passed-in struct snd_soc_dai, instead of going through its component.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--mkyrlyq2ktvpl2wp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3rvBQAKCRDj7w1vZxhR
xYhIAP4676GM9XSaAbSnJd3DmX4+jzabMNIHgp5HE5XSMzveXAD/bOUzRWgFE+UD
29qy4CVPR2kI7xBoRbCA3EmQR6agHw8=
=mRgD
-----END PGP SIGNATURE-----

--mkyrlyq2ktvpl2wp--
