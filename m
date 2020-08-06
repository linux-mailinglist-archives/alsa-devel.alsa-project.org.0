Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AECE23DB2C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 16:31:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F35D3836;
	Thu,  6 Aug 2020 16:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F35D3836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596724316;
	bh=9bx/m5KJGlL6iI4Ot1s02fouYxRcpi6AchvVLqflqRw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqr9Cp6DQ7St/ycs7UR3525Q4zRDaXt6EVqYujQvypuj8tOm4FF9vkbNHfkYZ/L/x
	 fa0lvJ2nqsMmOGtNMnJEN46Ix00RlpxBpnqWuvmBF86lXM+AQKofFnpZVir1J6F66j
	 KBWLDMulGQYL3pBUwhmxmCTn5x+VEV/ZTnHG27m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1938DF8015A;
	Thu,  6 Aug 2020 16:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0508F80159; Thu,  6 Aug 2020 16:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E26F80124
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 16:30:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E26F80124
Received: by mail-io1-f67.google.com with SMTP id t15so40849665iob.3
 for <alsa-devel@alsa-project.org>; Thu, 06 Aug 2020 07:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K/3We8AGMWDx9mNTiTs/sOpLR+yCgqCzpB93qqwd4xg=;
 b=cG9ACpQZ8a1AD2Em9fnG3YA4oolVQECmTqh8hXA5sBGodHsbX1wiw9IIp0FV1mccjO
 cakPLeaebs2e0HF4qu/1dfRlS12WV0nAJIQRQ0JgjaDjMktLjvbRrh92H83eSEZ/ZeGU
 41zUtZW9k9tzRcW4N0nBjB+eszRYw0R0+WWbVjh/g31L6YWrkbyXjuDVmBiriR79emu/
 7V0H9RscLrPgMrMdLCuYf63vJYPKjS/IMDgcMKCDLQIZ59GjvNZfaCzC3wE5teDyeYwL
 JDGR7NUbxgh5LC6SYbSqH4MMYnK7ydAtOhRyqdWll1oKUOiOZiI6D1ajGlQ3/+z3+Rby
 JPCw==
X-Gm-Message-State: AOAM533w3eJNNKnFuKnkl/TC6QNXOEXKzFAypLDRNz64lvkqzKaRhG9K
 y5xobAGeY45NN8a7XTjesQ==
X-Google-Smtp-Source: ABdhPJxIIJY14/wDGJG1LlEcpKWPQN9KGSXYigWRU+8ra5vZCkBoygTzV2YMWGy2Cnsuuto1f8jrlg==
X-Received: by 2002:a6b:c3cf:: with SMTP id
 t198mr10069332iof.164.1596724203177; 
 Thu, 06 Aug 2020 07:30:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s6sm4071541ilq.73.2020.08.06.07.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 07:30:02 -0700 (PDT)
Received: (nullmailer pid 807481 invoked by uid 1000);
 Thu, 06 Aug 2020 14:29:59 -0000
Date: Thu, 6 Aug 2020 08:29:59 -0600
From: Rob Herring <robh@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v5 07/12] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
Message-ID: <20200806142959.GA807423@bogus>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
 <1596528453-11437-8-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596528453-11437-8-git-send-email-rohitkr@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org
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

On Tue, 04 Aug 2020 13:37:28 +0530, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 55 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
