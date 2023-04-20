Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDA6E9D52
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 22:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4BEEBB;
	Thu, 20 Apr 2023 22:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4BEEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682023124;
	bh=gsR8O8LzxFHvmYDlZVU/ZDg/r0HGQXlHr10x079IwBE=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vN7OK8/YhJGdyys/6BcqKHRPzAU/w/G8C5SPy9kYMyPPwQnbE+34OKHTDbTnOkJZY
	 g6rf23mkTYQuKdgwK58/V0eS+GnXKPUY4BdEgcLI07PaLLmi3SnNIA/Pq+cr1JBwW3
	 587cRYnp3a12KK+ky4IzbhTBzecsTqV0ccdnGKKM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F97F80149;
	Thu, 20 Apr 2023 22:37:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9776EF80155; Thu, 20 Apr 2023 22:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76F23F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 22:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F23F800F8
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-38e3a1a07c8so881033b6e.0
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 13:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682023062; x=1684615062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8FJdD4kjLm/hVjdcv73QbssVlPxYomGy/qXm+SYTd8=;
        b=RXQzZzf22+tgkFv2EfJkyJqA2tTRxwUP9ufTabJhvuJjeWxmWe1p4gNT1dQBau7mm8
         d4g6V7/WA64ZGkG1ZnWE3dWMfJdSsRgyx0L0YIEwyQavDla7bDHMbTIS/zrRlwi2YdwX
         DbdT+Rpls+hXIVIjofXpYb4yvFDDFeET8vZ24TBtq9xt3Azj77RkEX5bS3fV1U1iMGyu
         z9J1D8mZqLP1A6g0NoUV17mHVUn3MBI8wq/HjdeHZys+83UHny1HG/UqsMDpj6vKFoSm
         OwahTUWgtpYcrAhNTwzozzhFxgB14EV0WiH9oT6Sy/H7L6jpx4hU8bdjk0dRMxL+ldCk
         /IEw==
X-Gm-Message-State: AAQBX9faXxi7X6TI0mmKs+GA1R3GgkuLkuFK8MJLNyA+xM0SnfiAlnGe
	OZ44J95dHGHOn/YjVLtZLA==
X-Google-Smtp-Source: 
 AKy350bS7On3P2idz+6zujSpiV6+igakBQK6inZE10KuPexfzZrc6bXmNRnKOEAjYNpCXhI4DPhCIw==
X-Received: by 2002:aca:502:0:b0:38c:6997:ca18 with SMTP id
 2-20020aca0502000000b0038c6997ca18mr1525896oif.46.1682023062465;
        Thu, 20 Apr 2023 13:37:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 l83-20020acabb56000000b003646062e83bsm952774oif.29.2023.04.20.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 13:37:41 -0700 (PDT)
Received: (nullmailer pid 3459023 invoked by uid 1000);
	Thu, 20 Apr 2023 20:37:41 -0000
Date: Thu, 20 Apr 2023 15:37:41 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: qcom: Drop unneeded quotes
Message-ID: <168202301515.3458100.10435265872091186659.robh@kernel.org>
References: <20230327170205.4106310-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327170205.4106310-1-robh@kernel.org>
Message-ID-Hash: 2IPUB2MGAV5Q5ER3PM5HWIPMOELXLJXE
X-Message-ID-Hash: 2IPUB2MGAV5Q5ER3PM5HWIPMOELXLJXE
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>,
 Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IPUB2MGAV5Q5ER3PM5HWIPMOELXLJXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 27 Mar 2023 12:02:04 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml     | 4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml     | 4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml    | 4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml     | 4 ++--
>  Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml   | 2 +-
>  7 files changed, 13 insertions(+), 13 deletions(-)
> 

Applied, thanks!

