Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6BC408537
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 09:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC1561655;
	Mon, 13 Sep 2021 09:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC1561655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631517475;
	bh=3Drb7itOQtyw+8s9nG9D2KLbtArLqp9QKHVCPoN3x3A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KJ18AP2eUbxcQ9UUmFFxF0tw6eA/nf0dPse90DLIh11PRF5BWZa2lkBbi2MI3Chtm
	 frfh0HAtQEUTt2x8eWL7epfrOwYthreXDLpalDm5vPl03eRbYw23sRvhW7+0kBHlKI
	 hIet9zBBnGho3ZSUgZMVFP1nSpnka6ggdAqPzgTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBBDF802E8;
	Mon, 13 Sep 2021 09:16:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F2EF8027C; Mon, 13 Sep 2021 09:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59A03F80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 09:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A03F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="mYAG2WcF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Ucg5mGrJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id F40E15C0097;
 Mon, 13 Sep 2021 03:16:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 13 Sep 2021 03:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3Drb7itOQtyw+8s9nG9D2KLbtAr
 Lqp9QKHVCPoN3x3A=; b=mYAG2WcF6g3Yv7iRc7KceuWZ19gRlxvRKeZgvSSyeID
 ixcN5YsrrTD+VtTtPdqb3Bbbu2N2AWFvQM8Oz1PyPdixl3X2qpnTKL06A/tbUazV
 VrKboC92L4TG2EuEhLZWLduOclvRb2UCUEEVcR9fQwMlBTK93MxskZ135ALo1sDo
 m6MAaPX3zIEeCn3+7zcfq9O3arLxjtucHQwwztVeJxyXNNqNIZDpvnOzzo6r7rQD
 4APljjdZWK5Oo3tK/48L4eGFKL3Pa3tAcuxXqltNr6AMTPYNQsKIZPyKZMJjwGlh
 BZV3401Mz4MILWv1wNamD3gPo0KsNoKv8lbH1ZPm6cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3Drb7i
 tOQtyw+8s9nG9D2KLbtArLqp9QKHVCPoN3x3A=; b=Ucg5mGrJhezteg3puAz0dG
 hQZq7wK7gP1GCFBBznu1HopA7bPziLir1FhWysl4pJRpfX9ZKAB3VWdgW85hN0x/
 OwAmlKIDtJYZAawK1OagfmQ0G54SC6dCgF2T0XSMjOThA6Ys1ehSE4MMYIdkW3QY
 FAxG7z+4cyKpM4GmlCjqlHuMeseH47RWc3WDLNogxH0z8yjADMaCuSChY1BdzL7q
 QhRD+pypdkJVDa3YeJDgE9+L63XynGjE8OU2LUCaRg+WZGBo3ZOJNtaWLPdp0loE
 vpZYoP6C5xww/qXNX7NJxqSSVU+75oX42nSDOoJFJLQq4emRNYuPtvYHK0LVqU4g
 ==
X-ME-Sender: <xms:w_o-Yd2T3CHYzWblX8iyWy91BMnnTbump3-8aMaMi1eI62ZCk-Hb_w>
 <xme:w_o-YUGfddWEMzaVcrcmwNa4qiQEwSVBdfSjGwxPz0TAnnUSHc8Dg_rV3uvn6oo3z
 buP5BhhCqkxIQFH4Nk>
X-ME-Received: <xmr:w_o-Yd6MdbU94rsMSV6Kc6zwAjjdsiQT54MXO3nzz4y1TaXsvgjnKzW8CEHgeJ-kqyQiTBd0VO0kZhM3MpCN89yl9HRbyDVBX9aY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:w_o-Ya3aJ4WUWBZzb8IDr8gVmnORINowJBFGcF-oXAvPM60-rVBMBg>
 <xmx:w_o-YQFOL1pcttYo2bSC_b410zWT2A4qibl1IORsWJvl2-20YYyItg>
 <xmx:w_o-Yb-4Cy7MIlxSvEXx8css486FPG5Cy2ZCN0upCgZJKewKkfJ8RA>
 <xmx:xPo-YeZoOUpvltYs1EpCmZBzjDZjr3RsugB5FfEXVMENSaUIb53NxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 03:16:19 -0400 (EDT)
Date: Mon, 13 Sep 2021 09:16:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 0/2] ARM: dts: sun8i: r40: Add I2S nodes
Message-ID: <20210913071617.i6lkibxh4ylnfkem@gilmour>
References: <20210912072914.398419-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zkuatqnldjiqikz5"
Content-Disposition: inline
In-Reply-To: <20210912072914.398419-1-jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, wens@csie.org,
 robh+dt@kernel.org, linux-sunxi@lists.linux.dev,
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


--zkuatqnldjiqikz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 09:29:12AM +0200, Jernej Skrabec wrote:
> Allwinner R40 has 3 I2S controllers, compatible to those in H3.
>=20
> Patch 1 adds R40/H3 compatible pair to DT bindings.
> Patch 2 adds I2S nodes to R40 DT.
>=20
> Please take a look.
>=20
> Best regards,
> Jernej

Applied, thanks
Maxime

--zkuatqnldjiqikz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT76wQAKCRDj7w1vZxhR
xZsJAQDeEDPcZDmfMJalBcC7nUafBRgdZvuSCYixP+VuD4aS0AEAzQFuhhZPW67l
kpEcVV3B0CGdnUzkW5jo2Zlfq6bSeAo=
=6FwN
-----END PGP SIGNATURE-----

--zkuatqnldjiqikz5--
