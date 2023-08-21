Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E177833D4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 22:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5C482C;
	Mon, 21 Aug 2023 22:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5C482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692650649;
	bh=P41CM/OE8qR2Gp1s+g6+GSL1DglIHghUvEzQuODVkmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ggKq/RgO5+uu9KcM1eLFpp0S/4DRL9wBXGt65XYnkwEWlp4t76zmuR8fVlfZIcgzr
	 EUPBd5xs1it3q/lZFaQMIqZEEd6TqZt6uEtLYvmzRMDkLUUJMpk1hw3J3442e7V79X
	 YdZ0nPU7cw/luPsFBvpxa/iKO80J3prtiV+jtwnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CF03F800BF; Mon, 21 Aug 2023 22:43:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9047DF8016C;
	Mon, 21 Aug 2023 22:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C25C4F80199; Mon, 21 Aug 2023 22:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AECEDF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 22:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AECEDF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UOml1bli
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 551E964B31;
	Mon, 21 Aug 2023 20:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0D4C433C8;
	Mon, 21 Aug 2023 20:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692650582;
	bh=P41CM/OE8qR2Gp1s+g6+GSL1DglIHghUvEzQuODVkmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UOml1bli7gpAXd/J8eSKV26mhi+K1Qkfswc3XkPFfbyVV5Ok3TQT7Z/JDWQop/uWz
	 iS+AzrUyvjliyoAd40oHLcUxTl3RVeshK/tZDCSBTTmjLjZFcbUTIelydTK+L0T5Bb
	 FnGg0AjSO+MjT4uimnJxVSXHlmf7jH81RZ2ftlfiGdC+6Gkq9RCuzblpSqczXAyY7+
	 qFazrV2lS835EOF2VaXPwPPwkGyt/0UVDM3uDcNL6gd3FN3KqTHJIdGvVMLudARvV2
	 rIavmg1onrMgqE+ej6mZc7Wwgp7yiXLGRsRhsWvWoohfvBlPZ9Svy2t977WWKD0mA/
	 8PLW6le92tJ8g==
Received: (nullmailer pid 2260072 invoked by uid 1000);
	Mon, 21 Aug 2023 20:42:58 -0000
Date: Mon, 21 Aug 2023 15:42:58 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas
 .petazzoni@bootlin.com>
Subject: Re: [PATCH v4 06/28] dt-bindings: net: Add support for QMC HDLC
Message-ID: <20230821204258.GA2253571-robh@kernel.org>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <817d1418fa1e9e689375177bee4bdc68ceeab7be.1692376361.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <817d1418fa1e9e689375177bee4bdc68ceeab7be.1692376361.git.christophe.leroy@csgroup.eu>
Message-ID-Hash: KVX2BWNFOUIM3CXR4B2IOELOPHHWOUFM
X-Message-ID-Hash: KVX2BWNFOUIM3CXR4B2IOELOPHHWOUFM
X-MailFrom: SRS0=A38r=EG=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVX2BWNFOUIM3CXR4B2IOELOPHHWOUFM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 18, 2023 at 06:39:00PM +0200, Christophe Leroy wrote:
> From: Herve Codina <herve.codina@bootlin.com>
> 
> The QMC (QUICC mutichannel controller) is a controller present in some
> PowerQUICC SoC such as MPC885.
> The QMC HDLC uses the QMC controller to transfer HDLC data.
> 
> Additionally, a framer can be connected to the QMC HDLC.
> If present, this framer is the interface between the TDM bus used by the
> QMC HDLC and the E1/T1 line.
> The QMC HDLC can use this framer to get information about the E1/T1 line
> and configure the E1/T1 line.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../devicetree/bindings/net/fsl,qmc-hdlc.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> new file mode 100644
> index 000000000000..13f3572f0feb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/fsl,qmc-hdlc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale/NXP QUICC Multichannel Controller (QMC) HDLC
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |

Don't need '|'

> +  The QMC HDLC uses a QMC (QUICC Multichannel Controller) channel to transfer
> +  HDLC data.
> +
> +properties:
> +  compatible:
> +    const: fsl,qmc-hdlc
> +
> +  fsl,qmc-chan:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to QMC node
> +          - description: Channel number
> +    description:
> +      Should be a phandle/number pair. The phandle to QMC node and the QMC
> +      channel to use.
> +
> +  framer:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the framer node

What's the framer? 

> +
> +required:
> +  - compatible
> +  - fsl,qmc-chan
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdlc {
> +        compatible = "fsl,qmc-hdlc";
> +        fsl,qmc-chan = <&qmc 16>;

Where does this node live? 

QMC is this[1]? Why don't you just add the compatible to channel@10 in 
the QMC node?

Rob

[1] Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
