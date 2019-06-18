Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFA84A99B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 20:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C5816DE;
	Tue, 18 Jun 2019 20:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C5816DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560881721;
	bh=MgOKmD8Rhi0ypVuNQyumX4Eesg4QO7c/3zk7rxJlFBQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QtaF6PqmnfVUDAUUmaMCcZ7J6LZYuWgZfHpcRjfOq2pcAgFNO8UGCFp4d7aZ2eqw6
	 yhhrjRYZTWjL6MlntSWcrS1EZwNtULAiBmyFGGeLlbpZ73iZqyMzQmfk0aZJa9GTyQ
	 cQVRMDflooqumkOISST+up5Oyz7YfAdUHRdAB3Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CCA5F8971F;
	Tue, 18 Jun 2019 20:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A1EF89724; Tue, 18 Jun 2019 20:13:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E3BF8971C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:13:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E3BF8971C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ATAktAWz"
Received: by mail-lj1-x242.google.com with SMTP id m23so459572lje.12
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u0LO1voIJdc5rwD/tpLzm7lno4EknpAahwh3tgnDyWQ=;
 b=ATAktAWzRWJqwtcElWQ3cEKWeBdAWybAa8BzjTELprX3qa5UtsSUFtLxLcl1e/YGPq
 g/Nd3wXZUBrBwPrePMRdUhamp6KDoHsnA5S5Mm3vsE1tUY9qOYmECzbTxLFpddgidmpX
 MQiRQ7a5kL8+Tm5W9xGYvvaSFgmsVo1CrptxXjZ2CQg1ZJdGE/K8oTWGCaie7xUJQBk2
 eQAwDPPNBbH4wnMCtXAtXj0ZX62MuK5oqdIqNw9AxRBTIEpOVYoCtUOhhkev1elc5+qE
 Y0v+IBWbBwzDWuGCYPk/UM+VdbxJy54xZdsSgN8v1kEp3DfLVNy4I1QZrhWJye8sV2WM
 2IYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0LO1voIJdc5rwD/tpLzm7lno4EknpAahwh3tgnDyWQ=;
 b=jnXF/GxeDQgIiTTus6cThsh6fEI8MKmmN6yStbhtNLJH8SleBH610Q9dbNn5RYtaCd
 PP7OKUB2t0NMoYKZTr5UsK6hyxZMIP+0VRm3/x4B30FpwJgPo0/tiiHf+Z9eo0E5BIEQ
 eFiEwJSMWfBBhK9S/2N96cxAHT9bs2O1tf79zKecljN1+kPrCFwuQoOPq0BpOX1pMpho
 wifI2fpRPwlrrsjNRa0wiqAhUwGAdZghYawbGlPxdANC0AJiK1h7m7VY/wugL6Nrcx9K
 FndeEvf0ex/pXVjsSfRmlsU5W0JyiscwtjF6SVwCtOqKn/B9wrmoQJBXSQRPcQBoK4jn
 D50w==
X-Gm-Message-State: APjAAAV0uMGfQcv3JVo08pmkbY4UEvjIkXhw7CvnMDdtioc1cavBToOW
 l0Ac3ULvL9Wy7DllBXNI8kyMkgk1nrwpdcpE5TNECg==
X-Google-Smtp-Source: APXvYqzttjMGTsCm4NOJoHIaebz4OVBkTcqC7LsTaUDReiBRtrpyuiRrFKDNbdxG8k4tXulYkhc9wCAJ03yN7NWCrX8=
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr557672ljj.160.1560881589735; 
 Tue, 18 Jun 2019 11:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190614194854.208436-1-fletcherw@chromium.org>
 <20190614194854.208436-4-fletcherw@chromium.org>
 <4e560e12-4c20-8d5d-b3f9-587a55da279d@intel.com>
 <CAN-6NYZzMqwDaw2oDyms4P9uKFPJvuQOtGbqMWLtFV3kDyQHJQ@mail.gmail.com>
In-Reply-To: <CAN-6NYZzMqwDaw2oDyms4P9uKFPJvuQOtGbqMWLtFV3kDyQHJQ@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 18 Jun 2019 11:12:58 -0700
Message-ID: <CAOReqxhETC9xAojXyDWLMOJ3W22Zn4GNGry44=XC=t_k7SCHqA@mail.gmail.com>
To: Fletcher Woodruff <fletcherw@chromium.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [PATCH v7 3/4] ASoC: rt5677: clear interrupts by
	polarity flip
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

On Tue, Jun 18, 2019 at 11:01 AM Fletcher Woodruff
<fletcherw@chromium.org> wrote:
>
> On Sun, Jun 16, 2019 at 10:56 AM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:
> > On 2019-06-14 21:48, Fletcher Woodruff wrote:
> > > +static irqreturn_t rt5677_irq(int unused, void *data)
> > > +{
> > > +     struct rt5677_priv *rt5677 = data;
> > > +     int ret = 0, i, reg_irq, virq;
> > > +     bool irq_fired = false;
> > > +
> > > +     mutex_lock(&rt5677->irq_lock);
> > > +     /* Read interrupt status */
> > > +     ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
> > > +     if (ret) {
> > > +             pr_err("rt5677: failed reading IRQ status: %d\n", ret);
> >
> > The entire rt5677 makes use of dev_XXX with the exception of.. this very
> > function. Consider reusing "component" field which is already part of
> > struct rt5677_priv and removing pr_XXX.
>
> I was using dev_XXX, but I believe Curtis found that 'component' was
> sometimes uninitialized when this function was called, so I switched
> back to pr_XXX. I may be misremembering though, so I'll let Curtis
> comment as well.
>
The issue here is that the IRQ is setup in the i2c probe and the
component is setup in the codec probe. In theory if the hardware is in
a bad state you can get an interrupt between the probes and have the
interrupt called with the component being NULL. It might be worth
considering migrating the IRQ setup to the codec probe so this
condition cannot happen and then we can avoid using pr_XXX.
> > > +     if (ret) {
> > > +             dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
> > >               return ret;
> >
> > You may want to simplify this, similarly to how's it done in your
> > rt5677_i2c_probe - leave message alone and return "ret" explicitly at
> > the end.
>
> Good suggestion. I'll update that for the next patch.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
