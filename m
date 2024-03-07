Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA203875052
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 14:39:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9751E93A;
	Thu,  7 Mar 2024 14:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9751E93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709818782;
	bh=QOIq153Hh97YArqMO6ndMKTIDS/Bu4Z0Gow+bUdmicI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b6h6l4g8qi1yAtKFbhGhyCndf49r+WQ1zT5Vaym5SmBZ+v5DMRkUR0C6TwJH7BFJ4
	 LQT7zVq4wq8Pd36CLBjf6MeLjdfnqmoUOMsH77fpjl9s6uL+aUGcgMilDuy8CcyR5Y
	 9oKxp34TuGHbKVaGqSNVwmniEt2FvKTNOepTI53Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907A4F805AB; Thu,  7 Mar 2024 14:39:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62FB7F80580;
	Thu,  7 Mar 2024 14:39:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E80ACF802E8; Thu,  7 Mar 2024 14:39:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48CD2F8014B
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 14:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48CD2F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QYe5b9I6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA7FD617E0;
	Thu,  7 Mar 2024 13:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51378C433F1;
	Thu,  7 Mar 2024 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709818735;
	bh=QOIq153Hh97YArqMO6ndMKTIDS/Bu4Z0Gow+bUdmicI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QYe5b9I6O512SuBx+pMc36xCatZ7plD9jkJUTPdM4VE2w1M5NU5HSNzEqZaTjYzNz
	 e77JAePu4bGHeX3o00+lpqMwKsETLSKjothuTlX8EYemEkd4s+Pi7OTGwUU43XxaBv
	 I4PYhg2Ppz++WdTcqIofwVVpk0SU4aH32+ogjWV9suVuXfpHnCxGhoufySCTk2asG8
	 3cQFB7M06hoBzi/85bLoyh+TkHQPbfWIj9m2ZN/ESAZ9VRBF7JagoNwr+JKst21m5H
	 CrTr/cJtN3qzS9hMsWEF7hLz4ovLJM3lxu6bn/uE2oZBffBRy/wPBwy3W8JyxubY6r
	 QMsif1rAmhqgQ==
Date: Thu, 07 Mar 2024 07:38:54 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, eugen.hristev@collabora.com,
 devicetree@vger.kernel.org, nfraprado@collabora.com,
 claudiu.beznea@tuxon.dev, zhourui@huaqin.corp-partner.google.com,
 broonie@kernel.org, wenst@chromium.org, dianders@chromium.org,
 shane.chien@mediatek.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 allen-kh.cheng@mediatek.com, shraash@google.com, frank.li@vivo.com,
 maso.huang@mediatek.com, perex@perex.cz, jiaxin.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, u.kleine-koenig@pengutronix.de,
 alsa-devel@alsa-project.org, trevor.wu@mediatek.com,
 nicolas.ferre@microchip.com, linux-sound@vger.kernel.org,
 amergnat@baylibre.com, kernel@collabora.com, tiwai@suse.com,
 jarkko.nikula@bitmer.com, linux-arm-kernel@lists.infradead.org,
 kuninori.morimoto.gx@renesas.com,
 xiazhengqiao@huaqin.corp-partner.google.com, ckeepax@opensource.cirrus.com,
 alpernebiyasak@gmail.com, arnd@arndb.de, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
In-Reply-To: 
 <20240307114445.196981-21-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-21-angelogioacchino.delregno@collabora.com>
Message-Id: <170981873072.2495513.10220063572625307394.robh@kernel.org>
Subject: Re: [PATCH v2 20/22] ASoC: dt-bindings: mt8186: Document
 audio-routing and dai-link subnode
Message-ID-Hash: 3UDFDCKYOXHPRJ7DS334NWNOABUTHVW2
X-Message-ID-Hash: 3UDFDCKYOXHPRJ7DS334NWNOABUTHVW2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UDFDCKYOXHPRJ7DS334NWNOABUTHVW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 07 Mar 2024 12:44:43 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 112 ++++++++++++++++--
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 102 ++++++++++++++--
>  2 files changed, 199 insertions(+), 15 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dtb: mt8186-sound: 'model' does not match any of the regexes: '.*-dai-link$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240307114445.196981-21-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

