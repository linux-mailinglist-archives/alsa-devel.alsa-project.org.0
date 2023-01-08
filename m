Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6746661824
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 19:30:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD92BAE4;
	Sun,  8 Jan 2023 19:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD92BAE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673202612;
	bh=L5IVlv661aEqQrH2nyGrcNBO2UtgzbxH8r7cvyC6ElY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=uQlrFrSN882zJUuLjOkXQwY5cjkAIDhsD3EIugPEiwbx65/mwYVVwptCciU0PdG11
	 T3NalgP31eW+9G3kcupVjOP0ku1fn9ch9otIMXyuTAsftjoZx133fVivf3YGtI5srL
	 JEDih9mtcPkDN2R02lkdLlicLlgf6k5VIi54r1to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FD6F80236;
	Sun,  8 Jan 2023 19:29:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12175F804DC; Sun,  8 Jan 2023 19:29:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67EC7F80236
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 19:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67EC7F80236
Received: by mail-il1-f176.google.com with SMTP id h26so3836586ila.11
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 10:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vMhFbySGrPohTwiXX3TAkbMAqqH438aTvo1KuJo04VQ=;
 b=Vot++RZzikjJFnzZ8jc0VuO3/sj0tlJYEmP2/kLA9om0sPDbWvKQm7m9uPNToeXNfa
 SDZbUQUy9hO5EZnAzJdG9ikggaejSnMxq8q+eJO+M19ilVpIryydEyVT72dCdANLylul
 NAKpyghIvFj12zExaDYCZV4zhe9sTVhw1/frSq0Q3GfyxFsSGOUxWN7WbyPvP48CT794
 O9vxh3HkUFdQ51AsBpEH7Cs35W5/HJ0Yf+/tues3z/tEqq/q4BfdMtxw74hIFlhwYpnq
 mva5X8BpqGLtYceZ93jdlaxIenVQWVpiBdoi4RzIcNVjqCVyapDnILbvgiCD200y6+zu
 YkKg==
X-Gm-Message-State: AFqh2kqmI1B40wtGqul8SUD3RUMU1MW/p+Qd+5ANak82HNRyVv+ucF7e
 C9Z3zbuCd4716Kh1b0aV4A==
X-Google-Smtp-Source: AMrXdXscl7NVSbdD6hIptcgu+AoJe4I5lmFCyA4jcxP2LE8xaf+gZBUiRRe8sFV5vHIJW9StFOiDCw==
X-Received: by 2002:a92:8747:0:b0:30d:6d40:aaa0 with SMTP id
 d7-20020a928747000000b0030d6d40aaa0mr15019018ilm.5.1673202552270; 
 Sun, 08 Jan 2023 10:29:12 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a056638217200b0039e80b510e1sm579616jak.157.2023.01.08.10.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:29:11 -0800 (PST)
Received: (nullmailer pid 175231 invoked by uid 1000);
 Sun, 08 Jan 2023 18:28:57 -0000
Date: Sun, 8 Jan 2023 12:28:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: qcom,lpass-cpu: Fix DAI children
 pattern
Message-ID: <167320253755.175169.16665151163621062615.robh@kernel.org>
References: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
 <20221227163135.102559-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227163135.102559-2-krzysztof.kozlowski@linaro.org>
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
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Bjorn Andersson <andersson@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue, 27 Dec 2022 17:31:34 +0100, Krzysztof Kozlowski wrote:
> DAI children (as subnodes) can come with two-digit unit addresses:
> 
>   sc7280-herobrine-crd.dtb: audio@3987000: Unevaluated properties are not allowed ('dai-link@19', 'dai-link@25' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
