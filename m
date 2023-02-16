Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B4269A2B7
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 00:54:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB888EC3;
	Fri, 17 Feb 2023 00:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB888EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676591655;
	bh=QYuazwNYUcnjE+/EeEWbbyq+2GgUhchBcJH/DELOnM4=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sFORj0y7CCVy9FMZ8gjbo2pbBtEv8ukXeRIKzO8l+wivLiZPBpLDz9zistKvHE3Kj
	 3Vxc9MPLNvk2ezEVG1vCXEJNavQ5Ze7aJ52z2f/PseRQ2GWRAFs7TzEzwmVmhr+rfR
	 bnCCRICkh1NKwbJplpuimL/a0FxuzcehqjK8dIuY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B27F800E4;
	Fri, 17 Feb 2023 00:53:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA8FF80171; Fri, 17 Feb 2023 00:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 395F6F800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 00:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 395F6F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rACrYxab
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PHsFq0GS4z4x89;
	Fri, 17 Feb 2023 10:53:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676591584;
	bh=fP7M6V+cjNdWp1AJeaYpecLEvF9ZpOfTM+q7vfHAObU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rACrYxab0E15ubVIDUkicHNZ9A7o6QYmslTZDcOJQfv/F/0NBjWDNSogqxgIeXY6/
	 ES7W5herbayThve7MD61VmbV1VgH9umTLzCioelUwYSDn5NuYy2zyhj33GJlWsir8a
	 ulpOs7iyxfs3sCIy0239wGGeto2v+Mo4XuIdQOnmhKX8lsw/gpAqMubXK7uzmr+MjE
	 fsVJHz/hJPLnVYPKrLNaflekWVbGGbrv7w8dC0g5WWu6f2WLbfm5nYmyePabZYU7Tz
	 xBdgnLQfW2lEvmPa2LK2SR31sA6tFbYUXnUOPsQzeJnqx7s55RErGykHtpIo2Udk4K
	 i8Rj2sYAlIr1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Herve Codina <herve.codina@bootlin.com>, Herve Codina
 <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Qiang
 Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v5 00/10] Add the PowerQUICC audio support using the QMC
In-Reply-To: <20230216134226.1692107-1-herve.codina@bootlin.com>
References: <20230216134226.1692107-1-herve.codina@bootlin.com>
Date: Fri, 17 Feb 2023 10:52:58 +1100
Message-ID: <87mt5dyxph.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: GEF75MX33XQXUQMTON5J7Q2O2C4TEQG3
X-Message-ID-Hash: GEF75MX33XQXUQMTON5J7Q2O2C4TEQG3
X-MailFrom: mpe@ellerman.id.au
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEF75MX33XQXUQMTON5J7Q2O2C4TEQG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Herve Codina <herve.codina@bootlin.com> writes:
> Hi,
>
> This series adds support for audio using the QMC controller available in
> some Freescale PowerQUICC SoCs.

Who's going to take this series?

By lines of code it's mostly in drivers/soc/fsl, so I was expecting it
would go via that tree.

Or is it a sound series that should go via one of the sound trees?

cheers

...
>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      |  172 ++
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml |  234 +++
>  .../bindings/sound/fsl,qmc-audio.yaml         |  117 ++
>  MAINTAINERS                                   |   25 +
>  arch/powerpc/platforms/8xx/cpm1.c             |    2 +-
>  drivers/soc/fsl/qe/Kconfig                    |   23 +
>  drivers/soc/fsl/qe/Makefile                   |    2 +
>  drivers/soc/fsl/qe/qmc.c                      | 1533 +++++++++++++++++
>  drivers/soc/fsl/qe/tsa.c                      |  869 ++++++++++
>  drivers/soc/fsl/qe/tsa.h                      |   42 +
>  include/dt-bindings/soc/fsl,tsa.h             |   13 +
>  include/soc/fsl/qe/qmc.h                      |   71 +
>  sound/soc/fsl/Kconfig                         |    9 +
>  sound/soc/fsl/Makefile                        |    2 +
>  sound/soc/fsl/fsl_qmc_audio.c                 |  735 ++++++++
>  15 files changed, 3848 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
>  create mode 100644 drivers/soc/fsl/qe/qmc.c
>  create mode 100644 drivers/soc/fsl/qe/tsa.c
>  create mode 100644 drivers/soc/fsl/qe/tsa.h
>  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
>  create mode 100644 include/soc/fsl/qe/qmc.h
>  create mode 100644 sound/soc/fsl/fsl_qmc_audio.c
