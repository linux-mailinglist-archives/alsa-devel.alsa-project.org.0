Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F22292398
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 10:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFB71714;
	Mon, 19 Oct 2020 10:26:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFB71714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603096030;
	bh=fs9TDdo4GTmdvRI4Rl+UuhCCplynp92mCOBhM23Ej0E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R3lzra9AJchL9ZTuKmadENuI4LSl3nAbxPG0X7v9bUpXeBax0yjPynZOWroZr+pAs
	 Pe801eBipB3PFscS4QE3Ex9izf0NHLvgGnoCb5xg6nWq4zgmYcAv696HI9904L0Hpc
	 E1o2yoy/WKpldGLoIoMDWPmIcN+PJCdLTpIEFgFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 327B9F80272;
	Mon, 19 Oct 2020 10:25:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A50A0F8026F; Mon, 19 Oct 2020 10:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BBFAF8010F
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 10:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BBFAF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="JVgNBFsU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VGaQ941s"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C7E455C013A;
 Mon, 19 Oct 2020 04:25:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 19 Oct 2020 04:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8Hdo6XRn66Ey/4f3KOt+Xa3eVA4
 wVg82ujK1oI1kvFM=; b=JVgNBFsUepY+jbBoqgIm/nnrZkkqK5MIOmhrNLpEEvw
 KkKwaiy18ISuowrASuvhBeze/CXKjLsuAeRLiyT22fBiXnI3jq5Yr9rgQD0yfZS6
 opN5//uiAdk7jN0oS6qlWH+AQ/3P4duFt0VUm8CvcLaiiUU43Dtz0+OCX/g0QO9C
 gdLgtDgQIFQoPhCqWhOC5iVm1/aCgEGZoN5AaAxsDS52ySHRq4ioeURpxh7cKY1k
 ezvte5MSJAFDIVYDpv3TOxp7pPBRDLFi4wwkhgyP3X0/af4i1+b4IbPquJ5HmPzO
 ZphTVJDQ1cgXUU2kb3u2rRBPaFgSVmmOM3QBO6BAVRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8Hdo6X
 Rn66Ey/4f3KOt+Xa3eVA4wVg82ujK1oI1kvFM=; b=VGaQ941stNmnTi9eFHxSak
 zIzPVH+LIq3vjvoZNX04nBk6NE1y/1yO6z5FQ93iOnnYdukxyQ0UXXsGJw6+aeNk
 vOifYHQzQYkBeVqXLzNaazQRS6Zqi5i0XCNKbBWpdGPUu/VDsJnuM8Ik49JCf51n
 UoYqTeibfwcujr4ObLm49RnSHgoCurEo1yf/VnvmzDpd6A4Wdd9LrGtrE3Gngmih
 V1a7zWWODtOSmSL5Cqo87T2vrPcceDte9oOan97M4FkcrMPFNxgWnQrxpgy4792L
 RvZ2vSTuibxMU/0/mxru0iJ0bKz9SZWFZ09aey6Ie73BiFO8VrGy0bhI7XeoDn0w
 ==
X-ME-Sender: <xms:jE2NX1EgNpaZCtT_GbmzvIBBepzJq1NyZFLN0iXbCekE3v85IEEQcg>
 <xme:jE2NX6Wktub740LX0h8fSih7Xvnr0zVMPfo1jCwuK5viXOJqoPZ1Q8EJz9BZfl60f
 uJOl-N0gYckd-lpd1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedugddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jE2NX3KwLCk7AWhNdlDsCbqwI5I_7_yum8REWCR1MQYc-inlcN4yng>
 <xmx:jE2NX7H4iHiu-lTqPPAvheLyZWndy8WtYOg3UQWlCLqJa52l0bULjw>
 <xmx:jE2NX7WtMF-0UuRo0IdVRVBbH7W1myX84_vvr37EA7kQ6hObXk93iw>
 <xmx:jE2NXyGi1m6pUvMlZu4cchRgflIhJW0sFg8UutoTEZOYTRLguwILzA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F9873280060;
 Mon, 19 Oct 2020 04:25:48 -0400 (EDT)
Date: Mon, 19 Oct 2020 10:25:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 10/17] ASoC: sun8i-codec: Automatically set the system
 sample rate
Message-ID: <20201019082547.um4tepbittn2cna3@gilmour.lan>
References: <20201014061941.4306-1-samuel@sholland.org>
 <20201014061941.4306-11-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ajokclgeyiavh36"
Content-Disposition: inline
In-Reply-To: <20201014061941.4306-11-samuel@sholland.org>
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


--4ajokclgeyiavh36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 01:19:34AM -0500, Samuel Holland wrote:
> The sun8i codec has three clock/sample rate domains:
>  - The AIF1 domain, with a sample rate equal to AIF1 LRCK
>  - The AIF2 domain, with a sample rate equal to AIF2 LRCK
>  - The SYSCLK domain, containing the ADC, DAC, and effects (AGC/DRC),
>    with a sample rate given by a divisor from SYSCLK. The divisor is
>    controlled by the AIF1_FS or AIF2_FS field in SYS_SR_CTRL, depending
>    on if SYSCLK's source is AIF1CLK or AIF2CLK, respectively. The exact
>    sample rate depends on if SYSCLK is running at 22.6 MHz or 24.6 MHz.
>=20
> When an AIF (currently only AIF1) is active, the ADC and DAC should run
> at that sample rate to avoid artifacting. Sample rate conversion is only
> available when multiple AIFs are active and are routed to each other;
> this means the sample rate conversion hardware usually cannot be used.
>=20
> Only attach the event hook to the channel 0 AIF widgets, since we only
> need one event when a DAI stream starts or stops. Channel 0 is always
> brought up with a DAI stream, regardless of the number of channels in
> the stream.
>=20
> The ADC and DAC (along with their effects blocks) can be used even if
> no AIFs are in use. In that case, we should select an appropriate sample
> rate divisor, instead of keeping the last-used AIF sample rate.
> 44.1/48 kHz was chosen to balance audio quality and power consumption.
>=20
> Since the sample rate is tied to active AIF paths, disabling pmdown_time
> allows switching to the optimal sample rate immediately, instead of
> after a 5 second delay.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--4ajokclgeyiavh36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX41NiwAKCRDj7w1vZxhR
xZB5AQCX7eiXyErGbPQSBDTuEkJ8G0MBQEzZFHswNw55A1hNqgEAslK2HkaSg6SG
IlFnQUi/8Nav/AvzfQ6LqOYF8diF9wI=
=MtrP
-----END PGP SIGNATURE-----

--4ajokclgeyiavh36--
