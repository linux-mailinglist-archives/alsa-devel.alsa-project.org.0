Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F413AFAB0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 03:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C88B0169D;
	Tue, 22 Jun 2021 03:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C88B0169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624326378;
	bh=tiqacxrKeHUtX7fmUxAHnbMzCjkBTcksnrwvZnp2aoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4q+6QDFU6wtXvJP/tspqpBqLzwb9Gb7oHxxOg/BUZLPZCSgwGAB8WaYCdgD8bGPK
	 Km3bmgDoCXx+2B2FiIoOXlffscscVsAaramdGTX0wcLppfzJrzETv6mGfxB1Hv9UaO
	 pakEk2wY42xPAMRDDKP/NKdZlQRRcQsJzpzmeyBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 821FDF8025F;
	Tue, 22 Jun 2021 03:44:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45054F80268; Tue, 22 Jun 2021 03:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61D9BF80161
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 03:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61D9BF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eRVgBkLk"
Received: by mail-lf1-x133.google.com with SMTP id t17so13085327lfq.0
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 18:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2T+4u9U452MLDrV2sYabqwjNLxExFpoXzhYGSkfV/Ws=;
 b=eRVgBkLkEobSTUu2RowLHRnirDS2+IwYWobxfQcL1BQgaljFpmhjb4Nq7LOUQ+Hj3M
 s4W6phGuKaUSejFuFkfCQ4U9v3NjqK4FOKXIomQNR81jfOE//up36OIDU7Mnx3DX4qpF
 l2cY4IJK/9UAsJPc6Nu/AETIeST4OORcrqv75/Seg1CHIvvQvQwe7iXiAz1dgNtUnBcG
 DgCCoGbUjaPkgkzK5U0tufNBgh54zK8J7B2+UnH6aXqk04V4W4S73ISaRvv9kqG8brSA
 n6TnhwiWH1Rk99hHEuAwK9kMtmxRFbKyGkRfUZqJk36daIK2zyCxk4SzQqKiRu4dDBb1
 U2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2T+4u9U452MLDrV2sYabqwjNLxExFpoXzhYGSkfV/Ws=;
 b=Zy21Gslz+Tov2iUCSsnBrp00QUyyt+Ls/TqQXkwVvI0xejs1nDNW14SdaVyJ3AbC7h
 vDQMGg+9ARvXZjpHZ6nQ4FtzT67jShmsRe/tGZVyS1XWJutf+zhtuH/CfPETYWRSPlCU
 yFlT2PwBfVJvoAJjOTYCMinCZgLz/odkfQg6ZDC3sto15kLzfPOzYeUUaaIh74eG29rz
 xLTirpEtCNa6BLqzwy3+j07usl7MlXZcycy2KNlgtneKy8MSgWFcGgIuvAo5xEHWTymX
 aUNo8sCgM9pABwqnJ0nvl2e5DWJOJ4ZT7MvlRcK+Iv6OgWT+/wkBRj92npZ9zzqnR41/
 J4SA==
X-Gm-Message-State: AOAM5311E2a4yk+ziMXQ2i7a2dnkEg20okvkIQZukX9WCl5OJHv8qVjA
 VVa8CuZvv3rc3qoAVWuS45wB2Gue4c8K/W/8FU4=
X-Google-Smtp-Source: ABdhPJyQXRfM5h/ViEgeFaxz2ca/NMheg2Er/toj2fzJ2zsb2j4LEy+PdmZbxxtQc2bwjuQGToAOvFBERb0c4+GEbxw=
X-Received: by 2002:a05:6512:1583:: with SMTP id
 bp3mr864286lfb.500.1624326278809; 
 Mon, 21 Jun 2021 18:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jun 2021 22:44:27 -0300
Message-ID: <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

Hi Shengjiu,

On Mon, Jun 21, 2021 at 10:31 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Don't need to print error message for defer probe
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - use dev_err_probe instead of dev_dbg
>
>  sound/soc/fsl/fsl-asoc-card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 121e08c2af2a..24c890d76da0 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -708,8 +708,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>         of_node_put(framemaster);
>
>         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> -               dev_err(&pdev->dev, "failed to find codec device\n");
>                 ret = -EPROBE_DEFER;
> +               dev_err_probe(&pdev->dev, ret, "failed to find codec device\n");

I know I suggested dev_err_probe() before, but looking at this again, I realized
that the error message will never be printed.

Maybe the error message could just be deleted?
