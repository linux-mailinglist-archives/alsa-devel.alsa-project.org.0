Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5B7B2225
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 18:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D586EAE9;
	Thu, 28 Sep 2023 18:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D586EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695918049;
	bh=mw3dCL34p/b/T6NWnBreYmODuNtO2bUmbCul5IYJSkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Km4K8SAGMEaly6MVh5SJPCO5DPtJQOYxDQZZoOvyhlFlZ36CcFS3ASOh2BTwVPoE+
	 yOX05Z633rKVC0NUBtxn/PzFbh9EPRcmDVBDJujMGq9ARcHs4mJjLpkh0/USndc7kh
	 vKObla2zzX4+jEV+gd2jGQInon+iThqg850YRQxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F521F8047D; Thu, 28 Sep 2023 18:19:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F05F8016A;
	Thu, 28 Sep 2023 18:19:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0912DF801D5; Thu, 28 Sep 2023 18:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A4AAF800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 18:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A4AAF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lKNi11Ad
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07E3D61BC5;
	Thu, 28 Sep 2023 16:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C59C433C8;
	Thu, 28 Sep 2023 16:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695917973;
	bh=mw3dCL34p/b/T6NWnBreYmODuNtO2bUmbCul5IYJSkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKNi11AdR30o0vP7v+IqY9BF+c+bXg21PvtUJyg0ZXvRYfSTJmIZlNo0YQNfBpqyt
	 R/2OIMD3hx1+8VdppRQc9sdDWqFr18cwB1UweQpBr05RMw6GD4AZarq4N1zQCoqQ9a
	 4ZeMozVxmn6InZKdI4XXdo2pp7VM5S5nbBFpZOPR9pDnONIR/vNX+p/0ZiZ3cWj1a+
	 CBNL/N6xRacq5uLDFogMRIw87JDEHcU7/Z0EKG1yEotyeInQvlG/nunING72HvGO2P
	 VWHNKdjn/bWWfFyLMotPOhoACTycIdPq+jYq7tDMdYxi2ObUhJubIpvu+S9qsfoAC+
	 dC7XjVaANSEXg==
Received: (nullmailer pid 745205 invoked by uid 1000);
	Thu, 28 Sep 2023 16:19:31 -0000
Date: Thu, 28 Sep 2023 11:19:31 -0500
From: Rob Herring <robh@kernel.org>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: rt5616: Convert to dtschema
Message-ID: <20230928161931.GA713974-robh@kernel.org>
References: <20230925165715.34883-1-bragathemanick0908@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925165715.34883-1-bragathemanick0908@gmail.com>
Message-ID-Hash: PA45WQXQQVJPGH3YOPDAUWBNMKTTA7TX
X-Message-ID-Hash: PA45WQXQQVJPGH3YOPDAUWBNMKTTA7TX
X-MailFrom: SRS0=w7AI=FM=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PA45WQXQQVJPGH3YOPDAUWBNMKTTA7TX/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 25, 2023 at 10:27:15PM +0530, Bragatheswaran Manickavel wrote:
> Convert the rt5616 audio CODEC bindings to DT schema

> No error/warning seen when running make dt_binding_check

No need to say that. That's the assumption and it should never get 
applied if not.

> 
> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
> ---
>  .../bindings/sound/realtek,rt5616.yaml        | 53 +++++++++++++++++++
>  .../devicetree/bindings/sound/rt5616.txt      | 32 -----------
>  2 files changed, 53 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
> new file mode 100644
> index 000000000000..00ff9b4e3c7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek rt5616 ALSA SoC audio codec driver
> +
> +description: |
> +  Pins on the device (for linking into audio routes) for RT5616:
> +
> +      * IN1P
> +      * IN2P
> +      * IN2N
> +      * LOUTL
> +      * LOUTR
> +      * HPOL
> +      * HPOR
> +
> +maintainers:
> +  - Bard Liao <bardliao@realtek.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: realtek,rt5616
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'

This was not in the original doc. Was that an error? If so, just state 
that in the commit msg.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;

blank line

> +        codec@1b {

audio-codec@1b

> +            compatible = "realtek,rt5616";
> +            reg = <0x1b>;
> +            #sound-dai-cells = <0>;
> +        };
> +    };
