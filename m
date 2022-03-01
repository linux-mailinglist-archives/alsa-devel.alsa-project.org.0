Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7511E4C8BF4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:47:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECDDE1B17;
	Tue,  1 Mar 2022 13:46:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECDDE1B17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646138867;
	bh=nxk6HmZ+oziOwd4/ZlWqyk2FF1Rck5kB6obmq+t2JxQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6UujnqwX4ha+tsBcu4M7jzyHHDW8wHCfpnHSvETlP1ja7lPNM6VChnlI37l9XZcl
	 hg2sMgh+Wgec7ZoZVzWLO/iyoaZyWGjYvT49cMV4Rjgt2CGj8bzy+5DtcEhWxJEdAi
	 a/2gL2QlV7Zq7EFfZsmf4S1leSY5POjHFrgZheQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F009F80095;
	Tue,  1 Mar 2022 13:46:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF5DEF80227; Tue,  1 Mar 2022 13:46:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E05F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E05F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A9qS1Vry"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF52DB81869;
 Tue,  1 Mar 2022 12:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57318C340EE;
 Tue,  1 Mar 2022 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646138790;
 bh=nxk6HmZ+oziOwd4/ZlWqyk2FF1Rck5kB6obmq+t2JxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A9qS1VryQH4aCd+igJlo2W9SYPDQ8QUQI/f9hD3h3KZ2yORYc+89/eeicK28W53GT
 3jyQIFNwIML/qzZyuT/hVubKT1RI5QbE7FHxNmNKWijHU0BAOW1w+NHBrGAb1rKMbP
 Fbn0dKC2HC1a6ZJw8EwBCs0THbU6o1ng5m93+CsJh6itVTdkmWQzPsH1GZO5SUKais
 3JPYgg1G/TBoEhSuBccwLTcSIrrzR6Zml+C/+sgTwJ737FJoJV1QTXB4v/whfXTvGh
 mHi+hTCgKqZ2YArogxUIwZ8qx5yA4VvMuaKArUf9iWy7B4b7ndeFuxvXyo+Rm62o6a
 ZKPAk2UNb15qQ==
Date: Tue, 1 Mar 2022 12:46:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] ASoC: atmel_ssc_dai: Handle errors for clk_enable
Message-ID: <Yh4VoWfDxUOBGRBg@sirena.org.uk>
References: <20220301090637.3776558-1-jiasheng@iscas.ac.cn>
 <Yh4BCPqPngcsvER1@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T6jZRfUnVsfwpi4G"
Content-Disposition: inline
In-Reply-To: <Yh4BCPqPngcsvER1@piout.net>
X-Cookie: You have a message from the operator.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 nicolas.ferre@microchip.com, tiwai@suse.com, codrin.ciubotariu@microchip.com,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
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


--T6jZRfUnVsfwpi4G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 12:18:32PM +0100, Alexandre Belloni wrote:
> On 01/03/2022 17:06:37+0800, Jiasheng Jiang wrote:
> > As the potential failure of the clk_enable(),
> > it should be better to check it and return error if fals.

> As I already replied to an earlier patch, this will never, ever fail,
> this patch doesn't fix anything.

OTOH it doesn't do too much harm to have the error checking and it means
people don't have to check if this is a case where it doesn't matter.

--T6jZRfUnVsfwpi4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeFaAACgkQJNaLcl1U
h9A12gf/Z2ih09vgW44eyJevr+GSx5BKo89juYbnargXWju4kIefBm99v9d/V/iV
H72bbmH2hR1Ja5mbDlSKPvEnpQGknmuQl+CCcgMujjPOZ2xtnkriHaszCUkilvnq
sRswa4l2SYSXGAsz440VEgUA+QDAbObEn02uTqBv0Nf+kudu2WHqioSR6A75xlZ5
G3FTauzL+KDsFXhHQ36PydQUWb6W17kxYvvja/46qHvmNg2BejvbWCL/6T/j2myr
lnSc+4rw5jD6lB4ItVuUCS87enl5fqKkTZ7E4W5FciqpenCP7SGA8OsjuLSJ3roB
pRJmnX1i7THYcqMsjsjwAckc5MUE9g==
=s96X
-----END PGP SIGNATURE-----

--T6jZRfUnVsfwpi4G--
