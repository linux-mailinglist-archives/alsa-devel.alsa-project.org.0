Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655F28355D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 14:07:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BFE17ED;
	Mon,  5 Oct 2020 14:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BFE17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601899653;
	bh=DdtczL+cYcTx9dQiC0gmku2IiM9cruIOpdGZSLlZsB0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2PnuQiPSdT3ZRKYzVElvd5X7JPn49ImmAbBsh7B5f9TVX/U0xm/NVR+dCUaeY/3g
	 4Ji3vzV/SFLwxmak0w6ok9ud5rHn1D9ujwiiMv0u2E5igeACTG1Yyd3jZJwAPHIA63
	 Gnf4ql1G+KEZ/tgt63n90Uq84YkO6qHBuZelA9e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E26EF802DD;
	Mon,  5 Oct 2020 14:05:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520FAF802DC; Mon,  5 Oct 2020 14:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 107EEF80291
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 14:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 107EEF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Nkvetsvb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VJV5AmwK"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A3CB95C0190;
 Mon,  5 Oct 2020 08:05:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 08:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=DdtczL+cYcTx9dQiC0gmku2IiM9
 cruIOpdGZSLlZsB0=; b=NkvetsvbvNMllOJjzZFcK7yulRoWdDiPLp1kw287mEH
 QDEkPnIJej/7agQOUmWH5kghRYKOlZHuE1kCoxSfUp/fHCY15C8xBRSSPY9hXLU9
 go9jD2cy//wfGPtWT2DF0wP167QtHdpoFt2EN5d9WfuSLhbckO8MvepOX5yNyJAH
 r58bKjl69PdZx+FOsv7q2b1XzKEaYRmgiKWlS4UwQQzUCY5K2pp+SKl9Tin+sDVd
 JUN2ZsogOK0l4dkUDYf7P/pb2e1ll8mKb8lGJyfjOjxFj1FpQwCbPTTeLEM+LfGL
 raa9mY7+MGT91ZA8lHu6Ia5Xa52vJWSYuO/UFs+GZYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DdtczL
 +cYcTx9dQiC0gmku2IiM9cruIOpdGZSLlZsB0=; b=VJV5AmwKP62lIHFIuFptmd
 oj2afs7m1NrNuJBNEXy0s1xIh4fLqg7rcR5D1F6NCjVKfYdBaIXO/swElsyCQZFA
 sfiU2BIsn2F2/+G22vAyo2tljgK63NnhRlpYhtxlELfv2LgkgWAZ1SGUuEtbS3Sy
 KNNTLYrsoIsQprg4HJKwFO6VaJEQdc8BvyRjet27nQngi3Y01WmiH7DO9wMS3jZb
 JBGKcpWlTrO3TggYXIqSKDpg0cEftn/lb/Mo1Kt22hED0FlnykG/PkbkzFZCj7O/
 GAvkJppoq/ttf/+Jh9O+nPgjw3TvRJacg9ekZbncCrP4FrgFF8USpuMWEeiZZK3A
 ==
X-ME-Sender: <xms:Bwx7X0WRzGZjQ5gs7OK35u_O6kbjMRBzL1mbXxoegZh2Etn7aET8mg>
 <xme:Bwx7X4n0L5nHfwbcTg8wQZQ5vHtSB_PGxoh1DgHa2wRYCxXDa-d3Uf5tKDtV1BZDf
 aWAEumKOw3WIJJ3Vvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Bwx7X4aMyoIRaAqYtuQMz9cx9x9vLWLefa87URDoicqVf_GRCIrpRQ>
 <xmx:Bwx7XzWl6a4DHUN0uI7u8f49Zk3Oxnvx2hbNfjncsVNZRE_PWhhKFw>
 <xmx:Bwx7X-m5COMg_DOGDI8AQMRwQvcvVl8yD0yt-KuRQ2olb4W5uTcaCA>
 <xmx:Bwx7XwWzk2WCsewBI3950WDMRFn17iAEjy4RIPdezmutM6DmznHDxw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 385643064674;
 Mon,  5 Oct 2020 08:05:27 -0400 (EDT)
Date: Mon, 5 Oct 2020 14:05:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 24/25] ASoC: sun8i-codec: Add a DAI, widgets, and routes
 for AIF2
Message-ID: <20201005120526.acptx6e4hcdlj5pj@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-25-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gsxps3a4pixzmtrb"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-25-samuel@sholland.org>
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


--gsxps3a4pixzmtrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:47PM -0500, Samuel Holland wrote:
> This adds support for AIF2, which is stereo and has full clocking
> capability, making it very similar to AIF1.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--gsxps3a4pixzmtrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sMBgAKCRDj7w1vZxhR
xWTgAQCyyHGI+XTOmFHzVwEN6M+nYXVb3e/3CuD7P7RGSFJ0LQEArkcjfH3wUxfV
R3U2LAYKxa8L0lkwnb27cwGdCgrjJw8=
=ewTZ
-----END PGP SIGNATURE-----

--gsxps3a4pixzmtrb--
