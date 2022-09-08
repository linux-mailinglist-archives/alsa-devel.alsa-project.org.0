Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F59D5B27C0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 22:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25BF1685;
	Thu,  8 Sep 2022 22:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25BF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662669233;
	bh=i++WLbBVy90A8e+JAcE9TFJjaYVhyLVFCXcmlYiRhsY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Njzrww2pVMWhoM1fnsjscHMabe8teUyA4mp4d7yGEaXftWk2pTm+2AHwWCFipiOP4
	 8N8obtP63X5MoZ+aB9MHz+HHcz2XdqxORIA7DpMlUs4loLJ5I0goptl6Er57Hl9VRW
	 p12cEJ+LjI1RmYjGVHTaWAFPlC2P6tZ1LvN5R7Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A8F5F8023B;
	Thu,  8 Sep 2022 22:32:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6ED1F80217; Thu,  8 Sep 2022 22:32:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8BC6F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 22:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8BC6F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lCAHHHtG"
Received: by mail-wr1-x42d.google.com with SMTP id e20so28115802wri.13
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vaR+PRR/c8VGDxG3pWSaeOmzf/CHklELeimE/+fWPMY=;
 b=lCAHHHtGrq9cNEZkhFfMbtPxHscDK7s0S4yHqSiFF3nde/Kclq1HENHQQhVHeUt9Yj
 D/9+fdKfsyfKL3ZSZntsRfDnls3ySehyrEFIyUYVB5xt7JACTP/dkpVza+mmKUvv2FKq
 oPDBxtsu1GQFlk0Rt+PqICrAQ1shTZq0nXN24wPlw6Aum6LGRiGShk3pLvhytTx2Y1fz
 UXLNaDng7ZEiYEUBVwbARxTMEvShiKmkHJ0DjHqynta2OncqVGAGUomZZYvL2B4KxOS0
 5JC1hJkVwLq/cwbHpzgru3X55StUYRb9OEezfeaoevF5Ba8NAaF7CiEn9cppS4+T/Na/
 KuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vaR+PRR/c8VGDxG3pWSaeOmzf/CHklELeimE/+fWPMY=;
 b=BrVXrT+um/URuKBnmxlxZ0iGxSxw/KC4hqqEm7zBWvd1rcJIxFW+76OhimKwE92SSz
 azxA6Mww+CTgINJZzy11tOHGF2V7sqz2lGfthjmu5mbfjE/dKLGxSqEGxLCGve356p6v
 LUnRTSWpcrJod+Ho7hSmQz9mJx6MLDHvThXawJM0YOkPdMKldtOR2vD2Ui3v3pgs6olh
 onqqyeSj3jnKD3Eh6VW0PvqrMmoQLSJaUpGzJkMIASldvMfaC9ioFRKkoD0UqYp04HFd
 Xt9ECuIZyPXQZzHL7D1TvhiPvsLTiW3i818zK5vHGNujCNCF6iKQ9vNMthJUAnDsAK4F
 HVaQ==
X-Gm-Message-State: ACgBeo2lR0shjiYsAVf3+M5SBJhh7NjNA9UajenJ4bcCeflftynL5wL9
 lZo2mCjeS2S/iokHjExVFAcIVrqOgEjqA9zR5+Y=
X-Google-Smtp-Source: AA6agR7lafh5iFDYSngDCJLO1yWQBBaEIcCgTmgJJZt1Q4q1I7mTv9rD219dWAKV0aSj6u6/8XmjvrSPmjTKI+DJsZU=
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id
 y14-20020a056000168e00b0022087dac3e4mr6000203wrd.559.1662669163591; Thu, 08
 Sep 2022 13:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <1662519715-21891-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1662519715-21891-1-git-send-email-shengjiu.wang@nxp.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Thu, 8 Sep 2022 13:32:32 -0700
Message-ID: <CAGoOwPSCQF9WC=jhV79wnqDQ-puL+=yuF1u1oEpomZU9FRzBbA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, Sep 6, 2022 at 8:20 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> If the initialization is not finished, then filling input data to
> the FIFO may fail. So it is better to add initialization finishing
> check in the runtime resume for suspend & resume case.
>
> And consider the case of three instances working in parallel,
> increase the retry times to 50 for more initialization time.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Some nitpicks inline.

Otherwise,
Reviewed-by: Nicolin Chen <nicolinc@gmail.com>

> @@ -20,6 +20,7 @@
>
>  #define IDEAL_RATIO_DECIMAL_DEPTH 26
>  #define DIVIDER_NUM  64
> +#define INIT_TRY_NUM 50

s/TRY/RETRY

> @@ -592,6 +593,10 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
>                 reg &= ASRCFG_INIRQi_MASK(index);
>         } while (!reg && --retry);
>
> +       /* NOTE: Doesn't treat initialization timeout as error */

s/as error/as an error

> +       if (!retry)
> +               dev_warn(&asrc->pdev->dev, "initialization isn't finished\n");

Could print which pair; or perhaps pair_warn?

> @@ -1295,6 +1301,20 @@ static int fsl_asrc_runtime_resume(struct device *dev)
>         regmap_update_bits(asrc->regmap, REG_ASRCTR,
>                            ASRCTR_ASRCEi_ALL_MASK, asrctr);
>
> +       /* Wait for status of initialization for every enabled pairs */

s/every/all

> +       do {
> +               udelay(5);
> +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
> +
> +       /*
> +        * NOTE: Doesn't treat initialization timeout as error

s/as error/as an error/

> +        * Some of pair maybe success, then still can continue.

+        * Some of the pairs may succeed, then still can continue.

> +        */
> +       if (!retry)
> +               dev_warn(dev, "initialization isn't finished\n");

Could print which pair.
