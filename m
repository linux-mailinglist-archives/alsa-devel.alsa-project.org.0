Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292538A6E57
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 16:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3E611930;
	Tue, 16 Apr 2024 16:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3E611930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713278014;
	bh=wjp4bLJ0fT33224ygvnRP0tblkyuZ6Q22imNSXQ8bQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i2qd6zBKH0FkEjgKzCs0C1ayCbOtse6umWnmfbv1ocKTrJ9UUv1Zub5f4KKh5vQC5
	 pC9p0v0IcFGp7u7eOI4gm5tu+oz4Q7e/+orow+dhd2OnyLBdEPAwbGF8xE02g/k2i2
	 EcsJAsg3CucBE49HufC9DpkTesIs+B6W+zrztRYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D2BF80588; Tue, 16 Apr 2024 16:33:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC1BAF80423;
	Tue, 16 Apr 2024 16:33:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51B3AF8025A; Tue, 16 Apr 2024 16:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9DDEF80124
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 16:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9DDEF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ELC8O1hE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04BB661211;
	Tue, 16 Apr 2024 14:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D84C2BD11;
	Tue, 16 Apr 2024 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713277959;
	bh=wjp4bLJ0fT33224ygvnRP0tblkyuZ6Q22imNSXQ8bQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELC8O1hEoEIPM2E6gWK8WyW2OayVVZCojXc4wIgfrTIBqIGH3wx4xw0daVirJGf5z
	 BGi8uSFtsLKQoFWxjXtsWDqAYrvVpjT8GEnrxcmMzg0Ui4tZddBCzMy8LpZQJmd77Z
	 6BVJbyLGOVbhNTJv3p5gZru86qStIGA4RPaHrLj+TT2FqCBWnNGyXpuXI+vo+OwBV1
	 GqxSL+E3iIMyQJpwLWxQ0dD8NUvxelf4+yM4O92n9JUDULl4kIrncXMJxnBzokRHF0
	 glHQcUDstoGq2M+lbLMwi5cTBRxI0AfD0R+AsSAPhrWRi+7lg9ApXRPC+oxKBp9nki
	 r7YrNWAzZ09zQ==
Date: Tue, 16 Apr 2024 09:32:37 -0500
From: Rob Herring <robh@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v2 3/8] ASoC: dt-bindings: wcd937x-sdw: add bindings for
 wcd937x-sdw
Message-ID: <20240416143237.GA2250258-robh@kernel.org>
References: <20240416063600.309747-1-quic_mohs@quicinc.com>
 <20240416063600.309747-4-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416063600.309747-4-quic_mohs@quicinc.com>
Message-ID-Hash: EUST7ZTY6LYSAIYVWQ5FE2BQFRDUY74J
X-Message-ID-Hash: EUST7ZTY6LYSAIYVWQ5FE2BQFRDUY74J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUST7ZTY6LYSAIYVWQ5FE2BQFRDUY74J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 16, 2024 at 12:05:55PM +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices RX and
> TX respectively.
> This binding is for those slave devices on WCD9370/WCD9375.
> 
> Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> new file mode 100644
> index 000000000000..2b7358e266ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd937x-sdw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoundWire Slave devices on WCD9370
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |

Don't need '|' if no formatting.

> +  Qualcomm WCD9370 Codec is a standalone Hi-Fi audio codec IC.
> +  It has RX and TX Soundwire slave devices. This bindings is for the
> +  slave devices.
> +
> +properties:
> +  compatible:
> +    const: sdw20217010a00
> +
> +  reg:
> +    maxItems: 1
> +
> +  qcom,tx-port-mapping:
> +    description: |
> +      Specifies static port mapping between slave and master tx ports.
> +      In the order of slave port index.

Are there constraints on the values of the entries?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    maxItems: 4
> +
> +  qcom,rx-port-mapping:
> +    description: |
> +      Specifies static port mapping between slave and master rx ports.
> +      In the order of slave port index.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 5
> +    maxItems: 5
> +
> +required:
> +  - compatible
> +  - reg
> +  - qcom,port-mapping
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soundwire@3210000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03210000 0x2000>;
> +        wcd937x_rx: codec@0,4 {
> +            compatible = "sdw20217010a00";
> +            reg  = <0 4>;
> +            qcom,rx-port-mapping = <1 2 3 4 5>;
> +        };
> +    };
> +
> +    soundwire@3230000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03230000 0x2000>;
> +        wcd937x_tx: codec@0,3 {
> +            compatible = "sdw20217010a00";
> +            reg  = <0 3>;
> +            qcom,tx-port-mapping = <2 3 4 5>;
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
