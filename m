Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4B81B906
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 14:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69948A4E;
	Thu, 21 Dec 2023 14:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69948A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703167149;
	bh=P5LqH2Y7SWkKlwY3y6xyxJudJDH6IG5UM2gLj1IEnsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iaz1e/OV4tiUHe8igjQku7usHdqxas23ZeaKIqnz67uWsSoAnIg3n3ZENYtjlYrJk
	 qBmbSRpiRfN2/teeWAzlqyshxUWSLKEAy7hb5alwu92zsMnKgep51kY9RgUk10cvs5
	 CCLWCbyWBtz1SdSdCIbyqCYoXZEOpOOkDxrGnjuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 455C9F80557; Thu, 21 Dec 2023 14:58:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9743F80571;
	Thu, 21 Dec 2023 14:58:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FD99F80153; Thu, 21 Dec 2023 14:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3CAAF800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 14:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3CAAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mabOuG0i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 367B56173A;
	Thu, 21 Dec 2023 13:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E897AC433C8;
	Thu, 21 Dec 2023 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703167119;
	bh=P5LqH2Y7SWkKlwY3y6xyxJudJDH6IG5UM2gLj1IEnsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mabOuG0ivwRlO6G4naCOKEZhMk2uR1LZdjj+a9DUlp0T7/PrKZiLNXL4AIt5KCvaO
	 H7T/aA+uHk2GAokUTNGQ6M0Ncepd824C9Ejf+f5xRqEEkNf4nAyQZBEEMWUdfqKvJ6
	 6FSsNIrjb4KiYuhWaVA86cypqaqRA2dk6cqsuduZNxj/6ryGNliWHkU+mUVggy+0DN
	 jtqcmJDcfOzwWA4hzor5T2NNCtL7F6XmYqZRudrGGHJwDx2RIdCUAcQmRxn0TXdtRH
	 guDu5adgXbyWiD4ppjx3rJ/LjE460/Y5oxvSBou6WI8hkdRhTY9wEi0vv9th1tg5f4
	 EjOhJrkqtlRSA==
Date: Thu, 21 Dec 2023 13:58:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: ASoC: Add Cadence I2S controller for
 StarFive JH8100 SoC
Message-ID: <f1210b31-25af-4cbd-b73e-2a72aa6c41bf@sirena.org.uk>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-2-xingyu.wu@starfivetech.com>
 <20231221-saddlebag-tricolor-d02a17d66795@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Je10eHLduGuAy2yb"
Content-Disposition: inline
In-Reply-To: <20231221-saddlebag-tricolor-d02a17d66795@spud>
X-Cookie: Results are not typical.
Message-ID-Hash: KXB5VKAGT6QZZLLC4P72TT3QLPB3CC6J
X-Message-ID-Hash: KXB5VKAGT6QZZLLC4P72TT3QLPB3CC6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXB5VKAGT6QZZLLC4P72TT3QLPB3CC6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Je10eHLduGuAy2yb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 21, 2023 at 01:53:00PM +0000, Conor Dooley wrote:
> On Thu, Dec 21, 2023 at 11:32:22AM +0800, Xingyu Wu wrote:

> > +  cdns,i2s-max-channels:
> > +    description: |
> > +      Number of I2S max stereo channels supported by the hardware.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 8

> Mark, is there no common property for this kind of thing? That said,
> there's one device here so the number is known at present.
> Another note, this property is not required, so it should have a
> default.

I wouldn't expect this to be a property in the first place, as currently
presented this is specific to a single instance of the IP in a single
SoC.  In general this is something that is obvious from the compatible
and doesn't need a property, it's only plausibly useful for Cadence and
Designware which is a very short list of vendors.

--Je10eHLduGuAy2yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWERIkACgkQJNaLcl1U
h9BcGQgAheM9EAPMjgBTsuBAaQIPvCR4hci5mQpv4BAqe9xyf3i1kt8jh0saB1Ml
+ziuaF1AQrBoBkJSd3RSSfTgeOCplifgqtoVthIhI4LUyIYK13WCbvhVG92shYYv
ASQfO03KLvk559mAIHA/oW62eF/YzEpTHJsorSHUHeWoqAltTitK/51n8QAHfeJP
sukuTUG9MgYX+t5mA+qVKl6NRLvcFaw9hosbXSqaTXPwSAHDn/8LHMiTcsFu3BBE
XvmoBdRS0hYA6Ek5er3o22Td8pNjS9/uWyO/ZYYdURpPx6/foStm12WLQcsneEEN
B8egzLRTfz4+EzLBIJw5q1Um04byyg==
=bQAA
-----END PGP SIGNATURE-----

--Je10eHLduGuAy2yb--
