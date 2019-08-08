Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB5486D56
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 00:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE9D950;
	Fri,  9 Aug 2019 00:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE9D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565303862;
	bh=pHCH0PHl4tUyHgVL5/KbXGEbhGXGpxSx4KPQ9uGDgJE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sd2W9CtDwkhVl+rJ/nNDE8elRT4tDnoLokF92sfITFkfTsISoD5zH2+dDaIoxrEhV
	 WJWrN2CAEwmUce/K5Hj+RHYEPZDQlKrADfsMBCh2/9ETq55g/VEXii2iT8x7xzMev/
	 Xp89UDOxwU0orvrAn52zbSeCcK7Yl/jpQfKu/kUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E21BF804FF;
	Fri,  9 Aug 2019 00:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCD7F80534; Fri,  9 Aug 2019 00:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4452CF800E3
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 00:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4452CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="jpryvk0H"
Received: by mail-yb1-xb41.google.com with SMTP id e11so8364475ybq.9
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVJAEewLu4ZEBGpDE8SEqO+cTPIH++BAUSzUDgfxX38=;
 b=jpryvk0HfZuzGF+NSjauy0iIicatOne8I0besFAzU8uJ6BhCP6NuAJWMC90BvhQMtt
 d5bbe8eQRaJn1pLHG4xnCaKqCNqDk9kMbK+CTuKUByjuHjZOnWAKS5rkrMZrE+JWVbFo
 TlfAUNTe6bzxKJRI2gXps984TagAj5jOKLhVV3AToFywzumK5/Bwo51opUN4CPW/Jf/F
 TTjEJNsuxXBMsSVw4SsaWGE7Lr+pQXds01fTkTtUW/kkBWnh4xwaBEaxe08ZCY0SgHmL
 RJ+aLYupr2B4b2M2tGLn9vABlcULrLr2B/1W3nEnH2n7kUvLAQjTvAR+MzJIto5rdpgV
 47JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVJAEewLu4ZEBGpDE8SEqO+cTPIH++BAUSzUDgfxX38=;
 b=fgHjo3i7Xrc2SUHuNZjIow8GhkSfKvSSwYD9h0d3UrePBo2uiOohq+Q32mQTFw7K01
 CEPD+PGTglMiBq3pL002y7oaetTeFqNBA0yEOfxlrZ9tCo0rbA/dFIfNyzekiQ3er880
 m8Plfyz9dBWpGDcbKArt/yKW45umGVvjOTuyYGVsA7gmnC8BlH64SUI9HdQkHyzmZNP+
 TRQXOnUtjb1csS4SAqoCMgPPRQIJCnSPdxPwowLaEPW+ANa3Ksw/fcn883AIbe1otEmo
 3JIFx9ceGPRcnd4NdD6t2jIe4k47OTWBVsWTgtj2jMAzFLsRYadm2DFYKykTBlVlTDip
 rjzA==
X-Gm-Message-State: APjAAAUBv4y/b4+Lw0ORwWd+iCuS9hfE2s08QCsLN/c+jWWmHgT2xytw
 F+QLTF3iuNWDm4mm3gnyCiU/ZiPsbDuhTcBLUn2rQQ==
X-Google-Smtp-Source: APXvYqzRJ26+bJCpIE5mrPK/PZx4gBiqTiuC/Yhtkpdio5oQ2P5JYCF/D52AuKGdj80cIyFrx0o2Rr1jmQJa/lHj0CI=
X-Received: by 2002:a05:6902:533:: with SMTP id
 y19mr7952340ybs.109.1565303750371; 
 Thu, 08 Aug 2019 15:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190808221850.25963-1-broonie@kernel.org>
In-Reply-To: <20190808221850.25963-1-broonie@kernel.org>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 8 Aug 2019 15:35:39 -0700
Message-ID: <CAFQqKeXnC9fmwBna-BV+0j2L2XQM1BsO=gFT_JoM9-eM02ffFA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sof: Fix warning when IPC flood test
 is not enabled
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

On Thu, Aug 8, 2019 at 3:21 PM Mark Brown <broonie@kernel.org> wrote:

> dentry is only used when the flood test is done so move the declaration
> of the variable inside the ifdef for the flood test.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
>
Looks good, thanks, Mark.
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

> ---
>  sound/soc/sof/debug.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
> index 40940b2fe9d5..54cd431faab7 100644
> --- a/sound/soc/sof/debug.c
> +++ b/sound/soc/sof/debug.c
> @@ -221,7 +221,6 @@ static ssize_t sof_dfsentry_read(struct file *file,
> char __user *buffer,
>  {
>         struct snd_sof_dfsentry *dfse = file->private_data;
>         struct snd_sof_dev *sdev = dfse->sdev;
> -       struct dentry *dentry;
>         loff_t pos = *ppos;
>         size_t size_ret;
>         int skip = 0;
> @@ -229,6 +228,8 @@ static ssize_t sof_dfsentry_read(struct file *file,
> char __user *buffer,
>         u8 *buf;
>
>  #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
> +       struct dentry *dentry;
> +
>         dentry = file->f_path.dentry;
>         if ((!strcmp(dentry->d_name.name, "ipc_flood_count") ||
>              !strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) &&
> --
> 2.20.1
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
