Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7876939E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:53:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA0211E3;
	Mon, 31 Jul 2023 12:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA0211E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800829;
	bh=QAkWF3SHnsBtMX+Ko7kFJ6YbmD7FaoUckCUKyXC97u0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FQZV7b56ewLZ/5v7IbLLY5JX5Ix2FYoWn5HOeEcNZcqCzGLs0PZe7aYFz6PdgSqpD
	 6cP7WLxQLhRW2sBP3pXbwOKsVo7qFKl29gyKcJaeSVM8iwFJWDH1qt3V7q26OS5Ua/
	 LwFgknFqMcBtPDFz/SWzVo5196bgjWpwBdA9nGAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98373F80558; Mon, 31 Jul 2023 12:52:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAAC7F80549;
	Mon, 31 Jul 2023 12:52:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E61EF801D5; Mon, 31 Jul 2023 12:52:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C4436F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4436F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hpXVnYnX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABF2B61014;
	Mon, 31 Jul 2023 10:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168ABC433C8;
	Mon, 31 Jul 2023 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800716;
	bh=QAkWF3SHnsBtMX+Ko7kFJ6YbmD7FaoUckCUKyXC97u0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hpXVnYnX+6E/aFEBKOCYbzMSgcyzja4VjDWQlZlezMtP7rYNcQFQDw1CU8C2YlHYt
	 8SVR6iJL2xv8AP+JPoYSPpJIRCan2WGl1ADUGS3K4IyNn8xxbtnn0q17Wk5PsECxtQ
	 KwHDeNLBVo3tN5XYxF8P5YfT40PHsucRECDFkvKWEYLCMviBafBnnVer55InpXM7+S
	 5NgVIzvP6CK1DM8Nw3mO6X2DtnUQGO9+lXHp2jJOL9I2iRqHYSZfCvyKDN7c3ijpSo
	 YQCSBhLhK2jqxdfe/ueKJldty3fgAV240ed/w2cmHDoxoIdgnJquaPAvKjFsi/PZhV
	 rBt1sJalcvIfA==
Received: (nullmailer pid 2405201 invoked by uid 1000);
	Mon, 31 Jul 2023 10:51:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Trevor Wu <trevor.wu@mediatek.com>, NXP Linux Team <linux-imx@nxp.com>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-mediatek@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Rao Mandadapu <srivasam@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Rohit kumar <quic_rohkumar@quicinc.com>, Shawn Guo <shawnguo@k
 ernel.org>, alsa-devel@alsa-project.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-8-krzysztof.kozlowski@linaro.org>
Message-Id: <169080070694.2405139.10757549014732819769.robh@kernel.org>
Subject: Re: [PATCH 07/12] ASoC: dt-bindings: samsung,tm2: use common sound
 card
Date: Mon, 31 Jul 2023 04:51:46 -0600
Message-ID-Hash: EAOIXWC4YUXK7QKKDW4IAOJAUHHOVWOU
X-Message-ID-Hash: EAOIXWC4YUXK7QKKDW4IAOJAUHHOVWOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAOIXWC4YUXK7QKKDW4IAOJAUHHOVWOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:58 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/samsung,tm2.yaml   | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,tm2.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,tm2.example.dtb: sound: False schema does not allow {'compatible': ['samsung,tm2-audio'], 'audio-codec': [[4294967295], [4294967295]], 'i2s-controller': [[4294967295, 0], [4294967295, 0]], 'audio-amplifier': [[4294967295]], 'mic-bias-gpios': [[4294967295, 2, 0]], 'model': ['wm5110'], 'audio-routing': ['HP', 'HPOUT1L', 'HP', 'HPOUT1R', 'SPK', 'SPKOUT', 'SPKOUT', 'HPOUT2L', 'SPKOUT', 'HPOUT2R', 'RCV', 'HPOUT3L', 'RCV', 'HPOUT3R'], '$nodename': ['sound']}
	from schema $id: http://devicetree.org/schemas/sound/samsung,tm2.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,tm2.example.dtb: sound: Unevaluated properties are not allowed ('audio-routing', 'model' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/samsung,tm2.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230731094303.185067-8-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

