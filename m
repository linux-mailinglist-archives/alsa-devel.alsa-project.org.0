Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A1C67394C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54CD3363C;
	Thu, 19 Jan 2023 14:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54CD3363C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674133408;
	bh=tzX/okoLuwqBfgJ33YkysTkBXEsiUd7MvUBe13Sq+a0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HykhQoxaqc+/WDeganLhdhXHI6FWNiEW3hH7EjoOQPlWZpkADg/ZIVKyPHken1+/f
	 TNT47mpbLpK3NC+aWI7Q0Z02C4SStpnkUdvwfzTlzNXJFoWLkh6Ut0J5C/7cwr84Y2
	 5cGZXOHlRWECuZX2LN+XJ7Jbwzm6Kk/OzyHXS8CM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF87F80083;
	Thu, 19 Jan 2023 14:02:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 283C2F8047B; Thu, 19 Jan 2023 14:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
 version=3.4.6
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 291FAF80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291FAF80083
Received: by mail-ot1-f50.google.com with SMTP id
 n24-20020a0568301e9800b006865671a9d5so1157129otr.6
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 05:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qEzWKNVhTxhmNjpAWCuBDyNcXgW4w9tcJfOj8LQ7RrY=;
 b=kGnekq5NGjgS5fTJKHEV6px3EK06mEJA2tg6Z3DyvNmQCuzQQrdn+Oqh3tuEjBFt1D
 jAyvhk+IM77uMSlJFKWxNl5GYhwWcT5tSr7PoRsikG3MbRWnXSa6sH4iULBhgmBS5z9+
 fAxF7qrh9ZZQhQHHeqyxGfVsKrbAWV5qHZl/wibfBbMJWZihpX4rQ4sV+J+fmxb1vyVx
 1KrSXB7gdW6ETiDrzIfxLO2YxlvrUuJgFLxrPG5XsGx07hyQRR/yqASioKaI1Ig8DOv6
 t7NoRDMBX2BQRYEInrPM36QmGBcDOMTctHyqY4JWDN/qaWsylnRjHG+7umDfNhtaNcCk
 lP7Q==
X-Gm-Message-State: AFqh2koaZl5fz87CbkZmOh1auF5aq5F9SZ9mq9gs0OnyJ7q1OOy3LLSf
 8zaz4P8ro1M9ZAnuQqfjqA==
X-Google-Smtp-Source: AMrXdXuS0RwLdG32aXLQuMazq1vnSK/yWK2wwrLeyNfrY1C2VusapTqW5U+LsHMCNe53FfekOB/c4w==
X-Received: by 2002:a9d:7113:0:b0:678:2dcc:9277 with SMTP id
 n19-20020a9d7113000000b006782dcc9277mr5441279otj.31.1674133343855; 
 Thu, 19 Jan 2023 05:02:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c4-20020a9d6c84000000b00684eaf9018csm7174270otr.34.2023.01.19.05.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:02:23 -0800 (PST)
Received: (nullmailer pid 1589489 invoked by uid 1000);
 Thu, 19 Jan 2023 13:02:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
In-Reply-To: <1674108674-8392-2-git-send-email-quic_srivasam@quicinc.com>
References: <1674108674-8392-1-git-send-email-quic_srivasam@quicinc.com>
 <1674108674-8392-2-git-send-email-quic_srivasam@quicinc.com>
Message-Id: <167413318302.1585278.7105957388478984370.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: qcom: dt-bindings: lpass-va-macro: Update clock
 name
Date: Thu, 19 Jan 2023 07:02:22 -0600
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu, 19 Jan 2023 11:41:12 +0530, Srinivasa Rao Mandadapu wrote:
> Upadte clock name from core to macro in lpass-va-macro node
> to make it compatible with existing driver and device tree node.
> 
> Fixes: 67d99b23c881 ("ASoC: qcom: dt-bindings: add bindings for lpass va macro codec")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Ratna Deepthi Kudaravalli <quic_rkudarv@quicinc.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.example.dtb: codec@3370000: clock-names: 'oneOf' conditional failed, one must be fixed:
	['mclk', 'core', 'dcodec'] is too long
	'macro' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.example.dtb: codec@3370000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1674108674-8392-2-git-send-email-quic_srivasam@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

