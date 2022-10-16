Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053985FFD95
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 08:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B9D7C46;
	Sun, 16 Oct 2022 08:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B9D7C46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665901843;
	bh=P3pIVBxCmXU8+rMjIycALUb0/bBv+wKrwtLZ1JmWc0I=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRp7LRuLhZJOr7/T0aSDSITpK5mz6JwSedSQgl7oVJ+Xl0s6g/1TqQz1YEnEURJFE
	 tNYeGUBMaWGePY3xMn5wpEete33k4Rgf5Gm53CGvLpXkIJTYHdv69lBeSxw5dVS93r
	 +HfcsfR2eKp37Rk1a1LjJjOU6Q6hKKST/YNSD0r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1735FF8027C;
	Sun, 16 Oct 2022 08:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BC9FF80271; Sun, 16 Oct 2022 08:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9467DF800E5
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 08:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9467DF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RiOtb6YP"
Received: by mail-lf1-x133.google.com with SMTP id bu25so13157934lfb.3
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 23:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=US9PhGD0EZ/GSYUx3MvJmwlkBhsahTraQEdhwHbepJY=;
 b=RiOtb6YPC3lun87HVx86jIDNEzI86+QPB2RZuA36gBxrO3xkRw2SFk2/B3Oynd276b
 eHuybi15OR6AXqmNbxVhb2+AdmRHXNv8yq6lcAk1Bv1Q5lzzl6Qe27a9qJcffOQhb6gA
 76N5ZygMOWs3Z4XNY0Zsk+OpgNKOX0ZVnEYXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=US9PhGD0EZ/GSYUx3MvJmwlkBhsahTraQEdhwHbepJY=;
 b=VdQnim01MzRDK2NeQVqpJxMEHqDOglqLzaXio4W3Xa1mJ8R+lY0rsu7BE8m34GZpo9
 nNpzrZN/i7g20hYbGuWOx3WIZZ1myBWwomHmo065bUyK9oYT6VkAK4S6cf7zbZz2Xn9B
 9vnYIRTD07PksIrUadnXqZo0Euj5Zsn1EdEsmh6s+hcTszRn2PTai0WSKWBLyezDUWbm
 lgkaGyF139RDqoBL3dhgaORHY08gLWs3esaAxk8n5/Anv7UwmjwOXZVDHSma62rTS3b9
 /JZZ+c9I/ew1JY2Bn+WzFZ4/JZ6vo+lF47tbw4oM20Fz8LTBfnEVJXG8c93VMf6vjJVQ
 dMxg==
X-Gm-Message-State: ACrzQf2mbnNhRjFL8kAvHEP3x0j/vMSLw2jf7x9n3ev+NWpNostttaFC
 XhfkIhHE2+M24KSB9w2yWbFPImMFgrwOJ/MHAG1jWQ==
X-Google-Smtp-Source: AMsMyM7JEnalmWw8BKPoMCAa9iPJIp+GXB9eMbLBi6x3Zoe2OwvznS0jEYt74uT23Zr3JdRCZPdr092kOj/xNqz+i4Q=
X-Received: by 2002:ac2:50d0:0:b0:4a2:3c86:a11f with SMTP id
 h16-20020ac250d0000000b004a23c86a11fmr1788074lfm.253.1665901777287; Sat, 15
 Oct 2022 23:29:37 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Oct 2022 23:29:36 -0700
MIME-Version: 1.0
In-Reply-To: <1665820441-617-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665820441-617-1-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sat, 15 Oct 2022 23:29:36 -0700
Message-ID: <CAE-0n51ikqx=cETrbqJYLpHKOyVJYFCGhELXo0ZyB7QmFXtZPg@mail.gmail.com>
Subject: Re: [RESEND] dt-bindings: soundwire: Convert text file to yaml format
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 alsa-devel@alsa-project.org, andersson@kernel.org, bgoswami@quicinc.com, 
 broonie@kernel.org, devicetree@vger.kernel.org, judyhsiao@chromium.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-10-15 00:54:01)
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> deleted file mode 100644
> index c85c257..0000000
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ /dev/null
> @@ -1,214 +0,0 @@
[...]
> -- interrupts:
> -       Usage: required
> -       Value type: <prop-encoded-array>
> -       Definition: should specify the SoundWire Controller core and optional
> -                   wake IRQ
> -
> -- interrupt-names:
> -       Usage: Optional
> -       Value type: boolean
> -       Value type: <stringlist>
> -       Definition: should be "core" for core and "wakeup" for wake interrupt.
> -
> -- wakeup-source:

This property is removed?

> -       Usage: Optional
> -       Value type: boolean
> -       Definition: should specify if SoundWire Controller is wake up capable.
> -
[...]
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
> new file mode 100644
> index 0000000..bf8f6c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soundwire/qcom,sdw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoundWire Controller
> +
> +maintainers:
[...]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
> +
> +    soundwire@3210000 {
> +        compatible = "qcom,soundwire-v1.6.0";
> +        reg = <0x03210000 0x2000>;
> +
> +        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&lpass_rx_macro>;
> +        clock-names = "iface";
> +
> +        qcom,din-ports = <0>;
> +        qcom,dout-ports = <5>;
> +
> +        resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
> +        reset-names = "swr_audio_cgcr";
> +
> +        qcom,ports-word-length =        /bits/ 8 <0x01 0x07 0x04 0xff 0xff>;
> +        qcom,ports-sinterval-low =      /bits/ 8 <0x03 0x3f 0x1f 0x03 0x03>;
> +        qcom,ports-offset1 =            /bits/ 8 <0x00 0x00 0x0b 0x01 0x01>;
> +        qcom,ports-offset2 =            /bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
> +        qcom,ports-lane-control =       /bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
> +        qcom,ports-block-pack-mode =    /bits/ 8 <0xff 0x00 0x01 0xff 0xff>;
> +        qcom,ports-hstart =             /bits/ 8 <0xff 0x03 0xff 0xff 0xff>;
> +        qcom,ports-hstop =              /bits/ 8 <0xff 0x06 0xff 0xff 0xff>;
> +        qcom,ports-block-group-count =  /bits/ 8 <0xff 0xff 0xff 0xff 0x00>;
> +
> +        #sound-dai-cells = <1>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        status = "disabled";

Please omit status from the example.
