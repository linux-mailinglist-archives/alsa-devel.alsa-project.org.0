Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DEE8839E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 22:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC6071663;
	Fri,  9 Aug 2019 22:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC6071663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565380872;
	bh=nGcSdR2KUeV4EE9sc8P/ppKE1qm9A+KOnVU0F5Y8wV4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e97YnA/qP4n7D6lBtxDujtOpK/CufowYWdJydjjKF3hpuw94saModFXV4yB9M0wJP
	 yLTg/1m/egB+7a2O0djhxUgDFp8OrgKnkevGSScQyCMa9IgRPxq7DVMyTZw5T6dbXA
	 FcMoYcBjzMxmzTV0MB6awN4gXOiMw+y8BujZMvH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A40B3F805F5;
	Fri,  9 Aug 2019 21:59:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC9F9F805E1; Fri,  9 Aug 2019 21:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D9A6F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 21:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D9A6F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TkLm8gEE"
Received: by mail-pf1-x442.google.com with SMTP id p184so46584837pfp.7
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ojmnuX0x32lHJ/D+75vj1kRonZuJ/g9iqnUm+zVivbQ=;
 b=TkLm8gEEMKiW84W4cgO3zvgYqub5DNNpfruKswekAOlUl+cYRrXISnfEwCNCJjld37
 MpnXIJSZYfTAJ83cPWQb7HnOdnU9IgacryuATqNKcAJ0pudFeHiW67gBlWLyB3qJ5fqD
 7n4PuWj/J6WOaJr/Sk1w0wBVupILPbLKDgFfc43Tv1X2pOyPHF0IAEGU+uB/aOFAoLjX
 32YgPYRRjSNnvYRpMZNAvNttfOf82m/5Uk1BbxQoPxIe8Sb+M7PTPI/QVGYDG/wrUvxZ
 vakjJnYA5CnIZFc0fT7s/kcB/Q/781RityGhOB9smsOtTHLVbY5MdFAO4CqyBYZFYmKk
 4USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ojmnuX0x32lHJ/D+75vj1kRonZuJ/g9iqnUm+zVivbQ=;
 b=JvB5Oxw+9jq6EMMUe51sk1nODuxNdrhZg6EwobhB67Ni7u36UsiRFEf02mOyATYawH
 x1Tcg8HrrtXT9qHd7C5uDGCEiNynR/mJKS85T9gylHD/kIsZ3X2Kvq5x+OBVL5kNwsji
 I2605RCU5hRw51C9HXlRbdpxniCH0YBsXXp58DsqZKB3CEwI4l7uI66l+R2R+6Z5A3Cl
 LmMa6RVifZwDwcTDB8Pm0QufHZm9x5a1YryJlPRDEXBIyZuqHzSm+XDF7P5+hVDHtPKq
 O2g/t+HFO+xQ8ax9iKArubkXhHNwMSjUv4EFvLuKKY93InlHvZAXG2sN3FxvfDalJmfS
 nrkw==
X-Gm-Message-State: APjAAAWwrjqnM4lyZrjZ0RtNRm/PxzwI0Nz9I0cF4vc6gys4WFnJwohF
 LczUk5luAw/O/o5tJ543/NI=
X-Google-Smtp-Source: APXvYqymbF/Bhg9bVlIjFmuXbUC94GuivHKAsuqe5AuDRK1+Hydo9/dP5KXtlzUlLvLE/7UKNhy1Bw==
X-Received: by 2002:aa7:9516:: with SMTP id b22mr23116258pfp.106.1565380738742; 
 Fri, 09 Aug 2019 12:58:58 -0700 (PDT)
Received: from Asurada (c-98-248-47-108.hsd1.ca.comcast.net. [98.248.47.108])
 by smtp.gmail.com with ESMTPSA id
 e13sm121094779pff.45.2019.08.09.12.58.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 12:58:58 -0700 (PDT)
Date: Fri, 9 Aug 2019 12:58:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190809195845.GB8148@Asurada>
References: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: fsl_esai: Add compatible string
	for imx6ull
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

On Fri, Aug 09, 2019 at 06:27:46PM +0800, Shengjiu Wang wrote:
> Add compatible string for imx6ull, from imx6ull platform,
> the issue of channel swap after xrun is fixed in hardware.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_esai.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index 10d2210c91ef..4b4a8e831e9e 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -920,6 +920,7 @@ static int fsl_esai_remove(struct platform_device *pdev)
>  static const struct of_device_id fsl_esai_dt_ids[] = {
>  	{ .compatible = "fsl,imx35-esai", },
>  	{ .compatible = "fsl,vf610-esai", },
> +	{ .compatible = "fsl,imx6ull-esai", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
