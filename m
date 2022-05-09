Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9945200FC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 17:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0726A1891;
	Mon,  9 May 2022 17:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0726A1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652109682;
	bh=Otn/1pW+YnVWg2O+X9tl6pzhmsugj4MKdcjS46dn8R0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQRVjM6/XmKysa0mUz/cg4dJN7wYd/tdMtzT4kf9m/SrGEwZPoUJUdcQ/2hFbingk
	 1GVBjxNvC3ImTz+IgQaCg5A1kPtMBxWB3viziUTbOq24h+SLlGQ4o5lNqr31wlxjC7
	 NniPF4IHXvPzwbG8Kjasro/sVhqI72D6WCOBvK+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4918DF80269;
	Mon,  9 May 2022 17:20:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A47B6F8025D; Mon,  9 May 2022 17:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6749AF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 17:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6749AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L1t5LK1i"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4307B816E6;
 Mon,  9 May 2022 15:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D957BC385AE;
 Mon,  9 May 2022 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652109606;
 bh=Otn/1pW+YnVWg2O+X9tl6pzhmsugj4MKdcjS46dn8R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L1t5LK1ioC0q9YcMSkEliKW70l9F/yrflXmF3DnLS+UrDqiqlHk23XBh2OvB1i6Gh
 nh43mAnNM71AVPZUz5eFqc7hRzmu/nD8ktyKlYb9/UnKUfPfpfyrVl6/y2iC0eA+qh
 s7uxSsn+VuaSl4gsY3I3h8ovcFiPn19goJGFaNsUQe62beoaxlN1EKrKNs4IvEUgNW
 /tg29mJrjLGSeo9TGVWHAGnmP34bbQ8JFkEEAGKVAYD4JaIhNPK6ay+jYfY4iYwDaB
 kDflRN5wyRe0dkGQmeLneHPVOku3tY0ruRCqmRjU4r2eYREDaS72ThhekUq56YgQQ6
 9dGOVrtk9eJew==
Date: Mon, 9 May 2022 16:20:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 1/2] ASoC: wm8940: add devicetree support
Message-ID: <YnkxIe1nVUiKNmdq@sirena.org.uk>
References: <20220509121055.31103-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="guiHyUClsBYNl/Vo"
Content-Disposition: inline
In-Reply-To: <20220509121055.31103-1-lukma@denx.de>
X-Cookie: Boycott meat -- suck your thumb.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--guiHyUClsBYNl/Vo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 02:10:55PM +0200, Lukasz Majewski wrote:

> This adds devicetree support to the wm8940 codec driver.
> With a DT-based kernel, there is no board-specific setting
> to select the driver so allow it to be manually chosen.
>=20
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  sound/soc/codecs/Kconfig  | 2 +-
>  sound/soc/codecs/wm8940.c | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)

You need to provide a binding document for any new bindings you add in
code.

--guiHyUClsBYNl/Vo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5MSAACgkQJNaLcl1U
h9ABUAf/QLihyIhlv9B+mH3K/QMNPGVNFnQaQzlyt3XGwFECkKhgxluXAyk0aush
IKXP04UdPiy/gC0iS3QXlrVDZhV094djNT42xGJzz2H9UKovYZjrYky76j7kduYI
2WeMoo8KZ5GfxZ5/HfHW+bw168wfH8SGEzuUPMqOs6NZJZ1HgXOeCoc7X+C7QJh7
d6Q0YKBafi8cYM0Eg48RloS17x5X8xYKYXdpc/ebA4buuM6NjQ83Jb3HN8w3IL/q
yHi5178payfHMp9JDmFuqc+pTHIcyf9oW4eTVxe2b2BLIZjwciE8ZIU1Y93lJUOO
7/rn7KPWzBaAgp/v0Uiup/jeelXIuQ==
=JEQ5
-----END PGP SIGNATURE-----

--guiHyUClsBYNl/Vo--
