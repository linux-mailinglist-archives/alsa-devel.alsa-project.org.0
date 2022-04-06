Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 676084F5E0A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 14:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2B616EF;
	Wed,  6 Apr 2022 14:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2B616EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649249167;
	bh=rHYUyNveyF2bxMIhzk8upZk3WgS1asCnQcOUgGNs+18=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DvPNIM3zad2fjBRK7whr2/joNVWL6aaL4YwlH8kBZUOsBhYBltAHms0iqCc3O7fFo
	 Hr4QSzspZnoE9Kj9ys+XxvurmVrIAk57Kby9PFxxXzHEz39mqi8nASRypHciU/BPim
	 ZZQt3s4NTgiLirNWiFPIJ3Kpef7DDi43j16gl7F0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D5AFF8019B;
	Wed,  6 Apr 2022 14:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B282FF80161; Wed,  6 Apr 2022 14:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D5B1F800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 14:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5B1F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UzkHHD3O"
Received: by mail-qt1-x835.google.com with SMTP id j21so4124998qta.0
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 05:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W73GazFv6e+Rfu0l6Ax0MB+ReYbbbviU4AMjZ01UVNQ=;
 b=UzkHHD3O2zmMxX0fvreRdKT4Kfz2fUBT/BHXbi2eAtraTwzj3yR5PU1CYVLqO2JWMP
 rob7HusvBCgx9vsSeFq4d34QEDRmCnJ/hNyjZSt7XKY3kGy6Z2d/XJ0SekXazPnal13K
 fe9nkVs3ii5/4vjMgQ8V9xUSeGzTwl8Is2q5Tirconr9Qoji7uA48HNVishyFV/evvTa
 m8BrHBN+92f1xsNSNL7yeWo1mTWjsC8Zm1mPNePxN/Fhc6w7AAN29XgZrrpQImEdlWeO
 +f6pDZQnX7T95F++e6SyKpdojof/vvEWYb2ypD+pJTrBYqipQJ1Ugo57CX5znaRPAEkY
 CckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W73GazFv6e+Rfu0l6Ax0MB+ReYbbbviU4AMjZ01UVNQ=;
 b=HOjmt/3EBu3EcywnXJCr0uPG6kgc2wz2/nTbFnYUoh82MmxmAEmJFEqsfFkwGqSUPX
 q65lles+fezaQMctABYfffpKJg0OigRWH36chO7rqbe7lR37NT8H8JQPRb1df9JjoJLM
 Hd8u6gmFrvCHF5AVDiqtPLRLQdpTTIHh+ke98XYMEl0/FzuGQcyyHB2yLuePEPXyweEi
 vHYxalSBHWPemGLN8EwxtA0CAd3oKiFs/XG3M+0ux2Zg+HeGF/MLZrryBp551peOHlJB
 b8cWhgOKK31GLFaP5ge+r1hp0HyMUF89BzX3DUhDWnab699g4WKIixYydZxwJZ5cdl2O
 mIVw==
X-Gm-Message-State: AOAM530WSHYMd4vSEy+7X0DIkRP5I7TQ7l+VjVpEvCyqwY4WcqANWk5v
 JF4lewFybgCfGL+iioPyDsh7HuLFYFMgWg4MCMY=
X-Google-Smtp-Source: ABdhPJw5wtY9bV5dKPzHN8WNAhVNWlua8XU4prs/BVVg17H5Cy1MzGcykVXjUX7g+ugc3KoRuD2A9o9amU6cHNeQpuY=
X-Received: by 2002:a37:a28e:0:b0:67b:eac:e839 with SMTP id
 l136-20020a37a28e000000b0067b0eace839mr5460429qke.80.1649249099445; Wed, 06
 Apr 2022 05:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-3-s.hauer@pengutronix.de>
In-Reply-To: <20220405075959.2744803-3-s.hauer@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 Apr 2022 20:44:48 +0800
Message-ID: <CAA+D8APZeiv8P7c89PjfHs6QmLHD5D5HFF7FkqXo+MtXW9OJmA@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] ASoC: fsl_micfil: Drop unused register read
To: Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, Apr 5, 2022 at 4:00 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:

> In get_pdm_clk() REG_MICFIL_CTRL2 is read, but the result is never used.
> Drop the unused code.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best Regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 64019d003784b..cf10c212d770d 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -148,12 +148,9 @@ static inline int get_pdm_clk(struct fsl_micfil
> *micfil,
>  static inline int get_clk_div(struct fsl_micfil *micfil,
>                               unsigned int rate)
>  {
> -       u32 ctrl2_reg;
>         long mclk_rate;
>         int clk_div;
>
> -       regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
> -
>         mclk_rate = clk_get_rate(micfil->mclk);
>
>         clk_div = mclk_rate / (get_pdm_clk(micfil, rate) * 2);
> --
> 2.30.2
>
>
