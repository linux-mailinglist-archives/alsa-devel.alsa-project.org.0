Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A0450569
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 14:28:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168D216CF;
	Mon, 15 Nov 2021 14:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168D216CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636982900;
	bh=VrvhXi38LVeGVj4zz/uSdMshhS6qkdQYs58zKEN+yCc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qkg6WNJ35vp4A2fYasVkCaxgEqfVRpellEdhko26Oldk3I9KFyqILQjJUhdwnVLZP
	 88IDilVVnBd2Z/hYcswV0IUZ4oHi9zILdri/e+W+scDZGE8HQ0KoEJuIRf6IJasdMZ
	 iY6wlmn6OFnh2ofPAy8KKavcpyu0Se2WcOA1nzzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C95B6F8049C;
	Mon, 15 Nov 2021 14:26:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4996FF8027D; Mon, 15 Nov 2021 14:26:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB3B7F80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 14:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB3B7F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hxo8bgln"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B546861BB6;
 Mon, 15 Nov 2021 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636982788;
 bh=VrvhXi38LVeGVj4zz/uSdMshhS6qkdQYs58zKEN+yCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hxo8bglnoiF02Ty2ZhPOlGBOV6Dh7ewtclRFrF6dmhdID076Q+dJnQLCSRKP+LIUf
 3lY6udJgn5nWkBP//3VuWjRkZIIC6TSSGNdbtWYVK3OlXoToTKZ4WM1P1nlnglMk7O
 2CJQz68SRGboLi2/X/trX0rYH8wa6mbN82tfmP4Go9hDigkkfcVGM+P/9/EperH8fR
 tlZGsPzcnfZeB6Ht7eyuR7pp7e2Wnjp+fkLJGvAmKs83pUzG31S4zE4ydztBuza40Q
 BO8EwZrOhPtQo3q39miOkGgsxt7FQaCfpt+QoZtOTLb93iCIY7X/fBY/ItohYEjxVV
 rgKlUC5V2z/2Q==
Date: Mon, 15 Nov 2021 13:26:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 1/6] ASoC: SOF: mediatek: Add mt8195 hardware support
Message-ID: <YZJf/viWnHhaHOnM@sirena.org.uk>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
 <20211101080026.297360-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OowjvesRb/Z2qiBw"
Content-Disposition: inline
In-Reply-To: <20211101080026.297360-2-daniel.baluta@oss.nxp.com>
X-Cookie: Another megabytes the dust.
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, linux-mediatek@lists.infradead.org,
 YC Hung <yc.hung@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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


--OowjvesRb/Z2qiBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 10:00:21AM +0200, Daniel Baluta wrote:
> From: YC Hung <yc.hung@mediatek.com>
>=20
> This patch initialize to support SOF on Mediatek mt8195 platform.
> MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
> It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
> mailbox interrupt between AP and DSP to use for IPC communication.

This doesn't apply against current code, please check and resend.

--OowjvesRb/Z2qiBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSX/4ACgkQJNaLcl1U
h9B/6Qf6AvsZ3R/I80XSt7mkb657/qrTS2Gg9zvLgVOrFxn50Z31Q0pbXVl1aAwO
uy71zZMN+mpd+UqASY8kZD1qA6wMKURIa4QF+FpcJdx5hxpogzN1EgNEm3zMs/6l
MK3cDUPCtdYcEs3EdFzlU43PWv6sG7c93xcoEsItlFUSuz8VsOVQ9ggNNj/oeCER
CJl+hRtteEzY60/X0vNjZ7iK5cMgNUOMqaig9B8c4R8mipRHX2SBuPobRlOoHftB
Qm7rlIKZougF1KZxKRxqudco5B86Vz2/fuoFv826JDWwLCZexTLBtMRW9GHRLx0/
O3hrm2FksF22m+2Um6IogCcJfGI7UA==
=KQpy
-----END PGP SIGNATURE-----

--OowjvesRb/Z2qiBw--
