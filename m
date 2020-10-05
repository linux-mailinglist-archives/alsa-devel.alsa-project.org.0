Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405B2834EB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1678217BA;
	Mon,  5 Oct 2020 13:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1678217BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897297;
	bh=sBOBUzyry7tYkPBem/JiXq0flCBBUkJGq1lznWBIxu0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vS0Hyr41vvfF4rRM/qiFw283ARxSP2dISpVkSk9OpoGBf7gnOJ0IqlkpWmv0j5c9+
	 gsEii2dybCv3fE0MaJVy9/3T6R4CjlO3JnOJByEZaSwP3L0GMqZfsxTRqCn/YqyMAN
	 ph1TUIaWbi/yjS2KK6CwqM15DrliIOwGbvl+CSc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F10EF8026A;
	Mon,  5 Oct 2020 13:26:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15060F80291; Mon,  5 Oct 2020 13:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55D4BF80245
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55D4BF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="F3YcXrnn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="R1Wl3Qsy"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EA4585C0118;
 Mon,  5 Oct 2020 07:26:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=sBOBUzyry7tYkPBem/JiXq0flCB
 BUkJGq1lznWBIxu0=; b=F3YcXrnnuT+l174MQvZwJHkDX8LCUZLYo660Rybnzyo
 WSXm5wWZJrRkuAJ7MB52WlY5WtVDwfUY5D5fUQpbXffinWwG9Y/U4p94PXbcJzyy
 P97PR0wVOuDjcqACdqQLOy8zUC/X2zTkXa9qiWo4lKQWTa68phGZ6GX2rLssu1jl
 EloIiBzFzSLe4bIDFy7qWb+NXk0iqllSoxwJWDGNQKYSbGmdTlTYl/C+htnepaul
 MqHNURP0Tqk6Z6vHMs5fdo/QIIYCaLRizrpd/NdM0E/ai75OiABe+tgJhCbl4r4U
 Hy8sUXG0//G8pEEg7cCyEKh63URRLWYDQ2FtVdMttcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sBOBUz
 yry7tYkPBem/JiXq0flCBBUkJGq1lznWBIxu0=; b=R1Wl3QsyddKgMFQmUuj9Gj
 o6qTPnyMHy7tA7KnrUTQQQx8Dc/kYXmYAVxqCNsR7wPBDXVK7SzVKF7bMAcLl7wx
 5Upn8udtr/RlppDjHdag7+Rou4qWl/mUJg819Kpe7T1p/hXgJ/CvmLNlWG7H3o0c
 R6xHpnwPyhwg5gqFhmC5+RYPEcIEYngC8BehEPZvb3HevMGlk/QiDyqkIAlAay5V
 Nz+Pyil2YfX/hKFyjT6SJgbvBEhhnHEzoohZNVuOwwlq8u/MvGs/csniugSgpqzL
 AX+lQC2tcAiBkuh0cSg1Z6sX/kEGnVFinf4jI7O5MgipSNU+Q3lWzYQNSE+GZjxQ
 ==
X-ME-Sender: <xms:9wJ7X87vnfrG7-QnqcQcjA4-UpVu0ZfcLAnU7jw0CXKzzl8zHIbMpQ>
 <xme:9wJ7X95KkJhX-AMe5-qOXoGGCzl35DjWnDFq25AEkpzRM6IbW6TY0lp-tFvfBv6WO
 Dg2we44z6fwHAwj4Dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9wJ7X7esuxj_HK2ONAbOCPrvUDg_Fzr4BCNmeO59Gwemj0akurFp8g>
 <xmx:9wJ7XxJgrFT1b_BJZyYunsaOiGntvidoIcyMZTAElg-wL9_DXa4cRw>
 <xmx:9wJ7XwLYkFTYi1uiuKHeSvXCVFPZ3eXaEhA10hk_b0eojyRX68LHAA>
 <xmx:9wJ7X5pIOvzDJNI7bM7baVAio7sxmfpfaWnQ5ckgbrOPlaO_x_1Pzg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 79ABA3064674;
 Mon,  5 Oct 2020 07:26:47 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:26:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 10/25] ASoC: sun8i-codec: Program format before clock
 inversion
Message-ID: <20201005112646.jhktikxgubfatbh6@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-11-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i2twgdz2xu3icbbo"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-11-samuel@sholland.org>
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


--i2twgdz2xu3icbbo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:33PM -0500, Samuel Holland wrote:
> The LRCK inversion bit has a different meaning in DSP mode: it selects
> between DSP A and DSP B formats. To support this, we need to know if
> the selected format is a DSP format. One easy way to do this is to set
> the format field before the inversion fields.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--i2twgdz2xu3icbbo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sC9QAKCRDj7w1vZxhR
xbwaAP430fSwoZJnaZEplR6DENxrtAyPlBtLiIfrXb+MHbkipgD/Y4ZRoJd+LZwr
BS0p+bWn2tQusQMQC7pRYKP5TRTvvAg=
=2dMT
-----END PGP SIGNATURE-----

--i2twgdz2xu3icbbo--
