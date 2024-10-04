Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B35B98FD82
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2024 08:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBFC74C;
	Fri,  4 Oct 2024 08:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBFC74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728024580;
	bh=vCBFmwrwEM2IvMCGAvBLAn1VRX2l5WyxHG1L61LQmt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E5kdAURaBnaPgu7DMwLPrwGlkWJh5x9yWLse9QusTvhHViZZH3iTowbJgDfe+ySJE
	 E7Kia5Rdpo9+Xv5r4wGbFBz4xzj2Q9Vj5VgyGN6MvfjdVViXfuq4F0W09EHMRdqloe
	 ln0d+X9s4FRuPPDAx8p2Lm7wkXrkOfQ4g2M7Ucns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBCA9F805B2; Fri,  4 Oct 2024 08:49:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA1DF800C9;
	Fri,  4 Oct 2024 08:49:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5F12F80517; Fri,  4 Oct 2024 08:48:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77892F800C9
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 08:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77892F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k0humdPx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14923A445D5;
	Fri,  4 Oct 2024 06:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDDAC4CEC6;
	Fri,  4 Oct 2024 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728024517;
	bh=vCBFmwrwEM2IvMCGAvBLAn1VRX2l5WyxHG1L61LQmt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0humdPxRvytD7mZEhX5AyjV/Z97RFJYmH2tEBfootMIcuK8Y/R9oXfPIsDlZexKK
	 36xgkxH6/glxgMVqJHfJNjZNMoN7vbinKgPRpTKb0CJoWsQSrf48mT15gPEVAh13hI
	 a97Ipsp4BAjVo3UZst5WQEQON8yGSe9dtSrcexDcvPqHVhkJd1wngojnQCm0rDVBJs
	 MHxOMNBMNLq2eSHwK42m3RZ1A30Ks2I7LXVZkhIJDVO8uy2fgP5Ddmlofy1TXmWCXf
	 E0DKGjmjYB2L7GKoin2ungllImHj8FjtF5cLTi+HWiHxUMsuhvcr+HAasmeNROABTM
	 gGxS+PL9SIU3Q==
Date: Fri, 4 Oct 2024 08:48:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jayesh Choudhary <j-choudhary@ti.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupt
 properties
Message-ID: <zhxowgwhddl6ywhnbhts6bgzfcwrb3zxrpqxqtjghg3s56u5ps@kw2hbogcm2nh>
References: <20241003083611.461894-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241003083611.461894-1-miquel.raynal@bootlin.com>
Message-ID-Hash: 2NGXWTS7QXOTSLKMU6NCK3LFNR52YOLO
X-Message-ID-Hash: 2NGXWTS7QXOTSLKMU6NCK3LFNR52YOLO
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NGXWTS7QXOTSLKMU6NCK3LFNR52YOLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Oct 03, 2024 at 10:36:11AM +0200, Miquel Raynal wrote:
> Combinations of "tx" alone, "rx" alone and "tx", "rx" together are
> supposedly valid (see link below), which is not the case today as "rx"
> alone is not accepted by the current binding.
>=20
> Let's rework the two interrupt properties to expose all correct
> possibilities.
>=20
> Cc: P=C3=A9ter Ujfalusi <peter.ujfalusi@gmail.com>
> Link: https://lore.kernel.org/linux-sound/20241003102552.2c11840e@xps-13/=
T/#m277fce1d49c50d94e071f7890aed472fa2c64052
> Fixes: 8be90641a0bb ("ASoC: dt-bindings: davinci-mcasp: convert McASP bin=
dings to yaml schema")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

