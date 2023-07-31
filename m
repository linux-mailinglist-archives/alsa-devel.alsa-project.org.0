Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00676939B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3970820;
	Mon, 31 Jul 2023 12:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3970820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800786;
	bh=RS2Kje527LAoh7KwjfjJ3UAjRfiJQsMXl2WRMM9TVkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JDtjBkYFojeTf8Uexs+JyIpzdXLg+2bavbYBQSzC/GaZfrRnqTVAwh1z6CbQitoMc
	 A210ovs8wYAWZi5AXg9hXNS2Ow5jUIZJ6zssQ0GdmYDYHjfzd7g51h+SWeDTr7awz9
	 TO5e+ZCTTdaVd+jc8ekzSGGWuvbNLPdlxj/zId6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F22F1F80535; Mon, 31 Jul 2023 12:52:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D4AF8016D;
	Mon, 31 Jul 2023 12:52:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D845AF801D5; Mon, 31 Jul 2023 12:51:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D86EF80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D86EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kvFxpcw1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D8BC60FCE;
	Mon, 31 Jul 2023 10:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00EAC433C8;
	Mon, 31 Jul 2023 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800709;
	bh=RS2Kje527LAoh7KwjfjJ3UAjRfiJQsMXl2WRMM9TVkU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kvFxpcw1lbAvb5Ahv13xNMEks4kU46H5mak33N3O7inv+OIR+bU4ELKHc4DoCFD6q
	 vF9XKIqmyVwAnBCpfzSu1QHfDCbbKcU4TM0yPEEM5ws/ua9VjYerJeQuLZN0lslt1Z
	 rhHJfjmaXJUHuvETwHXEBmM1OW7sFKs5D2mXlBo23hUl2UO+jeqDgM0NK6RlQ9e48B
	 FIvPW31eSvT9HOhMHIQvT04/sU2ERXgVTWOab6apIEZCjsnui7RNU3ASr/ZMkRktUF
	 2433J9evnlrW413p/dkduvw3rV9HkboDmez3Na6ZAFHh/oUcGr1pnF/RlwVW6y0C0d
	 QHzGFxoyzWRoQ==
Received: (nullmailer pid 2405192 invoked by uid 1000);
	Mon, 31 Jul 2023 10:51:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Judy Hsiao <judyhsiao@chromium.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
 NXP Linux Team <linux-imx@nxp.com>, Rao Mandadapu <srivasam@codeaurora.org>,
 Trevor Wu <trevor.wu@mediatek.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <l
 girdwood@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-4-krzysztof.kozlowski@linaro.org>
Message-Id: <169080070077.2404962.11506468692056687115.robh@kernel.org>
Subject: Re: [PATCH 03/12] ASoC: dt-bindings: mediatek,mt8188-mt6359: use
 common sound card
Date: Mon, 31 Jul 2023 04:51:46 -0600
Message-ID-Hash: 72CK45JWLRFEI76EGIFVOKPB3YFB3RA4
X-Message-ID-Hash: 72CK45JWLRFEI76EGIFVOKPB3YFB3RA4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72CK45JWLRFEI76EGIFVOKPB3YFB3RA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:54 +0200, Krzysztof Kozlowski wrote:
> The mediatek,mt8188-mt6359 Linux sound machine driver requires the
> "model" property, so binding was incomplete.  Reference the common sound
> card properties to fix that which also allows to remove duplicated
> property definitions.  Leave the relevant parts of "audio-routing"
> description.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/mediatek,mt8188-mt6359.yaml  | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.example.dtb: sound: False schema does not allow {'compatible': ['mediatek,mt8188-mt6359-evb'], 'model': ['MT6359-EVB'], 'mediatek,platform': [[4294967295]], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295]], 'audio-routing': ['Headphone', 'Headphone L', 'Headphone', 'Headphone R', 'AIN1', 'Headset Mic'], 'dai-link-0': {'link-name': ['ETDM3_OUT_BE'], 'dai-format': ['i2s'], 'mediatek,clk-provider': ['cpu'], 'codec': {'sound-dai': [[4294967295]]}}, '$nodename': ['sound']}
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.example.dtb: sound: Unevaluated properties are not allowed ('model' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt8188-mt6359.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230731094303.185067-4-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

