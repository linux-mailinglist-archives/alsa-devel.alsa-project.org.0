Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36128351F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F87217DA;
	Mon,  5 Oct 2020 13:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F87217DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601898105;
	bh=4AhZLjFKEOusupGCr/OMydiBcPgaw3RrqYS1wR4Erto=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CMCCLN1+XhZUcSW+proQ3jh4KtV39Ea0sGHk2Nh0ecdJLdkj0uri9Z7Yvi786UNxv
	 0x2FzEk6NjbX5j9JzRoMExa5/0VaE+HZBNLtP/YiIhHAPlFSMQiyutCAYaDZoOaGnV
	 Gzli5taIr1DrHGKlZaHUe49LUaPcymqzc2TlZ0GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75E84F8027B;
	Mon,  5 Oct 2020 13:39:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4287F8026A; Mon,  5 Oct 2020 13:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93BA0F8025A
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BA0F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="P2hwOPLn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Ub4y/Pk4"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CB2D05C00FF;
 Mon,  5 Oct 2020 07:39:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=4AhZLjFKEOusupGCr/OMydiBcPg
 aw3RrqYS1wR4Erto=; b=P2hwOPLnQJSxKifr01eJwX9kJwDBN33KdT2b0DLa+tn
 lpfXeNsj/vm0Wd9mxy7mN1V3DIiFjIL0nw8AR8TZWaaU++oSuakbKviaZnMFRa3d
 ijYTEzNfp6Hq1aw/lMVbae84A3RRT0y+k0rNw/UJluYDR7Z9gux8Z2XQSIwCJHr8
 5T+VjXDXhtRRaUA89qmDGQbRQrWWEUoeDTmk3ToOtfgTwx77F8u8W1lB72hqiTgP
 73f5KC4xHDHc4QimJ2mFzOFtbYCUxJoPXOaP8a2e/g2RbfWZmcmzbuC0YQ1r0cCN
 xH3z+Zpynn5KtOCJH8ZvvvpRPnWgiTnH7404O1EDvjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4AhZLj
 FKEOusupGCr/OMydiBcPgaw3RrqYS1wR4Erto=; b=Ub4y/Pk4MJLrc697Luo4KP
 270lb1nYL2kPeYjdzLWDd9/vpO3sCEM8zv01SruU0oGaLDXbwLohWgAD9qkPaXI3
 oW7rHLG02tuN6+XKjU23+d52gn5ZynH5G/fW16Ly8y6eU0lPqtJ5DAi+rUwUjoWz
 Kt1Zm23+BrTdsC2DPMaRQKC4xHKMbS1iIdxJJSoAsayNQsAz/F1Km8D2n7N9Decf
 HFkQnMkZfPErpVCL7VyJjMDAzvRMBb6H+8EsDH9X8T/twRFooN6X9KGdoJzpqZqa
 lXNhZ2YwQmbrQIDnaWjXQ2lkUo50WotYjx4CvaT1y7ew2zK3xwpUOvT9J8S7o1uQ
 ==
X-ME-Sender: <xms:9AV7XxqONFQWqUQj_bWdjTUr8XubKzhqDKn2BuqVyAvy96e0NRpZ6g>
 <xme:9AV7Xzr5-eW8rVxYB77FQkWMgVAN9lSCH7YroZkgoLRu9V6xJDNzAQAKaP_S_R-o1
 7vAqf9qLs-2po2iZkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9QV7X-ORMYZy5s7VqSeUdl-_eU_83ut3pYyot1VYgqvF7ST5G4DEdg>
 <xmx:9QV7X857VEhZ-tCbnt4emVhkvf0HeGXE_cn9r3om06v3kM2Jgawj1g>
 <xmx:9QV7Xw6PX7W5TgbA7kVFOeB9iQIJ0U4xHHaQ4msqm_wlkmU6vnY5bw>
 <xmx:9QV7X_ZFHPm5elaqsuS59KNBcgDmzuOqzcJXWOHmInnPiErlLXztxw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF9593064683;
 Mon,  5 Oct 2020 07:39:32 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:39:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 17/25] ASoC: sun8i-codec: Enable all supported sample rates
Message-ID: <20201005113931.djphs5lsdjujlzmx@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-18-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jruaklk2q64a4on7"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-18-samuel@sholland.org>
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


--jruaklk2q64a4on7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:40PM -0500, Samuel Holland wrote:
> The system sample rate programmed into the hardware is really a clock
> divider from SYSCLK to the ADC and DAC. Since we support two SYSCLK
> frequencies, we can use all sample rates corresponding to one of those
> frequencies divided by any available divisor.
>=20
> This commit enables support for those sample rates. It also stops
> advertising support for a 64 kHz sample rate, which is not supported.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--jruaklk2q64a4on7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sF8wAKCRDj7w1vZxhR
xZkxAQC122WVocQPizizO35rpyzxgSrmH+hLpPcw4Gn8E8Ue8QEA/8+dpDZdPRTt
ygWEfyJQboRXo9aAtWzasJRMVkB5bQs=
=H99Z
-----END PGP SIGNATURE-----

--jruaklk2q64a4on7--
