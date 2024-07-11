Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B3D92F11C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2024 23:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D050A4A;
	Thu, 11 Jul 2024 23:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D050A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720733242;
	bh=PqmkKClzKA9/SBnHkaebvSMhSF4dVf6/yT6uauqZ1ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WfnYrc7rX5ruOdIPnoozWPoNEFcLaP/JcGFaQf/gqGo2GIns97PEPyqb5Fidq1hnm
	 SobvC8gqehVfINCmCNrmJqXM5hHiidxm4bZePaf5zgEDuI1U3v1rgOKPIc9WKwbQU2
	 lxHZ1bZxd5ll2JVDXNrOhfSxt/dlHNNv8vRJbnCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4EE8F80588; Thu, 11 Jul 2024 23:27:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78055F805B2;
	Thu, 11 Jul 2024 23:27:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F449F801F5; Thu, 11 Jul 2024 23:17:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19D62F800FA
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 23:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19D62F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OwaEH00l
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 252ED60DBC;
	Thu, 11 Jul 2024 21:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6926C116B1;
	Thu, 11 Jul 2024 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720732473;
	bh=PqmkKClzKA9/SBnHkaebvSMhSF4dVf6/yT6uauqZ1ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwaEH00lPYizGDKn3Lj426vXvs6iS3F3txCwEPg5beVfkBvD61hOq1JKCd1ngTNsN
	 XWu+VztjQPRqlkgQeFN1wOnBvlwvq6LNriLsQmFIBKKvTo9rc+SkAGBTl9ZXEFzKFG
	 7MXRi+f1EA1TxV67rs7xvM0CgJwVJD6lZO5rDvfd69tV8avxM05k+5n7ach+cUVUti
	 E6rVlxpW4vjtGQpmS0vgoBxdkDZ6zN+DcBHP2yR2+MiAeQkK5MxarHPOtl7UDG2cCy
	 W/Zht9tvzw6GoSsEmIBur7LTi0ZYritzCsDbO2Ps3nZYdp5YY3PfWZ+GbF9hOLM89F
	 U9q+Xi8IwMJdg==
Date: Thu, 11 Jul 2024 15:14:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	alsa-devel@alsa-project.org, David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42xx8: Convert to dtschema
Message-ID: <172073247178.3021175.15222505507624018342.robh@kernel.org>
References: <20240710072756.99765-1-animeshagarwal28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710072756.99765-1-animeshagarwal28@gmail.com>
Message-ID-Hash: T47AUZLL4QYT5EANDIFBQJQ7UOBG4EPX
X-Message-ID-Hash: T47AUZLL4QYT5EANDIFBQJQ7UOBG4EPX
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T47AUZLL4QYT5EANDIFBQJQ7UOBG4EPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 10 Jul 2024 12:57:52 +0530, Animesh Agarwal wrote:
> Convert the Cirrus Logic CS42448/CS42888 audio CODEC bindings to DT
> schema format. Set power supply properties to required only for CS42888.
> 
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> ---
>  .../bindings/sound/cirrus,cs42xx8.yaml        | 81 +++++++++++++++++++
>  .../devicetree/bindings/sound/cs42xx8.txt     | 34 --------
>  2 files changed, 81 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42xx8.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/cs42xx8.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

