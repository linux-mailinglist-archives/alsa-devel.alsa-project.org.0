Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA907693A0
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:53:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCDD7A4D;
	Mon, 31 Jul 2023 12:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCDD7A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800836;
	bh=kZQ9rd7+vvc/7Gvl3vjW2UDDxuplrCUYeemfvqaByoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S0YqD3h+dI8LClSrHmQMjRUnB015dGAnNrmbwErOka2Y4c+e+H2lUsciGnZJFnK0H
	 /ZGhBZto4F1PbYpVsr/pT0EA9b0kPUwhsqP7c6HMeR7awYcj+oQfrsTnU0YO6Zhc4I
	 gIxSw81OE+xmG99FcXmxN0KQ9FKsT0Bn0goyu998=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F08DDF80520; Mon, 31 Jul 2023 12:52:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ECC1F8057E;
	Mon, 31 Jul 2023 12:52:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E2B6F80425; Mon, 31 Jul 2023 12:52:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 020FDF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 020FDF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fpNOclGp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB1C861027;
	Mon, 31 Jul 2023 10:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC3BC433C7;
	Mon, 31 Jul 2023 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800722;
	bh=kZQ9rd7+vvc/7Gvl3vjW2UDDxuplrCUYeemfvqaByoI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fpNOclGpW18IO6iaZafBQO/0Nm1AmHlp4wxvxMUqzK9yO/Vw84+QNTK1HtI8bUOIp
	 lqlRU3fww4IxLv/eYfEYRKGDl+b8YTktdDTrHM2gel32ApnTybb7uHeh3+iJg9kwI3
	 8FKFwzsDaEBN8mb/ao1oGcBBGdBujgDBN+OhnhCV94wD5N7dsTkmD5B7QRTDsr3PwU
	 lAEi0FgoHhjaxIV5r2qSbMDjDFNOv6u5TZuBg+oKKEn7SGmX6If9//cvb5Oi61YHAQ
	 6iEFnuyBubdRdN0bGpuy0ZGuate3E25huqW3i8UAdzU8AbRYJrD4bwT97WCjF422r6
	 NbA5RU6S3QryA==
Received: (nullmailer pid 2405197 invoked by uid 1000);
	Mon, 31 Jul 2023 10:51:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Bakker <xc-racer2@live.ca>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Trevor Wu <trevor.wu@mediatek.com>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Rao Mandadapu <srivasam@codeaurora.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sylwester Nawrocki <s.nawr
 ocki@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>
In-Reply-To: <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-6-krzysztof.kozlowski@linaro.org>
Message-Id: <169080070323.2405060.5165458565785804399.robh@kernel.org>
Subject: Re: [PATCH 05/12] ASoC: dt-bindings: samsung,midas-audio: use
 common sound card
Date: Mon, 31 Jul 2023 04:51:46 -0600
Message-ID-Hash: R6W2REG4WG7ZSAULVDPHKUQODJNA7ONM
X-Message-ID-Hash: R6W2REG4WG7ZSAULVDPHKUQODJNA7ONM
X-MailFrom: SRS0=3R/A=DR=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6W2REG4WG7ZSAULVDPHKUQODJNA7ONM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:56 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/samsung,midas-audio.yaml      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,midas-audio.example.dtb: sound: False schema does not allow {'compatible': ['samsung,midas-audio'], 'model': ['Midas'], 'fm-sel-gpios': [[4294967295, 3, 0]], 'mic-bias-supply': [[4294967295]], 'submic-bias-supply': [[4294967295]], 'audio-routing': ['HP', 'HPOUT1L', 'HP', 'HPOUT1R', 'SPK', 'SPKOUTLN', 'SPK', 'SPKOUTLP', 'SPK', 'SPKOUTRN', 'SPK', 'SPKOUTRP', 'RCV', 'HPOUT2N', 'RCV', 'HPOUT2P', 'IN1LP', 'Main Mic', 'IN1LN', 'Main Mic', 'IN1RP', 'Sub Mic', 'IN1LP', 'Sub Mic'], 'cpu': {'sound-dai': [[4294967295]]}, 'codec': {'sound-dai': [[4294967295]]}, '$nodename': ['sound']}
	from schema $id: http://devicetree.org/schemas/sound/samsung,midas-audio.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,midas-audio.example.dtb: sound: Unevaluated properties are not allowed ('audio-routing', 'model' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/samsung,midas-audio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230731094303.185067-6-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

