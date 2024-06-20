Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25899911286
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 21:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 380A6A4D;
	Thu, 20 Jun 2024 21:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 380A6A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718912957;
	bh=D+e2m26VHYUG/Lo1gKaeNxI1GFfU9WexaAsiXpn5YYI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IJxNrqO+tCRH56ebmaPzf8nAuxoeNQ0JfV5ZxSUIulzRx08W0mforwFUvo89hKNHi
	 u4X3feHvXX3GToIzgjYf8hlmwaYMNgFxHhZIlncqSoegsMKwEm05PEf2jCymRvis+E
	 P0/HL6su3qs00qONoo8Ztr95UjPpK1bK1nEAfL1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B75F6F804F2; Thu, 20 Jun 2024 21:48:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BACF805A9;
	Thu, 20 Jun 2024 21:48:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 062D1F8023A; Thu, 20 Jun 2024 21:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E55A6F801EB
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 21:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E55A6F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=snFugIF/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FC5062190;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD0CC2BD10;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718912838;
	bh=D+e2m26VHYUG/Lo1gKaeNxI1GFfU9WexaAsiXpn5YYI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=snFugIF/AqgJy+pEn7auwBHqcgy7Pe3AUcf+drxFEmAqZGIg4UnWBdqoK6m6CwAsz
	 EkiwhgZjP3d7GOm7e8ou0XhSc1T7L3lMeaa/T1AEIXbfpSX2iywkxq4avE0e0+m91t
	 dLOvf7FI8ULn1u+pmBL4hCtE4SXPle6UjAxOchsCgdgfWHkHmUV9bzREB8NNPkOJPP
	 5LWC2Wixht1KdskG7sSDxZfktWP8GWsK507Mj2+LEuf+K4sBHxeRyzFxXz2SDbZ0t9
	 K6+mi92KIySVFO89b+DEvfdkNsCh+2E7uNs9B8beQA9nGHp8USIGgcbWKanPLsl5s8
	 j+fvNo+PZMXHQ==
Date: Thu, 20 Jun 2024 13:47:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-sound@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
 dmaengine@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Richard Weinberger <richard@nod.at>,
 Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
 linux-mtd@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org, Li Zetao <lizetao1@huawei.com>,
 linux-i2c@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 alsa-devel@alsa-project.org, Vinod Koul <vkoul@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
Message-Id: <171891283706.3289677.3213379285370562671.robh@kernel.org>
Subject: Re: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
Message-ID-Hash: WEPDEY4H3U2JHJR62MKVJ4XY6YI6CXX2
X-Message-ID-Hash: WEPDEY4H3U2JHJR62MKVJ4XY6YI6CXX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEPDEY4H3U2JHJR62MKVJ4XY6YI6CXX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 20 Jun 2024 19:56:33 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  9 +++
>  2 files changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.example.dtb: /example-0/syscon@40004000: failed to match any schema with compatible: ['nxp,lpc3220-creg', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240620175657.358273-3-piotr.wojtaszczyk@timesys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

