Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E45532F6266
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 14:52:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E36516B2;
	Thu, 14 Jan 2021 14:51:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E36516B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610632339;
	bh=DnFIJriu2NQJ3DPbFgi7Hv3d4fRixKoXDF2V4R9eYE4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7GY2jTmWj2WF01p7lqEeHuZYH3TMqs1ZU37DTOGknJEGYYLjgfEeJznPoXCQU8E3
	 UmLm7U6+VsrYynnX1BzqCTgZ+mlW0i+cqhgW6lzzq60xtPx96bX3Npz8FDrRnG7h6t
	 HyKkqs//oGAJjd8AiuydcNhIPNPgfdM3T4RBlYpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3DEF80134;
	Thu, 14 Jan 2021 14:50:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A9E6F8025E; Thu, 14 Jan 2021 14:50:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E3B0F80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 14:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E3B0F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Egx5gGNY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26A4323A6A;
 Thu, 14 Jan 2021 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610632239;
 bh=DnFIJriu2NQJ3DPbFgi7Hv3d4fRixKoXDF2V4R9eYE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Egx5gGNYW3DKyeR8qsMGJSttarAm72aEx3wtT/MTfk6fonlFd1OH1rzPDH59mNJS6
 G5RYLP3pjh1CDTYEh9s22olfyugNqZ8sdwdWBU69v5iH/dgOh76r1zjZf94lTj15Yn
 RzixV3iRDitz6TTrRjCeXVQ3mutKXxXD7GosTKNt6ZleyWcuhOqAieVPelb1yTKadl
 jPrdOwbTfjUj4FTz3Cyy6i7ggh7otW4htp1Xw111QxazrMhpyWryHfT5wKltM7eayN
 NYm6axLN75dizIZBTEaNlKBHLxlTCv55stbZnX1FH4phhgzapt0jwKj52FmvVoJBc1
 pkV/QanNKEwQQ==
Date: Thu, 14 Jan 2021 13:50:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: Question about daifmt of legacy DT on simple-card
Message-ID: <20210114135006.GE4854@sirena.org.uk>
References: <87bldsp2yt.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline
In-Reply-To: <87bldsp2yt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You have taken yourself too seriously.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Jyri Sarha <jsarha@ti.com>
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


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 14, 2021 at 01:24:04PM +0900, Kuninori Morimoto wrote:

> It rollbacks to legacy DT parsing at (B) if (A) didn't have
> master settings.
> Here, (B) re-try to get daifmt, and use "or" with (daifmt & ~CLOCK mask).
> Why CLOCK mask ? and shouldn't it use mask when "or" ?
> Otherwise FORMAT and INV part will be duplicated, I think.
> for example
> 	daifmt = (snd_soc_of_parse_daifmt() &  SND_SOC_DAIFMT_CLOCK_MASK) |
> 		 (daifmt                    & ~SND_SOC_DAIFMT_CLOCK_MASK)

> I think using snd_soc_of_parse_daifmt() only is very enough at (B),
> but am I misunderstanding ??

I have to confess I'm not entirely clear on what the intent is behind
the code; we can work out what it *does* but looking at it again I'd be
hard pressed to say what the actual intent is.  At the very least it
needs more comments :/

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAATA0ACgkQJNaLcl1U
h9CPmAf/S3lfGWBR/QjX9kezwVelTeGm5S8Dy21xFceYinrpPXowArkFpxaJuMSs
HGO4NHAc6OSL0Aj+o37QvoQpyv9ENCj0fQ8HIoOAvEBy/TKE0CHpPmScwB4q7Lok
JuDIcbJ+Q8QDWOP65++JXXxulz+MJg5tz5ft09zKUSGFB0GWyxNFOhz+GioaUoW8
MwtuqAloM+/aYY/T1T00gXW/eq+lwbxXMUrqiYwTRkJEld1UyOAYVhEY6yXvhEHB
4addEmfY7zYwzS/6U7awGyVPDC1IbWQQb8JWuepqhYIpMKLpPtPpg0MP6RIfUC/+
51QORv5SyrcbLuQuqkVZ3xXs3eArcg==
=BRwt
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
