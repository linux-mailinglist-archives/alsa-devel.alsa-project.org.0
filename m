Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3618419ED8
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 21:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1192816A1;
	Mon, 27 Sep 2021 21:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1192816A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632769396;
	bh=6jQdBRF+DstmmJJDR5CA7SVAJza1XejfL/+4xbIGu48=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W3O8NU3VV105vdxOV1QIbH12RSq57nYPyX5guo5vyPuGXQ35UpiW984fgiNmtE4FA
	 TCoQul6gFW9EBg5GoAiu3xek2beE7gYwWf1aGew2rSx2Wco+lli8K3za7/Gm1/7ZZY
	 jM14mOg+au3l711kci7OgDy5vVWMjvGYqjymhP1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EA2F801F7;
	Mon, 27 Sep 2021 21:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B08F8F80272; Mon, 27 Sep 2021 21:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CE0DF80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 21:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CE0DF80147
Received: by mail-ot1-f43.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so18873612otv.4
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 12:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KDfN3VPs9v1P9wRbetasKjyeNxBPhJmR/WhM7HctVEY=;
 b=fNehE+KtxvYEW45Luqvi9UvPplQ70CiLM5r36CJ5MAnWUjQU00V44FGc0qnsDuwHVt
 qzCzsa4QTyOTsFUB9buhHON/eKXVM1OFu3rpulk+mCI7WQiEi/YSrK3LiC1FDbkIwwPY
 dwbz6wT7Cyw7nMLw5CZLjJa9v1F6VV/AIzIJHYCUbxJ/G18WEdp/5/bJYntQBa9hsR+l
 NRYRRhLl4HzslXC+2SVKTS+vOK+C3qP21xBAYwMz2ZWhh4icwzZC97egL7/EEJYpGl4a
 N0l4L+UbpqV0QfSB5c//WTo6zIpaAn9qbQogdXPERBs4nnY5WfhRTcNYGFiS0iNdTt8/
 iw1Q==
X-Gm-Message-State: AOAM531NWbjS00jiXPlQ6CDK7UHkA5k7cd7+Y7xm7xsT2l7eW09QC43h
 thyhfrnkvJ8rKMYMyHc/jw==
X-Google-Smtp-Source: ABdhPJz6z3MNPTLUXwOZo87wAe7zH1Ti2ldX1clqtvsG0UygqrhDcYkZP4+QP/c4OW/PUNc7UvO1ew==
X-Received: by 2002:a05:6830:2b27:: with SMTP id
 l39mr1444334otv.25.1632769293304; 
 Mon, 27 Sep 2021 12:01:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z10sm4127882otq.64.2021.09.27.12.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:01:32 -0700 (PDT)
Received: (nullmailer pid 3670394 invoked by uid 1000);
 Mon, 27 Sep 2021 19:01:31 -0000
Date: Mon, 27 Sep 2021 14:01:31 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v2 2/5] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
Message-ID: <YVIVC5GFTMu2PjPm@robh.at.kernel.org>
References: <agross@kernel.org; bjorn.andersson@linaro.org; lgirdwood@gmail.com;
 broonie@kernel.org; robh+dt@kernel.org; plai@codeaurora.org;
 bgoswami@codeaurora.org; perex@perex.cz; tiwai@suse.com;
 srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; swboyd@chromium.org;
 judyhsiao@chromium.org; >
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632313878-12089-3-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-kernel@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com, swboyd@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 rohitkr@codeaurora.org, judyhsiao@chromium.org, plai@codeaurora.org
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

On Wed, 22 Sep 2021 18:01:15 +0530, Srinivasa Rao Mandadapu wrote:
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>  4 files changed, 12 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
