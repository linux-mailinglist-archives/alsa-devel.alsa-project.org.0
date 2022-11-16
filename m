Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02A62C132
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 15:43:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A7216A0;
	Wed, 16 Nov 2022 15:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A7216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668609781;
	bh=+erI5d1WRLJY4JMB1ZaHqQS1CAOnUcurv5BHFJ2J4BI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R6Ru2xRhKbgHUyS1BbRlhERrjSYGlVIuB/v+lcjYLFphnsVLa9X9V5vPR26V8p7vJ
	 iIQQiNz+WhiuHtCxhXBK9Bsm1QahYHzNbjpRFmOWh0JS9oQV5aCCfB/RdguNr1CV9R
	 mJ9/Adyi5NhaqMuBQhaUumY8U9R7SgpQRUr/5s6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CE3CF804A9;
	Wed, 16 Nov 2022 15:42:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A3EAF80238; Wed, 16 Nov 2022 15:42:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B5DAF80238
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 15:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B5DAF80238
Received: by mail-ot1-f41.google.com with SMTP id
 a7-20020a056830008700b0066c82848060so10519539oto.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:41:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmTmOBiujjJzMOC34NULLqzGRaBRcGqq+M/PlxPI0qg=;
 b=jHYHQFyTSLYIkeUJLHilcdgHLdSbFvb6mfVwxFdc2uYKUa7xDTeMfdzmzSfgf4SrJk
 PEZYvV+Ys7b7HN8OAtuFQN2Nwsns/B8hpABK7fAjZzai0kiiVYpc8l3cur0RGPnyqrld
 0rEQDKcB35s49pCv1tZaGoQqCjDIvt8KZu17nQjUP4KlB00/RCeoT3qsx/L1otKZ3gsd
 8+UHaeYsz9Em78JFMHzkeaU+1eGbphLY2OX3NSWYRZPAfyQ6YC4Oa3WjA7L3s9z7S1Mg
 uwu95ap4zB+XRxxSdp80hTlTSgq/I9fVqG4GVTh5povU0l/n76xEUT5/9G049ZCOodkZ
 I1KA==
X-Gm-Message-State: ANoB5pnIvsYu4ZBEcVqkjJ3rhTl3b1gTaiXsvS20bUtcwLNOCDp2KeUj
 9hlwuMrveC2mEFMcH3SDPw==
X-Google-Smtp-Source: AA0mqf6yczlqz0ixYCplthhhPxfTsROjnYiGuRO6OYi37eGwpih3pykOrdiorPCJqKBhxfSpfvob4w==
X-Received: by 2002:a05:6830:6089:b0:66d:8b98:683f with SMTP id
 by9-20020a056830608900b0066d8b98683fmr7259700otb.40.1668609717543; 
 Wed, 16 Nov 2022 06:41:57 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l6-20020a056870204600b00136c20b1c59sm8057852oad.43.2022.11.16.06.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:41:56 -0800 (PST)
Received: (nullmailer pid 3820928 invoked by uid 1000);
 Wed, 16 Nov 2022 14:41:58 -0000
Date: Wed, 16 Nov 2022 08:41:58 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 07/11] ASoC: dt-bindings: qcom,q6asm: Split to
 separate schema
Message-ID: <166860971788.3820869.2449332152697837525.robh@kernel.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
 <20221115120235.167812-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115120235.167812-8-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, quic_plai@quicinc.com,
 quic_srivasam@quicinc.com
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


On Tue, 15 Nov 2022 13:02:31 +0100, Krzysztof Kozlowski wrote:
> The APR/GPR bindings with services got complicated so move out the Q6ASM
> service to its own binding.  Previously the compatible was documented in
> qcom,apr.yaml.  Move most of the examples from its children to this new
> file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: quic_srivasam@quicinc.com
> Cc: quic_plai@quicinc.com
> ---
>  .../bindings/sound/qcom,q6asm-dais.yaml       | 48 +++++--------
>  .../devicetree/bindings/sound/qcom,q6asm.yaml | 68 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
