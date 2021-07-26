Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EDD3D64DA
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 18:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C5741731;
	Mon, 26 Jul 2021 18:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C5741731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627318393;
	bh=9wY+vK8pU8J7omIu+pjegU2qRU8KinU8TvumD7+FnYo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qpglbb0UGZG72eigOcW1XRc/9bUGr2Jf6fd+zBYmqwnLx0xeKNyncWTzguAfy62aO
	 lMEi1Nab9KBx0fupVf5TDfv2Nk2IOnyk/hhEuNQ/4Ft+oZ/LBXV84Mv3b7wiPKpoKy
	 6F9YxXEWnfpcVCrdxQ4+sT/fz1j0wVNyKfwAY2W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 087E9F8025E;
	Mon, 26 Jul 2021 18:51:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 525B9F8025A; Mon, 26 Jul 2021 18:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B820F80132
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 18:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B820F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T1Upm1SM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BC6B60EB2;
 Mon, 26 Jul 2021 16:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627318293;
 bh=9wY+vK8pU8J7omIu+pjegU2qRU8KinU8TvumD7+FnYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T1Upm1SMxQcZG0iZgig5cay6fQ3MmbTYQGqCpn5tQk1HdV/AeHhn4Qj/ON9J3inyC
 +Q3zJaZbfa6UWk031xegXgo3PQHyIwr1QzVQcrqj4vFlnm5wfsB0teOpk35ZEWF4lP
 kmf/d/yEOTGV57ZSQWgAuzwAEp2lg+qZY3+dkcV7t3T/tcSsPBvwFbHQHVasBFNDcF
 lCZ+BiODNMQuv5okFo3lRJdPZyaVL4UXbhQtN2j8mjck393jXIz0m/Za0iWdyuOVZH
 Bh5RL3cuuV67VVTyWj4i6SYFkA3YlnntkAfMNgL2kGGuw4AK+AeIKhRRRaJJ27HvJm
 t3Qlzi5sFt/Nw==
Date: Mon, 26 Jul 2021 17:51:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Subject: Re: [PATCH v2 6/8] ASoC: cirrus: i2s: Prepare clock before using it
Message-ID: <20210726165124.GJ4670@sirena.org.uk>
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-1-nikita.shubin@maquefel.me>
 <20210726140001.24820-7-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ONvqYzh+7ST5RsLk"
Content-Disposition: inline
In-Reply-To: <20210726140001.24820-7-nikita.shubin@maquefel.me>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
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


--ONvqYzh+7ST5RsLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 26, 2021 at 04:59:54PM +0300, Nikita Shubin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> to Common Clock Framework, otherwise the following is visible:

Acked-by: Mark Brown <broonie@kernel.org>

--ONvqYzh+7ST5RsLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD+6AwACgkQJNaLcl1U
h9A6Dgf/Wm+8EbWA4QXnD1gSbW2Zlde8S4f+YIjYt2M+qV9LmDgwZP6bDSkRXepv
s8ddt8h+D7mYcN4N82bEPlQVcPqzM3yi2DM8Ba6Vp6FWL7kLME2tRDhN2YH63Chv
PDeAvO3ThrXmd2hOOy40WgiR+oRG7URiDCbUYxbU2Ce1l/MueeeRwJohgOfp4S5a
SDt3IoRGZH7cfa92Sybcvrj4cs86jYEa+SzotUYElkr4X5pZISG24t3rchwZuM6+
5vVbpkCSCIhCH+QH3OlRgf3GLxrI22ExJTBdaeGh/Mo8ZQ2eJFYDcmO8BJVOZmvk
MPRriHL+0E+GfcG+2S7Rn6gaDmut4w==
=5Q4y
-----END PGP SIGNATURE-----

--ONvqYzh+7ST5RsLk--
