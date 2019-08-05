Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2E827B8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 00:51:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4151668;
	Tue,  6 Aug 2019 00:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4151668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565045487;
	bh=ByG56wtBHH3wMksfEm/kXWUv3Hc771gvkGbjzGwgFdQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RlHSFDfiXMWJI6Bvs3r1F+O8I+GZGLY8vEGJmcw5UxnX3X2wqK2/Vzlr5Id2XueVj
	 XLzTb3nwjlltbw+5LWq4+U3WiLf3DhQ9BQl5g3vmx8dBjeBve8G+PXyk2OUTHZBaGT
	 kp/sj0+WTe6tbw43hLQbZY04+w1/u4Rh3xzB3Tws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C2BF80534;
	Tue,  6 Aug 2019 00:49:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D437F80533; Tue,  6 Aug 2019 00:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E489F800F4
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 00:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E489F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="S2MBrMac"
Received: by mail-pg1-x541.google.com with SMTP id r26so4510465pgl.10
 for <alsa-devel@alsa-project.org>; Mon, 05 Aug 2019 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eRULxEnfuJ6z59hMCQXAvm9BHOXszvRh9MwRF5O1Bws=;
 b=S2MBrMacN+dYlhkL81oHvr54zEFrun+a9BYuxX5f1fmUgWQTd3HHnrjAPVG+gQfi1j
 rxQ4Cr4ylrPNhLmySbUuyM8XyW/xi6B+HhMFtOhx9DCEJRCDNwSnN1HMIcbxiigrzYbm
 EAmfmFhlH0qWS4CjESpTOj6x89hjChm9/etOzT587sk8V0JDREONMSqkY+i6UTrnrmW2
 i63WGiQ2YWiXU7WdgGS54MPASBegBOCx9TLw6k8PbpxxbhU5zzBT+zKNvHELaqUwR7eA
 0KeH+oRmOr84NB5zxeUyY2A3fuBnE2lc+mG2tIGSXZQ/YQT4ekOqeBG8Vl6Zk3uWGGeQ
 a2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eRULxEnfuJ6z59hMCQXAvm9BHOXszvRh9MwRF5O1Bws=;
 b=O7hgWx9WGly6VRnFNsoA+UZSER08sK+CJTkpp2uIB0/yc1EdcmFX0q+3P9Hqm48dCw
 uupzspBiAgBIT7bOHfQRW59gcwESwsTiQW814KmsTcEA8p7DWo4mfSNHIY6yrZvfOVqW
 ActoRLabSg+j2IooDRJjktOQ80R08SMfCnunMUrDaDKfm5ndcGO0FY2f2Xb20qOiyZpF
 ht+0c4rDSm8M56l3o3rAEFvjTWJgfDXiT0uxdjt8SyVdQLex4j37hzXATPsZBp4J5VRJ
 FWV8zVfbZ0S9jjhy/En8njhIckvCwJlFnspJN9lOJClPh+d579dfYe1cBDknWMCqKyN0
 khyA==
X-Gm-Message-State: APjAAAWvyg2a5qI8HggPqEMIsTZK31qeoItsrg6Imv3xMOiTxyo4btLc
 R2yC/6Li/zNpvuyzWrYoBMDm6Q==
X-Google-Smtp-Source: APXvYqylGTV4UGyqBMoDCj097zl3IRlSvbcAo8xrO2z7ThsKGgbubG5XVOYAvrwXBSdMJ5UPDIs3gA==
X-Received: by 2002:a63:9e43:: with SMTP id r3mr225055pgo.148.1565045375696;
 Mon, 05 Aug 2019 15:49:35 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id y10sm85131247pfm.66.2019.08.05.15.49.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 15:49:35 -0700 (PDT)
Date: Mon, 5 Aug 2019 15:49:32 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <20190805224932.GB6470@builder>
References: <20190804162201.5838-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804162201.5838-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org
Subject: Re: [alsa-devel] [PATCH] slimbus: qcom-ngd-ctrl: Add of_node_put()
	before return
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sun 04 Aug 09:22 PDT 2019, Nishka Dasgupta wrote:

> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return in two places.
> Issue found with Coccinelle.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index f3585777324c..29fbab55c3b3 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1338,12 +1338,15 @@ static int of_qcom_slim_ngd_register(struct device *parent,
>  			continue;
>  
>  		ngd = kzalloc(sizeof(*ngd), GFP_KERNEL);
> -		if (!ngd)
> +		if (!ngd) {
> +			of_node_put(node);
>  			return -ENOMEM;
> +		}
>  
>  		ngd->pdev = platform_device_alloc(QCOM_SLIM_NGD_DRV_NAME, id);
>  		if (!ngd->pdev) {
>  			kfree(ngd);
> +			of_node_put(node);
>  			return -ENOMEM;
>  		}
>  		ngd->id = id;
> -- 
> 2.19.1
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
