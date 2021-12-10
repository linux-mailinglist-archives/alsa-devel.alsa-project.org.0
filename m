Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C44705C3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 17:31:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF5120C7;
	Fri, 10 Dec 2021 17:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF5120C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639153865;
	bh=F25tk6LC9Q2F6QmZS81dv7AZROYjqrE7MmVLMsst1MI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obz1y6gWwzzqIbkLT1J5hEkw7Bc71/rAMjqAn56q7qwOE0YKl6+Ci+Tp7IvD+o0D2
	 epmcsjnKGnhehhnzaiUzegFD1KG6TW7AuPbp8RltbkyMCWj03YhlKm91VCJ6K/iRTE
	 SouiCmmMxgg7hmVj79uhRU6VC0M5tBWJb/S98Yuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D437F804FF;
	Fri, 10 Dec 2021 17:29:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48BC4F804F3; Fri, 10 Dec 2021 17:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA581F8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 17:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA581F8028D
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="219063152"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="219063152"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 08:29:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="612974184"
Received: from lclopezf-mobl.amr.corp.intel.com (HELO [10.209.164.172])
 ([10.209.164.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 08:29:15 -0800
Subject: Re: [PATCH 2/2] ASoC: convert Everest ES8156 binding to yaml
To: Shumin Chen <chenshumin86@sina.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org
References: <20211210151041.108751-1-chenshumin86@sina.com>
 <20211210151041.108751-3-chenshumin86@sina.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4c665ce2-1df3-5fc3-018a-e8eff49794a2@linux.intel.com>
Date: Fri, 10 Dec 2021 10:29:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211210151041.108751-3-chenshumin86@sina.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
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



On 12/10/21 9:10 AM, Shumin Chen wrote:
> This patch converts Everest Semiconductor ES8156 low power audio
> CODEC binding to DT schema.

this doesn't really convert anything but *adds* properties for ES8156.

You're probably missing the device tree folks, added Rob + device tree
mailing list in CC:

> 
> Signed-off-by: Shumin Chen <chenshumin86@sina.com>
> ---
>  .../bindings/sound/everest,es8156.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8156.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8156.yaml b/Documentation/devicetree/bindings/sound/everest,es8156.yaml
> new file mode 100644
> index 000000000000..695d542013c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8156.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/everest,es8156.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Everest ES8156 audio CODEC
> +
> +maintainers:
> +  - Shumin Chen <chenshumin86@sina.com>
> +
> +properties:
> +  compatible:
> +    const: everest,es8156
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      es8156: codec@8 {
> +        compatible = "everest,es8156";
> +        reg = <0x11>;
> +        clocks = <&clks 10>;
> +        clock-names = "mclk";
> +        #sound-dai-cells = <0>;
> +      };
> +    };
> 
