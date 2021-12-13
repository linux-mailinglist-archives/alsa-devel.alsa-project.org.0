Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C82494735C7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 21:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2861917E1;
	Mon, 13 Dec 2021 21:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2861917E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639426958;
	bh=0vYLAtZoGeaGVYTlMLhXbtylsXvd6pnOMNwcEZMotn0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iswwbrkG9c+TMOEAuY7yDMOsgh+dwyBk1C/F3dhZo/G2ajlbmja2gF3QXAueivc5O
	 KeUOkLgkcNk5AXA5c7+YguN5nPbfECR5LEn4XtRbL/SbDahYgeZhe/Noi0LptJ11sZ
	 t8H0L4XuVN/6Ic7+uXix0RVvHECqf3KF9fkOAxFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2E3F80161;
	Mon, 13 Dec 2021 21:21:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77826F8025D; Mon, 13 Dec 2021 21:21:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57A1FF8013C
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 21:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A1FF8013C
Received: by mail-ot1-f54.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso18722471ota.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 12:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FBt0ubICNCgGkaELLaCLU2bVkOIIUBGePXG67VK50EU=;
 b=XY93EydA+nsoaLA9Kd++pNjJT9jEeO96StOGaQW1o/FcYIgGzZQ87Ogqh5mY+PrgCR
 SNGaydZQ2WcikdnhF0zm4ziMtEBSVLi3boIuqd/ILJqLhq9Rx0k3Gm9bcYiJZcUJo14B
 Bin52htfpVRbCPgvyw77Mlqsd4gE7gQBbI6mYvLA6JGDA0iX6mHmN28ypTuTGX+eEAmh
 kvm9zbP+mXsUyL2X5Xm0SbRxItNMdCLdS7Cnf2I2ZAUMfZ24iEpcaxPr7beVaoxgQ9ut
 OmOEHs4LvtnL59rNUPy8BJr6Yeom7pLqRoqyevcF9vikdEjsmrG/OPiNPer5fdD8ZZTR
 xu4w==
X-Gm-Message-State: AOAM531MxEJs2fUNhxqgdPBLBfTa5buwNUs5zbbCmL3171KvD0L5gFZa
 6rjwG3gNPt+g+gmw6DjE2A==
X-Google-Smtp-Source: ABdhPJyrqMJic+kGNvlxbkAlDzEbRjv+DjzQtpPWX4Vidllw/tObUb7QZzh90vXGdag0i2TFxngPZQ==
X-Received: by 2002:a05:6830:33ce:: with SMTP id
 q14mr682223ott.346.1639426874303; 
 Mon, 13 Dec 2021 12:21:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bf17sm2789682oib.27.2021.12.13.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 12:21:13 -0800 (PST)
Received: (nullmailer pid 1505028 invoked by uid 1000);
 Mon, 13 Dec 2021 20:21:12 -0000
Date: Mon, 13 Dec 2021 14:21:12 -0600
From: Rob Herring <robh@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: qcom: sm8250: Drop redundant
 MultiMedia routes
Message-ID: <YberODnYzbpwYcLN@robh.at.kernel.org>
References: <20211202145505.58852-1-stephan@gerhold.net>
 <20211202145505.58852-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202145505.58852-2-stephan@gerhold.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Thu, 02 Dec 2021 15:55:01 +0100, Stephan Gerhold wrote:
> The MultiMedia audio routes can be deduced from other parts of the
> device tree (e.g. the definitions of the MultiMedia DAIs) and therefore
> specifying them again in "audio-routing" is redundant and prone to
> mistakes. This is no longer necessary since commit 6fd8d2d275f7
> ("ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai").
> 
> Let's drop them from the example in the DT schema as well
> to avoid confusion.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
