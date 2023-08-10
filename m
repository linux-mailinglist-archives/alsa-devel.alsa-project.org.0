Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2664777904
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2654884A;
	Thu, 10 Aug 2023 15:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2654884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672587;
	bh=ifwSAVf7zqfgC0VUvGFtTcSsPQ83VyzNkkIsPttxrQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y7otd4cWMYvZ1TqHO0D+CBvkwMJ2P7VuJTQLddx+2XygtVY8p8yurKWzKwAsqX8fc
	 4pA0zH1/xe0M2JMYEBKA/yal08X2+xzAhd7NpDUSisosXCOWq/Csv1AqZnZ/y/xuvt
	 YAJW4sW0eo3RwSGvFgb79EI5Yh4O2Gu0E3OlWhBQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F49DF8057B; Thu, 10 Aug 2023 15:01:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDB5F80568;
	Thu, 10 Aug 2023 15:01:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 899BFF8016E; Thu, 10 Aug 2023 09:20:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8780F80166
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 09:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8780F80166
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XBN4oR5O
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57088650FD;
	Thu, 10 Aug 2023 07:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293EAC433C8;
	Thu, 10 Aug 2023 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691652032;
	bh=ifwSAVf7zqfgC0VUvGFtTcSsPQ83VyzNkkIsPttxrQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XBN4oR5OUyZZhcVNV9rrvCAxgxndp8GFrEGC+8uDrfZqVkDEctDcqd4U3l7ahxG4h
	 BEtvsfzgHjQKNnN0xjJsUTc5jX6k62eiT4XQPFQmGMu3LL+D9br3ow8heaR/fP3S9K
	 r220hJCW/XqLkQXAW6BpPp2i1jchiunkw52+RkU5sizV/aN+P6gtv9LCjoj0cwdrNi
	 LeMaLuGsSaZGT0uOBEt2CUIfPwTvmqzYp7ekxTy2d4NvUStogGNkvI+hRSw/+Wzzdp
	 Yt56RXo6qOFk91K1yk9VSjvebe+gq4krCpTuXzMqC3U2yuq4p0vWOFyvE/Lf6WIion
	 cdGkjd/O70haw==
Received: (nullmailer pid 3911833 invoked by uid 1000);
	Thu, 10 Aug 2023 07:20:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Bakker <xc-racer2@live.ca>, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, alsa-deve@alsa-project.org,
	l@alsa-project.org, Judy Hsiao <judyhsiao@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <20230810063300.20151-5-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-5-krzysztof.kozlowski@linaro.org>
Message-Id: <169165201914.3911686.628530054525655751.robh@kernel.org>
Subject: Re: [PATCH v2 05/11] ASoC: dt-bindings: samsung,odroid: use common
 sound card
Date: Thu, 10 Aug 2023 01:20:21 -0600
X-MailFrom: SRS0=zxi7=D3=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: QB7M44DA6NDVWURXWOI6FXQ5ED7DFH5F
X-Message-ID-Hash: QB7M44DA6NDVWURXWOI6FXQ5ED7DFH5F
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QB7M44DA6NDVWURXWOI6FXQ5ED7DFH5F/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 10 Aug 2023 08:32:53 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,odroid.yaml  | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810063300.20151-5-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

