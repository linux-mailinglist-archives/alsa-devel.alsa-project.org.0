Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A5978F1F2
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 19:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C8E74C;
	Thu, 31 Aug 2023 19:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C8E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693503031;
	bh=m2mFHdLb5akULhutA+xwBEH6Sa4t3tjPRJFFhXFkIsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=biYDkCbN/LKdCRybJbq5MRLEytgDKsQAaCziRfT0g245xadGw//N+r8QewWG19rna
	 MhxhZ7BQ6L0IVGtnZ+ElBfBCQPcOIAYBgo8h8+m/VGbfOkLghPZ9bWrrzRhvNKhuge
	 ujIWLegWPCjMVyThTPxZFXruDZsBWyMdVEOsN+P4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 369AAF80007; Thu, 31 Aug 2023 19:29:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB395F800F5;
	Thu, 31 Aug 2023 19:29:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D89B2F80155; Thu, 31 Aug 2023 19:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 180B0F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 19:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180B0F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ukG3XhOI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD2AE60F05;
	Thu, 31 Aug 2023 17:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86588C433C7;
	Thu, 31 Aug 2023 17:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693502967;
	bh=m2mFHdLb5akULhutA+xwBEH6Sa4t3tjPRJFFhXFkIsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ukG3XhOIQt4TGpxNwIxmrhlaWzF1CZZ7iz1KBcXUuA2SaM70aReb4BT2bjz/h6g6r
	 awNF6cgNx/eAZc+7kWZUmZD01zUzvnsUH+dyewPa21iYPySKUNx96GmfQ5xuDEWNVx
	 IRzlMTp3ux7LfwpXAcCXldy3Vfg6trqOZ54Y4huy2pEOW9IEEjadDpdPgeN2H9ekwd
	 ACeBzYusXVsxb+Gcj4uS/sULcH4GSPKswpPe946uV8dlPXnKJCi9ZUFxWsfAZ101Pg
	 4eUgPeU1eK2DOHKTFYGu0d523Uh3ViAJ3swl4KuF3PNbLwihcvsO8dnajpaRn7lPSy
	 H3iREe5wC4K4A==
Received: (nullmailer pid 2472105 invoked by uid 1000);
	Thu, 31 Aug 2023 17:29:24 -0000
Date: Thu, 31 Aug 2023 12:29:24 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Subject: Re: [PATCH v5 23/32] ASoC: dt-bindings: Add Q6USB backend
Message-ID: <20230831172924.GA2465731-robh@kernel.org>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
 <20230829210657.9904-24-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829210657.9904-24-quic_wcheng@quicinc.com>
Message-ID-Hash: WJARYQCBNXMG5TG7X2W4EPCLJL3ZWH2M
X-Message-ID-Hash: WJARYQCBNXMG5TG7X2W4EPCLJL3ZWH2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJARYQCBNXMG5TG7X2W4EPCLJL3ZWH2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 02:06:48PM -0700, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../bindings/sound/qcom,q6usb-dais.yaml       | 53 +++++++++++++++++++

filename should match the compatible.

>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> new file mode 100644
> index 000000000000..72254d7e70d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ASoC DPCM USB backend DAI
> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The USB port is a supported AFE path on the Q6 DSP.  This ASoC DPCM
> +  backend DAI will communicate the required settings to initialize the
> +  XHCI host controller properly for enabling the offloaded audio stream.
> +  Parameters defined under this node will carry settings, which will be
> +  passed along during the QMI stream enable request and configuration of
> +  the XHCI host controller.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6usb
> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.
> +    $ref: /schemas/types.yaml#/definitions/uint32

This is the range as num-hc-interrupters, right?

Perhaps this should also be uint16 and limited to 1024 (or 8).

But why does this need to be in DT? Can't the OS just pick one to 
assign? (the description should answer this)

> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dais {
> +      compatible = "qcom,q6usb";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };
