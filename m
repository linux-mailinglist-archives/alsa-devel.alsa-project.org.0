Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFD7615F3F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 10:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47454168B;
	Wed,  2 Nov 2022 10:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47454168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667380464;
	bh=yddB8YzbDqd9GZ4u8pL6Zol8d3iPlUtOe1y4r884crs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LvMwrBPXzZ+53vpfHarE9fc7KoED5RMbiCo9djLdk3O6mcyUHA1yXBH4H2Wli9dsd
	 Paw4ZCs7PRkigenJ7fOelv3RM0VelVnqTBzsM6PJeqTdCViD+FVYT9exSuF2IRv3Qa
	 gPRZREjk6KtGXN3Y+0szAP7sXGi6Y9F/d5Hi6eo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDFBEF801D5;
	Wed,  2 Nov 2022 10:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95CF4F8026D; Wed,  2 Nov 2022 10:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67676F80085;
 Wed,  2 Nov 2022 10:13:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67676F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="jhctdhIk"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 53B9766015E4;
 Wed,  2 Nov 2022 09:13:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667380398;
 bh=yddB8YzbDqd9GZ4u8pL6Zol8d3iPlUtOe1y4r884crs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jhctdhIkhVmddWdje6jcB76l5ca/7YUVPZs61kGwkJO/cVz37YWfDHEQSuK9YFGzC
 7+IT0gHZC3aBoS2M+/NwNHePwRSV5dGRhhUU90yrfC4KS4w9fDSQQ50dmgTCkMl3lX
 98yLtzUOTA8yZebHdWo2Q9qd72HMjMGAxkCA0Eg3wOEqB/RndIpxJsZJnlYMoCSAX8
 8/nShXz+TBvnTZ7/Niu8zrTcL60yviUi9+uCKQUTjHa5khNmLElHyy9Aw/fdZ2C4OL
 l8RY33ATCTYDNCf5XV5OnYtGNAxzxI+Db+Z1bgGSqoFosXFTR4jaHrd21u1C0hwgNv
 +yNPSVRrSEghg==
Message-ID: <1f0bb630-20b0-160e-a530-05fae7572b10@collabora.com>
Date: Wed, 2 Nov 2022 10:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 1/2] dt-bindings: dsp: mediatek: Add default clock
 sources for mt8186 dsp
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yaochun Hung <yc.hung@mediatek.com>
References: <20221101061137.25731-1-tinghan.shen@mediatek.com>
 <20221101061137.25731-2-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221101061137.25731-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Il 01/11/22 07:11, Tinghan Shen ha scritto:
> Add the default clock sources used by mt8186 dsp.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   .../devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> index 3e63f79890b4..4cc0634c876b 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
> @@ -35,11 +35,15 @@ properties:
>       items:
>         - description: mux for audio dsp clock
>         - description: mux for audio dsp local bus
> +      - description: default clock source for dsp local bus
> +      - description: default clock source for dsp core
>   
>     clock-names:
>       items:
>         - const: audiodsp
>         - const: adsp_bus
> +      - const: mainpll_d2_d2
> +      - const: clk26m
>   
>     power-domains:
>       maxItems: 1
> @@ -82,9 +86,11 @@ examples:
>                 <0x1068f000 0x1000>;
>           reg-names = "cfg", "sram", "sec", "bus";
>           clocks = <&topckgen CLK_TOP_AUDIODSP>,
> -                 <&topckgen CLK_TOP_ADSP_BUS>;
> -        clock-names = "audiodsp",
> -                      "adsp_bus";
> +                 <&topckgen CLK_TOP_ADSP_BUS>,
> +                 <&topckgen CLK_TOP_MAINPLL_D2_D2>,
> +                 <&clk26m>;
> +        clock-names = "audiodsp", "adsp_bus",
> +                      "mainpll_d2_d2", "clk26m";

You are assigning those clocks just to be able to call clk_set_parent() in
the DSP mt8186-clk driver... and that's not necessary, nor it is the best
way of doing what you're trying to.

In reality, you don't need to add new clocks and you don't need to manage
that into the driver, as you can simply assign clock parents in devicetree
... like:

assigned-clocks = <&topckgen CLK_TOP_AUDIODSP>, <&topckgen CLK_TOP_ADSP_BUS>;
assigned-clock-parents = <&clk26m>, <&topckgen CLK_TOP_MAINPLL_D2_D2>;

without any clk_set_parent() call in the driver.

When the driver will call clk_prepare_enable() for top_audiodsp and/or for
top_adsp_bus, the assigned parents' refcount will also be increased (and
if the parent clock is not enabled, the clk framework will enable it).

Regards,
Angelo

