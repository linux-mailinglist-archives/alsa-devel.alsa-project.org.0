Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD895200298
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 09:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42D66167C;
	Fri, 19 Jun 2020 09:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42D66167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592551079;
	bh=s2yDccPEJmq91XJy+RfVBl9hCa6HE4rg2sdEUftD7C0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZcuBlr6Cbv6jEVrKES3DtOto+5rxx91elsEQciKkwswFGQMVunAsvQXsR4IJGQZes
	 GHVEW+eiwbXAk0RKBbtRWJ/n0bI/MVF6+kgt15XpjN+V93MPqRQWIJ5idHcneloM9z
	 XoCfgJUNFTz1erNxWruBdyq9TElCv8XiUei1piCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED01F80255;
	Fri, 19 Jun 2020 09:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B49DF80252; Fri, 19 Jun 2020 09:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D31BF80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 09:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D31BF80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MThCG9Jw"
Received: by mail-qt1-x843.google.com with SMTP id e16so6519379qtg.0
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcLqzNszUsRDe3jzmL6Kvi+SK8buR0iM6L0pJ0UQJfo=;
 b=MThCG9Jwd1aI1wlSrnihvC6cp3eKrh1rOv53tY8fvT3TtKvhO4+k+EFdPX6DnBxykT
 HIAUcdBak30KNoee1xQlVGjQw+hElyt19YBKvIplGecD/KWhj8ClCPXrtKXwLneEzPkG
 FX2YRtIycp9pDMfyTHJgBM5aXLXlxwmFiJy+p+G9rjP4s16pUfA8Ed7dtd9yN2DsSr65
 ajQr2uZOX1cSLXZrD31ZkfHZImQMfY35RGJ5SEJylICknu5fwuDtAcUp6VtIPDTgMuIT
 SdzZcm84vhjqCYCVAgG9traNzYrCUBJBeoTdbYa44zPvck6LQiRZDIa5uulw8dHVCqPb
 HDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcLqzNszUsRDe3jzmL6Kvi+SK8buR0iM6L0pJ0UQJfo=;
 b=GAjGLz+JhGqeIxwniI1OoX6GUr9TgUOzMep4/qUvR8n56BpgKPqAozQNAgNpxX5W3v
 nFIO8LwTUP4pCgqCW8unUqMk72JcIkZqRoMJWomTiEvkVo8wK9J4DZj9jflWWdRy1wzd
 nGm8SOAY1fxMizvNx/DTkdpYxOLbHydHcQXtBnK1H/W7fWI7xkQrXiV+qX5ORWxwYSyd
 3u1lSqFnPwGb8waiw38su6cqeGey6iD9NKUVh0Ea87+pSVwFTIbuEG2v6qPiJX22YVj1
 qK4/ib277owomUFIKgbM/EWmvYC4KHVdhSEy0Ccl+M8asieiZ2CZWxp+za+xOfjk4j51
 cNag==
X-Gm-Message-State: AOAM533t+kmv3i61El19qFoGF31ZxDkje6ahnTWJnwixSshFdCCmX32c
 1GyN5p9X8BND0w9YKeoKjEE0tY0u70rgArkBLeo=
X-Google-Smtp-Source: ABdhPJwbTdL1Xjyp+rNzK2cppzw1kNNdm5CIImL/5YBuAp+LbbOkOHM6SMPUmT6BhKjPwcHCp3aPi+cLdaaqcQP4Te0=
X-Received: by 2002:ac8:7417:: with SMTP id p23mr2043092qtq.204.1592550967172; 
 Fri, 19 Jun 2020 00:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <1592481334-3680-1-git-send-email-shengjiu.wang@nxp.com>
 <20200619054942.GA25856@Asurada-Nvidia>
In-Reply-To: <20200619054942.GA25856@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 19 Jun 2020 15:15:56 +0800
Message-ID: <CAA+D8APdNAzLyJyf+-FGSyAJtG5_8BVZCJ1+8ALZe_ePySY+rQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add pm runtime function
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
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

On Fri, Jun 19, 2020 at 1:51 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Jun 18, 2020 at 07:55:34PM +0800, Shengjiu Wang wrote:
> > Add pm runtime support and move clock handling there.
> > Close the clocks at suspend to reduce the power consumption.
> >
> > fsl_spdif_suspend is replaced by pm_runtime_force_suspend.
> > fsl_spdif_resume is replaced by pm_runtime_force_resume.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> LGTM, yet some nits, please add my ack after fixing:
>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> > @@ -495,25 +496,10 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
>
> >
> > -disable_txclk:
> > -     for (i--; i >= 0; i--)
> > -             clk_disable_unprepare(spdif_priv->txclk[i]);
> >  err:
> > -     if (!IS_ERR(spdif_priv->spbaclk))
> > -             clk_disable_unprepare(spdif_priv->spbaclk);
> > -err_spbaclk:
> > -     clk_disable_unprepare(spdif_priv->coreclk);
> > -
> >       return ret;
>
> Only "return ret;" remains now. We could clean the goto away.
>
> > -static int fsl_spdif_resume(struct device *dev)
> > +static int fsl_spdif_runtime_resume(struct device *dev)
>
> > +disable_rx_clk:
> > +     clk_disable_unprepare(spdif_priv->rxclk);
> > +disable_tx_clk:
> > +disable_spba_clk:
>
> Why have two duplicated ones? Could probably drop the 2nd one.

seems can drop one, will send an update.

best regards
wang shengjiu
