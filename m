Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D816F2980
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Apr 2023 18:28:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF1916F6;
	Sun, 30 Apr 2023 18:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF1916F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682872111;
	bh=V2tgsxOxTfmZcvRZyi6ynmgrf/tIIQz5o5snoPZmHO4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B3f9LejepLZLYuLPj8kkjMus8VvnwMkDTgg8vvXmDS4seDcrBmh53jA9AFON44JD1
	 ldvoWl2CwTuARZASoU6g+SmGHxX/FXcfabStmnzsCSIEQOt+hwgmbHSTgLip2DDtqA
	 /DFZeIMnmmd6Bi0MseLX2D2CSxVhbfLn6yzSto7E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF11F8032B;
	Sun, 30 Apr 2023 18:27:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49D5CF8049E; Sun, 30 Apr 2023 18:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B6D5F80114
	for <alsa-devel@alsa-project.org>; Sun, 30 Apr 2023 18:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B6D5F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ohiSAAgM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F4BA60FC6;
	Sun, 30 Apr 2023 16:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDFCC433EF;
	Sun, 30 Apr 2023 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682871924;
	bh=V2tgsxOxTfmZcvRZyi6ynmgrf/tIIQz5o5snoPZmHO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohiSAAgMfDAtFcx9SK192wPjh/7XHrSN79xa92ySMS7s2DLmuZmbHI+Jkj476cGoc
	 1A+qIU0Ini9+ni1jZoTzJHyEmIjacVKZxEkCuUgTWtHQYq29cXXYQhgAkmYj5/xsxb
	 aQe5wPQp1vI+yTeOJm8F499YWhjkrxkXvMvqJMiR5gq5530vUJerAzWTUxSFGyFyJj
	 z2CjhGFbqyJl0+f80/FyDVF56TPLZnCeTnAMZtmNdUc2R9U8d3FPyRBM4Cz7RMzwKG
	 CjVvnhMvGnTlg1awNM2qS+j0pzUI7wYtxAHTSXTGLcayqQHxdAvW6Mrwzom+sUxXZi
	 1BT2oml3WvHPw==
Date: Mon, 1 May 2023 01:25:22 +0900
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Add tas2781 driver lib to support
 common operation for both ASoC codec driver and HDA codec driver
Message-ID: <ZE6WcuZQH+5sla8n@finisterre.sirena.org.uk>
References: <20230429032302.5257-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DQ1ay+ysaRLSTEhG"
Content-Disposition: inline
In-Reply-To: <20230429032302.5257-1-13916275206@139.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: 2LMH5UAI2IKXPYHXOFWPHDKNMQHO7JIG
X-Message-ID-Hash: 2LMH5UAI2IKXPYHXOFWPHDKNMQHO7JIG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LMH5UAI2IKXPYHXOFWPHDKNMQHO7JIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DQ1ay+ysaRLSTEhG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 11:23:02AM +0800, Shenghao Ding wrote:
> Create tas2781 driver lib.
>=20
> Signed-off-by: Shenghao Ding <13916275206@139.com>

As previously and repatedly advised new DT bindings need to documented,
you should be sending the bindings and driver together as a patch
series.  Look at how other drivers that add bindings are submitted.

--DQ1ay+ysaRLSTEhG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmROlnEACgkQJNaLcl1U
h9A8Sgf/ZDYUOEkE+LN5WUMzOqBBnA8RCiUkP5OFE3sF5ssY270K+NMw8RFws/g4
OfQL58Wy7OYcXgWeqvemzybMavRT/pvJ80EptPsy5fnd8fP28c71Fs7TXSJBU+to
bvXDBSpHQOUFyuI22Ckk67KeSZDQO2AGJqwYp0hoZdRkenbOXtTRzV9tmVdDWev+
vQpmqGdZ6fRQA3kU/eXRaIq0evBxAXxSzJ54h2YiDOpo01cOiwzWcpGPgtB4QFXX
5MLYXK7ISSS+DSvF6BFG52zexdKdycTlbSG51Uyd4ynaXTCJCDiUOsS/OB9OMFpq
xoo4sdi6mo301RNil5YnxIi3KQ1lng==
=Cbb4
-----END PGP SIGNATURE-----

--DQ1ay+ysaRLSTEhG--
