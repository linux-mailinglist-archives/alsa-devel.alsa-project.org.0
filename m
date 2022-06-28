Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4CB55BD7E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 04:24:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB00D1664;
	Tue, 28 Jun 2022 04:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB00D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656383096;
	bh=d/CYBYUz6fZ+DGm19rSpz1MoMSXTNjkQ9vYvqOAu93s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nc3rZvrmli5Z5byXNWxLwVgUDNqNt8ck3VyVS4s9dbVO67dba/2N6sle5AnX9CBaD
	 wr3Ur/diRif5qPzUqCRMudPRv9fdmbCjE0+lqkYrbPXdUlG8AmCoGwdBgHF4jrkXpv
	 iVbc6x7KNJjVphVC0GvptWtEPXj9Udyma8VNboIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1C3F8052D;
	Tue, 28 Jun 2022 04:24:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 553B8F8025B; Tue, 28 Jun 2022 04:24:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB797F80115
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 04:23:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB797F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HI/Mpzhe"
Received: by mail-lf1-x134.google.com with SMTP id a2so19812219lfg.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 19:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dB8dhmVX1CwoFsrikItOoVuCqHYJQooSwxGeDKLgNT8=;
 b=HI/MpzheOO9DP7JyzGl+a3bFkcCKHo9eJPYaBisaK2S3Fn1+vKOWsg3egyhpj4t+X9
 Ly8V293IFYftR/AAlBeN8H9KAD9y6KCgtQMAUnYUe28Dc8vM6igE7FXTlTi9PVRbVRHY
 /OZO5DXqKIXo6Cyn6fQuvi35s3H9dzGaAASC0c/sKd5x7BR9GBn8chU7pAwDGDTwFUb/
 JSRO8+fqFxOOhRDy03Uz/Un3n5q9iY7e7pmnkB4KUqqzZnNgnKxbsDd0DnSXAXgQkGZB
 1SD405ytXODk1lf1KctejXodNqpiGHftSF4wPsmPnr+kAWBCE+p3az2KFA6I2/8Ea6hz
 Ir9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dB8dhmVX1CwoFsrikItOoVuCqHYJQooSwxGeDKLgNT8=;
 b=SWf4dNBfiYDxc1Blzuh8iKQPY4Zeln2hw0Fz5FUHqtAJL0rWSrDAztD2cyjZ5B7Xis
 iEGPkHJqzRCvNuv/Wt1Jj2j98zw6otIbax9P9MfFfwLzQpL6jy820IsPZ+rsppMvZyzp
 6XPUmpL/cedrxe7ddiGZHwzeOP2WYYECoawCU/J4HsSUE/yF2UQ4SNEpeSck8QpP9yun
 buRryXYdT3rQg/TGjlls4TXTfrytPZBsoZklR11Et2ba1WSLhQ+Z6AtrxAdO8j7s+3C2
 BFLa6s4WGn/wj21IsGG09zIyxxj4mRkiO2dhlwIeYHHxFMpoP1J0aSdw0rjFbydVi/Uz
 ceFw==
X-Gm-Message-State: AJIora9i2EbEmE/zknYjbryQI0CuNVCkc2Uoi2yJRwijhp0IU5lZPLWF
 6y8uexTzcwb4nmmFBUtPA850EZVbDDUZ9BEN8PY=
X-Google-Smtp-Source: AGRyM1syY2dmaaVRNUkd92rc/WKV+t3bEdWPEIjpTq4DEE+vBn3CEoNLNHFJUDvccvB2BWZBas+iOknsVfcuCT6oFQY=
X-Received: by 2002:ac2:4e0f:0:b0:481:df0:94a with SMTP id
 e15-20020ac24e0f000000b004810df0094amr7365079lfr.655.1656383035352; 
 Mon, 27 Jun 2022 19:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
 <1655451877-16382-7-git-send-email-shengjiu.wang@nxp.com>
 <20220627230012.GA3122063-robh@kernel.org>
In-Reply-To: <20220627230012.GA3122063-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 28 Jun 2022 10:23:43 +0800
Message-ID: <CAA+D8AOHu4Wvt4gkUCu7NaT_aNcwWbp1c2KNy7WTLnKvtzZ4jA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: fsl-sai: Add new property to
 configure dataline
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Jun 28, 2022 at 7:00 AM Rob Herring <robh@kernel.org> wrote:

> On Fri, Jun 17, 2022 at 03:44:36PM +0800, Shengjiu Wang wrote:
> > "fsl,dataline" is added to configure the dataline of SAI.
> > It has 3 value for each configuration, first one means the type:
> > I2S(1) or PDM(2), second one is dataline mask for 'rx', third one is
> > dataline mask for 'tx'. for example:
> >
> > fsl,dataline = <1 0xff 0xff 2 0xff 0x11>,
> >
> > it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> > rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index c71c5861d787..4c66e6a1a533 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -49,6 +49,14 @@ Required properties:
> >                         receive data by following their own bit clocks
> and
> >                         frame sync clocks separately.
> >
> > +  - fsl,dataline        : configure the dataline. it has 3 value for
> each configuration
> > +                          first one means the type: I2S(1) or PDM(2)
> > +                          second one is dataline mask for 'rx'
> > +                          third one is dataline mask for 'tx'.
> > +                          for example: fsl,dataline = <1 0xff 0xff 2
> 0xff 0x11>;
> > +                          it means I2S type rx mask is 0xff, tx mask is
> 0xff, PDM type
> > +                          rx mask is 0xff, tx mask is 0x11 (dataline 1
> and 4 enabled).
>
> You mean 0 and 4 enabled? Or 1 and 4?
>

Should be 'dataline 1 and 5 enabled, index start from 1'.  I will fix it.

>
> How many 3 cell entries can you have?
>

There is no limitation for entries,  the code in the driver will query the
length first
by of_property_count_u32_elems() then read the values.

best regards
wang shengjiu
