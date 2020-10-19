Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30626292395
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 10:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D6591718;
	Mon, 19 Oct 2020 10:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D6591718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603096000;
	bh=eZsfj7CupAZnJIQGICZAq7k5F1wAU3yj63NqaOPK4SY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIlIfwCkDzr01d5Sk5g1jEVRVutXExZBJG141YxYTdag+xfoKCNdia+0xXL04HbF3
	 lGJqpESTCyQSdhfQo0vTxsnJCSLhVvVOkdPczVTOYRxMdcRZl90KI01B97cxOYjnHt
	 HB1gvA7m2K3eofwWU4Qeayw9rcktL3xZ0FaawlJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB28F80121;
	Mon, 19 Oct 2020 10:25:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A041F80247; Mon, 19 Oct 2020 10:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72E85F8010F
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 10:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72E85F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="cECJZOj9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FZFDcM5F"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AED7D5C0126;
 Mon, 19 Oct 2020 04:24:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Oct 2020 04:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eZsfj7CupAZnJIQGICZAq7k5F1w
 AU3yj63NqaOPK4SY=; b=cECJZOj9uCJOc2IC1EsIrjcLxBYis0SrIEkc7TXM3tT
 3y1HrvgHZgtr12gKzC5nbfIkAwPi+q+VfvF1VXgRkYu2D6RchPybpdzlH4HRNRRE
 RsrmIUnciZ1S4ak0BsWygzZygGd6mKQJq8bLDhrXzwgTvz0KaoQpfvsuDpOBAHw0
 SfhXGKl5G4vFwSOHlZvy/KH1Zo00PqVYtw32oAOsbiD5wwIGpmHuMlfp9n/zOFLZ
 McmHY9LSS2gw/VRoWrZtIixOl1Bpe8PW2aG0DJ96AS3YLINhSFFMpPa8fOF7FobO
 zMgeTwfxgoXEnu8ah4zuBo046EKW6e/ty/aS3bt854w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eZsfj7
 CupAZnJIQGICZAq7k5F1wAU3yj63NqaOPK4SY=; b=FZFDcM5FRNn2YVXqMw2s2i
 IEgkkgfW8YI85HKbCpmy3c68YhXep46Rw5QU78ddqEHdaLkCJq94ZE5oaE0IgQ1o
 LLactVsc5lBg4c8g5DjjIaPAdYQc966ZwNqU6GDyVJgkTvIy56EgX2a0uYNndwKG
 yEbtJwTFe5JZ4mfK3JgW55JFrBGFbcGEP+jbSPcqzfNo9eoKelG4+FW/ixm26mrw
 CQvLFnaCywStXLEMjKyeAZX2SmI6Z3Z5Vrk/eK2il9tzevOE8BKKHwhwrKTixTmV
 QyAxZPWRdpTYBZvxsdZ2g0vq+NSKTauIBbh8Pk7x0Fi92DG9cct/WJG5dWuFCz+g
 ==
X-ME-Sender: <xms:UE2NX0MYF1oji7DHSQ3MfWMFP8HzXBvp4dmpSbxgpnegh3sNq5CGoQ>
 <xme:UE2NX6-iW9tyZ5j_2tswgH0V5le5OPBKnm16fQeyrFZoO6XKU4T229G0s_U2Q4P1v
 yx51l32vXAGq7sL-1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedugddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UE2NX7TW4WzC9WO6rT5lhdE0oNSIQ9Fi-AkCKRt1PdNphuqryowwwQ>
 <xmx:UE2NX8uO4Y3OkXhtdIOnlANs9JqmvCgGA4eZH6N6w7ryTxo-IYjChw>
 <xmx:UE2NX8fyu_hc19VzhIbyjIQxG84BIrjCh4IhEp1NPmcoGxWsqeZEXQ>
 <xmx:UU2NX6s2P7MSImdOpFZ2P4FZ24LKuvoetfD1obU-PCjz4TzJodMxEQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD43B306467E;
 Mon, 19 Oct 2020 04:24:47 -0400 (EDT)
Date: Mon, 19 Oct 2020 10:24:46 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 03/17] ASoC: sun8i-codec: Enable all supported clock
 inversions
Message-ID: <20201019082446.bedjg7az72sqfvsl@gilmour.lan>
References: <20201014061941.4306-1-samuel@sholland.org>
 <20201014061941.4306-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cqcoajix7hb5rria"
Content-Disposition: inline
In-Reply-To: <20201014061941.4306-4-samuel@sholland.org>
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


--cqcoajix7hb5rria
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 01:19:27AM -0500, Samuel Holland wrote:
> When using the I2S, LEFT_J, or RIGHT_J format, the hardware supports
> independent BCLK and LRCK inversion control. When using DSP_A or DSP_B,
> LRCK inversion is not supported. The register bit is repurposed to
> select between DSP_A and DSP_B. Extend the driver to support this.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--cqcoajix7hb5rria
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX41NTgAKCRDj7w1vZxhR
xayGAQCesFf8meHhbTCjVRz+uJFFlntIjlLqWTiKf7z7CgoHcgEAnhLRdd9QfEia
IQa+m8CsOCQ/9XthACy9KU44cRcgVQM=
=ulm+
-----END PGP SIGNATURE-----

--cqcoajix7hb5rria--
