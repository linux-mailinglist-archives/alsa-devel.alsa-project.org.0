Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5657B0DB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 08:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E500D1747;
	Wed, 20 Jul 2022 08:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E500D1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658297645;
	bh=CMpglGTKQIGnl8J9gGjNjML9h4BxYkx9EezpodPQDyg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uVOiKGDKZ+O25cU78soycWSz6wA9yRHoTJzYdWHQBV7uotYfdd264Zl6JfWYPbAej
	 n5gflQJjItj+96NgWZDx7KhSWdsu4xIHka28KehL9uPKiV3Eun4aoGb15bmqGXJUHE
	 /Ge2qjW0qcxyeU3FiWvfLXtXY2EQeiPqcXWxd9k8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C1CF8025D;
	Wed, 20 Jul 2022 08:13:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08D52F800BA; Wed, 20 Jul 2022 08:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C6A6F800BA;
 Wed, 20 Jul 2022 08:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C6A6F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lnOV0b33"
Received: by mail-lf1-x12c.google.com with SMTP id z25so28590988lfr.2;
 Tue, 19 Jul 2022 23:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q4sVZB99sCEb2Xsqk+OTLokj01u7aM4T4weg/W8BDCU=;
 b=lnOV0b33vP74QasJm9g4uA4MFlwFcFjCfE19ZMevweNpvQurbQwguzUM+zxnrJqiX2
 XP3YtDIhHYOKs36O2xgN8a7RU8s8jsgcTY0NCJNJRcY61MLc24MLroTQnyi6WhcF5aRv
 vVLYehm9Zt3Mz3I+w29yqYml2b6jLtdmGrWmTl8D/THhZEBuBX5vYfCNOvMri/ERXQKR
 VixEJiIUVQ3+YyhBsOGoWxNqahvpSXnt24hIcieUOzMS58Osa3Pk7gZL6zksgYV4hHkF
 /hKlbwSnyDvqswDAr4TgeNGkNae1bcOkmDtZnDc9uLkLzapzNxjwYpxjd/RBJyMzN799
 bCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4sVZB99sCEb2Xsqk+OTLokj01u7aM4T4weg/W8BDCU=;
 b=F5hvKJlTYWu7CnlI1ufEqbULXZxxh6EDutnsndTNDmi92oFVpyZDWGyNsjNQAPjI/M
 RIwLL0Bxue5b1o+oc6z0+uQ67QDPM3zGnlaGPFcYRcoj2Yb42al+6EKm8HxIb+GH+lFk
 fugX/oI30ydbOTEt6vVQ8OeTkPzWONCmF55rFDY4GsRNx744nnGnNuPvQGSk7uhdEQVz
 z6fZLMwBHPCY11H/Fh248d2MUeiJbb4DCs0E/Ow6++hlHHQnO+hfnD0wTI5Zm6qtV6w3
 nqM2Nl7A4uSE4LGzJIrEnOEA31WItVuJFgQchHRvNEc/ZazIPHkqL7L4mrn+ZIquU3nQ
 GcUg==
X-Gm-Message-State: AJIora8dVgpEccflmgJecFrQr/3uJ4/Wcr8LJ26PJodMrWWmhWFnKrmj
 H7A+pMblIIj1uJAlHJa+KUpX/I68hJ4MtjcclDk=
X-Google-Smtp-Source: AGRyM1sePTAvXb1LWurR8xKU6a6iq5u50pelcbw84+lUGq3AEJpvPN+vanHrowkj0vTBgFzi9b054lyCFJpad5oaCq8=
X-Received: by 2002:a05:6512:31ca:b0:48a:2e3:db41 with SMTP id
 j10-20020a05651231ca00b0048a02e3db41mr18678163lfe.285.1658297576936; Tue, 19
 Jul 2022 23:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
 <YtaYe58xS4ynZ+A4@sirena.org.uk>
In-Reply-To: <YtaYe58xS4ynZ+A4@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 Jul 2022 14:12:45 +0800
Message-ID: <CAA+D8AOrFr6DvgnLsHV8VD1MhE5MsM2qXjO7mHNDb8a3-OnJcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add i.MX8ULP HW support
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, krzysztof.kozlowski+dt@linaro.org,
 Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, kai.vehmanen@linux.intel.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
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

On Tue, Jul 19, 2022 at 7:41 PM Mark Brown <broonie@kernel.org> wrote:

> On Tue, Jul 19, 2022 at 01:26:06PM +0800, Shengjiu Wang wrote:
>
> Not a thorough review, just a few nitpicks:
>

Thanks.

>
> > +#define MBOX_SIZE            0x1000
> > +
> > +struct arm_smccc_res         smc_resource;
>
> This should be static shouldn't it?
>

I will move it to function as a local variable.

>
> > +static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> > +{
> > +     struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
> > +
> > +     imx8ulp_get_reply(priv->sdev);
> > +     snd_sof_ipc_reply(priv->sdev, 0);
> > +     spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
>
> Minor nitpick but a blank line before the unlock to match the one after
> the lock would be a bit easier to read.
>

ok, will update

>
> > +     regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT,
> EXECUTE_BIT);
> > +     usleep_range(1, 2);
> > +
> > +     arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0,
> &smc_resource);
>
> You need linux/arm-smccc.h for this (as 0day said).
>
Yes, right.


>
> > +     if (ret) {
> > +             dev_err(&pdev->dev, "failed to init reserved memory region
> %d\n", ret);
> > +             goto exit_pdev_unregister;
> > +     }
> > +
> > +     priv->clks->dsp_clks = imx8ulp_dsp_clks;
> > +     priv->clks->num_dsp_clks = ARRAY_SIZE(imx8ulp_dsp_clks);
> > +
> > +     ret = imx8_parse_clocks(sdev, priv->clks);
> > +     if (ret < 0)
> > +             goto exit_pdev_unregister;
> > +
> > +     ret = imx8_enable_clocks(sdev, priv->clks);
> > +     if (ret < 0)
> > +             goto exit_pdev_unregister;
>
> We're registering the platform device before we enable the clocks - is
> that safe?
>

Yes, it is safe.

>
> > +static int imx8ulp_remove(struct snd_sof_dev *sdev)
> > +{
> > +     struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> > +
> > +     platform_device_unregister(priv->ipc_dev);
> > +
> > +     return 0;
> > +}
>
> Could we just use devm?  I'm not seeing an ordering issue but I might be
> missing something.
>

Which devm do you mean?  There seems no
devm_platform_device_register_data().

best regards
wang shengjiu
