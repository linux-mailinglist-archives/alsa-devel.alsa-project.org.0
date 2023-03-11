Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FD6B5C53
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 14:41:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317AA163F;
	Sat, 11 Mar 2023 14:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317AA163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678542071;
	bh=A20PZyVAmJK65LVdmslRaAGn/ytdPCDbpkT/bWz6BsY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qnXxP1J9C/CtcDzZ0GnmUVc4nm0wZ+demU/tzqD9z+RPTenR/gs3aLaXaSXY6QZjv
	 b1IJho9CS8P0Mef5HMxwEjcyZ6uZboBTaSPblabmtfrD1tCFcOkm9fAaMZP0mZkld7
	 jXHtfvmHUGsT+TP8BMzR45i+ipODVk4UiBa8EERU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2129F80236;
	Sat, 11 Mar 2023 14:40:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A363F8042F; Sat, 11 Mar 2023 14:40:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20571F800C9
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 14:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20571F800C9
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-17711f56136so8996522fac.12
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Mar 2023 05:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678542011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl8BZOtinMndJA6yo9kH7m4T56Q9iqXbatouPywOBOI=;
        b=L/ti0c+dGrcyYDwP+s2MwLA/DrwfOy3TVleWO5s3DWJp21q/hM/rX4KB9r473Ixe7A
         B2MoEM4VF0bgggOg7PmG53aymXIDpxvU42R70CjbWiL6ufBLWduxbJiY9OOt//cdndjz
         ivFpSepVLaKXLEP5+ajE3QiQ336kKiCAKekfczZz6dl/MOgF/q6STIYG8T2hXegbQ/Kv
         TfP94CVUpQGxmaPsvHJAt4Ftc7DS+8IuUkUbN1JLA8BH7IDgZ7qICKJTLWHsXFoYkqX4
         vQPvzTwAtMxNyFw01iRu+Dbae7bmpXofPRXHMVx5hY3Tjvw+xKby7MHfvIEPwYW5Lzm1
         HO5w==
X-Gm-Message-State: AO0yUKW9rFtYHcaV0/xjVcBhKwZx03d2NPo7dhwV381M5AHivPZDu/Q3
	4XUcFff7z4RAAwZB4tEz4Q==
X-Google-Smtp-Source: 
 AK7set+0bP5QJ7JRrLq0ugfI9tM7uV4Py+NmxD1n437OiRnbpitOV2Eigxgvk7FPXOw8cnZiagylnA==
X-Received: by 2002:a05:6870:1f85:b0:16e:ac1:c644 with SMTP id
 go5-20020a0568701f8500b0016e0ac1c644mr2725591oac.21.1678542011376;
        Sat, 11 Mar 2023 05:40:11 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:ec2:d840:96d4:1bbf:55f])
        by smtp.gmail.com with ESMTPSA id
 k8-20020acaba08000000b0037d7f4eb7e8sm1086404oif.31.2023.03.11.05.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:40:10 -0800 (PST)
Received: (nullmailer pid 23618 invoked by uid 1000);
	Sat, 11 Mar 2023 13:40:08 -0000
Date: Sat, 11 Mar 2023 07:40:08 -0600
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH v3 11/28] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Message-ID: <20230311134008.GA20831-robh@kernel.org>
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-12-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308235751.495-12-quic_wcheng@quicinc.com>
Message-ID-Hash: M6QRK22VY2FKPKQ5SYQLZDZ7CZ4L2BSV
X-Message-ID-Hash: M6QRK22VY2FKPKQ5SYQLZDZ7CZ4L2BSV
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
 andersson@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6QRK22VY2FKPKQ5SYQLZDZ7CZ4L2BSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Mar 08, 2023 at 03:57:34PM -0800, Wesley Cheng wrote:
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
> index be36956af53b..4e2417191f93 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -359,6 +359,19 @@ properties:
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

Is this an XHCI or DWC3 feature? The former should be added to the XHCI 
binding.

> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 8
> +    default: 1
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:
