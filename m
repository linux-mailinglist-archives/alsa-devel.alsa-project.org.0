Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB7218D8E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A96D51654;
	Wed,  8 Jul 2020 18:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A96D51654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594227165;
	bh=AqMKtqS/OXQk+rhorj+lXzo8EwOOu2YsoGozE3DRg5U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGQSm4PtOC70htt6Xnz6L8fQlPCtI+ltab8kzG4M4SPvBUt0uGHBYt1unLplqxc2z
	 IiNoKEOC/3UP52gfi7DsqcuMH/zMVRwKzE5XIWMnQNgssWKWVHtDWr//8thooL/2zx
	 bIAKcR09m1Z66BNdp7hO3HGw13EPJlDnwhH6pcT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5899F800AE;
	Wed,  8 Jul 2020 18:51:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A499F8015C; Wed,  8 Jul 2020 18:50:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7379BF8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7379BF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g+siRc6b"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 800802063A;
 Wed,  8 Jul 2020 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594227047;
 bh=AqMKtqS/OXQk+rhorj+lXzo8EwOOu2YsoGozE3DRg5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+siRc6bJy6ezH6ZeNdz2UGNlovQfefe94DX3Ol9cFvhEvJwUWscErEJuSZWseQZS
 esTenErVulATOMRJI3KaxHGJEZgA7pGTm/tJE0yl+fLtEBEDoedT1KdWyg5i+z02jA
 31gZNcFQy7WDA+YJFJGBMkhp39cfu1zw3ooqG5XE=
Date: Wed, 8 Jul 2020 17:50:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v3 5/8] ASoC: qcom: lpass-platform: Replace card->dev
 with component->dev
Message-ID: <20200708165041.GX4655@sirena.org.uk>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aBaYPhOdNx+t7mr3"
Content-Disposition: inline
In-Reply-To: <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org
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


--aBaYPhOdNx+t7mr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 10:38:13AM +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
>=20
> We are allocating dma memory for component->dev but trying to mmap
> such memory for substream->pcm->card->dev. Replace device argument
> in mmap with component->dev to fix this.

This is a bug fix and should've been at the start of the series (or sent
separately) so that it can be applied without the rest of the series.

--aBaYPhOdNx+t7mr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8F+WAACgkQJNaLcl1U
h9DYdwf/TP/V9rRaqchmnuoLr81D+iZWagfBza40aZnj6L9DmzYz9ujUAXhBwLE3
m0qzU/Y80YabOhh+GByaGdPSPAT+34xYOcFVym6e2Iqq6iJHSIY9OWeChI+ieCKv
1JxhQzQgOBoHjSLmCG/IM6/DaP8Gcab0uEakRbI6wzuhKbZtQ8TmCLD90Igv2Y36
bFNfao34+aQxdmGpe1lLqScooepCZzYeL47nFGlVoXFSG9phR0h+Qwj/ed/5alhn
ntxODL3WdwurRO+1L/TZrPhfrmMolsda9pU0G6Mm4vO2NwXK/bZuYixvckCT7H3S
5frOF/gMTdki5Wl3SDrE8GDvOrX9/w==
=exLA
-----END PGP SIGNATURE-----

--aBaYPhOdNx+t7mr3--
