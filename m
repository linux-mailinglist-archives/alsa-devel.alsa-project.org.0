Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669F57B7E9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 15:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2EE917A3;
	Wed, 20 Jul 2022 15:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2EE917A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658325070;
	bh=S3t/0aFuiEsbtsnA6nu2eAla4EuKjBw+IvPvV5JNPVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RkpG+uvVgNYI7ZvWaQsjm9ZaT1hXY716IOHNFB81NmjYv7NtWtdCPBJixrtMG13iT
	 BCJO6bKXkV6gCm6RAuNMYvRfDoRFEdrzq9ZpMJuV/GsGtXW8LHg3zgX3cCw1ps0UGN
	 fcJ+oFTUpU9idWp5zmC3TkWCi1kQsL5ejYz3zyQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA31F8025D;
	Wed, 20 Jul 2022 15:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 312DCF80169; Wed, 20 Jul 2022 15:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5644F80125;
 Wed, 20 Jul 2022 15:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5644F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qFNp1cw9"
Received: by mail-lj1-x233.google.com with SMTP id x10so20739508ljj.11;
 Wed, 20 Jul 2022 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p4N/IbjkWbMhvwJvHe9dbmW9mAWjywr/pYkgdy0MEiE=;
 b=qFNp1cw9rdOfaGf2HY6rErZ6SVILD6bVPvOzF4YkhOOeHNS3AKSd1y5uIlUzV5aqSP
 xhRQ/s7mczSskiCEO/7B29eFbXP6FE24foK5FYpWm6kU8nVe0huL1JlqtKc3cgCU92HT
 PQ8h2rq2w0K9kZMBfMVFVDEbDLum1Ku+LXnItAOCnHX503524Sw1K9PBJr2t2QkQJWox
 GgrADIjnwtPqhukQPLmR5rhKDZ9qwmZGRkURuzrI7G2nN4vzbVoNCcmsh7W2Pg56Wrmv
 ksnaUetwHuzNjxABcONt4GfsA0urfmnBuQetFLwK4Il8DaqiZfLO00Vcm3brbDrJmvZ+
 cCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4N/IbjkWbMhvwJvHe9dbmW9mAWjywr/pYkgdy0MEiE=;
 b=lgHOJVcbNUbFEdHFdBPlpQeR/RJDPzGXMn8ktqFRqFTmGO8lLHsAHHktvyr9TEkdBp
 5B0/p9CTQDkid+3Xo7CEgTsMRdrs/FEslwAmcMBGLYMkZqQn0jyUr1Hrh5+BTqrF+gu5
 AOk/iHqgPcsTIx/rMJYmh9pozHFiaNVYAsltcjyBh+0ZC5/SGeCEFCvGE1Mbv+RBeWPt
 RsePiAa7G+WuamlEZsGtq7ujYHelH6YHAJ5f1Ea1fQMNg4NY6JOrx46nKBob6UQhgr+m
 QSE79hoYdgUFGO+g5y/Jh/+5s/7iPWXoqVI3jTY1XAdyZ0kE+rWnqE/MqDvustylHp2T
 unAQ==
X-Gm-Message-State: AJIora8joMn0PW2h0QdRYsExcRIhx0pJTYcgGJbo/jywAGuesU6J7ab3
 BsmtIc7hWeWM6EmKq9FlY4XTTAQ+aownAC4/H6k=
X-Google-Smtp-Source: AGRyM1tvWZjKGxSOZwba2cJOBsVLA1UPHwtczp/Qsq5Jt09gWeQa6jT8KfDdnbkeFd2z+jRNeWMqbjegcEuSNHdE+v4=
X-Received: by 2002:a2e:895a:0:b0:25d:6815:98ff with SMTP id
 b26-20020a2e895a000000b0025d681598ffmr16184153ljk.189.1658324998407; Wed, 20
 Jul 2022 06:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
 <a2fd9907-d098-7a38-c423-aeb167ab6d37@linux.intel.com>
 <CAA+D8AM3xwacUg2C-W-TFB4AHbvqd-4bSqRqeFAsmFKseT0zVA@mail.gmail.com>
 <8c839963-4244-3e22-3dea-f060603883c1@linux.intel.com>
In-Reply-To: <8c839963-4244-3e22-3dea-f060603883c1@linux.intel.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 Jul 2022 21:49:47 +0800
Message-ID: <CAA+D8AO4HoO-_LadXONLLkN+9Oz_9AvSUiV=n1E=q6xrM-KNfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add i.MX8ULP HW support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 Fabio Estevam <festevam@gmail.com>, sound-open-firmware@alsa-project.org,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, kai.vehmanen@linux.intel.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Wed, Jul 20, 2022 at 9:25 PM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
> On 7/20/22 03:57, Shengjiu Wang wrote:
> >     > +static int imx8ulp_resume(struct snd_sof_dev *sdev)
> >     > +{
> >     > +     struct imx8ulp_priv *priv = (struct imx8ulp_priv
> >     *)sdev->pdata->hw_pdata;
> >     > +     int i;
> >     > +
> >     > +     imx8_enable_clocks(sdev, priv->clks);
> >     > +
> >     > +     for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> >     > +             imx_dsp_request_channel(priv->dsp_ipc, i);
> >     > +
> >     > +     return 0;
> >
> >     is the assymetry between suspend and resume intentional? You are
> missing
> >     the update_bit for EXECUTE_BIT?
> >
> >
> > Yes, intentional. After resume the firmware is reloaded and  EXECUTE_BIT
> > will be updated at trigger DSP start.
>
> That's worthy of a comment to help reviewers, thanks.
>

ok, thanks.

best regards
wang shengjiu
