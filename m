Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086D72DD0F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 10:52:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2805B826;
	Tue, 13 Jun 2023 10:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2805B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686646373;
	bh=Fs2TQdypARqaeonb0tIJpF45H+5ETzPPP/OhXKzKJfg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ie4vr2weKXv39Zf8JJKqUG02cvRZB0EMjmKTACnCmMNtYBqKAsUrG9YC2zKHxr8oI
	 ODeX+0fmfyweeLPv13a7x98NB3jD6fPq59LC3FCAY53u+yGze9FcD4xI3ifrkPcq98
	 fxfiVIRWA84cCS6oIY5D1sn30dKZMzc8UuUMW2sY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4747BF80155; Tue, 13 Jun 2023 10:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A66EDF80132;
	Tue, 13 Jun 2023 10:51:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 680C0F80149; Tue, 13 Jun 2023 10:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A92F0F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 10:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A92F0F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z1ugRPqQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5813A63311;
	Tue, 13 Jun 2023 08:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FCAC4339B;
	Tue, 13 Jun 2023 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686646307;
	bh=Fs2TQdypARqaeonb0tIJpF45H+5ETzPPP/OhXKzKJfg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z1ugRPqQAgG7q4ip7dzx+ov4MrcxTdMzqcxqT48GRQbzkZeiwjw0PnWb547BsIhcv
	 qCbTw0jLpG9oYZV8VzjskmU0ri0ZyMV0K+IBsnYJT4PaZpLclPb8hkk0RE4YuEzCRa
	 niRBpSMapLcUCNEJ0M1uILKbwJJcPi/XXBDrbU6ay/AzQdcM3kWFaICDDB3qJzDRcl
	 H4wA1GaRFxblgqutYYUKy4f0zhpbjB/9d2vA0twLy3PzOKJOLBJSxh6wieWtAiE2DF
	 aU+7NC2+1Q248T8bDA9uNefaicnxqhbcIkO7sLvcNRIlycjOebK6VGsWj0YaXFvQ3r
	 1aNYb0ahMjEAw==
Message-ID: <d9cd1ff3-b537-1481-9453-5b3683d30fed@kernel.org>
Date: Tue, 13 Jun 2023 10:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt79xx-afe: add audio afe
 document
Content-Language: en-US
To: Maso Hunag <maso.huang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Ren Zhijie <renzhijie2@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230612105250.15441-1-maso.huang@mediatek.com>
 <20230612105250.15441-8-maso.huang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230612105250.15441-8-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FJ57QOAIDO45PLFLK3PLISQFXFSZXVRR
X-Message-ID-Hash: FJ57QOAIDO45PLFLK3PLISQFXFSZXVRR
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJ57QOAIDO45PLFLK3PLISQFXFSZXVRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2023 12:52, Maso Hunag wrote:
> From: Maso Huang <maso.huang@mediatek.com>
> 
> Add mt79xx audio afe document.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt79xx-afe.yaml   | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
> new file mode 100644
> index 000000000000..11ef1cfdf49b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt79xx-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek AFE PCM controller for MT79xx

79XX sounds weird. Are you sure you are not using wildcards (which are
not allowed)?

> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: mediatek,mt79xx-afe
> +      - items:
> +          - enum:
> +              - mediatek,mt7981-afe
> +              - mediatek,mt7986-afe
> +              - mediatek,mt7988-afe
> +          - const: mediatek,mt79xx-afe

I already saw AFE, why it cannot be part of existing bindings?

This list is odd. 79xx, 7981? So it is wildcard?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    items:
> +      - description: audio bus clock
> +      - description: audio 26M clock
> +      - description: audio intbus clock
> +      - description: audio hopping clock
> +      - description: audio pll clock
> +      - description: mux for pcm_mck
> +      - description: audio i2s/pcm mck
> +
> +  clock-names:
> +    minItems: 5
> +    items:
> +      - const: aud_bus_ck
> +      - const: aud_26m_ck
> +      - const: aud_l_ck
> +      - const: aud_aud_ck
> +      - const: aud_eg2_ck
> +      - const: aud_sel
> +      - const: aud_i2s_m

Why this is variable?

> +
> +  assigned-clocks:
> +    minItems: 3
> +    maxItems: 4

Drop assigned-clocks

> +
> +  assigned-clock-parents:
> +    minItems: 3
> +    maxItems: 4

Drop



Best regards,
Krzysztof

