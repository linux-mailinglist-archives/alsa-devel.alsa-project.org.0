Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D363D611E9B
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Oct 2022 02:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 621C21DB;
	Sat, 29 Oct 2022 02:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 621C21DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667002051;
	bh=9mAs5jNV4WUCIWHIz12h6HYmxWFxyAyczC1Iz+15III=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AeC5ckJ72EU2xe4as9ajTYDcm0j9SRpnG3UWkKYBpzM35dYBevjfKPXVPk+ARFgOc
	 LHfSU4sQ+l4U05g0gtE+KqsIrQFD1I3wtXQJRTdbEMN6dvGmpkQlOxhHmqzE7BTK74
	 YRLO/X2S+eZs363zs76CYJMaJ54X9fvspcXccrf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D10BDF80095;
	Sat, 29 Oct 2022 02:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C98C5F8025A; Sat, 29 Oct 2022 02:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08827F80095
 for <alsa-devel@alsa-project.org>; Sat, 29 Oct 2022 02:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08827F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O4Jn5exJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFB7762B27;
 Sat, 29 Oct 2022 00:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6815CC433C1;
 Sat, 29 Oct 2022 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667001987;
 bh=9mAs5jNV4WUCIWHIz12h6HYmxWFxyAyczC1Iz+15III=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O4Jn5exJSC1oinHzGUVzKD6MQB97DxrY5kPQCT7jfJSvJEeaH+NW8VeyzSdCXkGfg
 nQsuxM5d3FLx+aVigLkvxDNRt+tTF4xkJlOy8KWJLzvWjBtRqqOjIhWjD4hWVzn2sA
 L/VBCQttsy+qON+gUPZ5CnhjD6kNMoK8A/5+f+1S0TugTv9pEaLx5G8aDz9u/jyN6p
 KtU8fV3gz2v5ovTbnuh7gvZz5eW5z+cu/0CIWWaSjDHLA/+hzzShWiDNzz39EH04Xj
 usoRuNEEb+VIwPgqxNotwSBEj6i97F2+QSR7HQRxJ16mHcGqibPuiIhslcWgtVYJve
 RQWDlgClnvANA==
Message-ID: <1cd3a240-886e-82cb-e821-74f82f1afec1@kernel.org>
Date: Fri, 28 Oct 2022 20:06:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20221021082719.18325-1-trevor.wu@mediatek.com>
 <20221021082719.18325-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221021082719.18325-11-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 21/10/2022 04:27, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> ---
>  .../bindings/sound/mt8188-afe-pcm.yaml        | 187 ++++++++++++++++++
>  1 file changed, 187 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml
> new file mode 100644
> index 000000000000..b2c548c31e4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-afe-pcm.yaml

Name matching compatible.


Best regards,
Krzysztof

