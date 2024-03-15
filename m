Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47AC87CE81
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Mar 2024 15:08:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFE52344;
	Fri, 15 Mar 2024 15:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFE52344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710511708;
	bh=WdUX4lu8bXJIZPkoiQQkUmr5EbLf/TIHgfd0F51z534=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AArsfKFzR9/dgBAaMQV3IK4XgY+Mi2g4rEULY23PqWtLNbaCvVQE5reh/DBYby867
	 ESDSoi82zlUv2lyDNEsJ83MgpdcUKG+HFafDlOAx6FGbSBkWbzkr/5obiPOVNHMsBJ
	 9T7T/EbI4mJsrMIahJ4ZxTa8FBZCJ+BspegafGuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69784F8025F; Fri, 15 Mar 2024 15:07:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F596F805A0;
	Fri, 15 Mar 2024 15:07:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73570F8028D; Fri, 15 Mar 2024 15:07:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AFF5F800E4
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 15:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AFF5F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VrE85+Fu
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62DA7CE20A8;
	Fri, 15 Mar 2024 14:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C524C433C7;
	Fri, 15 Mar 2024 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710511639;
	bh=WdUX4lu8bXJIZPkoiQQkUmr5EbLf/TIHgfd0F51z534=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrE85+Fu6T6PEiwbvP4kB2o7DTAVBxOF0HfvAXbb73daAwwJd6neO5BO8FodeKgeb
	 D23zAIUVn22HBgwLKWdIzRSSe+AXB+rqGooc/TX9fAk6kaD+H6I9qNXvAEORrl3InK
	 Z2f3Ym8ISoMMzQUDaE+rlLe2NHijhxsQQOGpJdpbKSKDT4/w6AZOHZ8/QNEcPMuDZa
	 i07Z5m3471yM7r4D4bYvowbotVgl0+13LY/MR49TyJd87cRB4vxFR41RyI4hBjh9oJ
	 CRq4AdsRq2pHv/NLYr2JOSWbKcH7OZlVT7t60oMNPXIP8+zlDzPeM5ZuZE0MNNdh9B
	 EqyQ2noi/G/Nw==
Date: Fri, 15 Mar 2024 14:07:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com, christophercordahi@nanometrics.ca
Subject: Re: [PATCH 04/13] ASoC: ti: davinci-i2s: Replace dev_err with
 dev_err_probe
Message-ID: <6102130b-b496-4e75-9b9f-f960484848fb@sirena.org.uk>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-5-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3GytGuMeU5fQLL4f"
Content-Disposition: inline
In-Reply-To: <20240315112745.63230-5-bastien.curutchet@bootlin.com>
X-Cookie: A well-known friend is a treasure.
Message-ID-Hash: 3UP5B5JKEZ4OFNY3WD4ZHILQ2ZCODGDW
X-Message-ID-Hash: 3UP5B5JKEZ4OFNY3WD4ZHILQ2ZCODGDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UP5B5JKEZ4OFNY3WD4ZHILQ2ZCODGDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3GytGuMeU5fQLL4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 15, 2024 at 12:27:36PM +0100, Bastien Curutchet wrote:

> -			dev_err(&pdev->dev, "no mem resource?\n");
> -			return -ENODEV;
> +			return dev_err_probe(&pdev->dev, -ENODEV, "no mem resource?\n");
>  		}

dev_err_probe() with a fixed error code doesn't seem to make much sense,
the whole point is to handle deferral but for a straight lookup like
this that can't happen.

--3GytGuMeU5fQLL4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX0VhEACgkQJNaLcl1U
h9DoVQf6AqSdqdzoCg7bciF4ooMQTN5zUTk3BOK75rX557NTNOzssKXfOkq3P6IK
UPIgAGVmjLPycIsFR4/8r0Cbnh+/2WCn+5PB8u165TR6JaHq9LdBNqYI74E93Bxa
F1BYs3h1+OwhReXF7bVNlWX5vpkeM7GXuP4kqmgiVv1jKGCHOJhbBMCN5qB8kGov
6SCNIqh10yRWnjD8L68EtFgTxbF/Cx6Ohfm8nQalK6QC9BKc1t2JgsQuhm3xZLZX
A+OfFqvzRN1Ct0w5TjA8YrFfS3NYydlCuyO8mRdAycIi4gaoarJGRm9PGwpAS3E9
F4ppJpwm/ht2TzJDmVckcCGGihyOdg==
=IT+L
-----END PGP SIGNATURE-----

--3GytGuMeU5fQLL4f--
