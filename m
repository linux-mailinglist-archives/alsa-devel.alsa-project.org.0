Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 944DA7693A7
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 12:54:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0998AEA;
	Mon, 31 Jul 2023 12:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0998AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690800857;
	bh=zklj+NhkWCT4FbW/jvZlxxuVZ9VJzpk2ZRkNZ1w1vow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dewbD67/d8I3hJ5OQrj/YLxWfcq6fnx3wAlN8O+TwvWoWHPAaIo3I2be/OXoV8qrd
	 d9s1e0SdBt9Pcgsbqtn+bele++tVZ9AM7U5829d764sZs28BUDUCbhuTvmFFRkmIrX
	 6A7FKpPq+PggF8nOjq7kSOULfws1WQkUy7iS659o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 716DEF80552; Mon, 31 Jul 2023 12:53:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0924BF80163;
	Mon, 31 Jul 2023 12:53:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B9C4F801D5; Mon, 31 Jul 2023 12:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEE83F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 12:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE83F80163
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d8Rsm09e
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A173B60FFF;
	Mon, 31 Jul 2023 10:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F254AC433C7;
	Mon, 31 Jul 2023 10:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690800713;
	bh=zklj+NhkWCT4FbW/jvZlxxuVZ9VJzpk2ZRkNZ1w1vow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d8Rsm09eQYFpvwm/9CcrbSiHlAOvjMVXC9E5yHlwvD5+lsz55c3hJlV8A8YzlHUfW
	 +qeXqROXUOq38PTIzPZlbqrHbI6Y63mtFl/isdHnkh6gQ5VlG5MQgUihEw2L5xR1wU
	 J2zVLXHQe6FAiEmFN6psUgzZ8Zz36vgOxX1ccgrfwDOB4BTb5R15TxBf9SDc73zY7y
	 wDfRboqkCFMRBDzT/2em9/pxaIGT1yoNkd9bYsBzLsJgGIcmO+GFAsysluEhldGS+D
	 O/zVfX2fDqOjS/HoP9KxU4bkAPxpxWOJ+8W/EpHBi8N2MC6TCogccKXEH8I1yMEFWP
	 rEMhxzPlDd16w==
Received: (nullmailer pid 2405195 invoked by uid 1000);
	Mon, 31 Jul 2023 10:51:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jonathan Bakker <xc-racer2@live.ca>,
 linux-kernel@vger.kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Trevor Wu <trevor.wu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Rao Mandadapu <srivasam@codeaurora.org>,
 devicetree@vger.kernel.org, Rohit kumar <quic_rohkumar@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>,
 Judy Hsiao <judyhsiao@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@ke
 rnel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20230731094303.185067-5-krzysztof.kozlowski@linaro.org>
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-5-krzysztof.kozlowski@linaro.org>
Message-Id: <169080070205.2405020.10469672960396866749.robh@kernel.org>
Subject: Re: [PATCH 04/12] ASoC: dt-bindings: samsung,aries-wm8994: use
 common sound card
Date: Mon, 31 Jul 2023 04:51:46 -0600
Message-ID-Hash: OUBBM4ADWKFCWXBQ3ZTWJTCLMAOFYR7V
X-Message-ID-Hash: OUBBM4ADWKFCWXBQ3ZTWJTCLMAOFYR7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUBBM4ADWKFCWXBQ3ZTWJTCLMAOFYR7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 11:42:55 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/samsung,aries-wm8994.yaml     | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/sound-card-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.example.dtb: sound: False schema does not allow {'compatible': ['samsung,fascinate4g-wm8994'], 'model': ['Fascinate4G'], 'extcon': [[4294967295]], 'main-micbias-supply': [[4294967295]], 'headset-micbias-supply': [[4294967295]], 'earpath-sel-gpios': [[4294967295, 6, 0]], 'io-channels': [[4294967295, 3]], 'io-channel-names': ['headset-detect'], 'headset-detect-gpios': [[4294967295, 6, 0]], 'headset-key-gpios': [[4294967295, 6, 0]], 'audio-routing': ['HP', 'HPOUT1L', 'HP', 'HPOUT1R', 'SPK', 'SPKOUTLN', 'SPK', 'SPKOUTLP', 'RCV', 'HPOUT2N', 'RCV', 'HPOUT2P', 'LINE', 'LINEOUT2N', 'LINE', 'LINEOUT2P', 'IN1LP', 'Main Mic', 'IN1LN', 'Main Mic', 'IN1RP', 'Headset Mic', 'IN1RN', 'Headset Mic'], 'pinctrl-names': ['default'], 'pinctrl-0': [[4294967295, 4294967295]], 'cpu': {'sound-dai': [[4294967295], [4294967295]]}, 'codec': {'sound-dai': [[4294967295]]}, '$nodename': ['sound']}
	from schema $id: http://devicetree.org/schemas/sound/samsung,aries-wm8994.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.example.dtb: sound: Unevaluated properties are not allowed ('audio-routing', 'model' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/samsung,aries-wm8994.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230731094303.185067-5-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

