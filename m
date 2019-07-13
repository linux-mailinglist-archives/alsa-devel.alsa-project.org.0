Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9767A5B
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 15:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB4B1675;
	Sat, 13 Jul 2019 15:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB4B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563025963;
	bh=szFVR24UNNEnjXG4JDwYhNFskcUng02QZdlkTLiEuco=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/RID9CFX4+ggEgl7Z9I+1yBBhHppOdDKtjupLyYCagdPCwjbhVotoZBy3s/QR3yW
	 CWeJuWHLSSKaTJFDWchHiPJOAVXm7gPFlo4zFV/0NW/Uksesb0DYyvm5o+LoydGG9O
	 6SmdaJmehq1uhCvjnXV3vk6WMFydZa2dqISioNBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52E77F802E0;
	Sat, 13 Jul 2019 15:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23A2F802BE; Sat, 13 Jul 2019 15:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F3B9F800D0
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 15:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F3B9F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="q2M9092B"
Received: by mail-pf1-x443.google.com with SMTP id i189so5513335pfg.10
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SJUeu1gN7/mspxsTa9EOncf4StCjWZ5cgxwVtZifj3A=;
 b=q2M9092BrLcdUt5eYWDzQ+aCrFKTpwzF0n0qmbHJ3eXbDuRK9+aoKd1YPZWKzOzhQR
 U5nsaMEOWJi470JXtoCvLB1l7lfDugZdeMbEg9qbL+AKGPLdxjqYKKvpUi/AqIO8aSn5
 VbByuVEycdkVv/oazW5sIvaydMKxKaoJKZ/m9dqAp+aiynsf3kglFptTAHo7v6+hcMXm
 6ojRuygk8qRbgngucJjsaIDuREbfMNtKVyKfMagXQTmzN1AQjN69ATFpOxCIHQo+CGuq
 iTD/2kS4Ehp5UdnpWsXNfOJF3Tkas1QBCjRUSlotHPJZByP9lLLjsEZBve3IZm4mwRc+
 f+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SJUeu1gN7/mspxsTa9EOncf4StCjWZ5cgxwVtZifj3A=;
 b=OcRzrFxb7fPyggwx0bswMDyQBjyPPnFM+SJro4Jzu36YdKu0RoddrK+yyXqUbpJ1yx
 0eHeoPHVp9hV4mGDsW5Di+U5+YMx5FFpHFQMW0OCfdJsmK6qJB1yQ5CQvCsqhags/d92
 /+dSdZ47GsLJQgA8HnYMa862WoTYRZequMElP42WpkcKLc7Y//AeC8wlJPNcHZfl/bDX
 XZnnp6M9Vmn+i0NlBa5GFd6gka0T5b+hk9qNOeeV3QTfBSMVXu62Wb1hWRsJPLjv8xSm
 uDYiVsPHy4oEMDTRZQFp2HW2M9XLaKxId06M3FjpH9+lq89YLj6Ym2MEt7iKQEOA+MoR
 JimQ==
X-Gm-Message-State: APjAAAVR0SrzH/JyLaUuNwse1EqzAgY7zgwY6C51pMXjqEw8Ll1WNxDD
 0FbnRXF31poalK5HTQCJ/pw=
X-Google-Smtp-Source: APXvYqyIM6CVUjQDdabYvb7cg+9KblNmVYXrAnlO9WvKLuI6RbbFepWnviqkQKUYNBMzmGYkjb5Yhg==
X-Received: by 2002:a17:90a:1904:: with SMTP id
 4mr18892921pjg.116.1563025852464; 
 Sat, 13 Jul 2019 06:50:52 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id l124sm12080395pgl.54.2019.07.13.06.50.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jul 2019 06:50:51 -0700 (PDT)
Date: Sat, 13 Jul 2019 19:20:46 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Joe Perches <joe@perches.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>,
 Gen Zhang <blackgod016574@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190713135045.GA15087@hari-Inspiron-1545>
References: <20190711174906.GA10867@hari-Inspiron-1545>
 <eeeb09518c8967ffd48606c3d1222553752e895d.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eeeb09518c8967ffd48606c3d1222553752e895d.camel@perches.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [alsa-devel] [PATCH] sound: soc: codecs: wcd9335: fix
 "conversion to bool not needed here"
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

On Thu, Jul 11, 2019 at 03:00:00PM -0700, Joe Perches wrote:
> On Thu, 2019-07-11 at 23:19 +0530, Hariprasad Kelam wrote:
> > Fix below issue reported by coccicheck
> > sound/soc/codecs/wcd9335.c:3991:25-30: WARNING: conversion to bool not
> > needed here
> > 
> > Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
> > ---
> >  sound/soc/codecs/wcd9335.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> > index 1bbbe42..85a8d10 100644
> > --- a/sound/soc/codecs/wcd9335.c
> > +++ b/sound/soc/codecs/wcd9335.c
> > @@ -3988,12 +3988,7 @@ static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
> >  		regmap_read(wcd->if_regmap,
> >  				WCD9335_SLIM_PGD_PORT_INT_RX_SOURCE0 + j, &val);
> >  		if (val) {
> > -			if (!tx)
> > -				reg = WCD9335_SLIM_PGD_PORT_INT_EN0 +
> > -					(port_id / 8);
> > -			else
> > -				reg = WCD9335_SLIM_PGD_PORT_INT_TX_EN0 +
> > -					(port_id / 8);
> > +			reg = WCD9335_SLIM_PGD_PORT_INT_TX_EN0 + (port_id / 8);
> >  			regmap_read(
> >  				wcd->if_regmap, reg, &int_val);
> >  			/*
> 
> This change makes no sense and doesn't match the commit message.
> 
>Please ignore this patch. Both the statments in if/else look similar to
>me but they are not.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
