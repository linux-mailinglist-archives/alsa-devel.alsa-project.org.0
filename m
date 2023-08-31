Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5D778F1D1
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 19:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196E2208;
	Thu, 31 Aug 2023 19:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196E2208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693502610;
	bh=9QZWhRpHtmTV0U3uh7AIY6EM/VgorWxSrPGP3GaH8OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JqdUnsh37auyy/L+dHTGudn6xGCWYVzo9HSiQCl4dHMyXQBzwX/Y3+OV2pJYu+VCf
	 ybx7Kw/WDNFFQ0b8M0+F/i/CpaGe/bgriege/dF3x+FO6htxq68EczgFMzhuMbgQaO
	 /HmTIe+Xw/YuPdpl9U17nR4H/z7IclwpPkZsAhrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90127F800D1; Thu, 31 Aug 2023 19:22:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F868F800F5;
	Thu, 31 Aug 2023 19:22:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5728DF80155; Thu, 31 Aug 2023 19:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3064FF800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 19:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3064FF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S6dhHsvx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0C187CE216D;
	Thu, 31 Aug 2023 17:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815BCC433C7;
	Thu, 31 Aug 2023 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693502543;
	bh=9QZWhRpHtmTV0U3uh7AIY6EM/VgorWxSrPGP3GaH8OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6dhHsvxfBZdOrh3VnpluRK0lSG0ekQysNnLCg4ejHOvsj2DCJ8hk6xyELYX0LN3d
	 SSryDDvpob1QCFMKSBF0k0t5IYPFy6rnxFPfN42IIUyrZHu8uR+J+65xHeqXkdKqAj
	 VdAeLA1M7wNMe9T259WglI7c3JOBBrH9Fbp3ghAlj4RO9YJZv10SFxdhxdARC+FsXx
	 YUIKVlQzd61pzjhYMI8Hf64kDbrKqaIS+VXyn3I23LfmyDCNAZx6TpGfGR1o5RU0Dl
	 AcuNVrp7w/Td+9SASyRZk7b0xpuxbKh7xgnQn05z4Z5hhe6ow/+j6vOIqZwTMA7yVx
	 Sv0P6DzTGQIQw==
Received: (nullmailer pid 2462698 invoked by uid 1000);
	Thu, 31 Aug 2023 17:22:20 -0000
Date: Thu, 31 Aug 2023 12:22:20 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Subject: Re: [PATCH v5 14/32] dt-bindings: usb: xhci: Add num-hc-interrupters
 definition
Message-ID: <20230831172220.GA2460067-robh@kernel.org>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-15-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829210657.9904-15-quic_wcheng@quicinc.com>
Message-ID-Hash: ZBFXV4MKETDPMVX55YJREH3BU4OMZC6U
X-Message-ID-Hash: ZBFXV4MKETDPMVX55YJREH3BU4OMZC6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBFXV4MKETDPMVX55YJREH3BU4OMZC6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 02:06:39PM -0700, Wesley Cheng wrote:
> Add the definition for how many interrupts the XHCI host controller should
> allocate.  XHCI can potentially support up to 1024 interrupters, which
> implementations may want to limit.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 180a261c3e8f..2c05757cef01 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -29,6 +29,10 @@ properties:
>      description: Interrupt moderation interval
>      default: 5000
>  
> +  num-hc-interrupters:
> +    description: Maximum number of interrupters to allocate
> +    $ref: /schemas/types.yaml#/definitions/uint16

minimum: 1
maximum: 1024

> +
>  additionalProperties: true
>  
>  examples:
