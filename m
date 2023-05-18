Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555527088F8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 22:05:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56CFA1FE;
	Thu, 18 May 2023 22:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56CFA1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684440308;
	bh=5Cwrl8qfQUwlL/4Y2HNNh/JLjDgfYvj5/BvX1qUp3vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I0ujNRfmytg/VtZDuXuFwae/cmKuncG9p6FE40WZ2qrsd8kECQjz8XM6apSYb0aDj
	 PZAW0sb3w/0vxvU4P6S3fVRyj7ZDqVX2Oo1FKInAZHrVAGnsbMxoZG+V3036lDx8nC
	 CaMf+j/Ovp/pH5vlooByvY1mFsDfoNbALHKGthJs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC02BF80272; Thu, 18 May 2023 22:04:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F6D8F8025A;
	Thu, 18 May 2023 22:04:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E71F80272; Thu, 18 May 2023 22:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E313F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 22:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E313F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lULwo02j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 361C0651F0;
	Thu, 18 May 2023 20:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7651DC433EF;
	Thu, 18 May 2023 20:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684440243;
	bh=5Cwrl8qfQUwlL/4Y2HNNh/JLjDgfYvj5/BvX1qUp3vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lULwo02jjg6Q+XQ49XAielxqIkf12ZkVPnxekxZMQFxIyjeWy/ubinuxBGiywlo5U
	 wbDqXneLApdcxGsO2+lyyDU3pHrOBAm7FShubdOG4Ji+IGIiaNspz//sw5pK/SvVAm
	 8W2pOKfmSZrm1nh1jeHm7cnlL/lCX8G5FFCfPN9qCYkTFHvbUIRao/mww8SbBUxneP
	 7lvJAesnzvHVNe3C77/zCYBpEYT5TKDbB/+sFNdMOptFRQYQG4+1g+9sL375ynbnKZ
	 dOecIBFwjSCX7aAOTyU3lPV5F+zcf0sNnsdKAp6md8hxrhk7MsrfBWWMZxOf3IVamF
	 HPhYB1W1QswWg==
Date: Thu, 18 May 2023 21:03:58 +0100
From: Conor Dooley <conor@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Cc: broonie@kernel.org, support.opensource@diasemi.com,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	robh+dt@kernel.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Message-ID: <ZGaErqQ8lgtAofYB@spud>
References: <20230518091449.17984-1-David.Rau.opensource@dm.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518091449.17984-1-David.Rau.opensource@dm.renesas.com>
Message-ID-Hash: ZMXFAODX7TKY4BXUQM6OL6SJVP7XPQHJ
X-Message-ID-Hash: ZMXFAODX7TKY4BXUQM6OL6SJVP7XPQHJ
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMXFAODX7TKY4BXUQM6OL6SJVP7XPQHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 09:14:49 +0000, David Rau wrote:
> - Convert Dialog DA7219 bindings to DT schema format.
> - Add Jack insertion detection polarity selection.
> - Remove unused `dlg,ldo-lvl` parameter.
> 
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>
> ---
>  .../devicetree/bindings/sound/da7219.txt      | 112 --------
>  .../bindings/sound/dialog,da7219.yaml         | 240 ++++++++++++++++++
>  2 files changed, 240 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/da7219.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> 

(partially sending this to make sure that I can actually send these
things during Rob & Krzysztof's absence)

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1783077


da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb
	arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb
