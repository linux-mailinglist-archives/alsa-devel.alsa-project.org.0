Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FC2562A8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 23:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA0E18CD;
	Fri, 28 Aug 2020 23:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA0E18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598651689;
	bh=ROFVvjuyhout5udhMdUexmszaY/V6Pgw8mRjD/NJUQU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iKmdngElCk6P3IiOny/UAS+CsMkA+FAlyVbiZwZQHaDYOcTd2UtmgkJleuiUuSCXv
	 IlIGy8Doj/GNkfVatSPwz4t8yPf3HTmF9ucO2SjJzEUYkPGMrFYarpAAM4GTYxF4vj
	 gJz4hy4Ohdls2BF96uz+w+kNkdvVhe3+kfZzydok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B84ABF800EB;
	Fri, 28 Aug 2020 23:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10245F8016F; Fri, 28 Aug 2020 23:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACFDDF800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 23:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACFDDF800EB
Received: by mail-il1-f196.google.com with SMTP id o16so1939489ilq.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 14:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=en+PfxEtmvRwXUALF3uVWa2UzaRDDagomEGlqyPEpSA=;
 b=jxZZwZwqGgeuPm81zmsMDVgOAIytTrqm71KJijEVvYGzkrvBTp1klTXTFxQC6G1EMK
 DD5e2iVZtxL6pxDmZCFvI3YkNoPbpGKdDeTfaTWl4SCICMk/XrlqLl/Y4yze1ZBozgdO
 7yoEXnqERtBvq/pCLna8Z4bQM8MsEwNMIZp7C8iAgVxFiIwF2gJLLMEhdbp0KnaPHdDa
 Q5Bl1jA9KMnpwPfvh64bJDkgPShsEazk1YvmI0gr2B9uKR8dXqI5674DFz6XSAIyvP+D
 Hd74vVE39TqT5yRoVfcrxV2NqEtBAUH7xSHeTpNqu+A1L66iFnY0rU6hlIv5mRbiAWk1
 AWMA==
X-Gm-Message-State: AOAM530QUyqj+SXPDsuUaH75N+oED+OF+hQWmvOb9bhMDrTvuYJmugJU
 8UYc9XEjh43ntu3luDzXDA==
X-Google-Smtp-Source: ABdhPJy4YaTio1rbBlu0PiA76q677TzpWC0WH5BRcOwzNptJ7mNdQnN0x/aVJ+Fn3tDYsugM/Ig9+g==
X-Received: by 2002:a05:6e02:673:: with SMTP id
 l19mr726225ilt.121.1598651568896; 
 Fri, 28 Aug 2020 14:52:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id m19sm302471ila.40.2020.08.28.14.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 14:52:47 -0700 (PDT)
Received: (nullmailer pid 3469322 invoked by uid 1000);
 Fri, 28 Aug 2020 21:52:43 -0000
Date: Fri, 28 Aug 2020 15:52:43 -0600
From: Rob Herring <robh@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v6 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200828215243.GA3469273@bogus>
References: <20200826110454.1811352-1-cychiang@chromium.org>
 <20200826110454.1811352-2-cychiang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826110454.1811352-2-cychiang@chromium.org>
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-kernel@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Rohit kumar <rohitkr@codeaurora.org>, dgreid@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 26 Aug 2020 19:04:53 +0800, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  .../bindings/sound/qcom,sc7180.yaml           | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
