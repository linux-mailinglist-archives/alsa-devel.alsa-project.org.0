Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21863F14
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 04:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECA61663;
	Wed, 10 Jul 2019 04:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECA61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562724250;
	bh=O5mYkKPtW1QcuDf/4xSUs3KYsAmZse/KhN+nSsyg10g=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDNC3yXcmPwfEvAa44FUKpIPLvhaDBYs73ErkaRzaiTRlfJD+uRhBfQ0MihsV4xYO
	 yIxB9B6I3O/miZafK1jTKNkyEm9ZY5lftnHiETC7lCxRZEezgZtyLQ8BAi9p/Ea8OB
	 hxnRaHE56NPMdNZp7hLyujkZSzISi3vncjwNvi5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0685F802BC;
	Wed, 10 Jul 2019 04:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA30F802A1; Wed, 10 Jul 2019 04:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BDE7F800E2
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 04:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDE7F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="W8NM9kgb"
Received: by mail-pf1-x442.google.com with SMTP id m30so272239pff.8
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 19:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5ozlntHdL+bOtNT4Ao+TnnUuHHmNF6lXl3Z50ffu07w=;
 b=W8NM9kgbB7xliKIJEKnoVM053v5lDWkRfoaMeuHpmAd6ZCrXem052uVY+7963In31Z
 IBFu0UUcNMZaqsrQ28XjPseQlb0Fq0euCjm68QyY82ha87aMzOs4TjuM/0rvxAPO/+Yq
 Kgv5/tsvBb6X+JUDOBv/zD3a5Xqs/WhtvSdFEoKqX144BxgQD+G3pEGIvxKgor0+7xiF
 0KYpLqJcZ0KFAWryEyauCFsWodJybldYm3+k0nkucj2zLJiK42CtFcTP/4HiXXxqoVz5
 sPv8IxdAWi9dtmVquthytM65LXfhPVZSbzCUaAqORxDIJ6clB2jIumBGY5F2K8kX+ocd
 oJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5ozlntHdL+bOtNT4Ao+TnnUuHHmNF6lXl3Z50ffu07w=;
 b=mouOX3qIyi/hWrD68V7/KR+XOyu+TeSulUHnT2L+KYVAfDn5Ik3fGfOuU1unPCJl11
 P3prwhelIvWvKXgiTWbE5HJwjTWYF+cuAiY8qhnLrj/f8DNc0BS8c0rgQGY2LmLNhHxn
 ZVm1vPj2wVbVE0RKw05UKVHEzbiwoIS9njeZvKKZAImz6f6rcuPUzdd8sUunMrj1EMDh
 /0CzgadZE10Ssw3Pqgf+H4hBxBAmfCE7Ew4B0t3H/XpEfmEnd1jd6NwSH6TYqxjssH17
 dGv4q07EsvvR9Y0lhPLIgTDDpBvBlKmXzLqLItyFV4OmQEgFp8I7K9dkLuJRP9srnEV4
 lGgQ==
X-Gm-Message-State: APjAAAXhCq+XnvFw19Q2aqCEjeE9ph1rKhiKKkv7f2vOfYC3b6O3jnn+
 du/rY8v0K7CyTuqntZS392M=
X-Google-Smtp-Source: APXvYqyH4iuaZb9I1WmMrypxp2AoldTXAmkmzDe2l43UsFMsM5aA6WPD309XzD6oHM7J1itC5SK4nw==
X-Received: by 2002:a63:f346:: with SMTP id t6mr35149751pgj.203.1562724136460; 
 Tue, 09 Jul 2019 19:02:16 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id k22sm337387pfk.157.2019.07.09.19.02.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 19:02:15 -0700 (PDT)
Date: Wed, 10 Jul 2019 07:32:08 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Ladislav Michl <ladis@linux-mips.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Gen Zhang <blackgod016574@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190710020208.GA12600@hari-Inspiron-1545>
References: <20190704191026.GA20732@hari-Inspiron-1545>
 <20190705201006.GA22085@lenoch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705201006.GA22085@lenoch>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: add irqflag
 IRQF_ONESHOT flag
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

On Fri, Jul 05, 2019 at 10:10:06PM +0200, Ladislav Michl wrote:
> On Fri, Jul 05, 2019 at 12:40:26AM +0530, Hariprasad Kelam wrote:
> > Add IRQF_ONESHOT to ensure "Interrupt is not reenabled after the hardirq
> > handler finished".
> > 
> > fixes below issue reported by coccicheck
> > 
> > sound/soc/codecs/wcd9335.c:4068:8-33: ERROR: Threaded IRQ with no
> > primary handler requested without IRQF_ONESHOT
> > 
> > Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> > ---
> >  sound/soc/codecs/wcd9335.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> > index 85737fe..7ab9bf6f 100644
> > --- a/sound/soc/codecs/wcd9335.c
> > +++ b/sound/soc/codecs/wcd9335.c
> > @@ -4056,6 +4056,9 @@ static struct wcd9335_irq wcd9335_irqs[] = {
> >  static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
> >  {
> >  	int irq, ret, i;
> > +	unsigned long irqflags;
> > +
> > +	irqflags = IRQF_TRIGGER_RISING | IRQF_ONESHOT;
> 
> Why does this change trigger adding a variable?
Yes variable is not required. Will resend the patch without variable.
> 
> >  	for (i = 0; i < ARRAY_SIZE(wcd9335_irqs); i++) {
> >  		irq = regmap_irq_get_virq(wcd->irq_data, wcd9335_irqs[i].irq);
> > @@ -4067,7 +4070,7 @@ static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
> >  
> >  		ret = devm_request_threaded_irq(wcd->dev, irq, NULL,
> >  						wcd9335_irqs[i].handler,
> > -						IRQF_TRIGGER_RISING,
> > +						irqflags,
> >  						wcd9335_irqs[i].name, wcd);
> >  		if (ret) {
> >  			dev_err(wcd->dev, "Failed to request %s\n",
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > Alsa-devel mailing list
> > Alsa-devel@alsa-project.org
> > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
