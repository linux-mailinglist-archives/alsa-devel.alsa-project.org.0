Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E6978F1DE
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 19:25:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8D2203;
	Thu, 31 Aug 2023 19:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8D2203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693502715;
	bh=f6VrVQDrfPeeAwksl3Zn8beCh18icrc5Wwa0RFVNjYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aredVaHbaeD184y2Qx62M1tRwshyWuAZsMD9QTfz6EOQ8u1imOtH6uI2tWVRuLlXe
	 iZwRFoK/6zZlwC3VGJQkdun8Dko/4T4ZD3HYhZQeHIBDOuFkPvJesE5TbFCe3XHs8P
	 X6OwbA3E9OYiesSoi4CZbAUTxSfr4NXFdtjTy3EQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36513F80155; Thu, 31 Aug 2023 19:24:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F99F800F5;
	Thu, 31 Aug 2023 19:24:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E2BCF80155; Thu, 31 Aug 2023 19:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08813F80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 19:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08813F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h58iLyRf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9CCBBB8234C;
	Thu, 31 Aug 2023 17:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEB2C433C8;
	Thu, 31 Aug 2023 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693502656;
	bh=f6VrVQDrfPeeAwksl3Zn8beCh18icrc5Wwa0RFVNjYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h58iLyRfOxWnKlyFhKIgNrATw8bsjcvcfR24Rxegb/5Lg2uUjRGZpzj8FNdGUdoPe
	 u4ZZSmMk6W7xb7pLZOw88BAyUl7+fZwbRxaJjaQFZe3kLQ2Hc0qQQfoVfOxoqgAmOA
	 Qs+yM75jYN8JXyWuyaU4oQFwK/FrOXOfnKvAcr8k/h6aAvcTtuE+/FsGgPb8t2BPZQ
	 f2/+re0t/M2dsh44t3+Ai0cgGulKlbfLWGuHVz6EIKwnmHDa9o0iA9//LXuKVcxiIM
	 GFbQ7s+mNJeLGWIFEKZf5i5ZTF9pQlJH53FXjxlUS2XwIxUEdTMm6aMzuyOrKvjSzu
	 3EeIRp1latDbQ==
Received: (nullmailer pid 2465302 invoked by uid 1000);
	Thu, 31 Aug 2023 17:24:13 -0000
Date: Thu, 31 Aug 2023 12:24:13 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Subject: Re: [PATCH v5 13/32] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Message-ID: <20230831172413.GB2460067-robh@kernel.org>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-14-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829210657.9904-14-quic_wcheng@quicinc.com>
Message-ID-Hash: NUK3YOWYCP5VTDXSPTX4RG674FJOGPX6
X-Message-ID-Hash: NUK3YOWYCP5VTDXSPTX4RG674FJOGPX6
X-MailFrom: SRS0=wTfe=EQ=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUK3YOWYCP5VTDXSPTX4RG674FJOGPX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 02:06:38PM -0700, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index a696f23730d3..596762ef9b9f 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -376,6 +376,19 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  snps,num-hc-interrupters:

Why do you still have this when you defined a common property?

If you want to limit it here, just do: 

num-hc-interrupters:
  maximum: 8


> +    description:
> +      Defines the maximum number of XHCI host controller interrupters that can
> +      be supported.  The XHCI host controller has support to allocate multiple
> +      event rings, which can be assigned to different clients/users.  The DWC3
> +      controller has a maximum of 8 interrupters.  If this is not defined then
> +      the value will be defaulted to 1.  This parameter is used only when
> +      operating in host mode.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 8
> +    default: 1
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
