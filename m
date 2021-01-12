Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7192F3874
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 19:21:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6608A16F3;
	Tue, 12 Jan 2021 19:20:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6608A16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610475698;
	bh=Qe4WUfbiiWYV122wgOukfN+NRVtOE7rpqNJWm2qclzQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ij8EsIGR1IrxhJPlypm5YlGaIudstfQpdYsw3wQ/351uyGrTS8J1tnY0wKm8YFH+K
	 lfD4Ubi3HG0einlFHqDr5pVgwssC7yzht2qjpUoIQ5Hw6PqIR9eC7ig2ZyGgQqADRL
	 sbESbPSgjR2SPjgDCqj25DI5PS7lHZLf96Fdf7H0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE180F8026F;
	Tue, 12 Jan 2021 19:20:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F33F8025E; Tue, 12 Jan 2021 19:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4958AF800B9
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 19:19:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4958AF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LynGEmqa"
Received: by mail-qk1-x732.google.com with SMTP id 143so2698289qke.10
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 10:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6/4/dr7fn+zRTbNcUowmMs8Ol/J2eKhumjr3A4Q7PFg=;
 b=LynGEmqaTLG2T0txzoExer0ZVvjQ7ErcUJn8AJ46RHf/x34wtEtL7n7G5pZi3WcIkm
 2liRj0IBu3R/Tn5gyMpYhSPxmjvwY6kit3j+p+XB9kjWHJBvy87NuxGprIcmz7T4o+Pa
 ja9De+tLhO5ZymbHezPq6orUehBQJUjfP6yIJac6hT9UTC18Ywi00zftsU9YWd/crE+o
 BsH3yQICgUmTf3AHw/mNFffhDx8hkP7Mlux1H5J1fwO5BrBh/5oMSETzzv1jeDEN1Lpi
 w5gViEURf6IPAXIyznPwQsFVgMI7nur9g1x8FOe4lj8E8w59WZ3DCMqDSgfo4l5ea68X
 86Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6/4/dr7fn+zRTbNcUowmMs8Ol/J2eKhumjr3A4Q7PFg=;
 b=nwlOa62gHkBCFHdeaYAoYmRA6QRIWJwPnhgorVZrlicqamkaicPrrt2gd0vNKLbG+P
 E0ghRm+HtOchWBHuM+PrwrxWyoTPjmE0qGCYB3BEGSEt1PRU+7sD349Zu4Vv2MzhxBed
 JFANsj0M/po4pOhu6xgi60I+Pn5u27ntPy8nUYTdSHBxkgvuHEAMerdSRbn1qA0STssw
 FKnk/n/9rKWagpoG/zzXZ4KOaqN8TTA/IuhvYqeb8ssbin2oZf20tbu0VAkPMhwgDwb9
 NsQvubWqdqcy5wuaeexHcTzWg78SAbeW5l29IofloZ47BbzC2qbSYa2Q3Ijw8+iAFcl+
 xXRQ==
X-Gm-Message-State: AOAM533QNntVpfmljqqpQx2psPom0DrX4k05KZTWXYsVYGVESrJJ7hU6
 EOmLyS2/1DWLlVkBJtbOmR8=
X-Google-Smtp-Source: ABdhPJw0IfeM/ZZbNMvRUDF9MbEZALByeR0JUGlFVpnEJrx3y+U/PumG28kscAX3wbxVu5lB/HcYjQ==
X-Received: by 2002:a37:4f11:: with SMTP id d17mr615113qkb.53.1610475591791;
 Tue, 12 Jan 2021 10:19:51 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id q70sm1736569qka.107.2021.01.12.10.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 10:19:51 -0800 (PST)
Date: Tue, 12 Jan 2021 11:19:49 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix warning of the uninitialized
 variable ret
Message-ID: <20210112181949.GA3241630@ubuntu-m3-large-x86>
References: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Wed, Dec 16, 2020 at 06:44:24PM +0800, Shengjiu Wang wrote:
> From: shengjiu wang <shengjiu.wang@nxp.com>
> 
> When condition ((hdmi_out && hdmi_in) || (!hdmi_out && !hdmi_in))
> is true, then goto fail, the uninitialized variable ret will be
> returned.
> 
> Signed-off-by: shengjiu wang <shengjiu.wang@nxp.com>
> Reported-by: kernel test robot <lkp@intel.com>
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
> 2.17.1
> 

I still see a warning in v5.11-rc3 that is fixed by this patch, is it
not going in this release cycle? It is a regression fix, seems like it
should.

Cheers,
Nathan
