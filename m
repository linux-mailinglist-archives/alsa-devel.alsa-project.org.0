Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D27AD7F7
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E958DE5;
	Mon, 25 Sep 2023 14:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E958DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695644779;
	bh=EpScTZPLgSj65vBFSIAyo7Cs1HB/1MAIHpQTaZ0bcLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EIbmsOYPaBdZSiw+cSvuEbZhcY03LTF8hruf7UTskx882CSMGDi5bfgr0iCQRqChZ
	 KPwT/Ep49MIhaBfI7ejcq2D2rK75QvWLCQ0XX7AJKe+M7EQLW/qZd42R6JBc7lmVJm
	 Aj1dAo1kgQ0v7uOWfVN7smz/X5IWe9ItD3e6Vw+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3832F80166; Mon, 25 Sep 2023 14:25:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A828F800AA;
	Mon, 25 Sep 2023 14:25:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 811A3F8016A; Mon, 25 Sep 2023 14:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 026F9F800AE
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026F9F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WOPfcOgN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E795160ECF;
	Mon, 25 Sep 2023 12:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3CFC433C8;
	Mon, 25 Sep 2023 12:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695644718;
	bh=EpScTZPLgSj65vBFSIAyo7Cs1HB/1MAIHpQTaZ0bcLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOPfcOgNDBAeO4O+0jKxnPe1Lx4/OaazqraHxWLEniyocDCR/cxEGGp/1h9gmYzNT
	 GGWqEr7I835ssWWvijGb9t+Nh57032xRF3NVRgUAIeDfETZfdQabHr/O9kdQ/fO7Jh
	 ONTvPBjZ+1eeh44LgK4ekXn6mRYj0UNb2mnje0p2jUP+k6a75GQDGrKvqqfcyxI4UJ
	 9rmHzSSZWcer6u1FC2XHatapgkGmrJXyez5tHe/1DTAnNJHMC3mmqN+twElSSfyQZm
	 bd9UyBTC3XNLXG8NI4IbUhwcKPDyDD1U4+I1/wKYcarCOx+7g/DQco05eKdNDKxvmb
	 GRzouKT4TE8AQ==
Date: Mon, 25 Sep 2023 14:25:12 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM endpoints
 ignoring system suspend
Message-ID: <ZRF8KI11IVf6NzpL@finisterre.sirena.org.uk>
References: <20230925110946.3156100-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q/IrCVZv+ZArlVx4"
Content-Disposition: inline
In-Reply-To: <20230925110946.3156100-1-chancel.liu@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: PDIYGQDMSMCWQCEFWASJ7OPP5F43BQ2N
X-Message-ID-Hash: PDIYGQDMSMCWQCEFWASJ7OPP5F43BQ2N
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDIYGQDMSMCWQCEFWASJ7OPP5F43BQ2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--q/IrCVZv+ZArlVx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 25, 2023 at 07:09:45PM +0800, Chancel Liu wrote:

> +  fsl,lpa-widgets:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of DAPM endpoints which mark paths between these endpoints should
> +      not be disabled when system enters in suspend state. LPA means low power
> +      audio case. On asymmetric multiprocessor, there are Cortex-A core and
> +      Cortex-M core, Linux is running on Cortex-A core, RTOS or other OS is
> +      running on Cortex-M core. The audio hardware devices can be controlled by
> +      Cortex-M. LPA can be explained as a mechanism that Cortex-A allocates a
> +      large buffer and fill audio data, then Cortex-A can enter into suspend
> +      for the purpose of power saving. Cortex-M continues to play the sound
> +      during suspend phase of Cortex-A. When the data in buffer is consumed,
> +      Cortex-M will trigger the Cortex-A to wakeup to fill data. LPA requires
> +      some audio paths still enabled when Cortex-A enters into suspend.

This is a fairly standard DSP playback case as far as I can see so it
should work with DAPM without needing this obviously use case specific
stuff peering into the Linux implementation.  Generally this is done by
tagging endpoint widgets and DAIs as ignore_suspend, DAPM will then
figure out the rest of the widgets in the path.

--q/IrCVZv+ZArlVx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmURfCcACgkQJNaLcl1U
h9AHzAf+PwWIz4bbMz7QJRzUtT+mOEdX/5lMuK4w3mvqnYoUdqA2qy3yVAdLoegF
WoPAesxiBiwTkmnQcnEsWsIdH7T3tGO6oSpYg1DfWmKbwGi2wnPerTw98/lNyLM7
f23wUYprpUdcE2+9j6/1dMuN7T5hDZoBLXxp/pcVOmL/z40sXOKkpaRhBb1oy5Jq
qeIcheuyv3RCEdBKCoMa70apc3LRU6MTkVJpqBjM6DfDZ6YTOFwUs841MV/lz/uz
fXV0yK4ETHlJ5ThXNPLezNqSEyghVeFKt7ZaIBze4VuoS7YYhgv777AZBJ6rIija
y2y2FOnTDyyU7C14ZyZdfXWkCnp0Aw==
=Zz/j
-----END PGP SIGNATURE-----

--q/IrCVZv+ZArlVx4--
