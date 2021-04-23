Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666436993D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF3C16FB;
	Fri, 23 Apr 2021 20:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF3C16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619202043;
	bh=h7AV5zfVh6vO1R++3uX+B4pB3EBAfnvQ6P6IIhCfPJE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGXtcxeiHR0dejVw4PDeaycsn7CrXAcKbNh24O9AJadoKYWIIQzUSWJLOLypEXxgU
	 kDiXxaOSMXCnnUfrldDT/UKLlcBFQzD0ezx4u49/dkpttnHVnTKf5zI65koeIxPKCv
	 STSuXZBA4BUEBpSUO/ba1aY2KOTAt1sxg6q7KPq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C4ADF80117;
	Fri, 23 Apr 2021 20:19:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39223F80227; Fri, 23 Apr 2021 20:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88108F80117
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88108F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ObhISvpA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA25461261;
 Fri, 23 Apr 2021 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619201948;
 bh=h7AV5zfVh6vO1R++3uX+B4pB3EBAfnvQ6P6IIhCfPJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ObhISvpAgNNX/dCDCcEWnhg1vvAZzdWJBYgkjqzJLPL6jexrcdIrPfWZfFcsUAVbd
 mkurRAvi7TJCog7cmaeKkOwGIz8uQDRdT98sDutyefU5EKRFiR0GHNhYohaAE90qkz
 dcPoPIX3uBGV7HGaCF5EFhj/OmhXM8pcTyP6kqyeMENGKnXNU/RM4sIoLdBv/360at
 IQtMTat4y1Fqvtzk9A6CL3DYr0+Wy+xyADc/KN276gwa0OLefP84jvTb+mQ6vIr3Fm
 y3JpAusqwxHZ1hf2oIkHnTM9VVmJhPFsd9qWO2YG0Ul6WQYsWBJvtyIu8ahn9pzX7g
 U/HzlCs3kNpIw==
Date: Fri, 23 Apr 2021 19:18:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/7] ASoC: adds new .get_fmt support
Message-ID: <20210423181840.GJ5507@sirena.org.uk>
References: <871rb3hypy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W13SgbpmD6bhZUTM"
Content-Disposition: inline
In-Reply-To: <871rb3hypy.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--W13SgbpmD6bhZUTM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 22, 2021 at 10:52:57AM +0900, Kuninori Morimoto wrote:

> But, it can be automatically selected if both CPU and Codec drivers
> indicate it to ALSA SoC Framework, somehow.
> If we can use it, Sound Card Driver user no longer need to select it,
> and I want to use this style on new audio-graph-card2.

It could even be done with the existing ones if we just make the format
property optional.  The automatic selection is something we really ought
to at least try to do so thanks for working on this!

> This patch-set adds new .get_fmt callback which indicate available
> dai_fmt to ALSA SoC Framework.
> Of course Sound Card Driver can still select dai_link->dai_fmt, same as before.
> If Sound Card Driver didn't set it, and if both CPU / Codec had
> .get_fmt callback, dai_link->dai_fmt will be automatically selected.

One of the biggest things to consider here is that there's a bunch of
devices that have varying degrees of support for different formats so
that while they *can* do some formats it's only in specific setups.  The
most common example is generic serial port devices which can often cope
with I2S so long as there are no extra clock cycles but don't *really*
fully support I2S (they clock off the first edge on LRCLK and ignore
the other edge) but there are other examples.  This means we probably
want drivers to be able to list at least two levels of preferences for
formats separately then try to ideally use one they both like, but it
gets a little tricky.  We probably also want to have some priority list
in the kernel where we try to rank how likely formats are to have bugs
in the hardware to maximise the chances that things will work.

--W13SgbpmD6bhZUTM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCDD38ACgkQJNaLcl1U
h9DtHAf/RDzIKExFIsZ1AGr7GEobWoMOWeCDnYfeJeVI5zTYLrMN1qRatXmUgD1E
OEAgdnff3UOB48d6NaVEJwfZk6fsHJNWPbF/WlofYUPsTgit+VAS/k8ADePcOIQv
bL2KUSZ4N2DpwvLP1N0LRXgiY6iizRrS9qBz4Mhx5zmU5y6SQAIBr1ehhKt20jgk
99b/fUKH0r4NCHYcPruWJWnMxIw9dEOvYaXIeM1az6paxQ6Q+wuijhI74cZaQS0R
i9RC9rB5CTMbf4J1y5jh0Kr7PVdoxVFsN0h6UqBq0EW9mu/GIuP0RlaLp0py4uy3
T6jhulRyLyjRoKwOhMd2fSR+6KhBZA==
=EyFW
-----END PGP SIGNATURE-----

--W13SgbpmD6bhZUTM--
