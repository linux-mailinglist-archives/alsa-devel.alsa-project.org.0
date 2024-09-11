Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9199750E2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 13:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 571297F8;
	Wed, 11 Sep 2024 13:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 571297F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726054440;
	bh=cM9An+lJrKf5fchTezFQIl5Mxbf04kjvGjWZErkcecY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vvUo1mWT8PRJ3oigiwHBhkoZhlf50KkZl/LO/vH5NOUBmMAP2cvxeBj8pV1u4cT/a
	 l7HlcZdugLH4r6b69oDKMSbtmeSITargT0hCP61ZFWOLSVAPwV+At0ddw5mF6yMfei
	 UKdVyHSl2aHqR8Hen1aG9RvyXZziMRbtdRJeSRLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44591F805A1; Wed, 11 Sep 2024 13:33:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF23F801F5;
	Wed, 11 Sep 2024 13:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CEF4F801F5; Wed, 11 Sep 2024 13:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98D60F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 13:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D60F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZzsPJIEY
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53659c8d688so707827e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 11 Sep 2024 04:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726054402; x=1726659202;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0GzAnTjhxYZKHt72GpqMtlHwxT7ETsaEqcjwqFxbdI=;
        b=ZzsPJIEY0pJQ3DRCVNwVMoe74Hc66RUey3x2ysNXowoz5+SBb9hb0HDi7VojLzSG47
         KuWbEHaveMmCXqF2SWzofcTpYqPTEeGofMlD/LeUMMwUMLGPkp5/EWmcLiHt2+Zwjik1
         QiCg/SRO7EesXQiqwSuo38OUtHvRKPmkqKzvws/sdmbdVXzX+L2uROywYKeIOhen/ehs
         zfvyjLSaLSE+AH/CceH+XGtrlEHLfKWDZan5Duv9HEqBjGxGtwxAucTK69y19kEpZy0P
         x4zs++xjs4MLFqR6A54ElG26NNeqExgEkPK2q5qYrSz7ir8U5p+dfgbFQJvLLtpgCZMx
         Y/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726054402; x=1726659202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0GzAnTjhxYZKHt72GpqMtlHwxT7ETsaEqcjwqFxbdI=;
        b=bq9/VtXqXu94syVmmR5SRe5B5NXGB/NiLVwEW9Q6V7j3+jRd9No+m56SNgTpkubLFK
         nqXmnnJZB7gwLGMPYMCW7RJAoSf3uTooB6XRh8Pf5ba2uKunlQIKKGaOqKFUS6KYKFgP
         EEdw6khYtTS3Ahjo+N0Q9bFK6W8mGY7FwUveABBDfcW4SWXGbeiMeskx39N0v6vZmCnS
         2sk8CU9pxZQzNSiYGFmBmG9CS/y4jsiumsTMTQ8GBUE+39gjO0KpTh5VhUJiPkCu6TWl
         wJn/WqXcYRBCMXGTf4Sz43j1XS1goBxbZsNRZE8/nm4VlDohLG3GBmJORqi9kd5FMIzo
         sBlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz75vdX94nlTQk2HPodsb8xSfKHCGGBVN+AAKpqVomw1YLBD/IUxOARnIYSSV/xky56L1mH1teaLGN@alsa-project.org
X-Gm-Message-State: AOJu0YwaAlFgZQNyucBpYKw+lYwpn1sOpe0oxXDX07I59CzdTgDir63I
	ifmymxJwakkmov4zUN2a6d8azlfzMejHmLMMJqygRmGIMh7NHwxd/QFs1Rl4RMo=
X-Google-Smtp-Source: 
 AGHT+IGJTJ4gfvXWiLZYGJnjq1U6O/nKro6eMFZ5KwjhG3ZDqLoxi5tKw42KVzSzIJdS3EXUUs0o+g==
X-Received: by 2002:a05:6512:2250:b0:52f:cf2d:a1a0 with SMTP id
 2adb3069b0e04-5366bb48a71mr2373288e87.26.1726054402046;
        Wed, 11 Sep 2024 04:33:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8cad44sm1548242e87.150.2024.09.11.04.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 04:33:21 -0700 (PDT)
Date: Wed, 11 Sep 2024 14:33:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com,
	kernel@quicinc.com, quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: wcd938x-sdw: Add static
 channel mapping support
Message-ID: <iv2ajlr4qe7lcfwd7vwqsghxprpqz6r2nrvgmqmg6ryscgslqs@zb5nsyavuzej>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <20240909105547.2691015-2-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-2-quic_mohs@quicinc.com>
Message-ID-Hash: 7G2TSWFCZW3GLFL3OPY5BTPQZ4YD3KLB
X-Message-ID-Hash: 7G2TSWFCZW3GLFL3OPY5BTPQZ4YD3KLB
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7G2TSWFCZW3GLFL3OPY5BTPQZ4YD3KLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 09, 2024 at 04:25:44PM GMT, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave rx/tx ports.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> index d3cf8f59cb23..1db3c001ce98 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
> @@ -58,6 +58,30 @@ properties:
>      items:
>        enum: [1, 2, 3, 4, 5]
>  
> +  qcom,tx-channel-mapping:
> +    description: |
> +      Specifies static channel mapping between slave and master tx port
> +      channels.
> +      In the order of slave port channels which is adc1, adc2, adc3, adc4,
> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 8
> +    maxItems: 13
> +    items:
> +      enum: [1, 2, 4, 8]
> +
> +  qcom,rx-channel-mapping:
> +    description: |
> +      Specifies static channels mapping between slave and master rx port
> +      channels.
> +      In the order of slave port channels, which is
> +      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 8
> +    maxItems: 8
> +    items:
> +      enum: [1, 2, 4, 8]

Can we please use sensible strings instead of a randomly-looking numbers?

> +
>  required:
>    - compatible
>    - reg
> @@ -74,6 +98,8 @@ examples:
>              compatible = "sdw20217010a00";
>              reg = <0 4>;
>              qcom,rx-port-mapping = <1 2 3 4 5>;
> +            qcom,rx-channel-mapping =  /bits/ 8 <0x01 0x02 0x01 0x01 0x02
> +                                                 0x01 0x01 0x02>;
>          };
>      };
>  
> @@ -85,6 +111,8 @@ examples:
>              compatible = "sdw20217010a00";
>              reg = <0 3>;
>              qcom,tx-port-mapping = <2 2 3 4>;
> +            qcom,tx-channel-mapping = /bits/ 8 <0x01 0x02 0x01 0x01 0x02 0x04
> +                                                0x04 0x08 0x01 0x02 0x04 0x8>;
>          };
>      };
>  
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
