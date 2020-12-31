Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C572E7EAF
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 09:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B2C16DB;
	Thu, 31 Dec 2020 09:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B2C16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609402504;
	bh=PkoqhAGH8xigNDtPbHTaLRe++uO6h3DzHwGgq767vAY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bKoqzYuNZpy40BkLdCfdG3+ccTOQB91RIiwWrMiMDRBwn6B3Xcim2F5s2Vbg9yiJ6
	 ZD3a3dmk2bKmi/2i11Mlhg+NbiYfKAaBVsWcg+h1Lg06EV8TRdxZv0AeNPfyeYdFnU
	 XcYuP0QpeD4sqtP/qke1149J7pw7zXWYFGxnI9Vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7556EF8020C;
	Thu, 31 Dec 2020 09:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E705F8022B; Thu, 31 Dec 2020 09:12:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E0CDF8015F
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 09:12:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E0CDF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OkZtmlJL"
Received: by mail-il1-x129.google.com with SMTP id r17so16781514ilo.11
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 00:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t3sCvs+FLAqfEmFOY3gSWy3C5FD079L2BEMz5q0+2bY=;
 b=OkZtmlJLPwpYGEBhlMTlxC1UNnPNxBb2enYNiFsvCETew052T/SM529w00lcZ0fkU5
 DxiAtfdG8AYnhPcUYDCLhQw30Pb+ngkdcM6cwNWgNn8pByZaN2K3aSG2A9pRE/bJ8/z8
 5qv7tFwZyFVcLOVEXFxINtfell5leVzCMDegQwV63WYi8gfCDuh/Cp1qG/tCa/z+FSwh
 BK5joIczA34jFH5vo97p8k0BzClO9gA1LZSYgRuBJDRZJkkPar5IE905+skQb43AJvoA
 7Etsuhic3bu54GcaoTvgKEG6C8epT7F+fos6MZ/LRuETJImDYOBGc0QFIkj2G4G2FRz5
 3WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t3sCvs+FLAqfEmFOY3gSWy3C5FD079L2BEMz5q0+2bY=;
 b=PXCYfKsqkh9I+E61rzelsVJIdZI/EpPhsUT4Nbiiw+zbD2Do877s/QPQ34ulY2Y/MC
 psAqq0EVE/AyJFDEdApenar8RxxYYKj3renFKCMfb2cHWDLeSNQMOwYOCAhbWDxcUmfl
 4YJ4vY7NxEVT0tyeVafXNMFBAHp6HOnnlsA8+xrPYzczYN4MQXaYb+XLLQN56PGdmL1b
 6GL/wVdc4SA5+JFcCAUzYNqwQgeZEu/y91UYAToienrBRpEhAnHkwYtCpOCKdcRHtvf1
 JNQ68fhj3Asfff5lvfKAJzCf1wzW736Flr8Txyg3NaifJpYyTklmu+rndktMNU2q6a6Y
 Gwsg==
X-Gm-Message-State: AOAM533Ax8PL9PIgt8llsW5PIc9EbyefW0RHGa7tl7/PCqiiU9HZTFh8
 O0gh2GshkyUexuW6dpESSPE=
X-Google-Smtp-Source: ABdhPJzulMTF8nMMBl5A1e/hD/tt98OHBQ06c26gifLgedLyKNUPLiTG4n2V5ZcJIbzuF8Inj5bFxA==
X-Received: by 2002:a92:8404:: with SMTP id l4mr54964892ild.49.1609402363602; 
 Thu, 31 Dec 2020 00:12:43 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id r10sm32437881ilo.34.2020.12.31.00.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 00:12:42 -0800 (PST)
Date: Thu, 31 Dec 2020 01:12:40 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: fix -Wmaybe-uninitialized warning
Message-ID: <20201231081240.GB1970946@ubuntu-m3-large-x86>
References: <20201230154443.656997-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230154443.656997-1-arnd@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 clang-built-linux@googlegroups.com, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
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

On Wed, Dec 30, 2020 at 04:44:15PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang points out a code path that returns an undefined value
> in an error case:
> 
> sound/soc/fsl/imx-hdmi.c:165:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsom
> etimes-uninitialized]
>         if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/fsl/imx-hdmi.c:212:9: note: uninitialized use occurs here
>         return ret;
> 
> The driver returns -EINVAL for other broken DT properties, so do
> it the same way here.
> 
> Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  sound/soc/fsl/imx-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
> index 2c2a76a71940..ede4a9ad1054 100644
> --- a/sound/soc/fsl/imx-hdmi.c
> +++ b/sound/soc/fsl/imx-hdmi.c
> @@ -164,6 +164,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
>  
>  	if ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in)) {
>  		dev_err(&pdev->dev, "Invalid HDMI DAI link\n");
> +		ret = -EINVAL;
>  		goto fail;
>  	}
>  
> -- 
> 2.29.2
> 
