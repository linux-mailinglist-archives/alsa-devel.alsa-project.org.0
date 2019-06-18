Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 981144A937
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 20:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2904616CE;
	Tue, 18 Jun 2019 20:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2904616CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560880995;
	bh=b7i2WK/jrDZaY37RlN489WifizWJUwVHvnkZsReqGa4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HW6EUx6U129z/sLdfMEqfl0cRKbRpmyEQO/BWSNtAjXyEJWDUam1CDEbgWNdE4fvY
	 b94CsqIyrmV/Da+XugImLOTTNpfvDgTOS6tEIsFlECK7grwrD5gTLVRkm/5x9YmrsT
	 ryIv1ARsgK853FLbhFYQJYnK5dP4VjwB1f96CYd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1005F8971B;
	Tue, 18 Jun 2019 20:01:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 977DCF896F4; Tue, 18 Jun 2019 20:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E603F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 20:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E603F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="j9e6WBhg"
Received: by mail-wr1-x443.google.com with SMTP id x4so488296wrt.6
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4TRvD1f7mrzpWOl3NEs7czvhz+VRSz0lAkw6qBXnFLE=;
 b=j9e6WBhgGb2m272a9Ty7hK1Ru1Z8Et6pItbk3oLasaW5jrj9fVMlunQDavatnrdA33
 nzb+9HMIHPnH0Bnc8VFVGe38iQgbZxOUWbgSvfQgbfW8Vg2kHgOHg82aiuJqUfiLiQXr
 OmIJ73VMFS+TMf2dz94G4VDkLJiq4ACZ7CDus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4TRvD1f7mrzpWOl3NEs7czvhz+VRSz0lAkw6qBXnFLE=;
 b=siE8B6OtifRHpeUJ5Y8v2pUhpslL9o5gjUYdXc3o/uiLOI+BFurhXLSztFlybD1SiL
 /s/xp0s6248sUi7mT0H0+9pA9jT9S85ECV0zekXKvM46XZALYyjyxHfB1MMXZXN1EhzQ
 X+REyt2hRYy4lNe95Xk1B611/XEJ/qYpwVSjXyLFNL5QF8MZax3DlCwZvDz1larWEFlF
 E+UcqqY5AiZ6hdZ+9pXipc2sNO7RWrAuGxHOeF+TooI8kxN4Ntdf7hHoh4ZeleeKZMA4
 cgboIlZpKipyJQ8+wRi5zw/UXmyeOvlkxeGZSOWzOg7l6WjjEEunycXCN3JFMa/eJRGc
 VQWw==
X-Gm-Message-State: APjAAAVVYgn6MXgeyRkN+e41V+aRgdLNgAQZe1Zs6iX2O9JolPKWHWK0
 xUod7fzX8FmesMlx5CVfVKFk5Y01QuNp4cWQKFNqqQ==
X-Google-Smtp-Source: APXvYqwkn/0bji0EJR+RJ98lDU9MBxhi3sf57NOIolkAwzcM8iS5SXwpkxoB2LXqSdeNugUR3A0nxHrOSh8c0/Naa04=
X-Received: by 2002:adf:ff84:: with SMTP id j4mr4994173wrr.71.1560880885230;
 Tue, 18 Jun 2019 11:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190614194854.208436-1-fletcherw@chromium.org>
 <20190614194854.208436-4-fletcherw@chromium.org>
 <4e560e12-4c20-8d5d-b3f9-587a55da279d@intel.com>
In-Reply-To: <4e560e12-4c20-8d5d-b3f9-587a55da279d@intel.com>
From: Fletcher Woodruff <fletcherw@chromium.org>
Date: Tue, 18 Jun 2019 12:00:59 -0600
Message-ID: <CAN-6NYZzMqwDaw2oDyms4P9uKFPJvuQOtGbqMWLtFV3kDyQHJQ@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>,
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

On Sun, Jun 16, 2019 at 10:56 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> On 2019-06-14 21:48, Fletcher Woodruff wrote:
> > +static irqreturn_t rt5677_irq(int unused, void *data)
> > +{
> > +     struct rt5677_priv *rt5677 = data;
> > +     int ret = 0, i, reg_irq, virq;
> > +     bool irq_fired = false;
> > +
> > +     mutex_lock(&rt5677->irq_lock);
> > +     /* Read interrupt status */
> > +     ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
> > +     if (ret) {
> > +             pr_err("rt5677: failed reading IRQ status: %d\n", ret);
>
> The entire rt5677 makes use of dev_XXX with the exception of.. this very
> function. Consider reusing "component" field which is already part of
> struct rt5677_priv and removing pr_XXX.

I was using dev_XXX, but I believe Curtis found that 'component' was
sometimes uninitialized when this function was called, so I switched
back to pr_XXX. I may be misremembering though, so I'll let Curtis
comment as well.

> > +     if (ret) {
> > +             dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
> >               return ret;
>
> You may want to simplify this, similarly to how's it done in your
> rt5677_i2c_probe - leave message alone and return "ret" explicitly at
> the end.

Good suggestion. I'll update that for the next patch.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
