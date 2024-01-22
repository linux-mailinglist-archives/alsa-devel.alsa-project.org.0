Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E067F837325
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 20:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB48822;
	Mon, 22 Jan 2024 20:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB48822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705953030;
	bh=pVtGodeicWDJGJnRxQD9TYUUvY4ml1P1cyQImCYhXeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P5quVU6rkIFLxvjfTHwLOEBw/TIWeaRmdd4L8gT9z1AcDw1VXujxz9q6SH28Zb27b
	 M8Q3tGdkV+3V4PqT+E0amnAHype1M0Xox34LlAh+myMCGM0U616Kr6amWHHda9n0ay
	 6pFOkH4oHn0syyja8IgjHnqgTHTOOlsC70mZGzQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F9DBF8057D; Mon, 22 Jan 2024 20:41:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A01BF80587;
	Mon, 22 Jan 2024 20:41:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C5FF804E7; Mon, 22 Jan 2024 20:41:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4AD8F8022B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 20:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AD8F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B32OpiG2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16B8E6194C;
	Mon, 22 Jan 2024 19:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6737C433C7;
	Mon, 22 Jan 2024 19:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705952457;
	bh=pVtGodeicWDJGJnRxQD9TYUUvY4ml1P1cyQImCYhXeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B32OpiG26rQr9Hr+UduoekLolHO0MhEsx6aRThvVxDKX/JeW2uys7/etwEddPf18/
	 u4SYBNkVTnimvXhcHCfsm/umRFJplfoU4qRh0Wki6ANXrnOjgWjh/ZiDQvLy896JcQ
	 wngPjKpEXXgbeeS5DzNnK+l6PrCgNy4EA8xQPkfIKDxWcYbb79Wm9eJ0B3NQpD9DAX
	 bTn9BiKFLiV8CU65SThM3+UUnR0aAcepvfTstsvTZASmeMSLR/jpRb6GOFbLQIasFy
	 IUh2MGOGgfhJDldXMXMioYEA0wEQreKlHbUGuK2/RuHQcGN8dCBsiSqeMl02O/D7WS
	 eCamcXgaaL1SA==
Date: Mon, 22 Jan 2024 19:40:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Seven Lee <wtli@nuvoton.com>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Message-ID: <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122-daunting-woof-19fac5689bb2@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cJlmuN7wD9uJzDfe"
Content-Disposition: inline
In-Reply-To: <20240122-daunting-woof-19fac5689bb2@spud>
X-Cookie: Nice guys don't finish nice.
Message-ID-Hash: PNB5WAMYPGTQHTPNNLHURLKZG77CZXZQ
X-Message-ID-Hash: PNB5WAMYPGTQHTPNNLHURLKZG77CZXZQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNB5WAMYPGTQHTPNNLHURLKZG77CZXZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cJlmuN7wD9uJzDfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 06:00:14PM +0000, Conor Dooley wrote:
> On Mon, Jan 22, 2024 at 05:56:49PM +0800, Seven Lee wrote:

> > +    enum:
> > +      - 0 # VDDA
> > +      - 1 # VDDA*1.5/1.8V
> > +      - 2 # VDDA*1.6/1.8V
> > +      - 3 # VDDA*1.7/1.8V

> I would also rather than this enum was used to have sensible values for
> the enum itself (which I suppose means strings here), rather than the
> register values. Seeing "nuvoton,dac-vref = <2>" in a devicetree is not
> very meaningful IMO.

Do you have a concrete suggestion for how to more clearly write these
directly?

--cJlmuN7wD9uJzDfe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWuxMIACgkQJNaLcl1U
h9A9wgf9GwcA7Ig0ZhctUzcIuOgFXg+HVs2fAzHGak6ySbki+9ticBmi6pSE85Ss
VawLZpUX9H/Gp2cV7U/PV81ax0MHTrvo1QWWmSoS+3BBHxgqCIHMNrM1houNIxle
YrH2Sq3AKOSs8QHUPF7YQu4VuJV7bOCH5C7FaAIXhVNu3l6iwpz4cBXN7Ta49+9Y
qVYxl0hq+Rk4FCA/7idB0c6I+Xahcz9oQ6YAk+vLkVASFAqgPiY+EDundI2abdW0
P3DwApDBdBjH/fYSf8WAu4x/R1VLvSKMj9gZBbYZdBnsM+u0kyx/0o9C1Lgg/iav
WYCEFzYB3Q/cJxIvQi6YFEwLBvty3w==
=l5dE
-----END PGP SIGNATURE-----

--cJlmuN7wD9uJzDfe--
