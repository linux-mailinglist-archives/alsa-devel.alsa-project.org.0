Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7913763D95
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 19:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2A9844;
	Wed, 26 Jul 2023 19:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2A9844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690392067;
	bh=efegVLS2xrCv7gYTENHX0ser7GsusM7cYHZ9iIN3WP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eNmpsMH87cOC5FW7pQaKISY6bYgMb1L5hAJi8sfPVrG/p+i178C7YUFyaJxgNnE9S
	 LZ3TTfB245bWjFuBhlTd+AbRZgI2BwkECSbPHx7D16gPNmylMIxH/6xGVQ64fSH5et
	 /t0lg351pjZtIBL3iRMlD6nU78p2fPMQvjW7mVqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3714BF800D2; Wed, 26 Jul 2023 19:19:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B465CF80153;
	Wed, 26 Jul 2023 19:19:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F5CBF8019B; Wed, 26 Jul 2023 19:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2CE8F800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 19:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2CE8F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UFMC/66v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C91A261C12;
	Wed, 26 Jul 2023 17:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F78C433C8;
	Wed, 26 Jul 2023 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690391978;
	bh=efegVLS2xrCv7gYTENHX0ser7GsusM7cYHZ9iIN3WP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFMC/66vrykLxmuvfSwz5durhy5zwQjCCF/Q8MicmwmbzBD9vgxyOyFJgXlHtyLyd
	 KVzSJgJWm6WOc7yByCR7iylIiKi5ErzAYd0TqVZ95Fb4WWzWOA6J74hj9enuUA84Qh
	 2h2gLZVq5pFC2G6Y7wNjndQnL7psbNmFaFd2A03ThpvSS3GfnyXZL8F0rAgKx+d0s/
	 kezOuuTjSd4LJczr8KQJDXItyGidwx45qZC7wBA+CVlBvHK1AEI/2nJZlCLNrAKhF4
	 k8oOfOthqlO0H+eybNglKRkwjKwfiFmYgGZLs9gmH9bZam8E2xkBsE2cMh5EJ9gI1R
	 rNnH/WuOT9vqw==
Received: (nullmailer pid 1675716 invoked by uid 1000);
	Wed, 26 Jul 2023 17:19:34 -0000
Date: Wed, 26 Jul 2023 11:19:34 -0600
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, pierre-louis.bossart@linux.intel.com,
 oneukum@suse.com, albertccwang@google.com, o-takashi@sakamocchi.jp
Subject: Re: [PATCH v4 13/32] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Message-ID: <20230726171934.GA1654540-robh@kernel.org>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-14-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725023416.11205-14-quic_wcheng@quicinc.com>
Message-ID-Hash: 6ZL2Z3G7TK3LLGWE3ML3UKJEQ3EYU7RP
X-Message-ID-Hash: 6ZL2Z3G7TK3LLGWE3ML3UKJEQ3EYU7RP
X-MailFrom: SRS0=X1iT=DM=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZL2Z3G7TK3LLGWE3ML3UKJEQ3EYU7RP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 24, 2023 at 07:33:57PM -0700, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.

Why does this belong in DT? What 'uses' determines the value? Who wants 
to change this and when?

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/usb/snps,dwc3.yaml          | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 50edc4da780e..cc6012e922e0 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -376,6 +376,19 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  snps,num-hc-interrupters:
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
