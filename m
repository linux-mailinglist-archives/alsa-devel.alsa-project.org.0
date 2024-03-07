Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC8875195
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 15:13:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26B25828;
	Thu,  7 Mar 2024 15:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26B25828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709820792;
	bh=nvbQsr5KjGsdgCRWMMm6N+qmKuGEbiis9IDBpCnfHWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OS/ifLXd8OTM1GA7Azhe5yBuMeLjJ+zZaalk9HeMBF0e99PBYVPe7ryy4PdqzRBHW
	 maxf3absqrPbqPUqOHwXA1KenPVrRlFV6TaHO3OHlDNNdqERLL5GP9x6rjUjtP8qNf
	 Jo/ZNzteC6AVRMT7nT0o8UYe3aOMMC3CTGC1AET8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A327F80579; Thu,  7 Mar 2024 15:12:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54297F805AB;
	Thu,  7 Mar 2024 15:12:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 057B8F8024E; Thu,  7 Mar 2024 15:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63200F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 15:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63200F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S6PAGLgF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0601A617B3;
	Thu,  7 Mar 2024 14:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76175C433F1;
	Thu,  7 Mar 2024 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709820750;
	bh=nvbQsr5KjGsdgCRWMMm6N+qmKuGEbiis9IDBpCnfHWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6PAGLgFEUhhVnJvxN9VBaasVy+W3B8NrblbXlXKVEObuLjkruTXouwbGYKa3GBI1
	 FJ0VlAfRtDaE5JJfuzJbej0DtmIINDKfOopCmms4fGTiC/gf6fd/jn9AmErabgyRXY
	 FVviSDnbtXKgXWetVHpzUBe50o7wsniQJz9BAQYTE+WY2iRACaHPqdA1U+p0TB3wxg
	 YTvrigZ9SNzD5itbbaw+okGwNGH2+NKjg5sDuxqthcxBh15/V4ZzX2uw4qnOWuTKIk
	 SiKQ8QZhMO+HiFSChgY86lRoZwtKUikxUNyToLVHB2q6z69CISeHTkAhft9xoZX2ww
	 NWn67JxkycS6g==
Date: Thu, 7 Mar 2024 08:12:28 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 19/22] ASoC: dt-bindings: mt8192: Document
 audio-routing and dai-link subnode
Message-ID: <20240307141228.GA2491015-robh@kernel.org>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
 <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240307114445.196981-20-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: OVX75UY6DUEVIVNK2UTJBVYN7OUCNOA5
X-Message-ID-Hash: OVX75UY6DUEVIVNK2UTJBVYN7OUCNOA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVX75UY6DUEVIVNK2UTJBVYN7OUCNOA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 07, 2024 at 12:44:42PM +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 

I replied on v1, but one more thing here.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 124 ++++++++++++++++--
>  1 file changed, 115 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> index 7e50f5d65c8f..449454c50dcc 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -13,6 +13,9 @@ maintainers:
>  description:
>    This binding describes the MT8192 sound card.
>  
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -20,6 +23,14 @@ properties:
>        - mediatek,mt8192_mt6359_rt1015p_rt5682
>        - mediatek,mt8192_mt6359_rt1015p_rt5682s
>  
> +  audio-routing:
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +      Valid names could be the input or output widgets of audio components,
> +      power supplies, MicBias of codec and the software switch.
> +
>    mediatek,platform:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of MT8192 ASoC platform.
> @@ -27,10 +38,12 @@ properties:
>    mediatek,hdmi-codec:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of HDMI codec.
> +    deprecated: true

The deprecated keyword doesn't do anything at the moment, but my plan 
there is to add a mode to the tools which disables all deprecated 
properties. That will give you want you want in terms of disallowing 
these properties.

That would require dropping them from "required" which I'm fine with you 
doing. (Though technically that's still an ABI change)

Rob
