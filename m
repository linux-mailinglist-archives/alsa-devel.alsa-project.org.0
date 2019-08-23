Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC5B9B3A6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:43:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B12ED1685;
	Fri, 23 Aug 2019 17:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B12ED1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566575008;
	bh=EPVyDegZFjGvEYOCcZ5LvQ7qLbcvXA59gwI93g7CtOY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2ePyKaSokUR3oRc/ATYkK6RVk5aFxsbRHSUyArGVTTKU1sNPC9HqAOCRKsI+cS+i
	 MaGa0F6JaX3xuaA9YYeUZ1Rftb59O534f2IboQvBIcZTkrufCzlhMEGOb1Sdf2VgCI
	 W2QsVzasn1wu7BT2K7IWCI1h6Cr27nMhKha8khgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5569AF80322;
	Fri, 23 Aug 2019 17:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C04CEF80306; Fri, 23 Aug 2019 17:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84267F8014A
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84267F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 08:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="330762256"
Received: from sdkulkar-mobl.amr.corp.intel.com (HELO [10.254.94.219])
 ([10.254.94.219])
 by orsmga004.jf.intel.com with ESMTP; 23 Aug 2019 08:41:34 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 robh+dt@kernel.org, vkoul@kernel.org
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7da8aa89-2119-21d1-0e29-8894a8d40bf0@linux.intel.com>
Date: Fri, 23 Aug 2019 10:41:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822233759.12663-2-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v4 1/4] dt-bindings: soundwire: add
 slave bindings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/22/19 6:37 PM, Srinivas Kandagatla wrote:
> This patch adds bindings for Soundwire Slave devices that includes how
> SoundWire enumeration address and Link ID are used to represented in
> SoundWire slave device tree nodes.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   .../soundwire/soundwire-controller.yaml       | 75 +++++++++++++++++++
>   1 file changed, 75 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> new file mode 100644
> index 000000000000..91aa6c6d6266
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SoundWire Controller Generic Binding
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  SoundWire busses can be described with a node for the SoundWire controller
> +  device and a set of child nodes for each SoundWire slave on the bus.
> +
> +properties:
> +  $nodename:
> +    pattern: "^soundwire(@.*|-[0-9a-f])*$"
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +      pattern: "^sdw[0-9][0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"

So is this a 64-bit value, as in the MIPI spec, or is this part of the 
_ADR description?
I also don't get why the first item in in base10?


> +      description:
> +	  Is the textual representation of SoundWire Enumeration
> +	  address. compatible string should contain SoundWire Version ID,
> +	  Manufacturer ID, Part ID and Class ID in order and shall be in
> +	  lower-case hexadecimal with leading zeroes.
> +	  Valid sizes of these fields are
> +	  Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
> +	  and '0x2' represents SoundWire 1.1 and so on.
> +	  MFD is 4 nibbles
> +	  PID is 4 nibbles
> +	  CID is 2 nibbles
> +	  More Information on detail of encoding of these fields can be
> +	  found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
> +
> +      reg:
> +        maxItems: 1
> +        description:
> +          Instance ID and Link ID of SoundWire Device Address.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +examples:
> +  - |
> +    soundwire@c2d0000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        compatible = "qcom,soundwire-v1.5.0";
> +        reg = <0x0c2d0000 0x2000>;
> +
> +        speaker@1 {
> +            compatible = "sdw10217201000";
> +            reg = <1 0>;
> +        };
> +
> +        speaker@2 {
> +            compatible = "sdw10217201000";
> +            reg = <2 0>;
> +        };
> +    };
> +
> +...
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
