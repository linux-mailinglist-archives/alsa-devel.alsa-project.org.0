Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF931D1772
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 16:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91AB51666;
	Wed, 13 May 2020 16:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91AB51666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589379689;
	bh=6fjHlyOTOqWxHSt4RPRb8GVZ91ZqD9TrDEJsn//PCGI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1yLy3pGheXXfYNzVMt+KK0OE8rf1PW561EDVaCzZs3oZ58gdN50RGfk3kz1ZnRWg
	 0PF86NKirkkRn/IlPjBW1f4mkWnKWVLu42TVzaIQYlH8y8XSREV1nFatiz2g5AXyVu
	 5DViF0nTB5Cfv6VLnu47l09NHDgtDsJ5PwL16cao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BC9F800B7;
	Wed, 13 May 2020 16:19:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9BCEF800B7; Wed, 13 May 2020 16:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B6AF800B7
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 16:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B6AF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="ZJO7lWSA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XZDh0kLB"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A7DB55C01D6;
 Wed, 13 May 2020 10:19:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 13 May 2020 10:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6fjHlyOTOqWxHSt4RPRb8GVZ91Z
 qD9TrDEJsn//PCGI=; b=ZJO7lWSA1pGZWi77jHrq32z7Kh+jSm15JVHlGSRHKvV
 O8MQzeqo6gFi4DzkkOXBXHxXEkqP9u79WIBJNeDQYstbGM4IF/DZB2GD79jDc+KM
 k+Qi05829aHju0opokmObn9us4YjjRWajf7z71yrjSpqsAPaj9BSceGGuz6CV1AM
 7vWCksQe0Z9CD55EJ2OjatiODXhZ58TM76WhqjwzfJDNw4yxWRtJgWeCsAmygv2L
 sajikkBNZn3mNWSGzrlQcG8rfXPiUm2g3VmPSA/Ar1cejeOAtgwsu0JjKN9XHoy3
 9OqSOehjuOQ9MhSwa8vpjn8xj9FUkF7GZ3oDlQae98g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6fjHly
 OTOqWxHSt4RPRb8GVZ91ZqD9TrDEJsn//PCGI=; b=XZDh0kLBcHH9Yt+8i992CH
 MpLJEFE1lYT8xfl94OHJ880u0bFQ0lJ+IVl3ckcXz3q1TeNVfLQv1vOjU/dE2a9n
 FdrZrk+II/hDrdIElcYWzrq/8xXVaTW694NbBA+q8FKDr/mVmp9gSnNSqU7jOJLu
 VCdjn/RW2jtmRl7fkemUcv/y7CWqTWk9KNJpk7exYVVugZCyLQ2ukYwtohiQMTdY
 vwjdwPr7/7Lx1JSQHeJjtY39rKODDR/9eP5nccwH3vIgsaZrMYTSkZwC5SyH+Jj9
 4hIMK5omIlFttPIRo+NRdCiDuI6Is7IqIA+RFJguZsMPed3Y/L1lgJBAAeogGr1Q
 ==
X-ME-Sender: <xms:7gG8Xjc1-jAmWs4zidapqSMWKH7xX_IUOGlynmyyAVa6ZOPYFNSfKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
 nhhordhtvggthheqnecuggftrfgrthhtvghrnhepleekgeehhfdutdeljefgleejffehff
 fgieejhffgueefhfdtveetgeehieehgedunecukfhppeeltddrkeelrdeikedrjeeinecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimh
 gvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7gG8XpMuAq-TjdugyqsUGqR86HcwnlTEnvMEal0lOwP8NEC0ypq19A>
 <xmx:7gG8Xsg-qtpBZoJgCZt1nuy1Azyv0dDsAE5l_xgTKelL_hcNw4tgoA>
 <xmx:7gG8Xk_XJ6S60gRhpBm2Onla_uzS5xavcTtCGVdUkod7E3DEP8ZYzw>
 <xmx:7wG8XlXXbyVi5ickxuVV-yGc1SgXk66YGaZ5WLjily-gjjZMet4rRA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DD500328005D;
 Wed, 13 May 2020 10:19:25 -0400 (EDT)
Date: Wed, 13 May 2020 16:19:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Zou <zou_wei@huawei.com>
Subject: Re: [PATCH -next] ASoC: sun4i-i2s: Use PTR_ERR_OR_ZERO() to simplify
 code
Message-ID: <20200513141923.klp2omelhawzxy4d@gilmour.lan>
References: <1588752912-37596-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6ttmhlo4bwfcw7it"
Content-Disposition: inline
In-Reply-To: <1588752912-37596-1-git-send-email-zou_wei@huawei.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, wens@csie.org, broonie@kernel.org,
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


--6ttmhlo4bwfcw7it
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable



On Wed, May 06, 2020 at 04:15:12PM +0800, Samuel Zou wrote:
> Fixes coccicheck warning:
>=20
> sound/soc/sunxi/sun4i-i2s.c:1177:1-3: WARNING: PTR_ERR_OR_ZERO can be used
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>

Didn't we remove that coccicheck test?

Maxime

--6ttmhlo4bwfcw7it
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXrwB6wAKCRDj7w1vZxhR
xbWmAP0Wl+mfUFUgVS86noXlYchEz4RTpXjy5YY+CO73b7vL5wEA4PceZeiROH26
wMKoHBBgjpNbCBfMKyOwfraY1MTy1AM=
=crja
-----END PGP SIGNATURE-----

--6ttmhlo4bwfcw7it--
