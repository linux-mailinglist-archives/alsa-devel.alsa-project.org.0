Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5C50E038
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98901709;
	Mon, 25 Apr 2022 14:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98901709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650889647;
	bh=CCfsBTA5tOM5okHwD5mr1fjJwZTvTnfyFRzdWo61CQo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4BhVobzG8EHprj5tLR5gBXNly8wE16s1GjGSMOnXG3CpKP75osBZ3Iepb2MJm2P2
	 bPgoupN7B7gnR7J+HL3d3Xw5FKrKu1bjd9kZPX9KYyt9i34uXRWFbCorsKy5uChpQz
	 fvpd5wNOnVp0gaCXOoEtqzS2STUORMqBRmHXfiyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A90CF80152;
	Mon, 25 Apr 2022 14:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF18F8016A; Mon, 25 Apr 2022 14:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01DAFF80152
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01DAFF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kOsgTXh3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F035561368;
 Mon, 25 Apr 2022 12:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D92CC385A4;
 Mon, 25 Apr 2022 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650889576;
 bh=CCfsBTA5tOM5okHwD5mr1fjJwZTvTnfyFRzdWo61CQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kOsgTXh3qLqBYkKsEtDHorXameycdD9qsUjKa79ik/kQwpfkC1vWwwzY5xEpXl+qv
 AIUv6JPKHd8EhWPZ4isMcJSZQLROYRnyQCIQfDa6HE1iJpg4UbW4ple1PgvAFyEWEq
 lnkE43sf8WbQar3VAVMa186wn1OyEG38k6/5/qpndfahwQhSJy+dIZsOXA2m3CT+ro
 JVA53pk4Gcb9yURRgRfRyMkJ8xt44sA+V0OVDYs45dcgumSHEjMhaRTJ29GQF9eV6w
 qFEEoA/C5WcOwPlbdm8ggoIZ/lwz38A7hHoBsOFSUyz5HtzDw9075bfkvvRP+4VaOg
 LH02Rq0fXRqpg==
Date: Mon, 25 Apr 2022 13:26:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: soc.h: Introduce SOC_DOUBLE_R_S_EXT_TLV() macro
Message-ID: <YmaTZEnMAsqtg2FO@sirena.org.uk>
References: <20220422160112.3026542-1-rf@opensource.cirrus.com>
 <20220422160112.3026542-2-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dUudKPHLHGWxXp+f"
Content-Disposition: inline
In-Reply-To: <20220422160112.3026542-2-rf@opensource.cirrus.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Simon Trimmer <simont@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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


--dUudKPHLHGWxXp+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2022 at 05:01:11PM +0100, Richard Fitzgerald wrote:
> From: Simon Trimmer <simont@opensource.cirrus.com>
>=20
> A straightforward extension of the SOC_DOUBLE_R_S_TLV() macro that
> allows the get and put functions to be customised.
>=20
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--dUudKPHLHGWxXp+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJmk2MACgkQJNaLcl1U
h9Bz7Af+Lf+FoJbAa0i8nRsGp/D2J5caATzoFfmsqnNeRpBfsFEkg05oAcUbaGXL
9a8Enhi1C74R5eW+yhjZ2778l/iB/rI53TaQD96c9pn9wfLIkNpeP5YjVDZDJ/ki
Pfz9GM04a8QYrqQhsAzjUGDdV6x8vBkRINdo9aq/vDmjvfcLRtbNweng3hziT8R9
61W3AQOgE6pvufbsTJONUF7HZdbJCQAt327i2q1e4FRevEoM4yiQNJJIxWYQTJ0H
mvb2bAW3SlZk7Yw42EULySeGI8xlxelerHKWsXdU/wti/fEUcaZzI44F+S4ncOu2
AiBQjJY3fngU+FFvD+Fzf8DG9LI9SQ==
=OCou
-----END PGP SIGNATURE-----

--dUudKPHLHGWxXp+f--
