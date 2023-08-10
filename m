Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F977713D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 09:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A47846;
	Thu, 10 Aug 2023 09:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A47846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691652145;
	bh=bP36nggtNTcaSB51YmxNCmFrR2tYKpXdKmSkIiqnMCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ObouDAOl1avGm7mkDA5eOvDErKBSlXGVOkAdQYTnTBZcqO4o4GEQZhTKhrjrEMaho
	 X1ri5MMCk6F+Y0TNnrLXeKz6xIwvpUpEdwzQ0Q9cPLKjjI9EKhFlN8E8EHmLw0O1AA
	 E2CPxoNWPsgKAiKvX+ho1G2VjNQuZj6bdS/1gAfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB17AF8057B; Thu, 10 Aug 2023 09:20:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CFEFF80553;
	Thu, 10 Aug 2023 09:20:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9B5AF80578; Thu, 10 Aug 2023 09:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2BBBF80553
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 09:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2BBBF80553
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b7xCgLCO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E35DA65131;
	Thu, 10 Aug 2023 07:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D474C433C8;
	Thu, 10 Aug 2023 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691652040;
	bh=bP36nggtNTcaSB51YmxNCmFrR2tYKpXdKmSkIiqnMCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b7xCgLCOVhYVaCRA9ysvEwB0KAVrnF0DPlnGhwHb8Asu/QKOW99CAQzQOZFoKIs3T
	 L+/fVvsyFCbF1VOcuCPW2tEjwhv7MUxKohsYz5oSC0pGQLa03+3ncBqId955zndZYo
	 t4fvgIOxQqathudofqFAq58pC8YFbPeEUG0kU4OLnpmK7IwqHfCtjChzldpMZPB+tu
	 JXHFSif6qnbLymtIJHIS+cR5wVmEC9N4sZkoJaE6rRJV0LwhM7FADDp/6bCeYH1RbC
	 VhAt5cnxp4FJFQ5Nje4IUERU8dHq8jGj+OA0i8Esl4TPlBmZTa2A0EUo2xX66unK1B
	 fzKZQsLIAmeBQ==
Received: (nullmailer pid 3911835 invoked by uid 1000);
	Thu, 10 Aug 2023 07:20:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Judy Hsiao <judyhsiao@chromium.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Jonathan Bakker <xc-racer2@live.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Takashi Iwai <tiwai@sus
 e.com>, Rao Mandadapu <srivasam@codeaurora.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
In-Reply-To: <20230810063300.20151-6-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-6-krzysztof.kozlowski@linaro.org>
Message-Id: <169165202008.3911723.14471178545610726250.robh@kernel.org>
Subject: Re: [PATCH v2 06/11] ASoC: dt-bindings: samsung,tm2: use common
 sound card
Date: Thu, 10 Aug 2023 01:20:21 -0600
Message-ID-Hash: OTABPZR3A4KW6B3L7YRML367SFSYQVVZ
X-Message-ID-Hash: OTABPZR3A4KW6B3L7YRML367SFSYQVVZ
X-MailFrom: SRS0=zxi7=D3=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTABPZR3A4KW6B3L7YRML367SFSYQVVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 10 Aug 2023 08:32:54 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,tm2.yaml   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810063300.20151-6-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

