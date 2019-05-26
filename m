Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C95F02AB9C
	for <lists+alsa-devel@lfdr.de>; Sun, 26 May 2019 20:25:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFE6175A;
	Sun, 26 May 2019 20:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFE6175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558895140;
	bh=zij2rrOihiUfVt9kDCi8gq+BeEx4Ho2qIakyUlo9hpo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCC/sFiO5MV8B0WaVQUGIeW6BNJERglDfVg8ER16nd2EPPjdTJqAqpIhxO6CIFuIC
	 upBaJQJh4d0jBS+cCVLM3Z9NYZnyFiLSmgJCdPu4Y6HP5u2oDup7k0JjtiS24mbDXE
	 Bqty2etl065rospTZFU3MUDHtLeeOlImIAtzBvZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A54FDF8970A;
	Sun, 26 May 2019 20:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF30FF896EB; Sun, 26 May 2019 20:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38829F896B8
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 20:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38829F896B8
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5B9BA200009;
 Sun, 26 May 2019 18:24:11 +0000 (UTC)
Date: Sun, 26 May 2019 20:24:10 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190526182410.soqb6bne6w66d5j6@flea>
References: <20190525162323.20216-1-peron.clem@gmail.com>
 <20190525162323.20216-4-peron.clem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190525162323.20216-4-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 3/7] ASoC: sun4i-spdif: Add TX fifo bit
	flush quirks
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
Content-Type: multipart/mixed; boundary="===============9169839064697155280=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9169839064697155280==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ncwtv45aqoqucxoa"
Content-Disposition: inline


--ncwtv45aqoqucxoa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2019 at 06:23:19PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a different bit to flush the TX FIFO.
>
> Add a quirks to prepare introduction of H6 SoC.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index b6c66a62e915..8317bbee0712 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -166,10 +166,12 @@
>   *
>   * @reg_dac_tx_data: TX FIFO offset for DMA config.
>   * @has_reset: SoC needs reset deasserted.
> + * @reg_fctl_ftx: TX FIFO flush bitmask.

It's a bit weird to use the same prefix for a register offset
(reg_dac_tx_data) and a value (reg_fctl_ftx).

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ncwtv45aqoqucxoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOrZygAKCRDj7w1vZxhR
xX2iAP4vmqh1nSGLNbrJR8v0vBh2+l0fQX6kqx83+rzmZQkZAwEA9wYOzTE6aQsj
ncPb9kzAxB6nwlo5NuAAcwZBIUQ9rA4=
=uFpz
-----END PGP SIGNATURE-----

--ncwtv45aqoqucxoa--

--===============9169839064697155280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9169839064697155280==--
