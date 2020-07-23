Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F21BB22B44F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 19:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A26651694;
	Thu, 23 Jul 2020 19:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A26651694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595524418;
	bh=cDi/adhr4FqD2W4xfxq14szMFJ+uTmKNfbCHo00dF/Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Npv9R3c5vp0uNuZ1/t49Yav+zC/438Kj60G8PtKvsK14r05SLMl/ZSpXpWO0j/Su7
	 Tgn/vHAWwT/6mrL67pBywGfiL+txhRUxPknhvE0Ik9+NqLYGX1J2pJmyvdZw2wGJl/
	 yT8usYy01CR3en/BTzKCpcTqCNbPEUiCw6n+NV0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA67BF80278;
	Thu, 23 Jul 2020 19:11:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A861F80274; Thu, 23 Jul 2020 19:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E8DF8024A
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 19:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E8DF8024A
Received: by mail-il1-f194.google.com with SMTP id t27so4923787ill.9
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 10:11:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W10uFRF9PNlMYJayv5R1Pm2HIaj5J/vliPwEy5KAVAA=;
 b=FFmB0dMj8kkFLLv2RIyTwMayghSQ9BnFtz6dMI5EuzpL/0YKM3lleY2mt58g+ZcJCh
 uO9Ljz1Fxiv8GFi2LuIfRXsNGWIyMJPpOqLKc5ejZKlrGpqpgc1ezqKBFzz2D30fFS+c
 n++PSlbUZUogZD/V3y2EyY6Y1IZ97BUXw16EFlq2RKsjEzT2dwimAHCf4pXrKQN3lGI0
 G88l50e9ypCAitvQP2BZKo+UPa/xV1fzZ1KeD5vZy7CaC/a0bIlBpEcQHA2BE6WCUK9S
 qEW+VRe1mMBEkTi8/iDGaeJcDKA6Yj7YiWoVyGNaHyH0X9rrPzgmQ7GYa3DTP3nrp1/+
 g6ww==
X-Gm-Message-State: AOAM531T9iXLIRedm6vj6KUgWepEnjf06mwsLabef+TQfL710gtsFgNJ
 ZKHxijuO386a7+zENBp0dg==
X-Google-Smtp-Source: ABdhPJwBOwWbNgntw6RkaJvSYZqmju6uJjrnsDHD6EwiLBFu8XLvtd0BZCUpcGvP1P6XjnZITh2bPQ==
X-Received: by 2002:a92:c011:: with SMTP id q17mr5990026ild.290.1595524291809; 
 Thu, 23 Jul 2020 10:11:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id f18sm1733238ilj.15.2020.07.23.10.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 10:11:31 -0700 (PDT)
Received: (nullmailer pid 547620 invoked by uid 1000);
 Thu, 23 Jul 2020 17:11:30 -0000
Date: Thu, 23 Jul 2020 11:11:30 -0600
From: Rob Herring <robh@kernel.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Subject: Re: [PATCH v4 08/12] include: dt-bindings: sound: Add sc7180-lpass
 bindings header
Message-ID: <20200723171130.GA547571@bogus>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-9-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595413915-17867-9-git-send-email-rohitkr@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 broonie@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 Ajit Pandey <ajitp@codeaurora.org>, bjorn.andersson@linaro.org,
 plai@codeaurora.org
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

On Wed, 22 Jul 2020 16:01:51 +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add header defining dai-id and mclk id for SC7180 lpass soc.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>  include/dt-bindings/sound/sc7180-lpass.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
> 

Acked-by: Rob Herring <robh@kernel.org>
