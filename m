Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D46967A56
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 15:49:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6F01658;
	Sat, 13 Jul 2019 15:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6F01658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563025777;
	bh=DA8AgkdLzalCQViXCxOgeNrV2Di5eZ/k8+8xhG5Lbfc=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L48+Fp3HHuGdAmsslx4cGuuBQFhqz7StdmhgAIsSqndMrxnXDYeiKjOPfTXmszlPH
	 WZsFC0DJUl0EgVWYIK0/Z+xS+LbvVSYkoZsc8CQffuLYXFqWf9dl1Ev++oEbvVrPS3
	 jZXZpqw8Ljahdv7n0unpkHA0RzrIwq/WQ7MauxmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0024DF802BE;
	Sat, 13 Jul 2019 15:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73E9BF802BE; Sat, 13 Jul 2019 15:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9A59F800E1
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 15:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A59F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ma5ZI12l"
Received: by mail-pf1-x443.google.com with SMTP id g2so5529714pfq.0
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MHQBlqOJyDDBTOKEayCnxnSR5munfqfFU78suNbldEE=;
 b=ma5ZI12lrynFaFq1wLNZC05ShF9C4Nts9tZIFj8OvXtp8WeNkuxldGyQbBwe0GZd1P
 zuNCYWgikc/cQdadbV4+8Gh6puzyackdUOLErtBHBKeRhZ/X+Xrkspn1twK72wyjxg8O
 9yj5y5CHmXySPbd7mvQayFRQYwG1cjMgCXOVAeCjKVrd23sgt08AuQe2a2M7Iv4XxmHH
 qjZ5ZCBgY7nG+15syDrBGfMy0AQ+p66nbl3DRUPM45C41TLAch0kIKaaCYu5Sz6Mvxto
 12xZ83WzEh3uZp1tAI14k8cJgGS6Xn7N2cwmoxbWRFoJSpxa8Bwz+UaqZYbht9Tod5gr
 fMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MHQBlqOJyDDBTOKEayCnxnSR5munfqfFU78suNbldEE=;
 b=hxhkbQSX3C0TO6qxl2LmrLpIOGfVRo4ZMdyrMOts2Gpy3iQrGia7dkioyR0xFoEg68
 lfkolFU6gp+6UUBiX7fEuQNIawOb0x/YSxIVOzaeOpb3dmJa8SmXO5E2WrcaXc9p6OvR
 03RwxuCg7Tcir8sKwHUCYDZcCtgvIbCKTrhiCvCi72tYKGPud0lBkoPaTropNH2vbemU
 o8M/QTWh9H8PB9TcXB4JHQo5o7eEJyxkUTBt21bgyi6N5J6AieX9MtJmXD2VPEZspW6R
 pVk7LrutkZ8g9aYsZRaQ1rxXiy5BpgM5/BPjFHAhn0xZNUJxzNBL4M5i7OvI37WVUIJ3
 qLZg==
X-Gm-Message-State: APjAAAU919H18ntChoOV8WEhLqRGhzSaZl1pYas6sEndjzqTKR8vszXY
 6OJniy3DIUPmLa8yDcc9LWA=
X-Google-Smtp-Source: APXvYqx4idiwBlGEcHoYCRhzdK6VMDt71COUdgiJS35nV5ptO3rXo807rxCRKPLRa5tJHgbse51/kA==
X-Received: by 2002:a65:5cca:: with SMTP id b10mr17317538pgt.365.1563025665379; 
 Sat, 13 Jul 2019 06:47:45 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id cx22sm9934041pjb.25.2019.07.13.06.46.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jul 2019 06:47:44 -0700 (PDT)
Date: Sat, 13 Jul 2019 19:16:34 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Joe Perches <joe@perches.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Wen Yang <wen.yang99@zte.com.cn>,
 Gen Zhang <blackgod016574@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190713134633.GA9749@hari-Inspiron-1545>
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
> Please ignore this patch. 
> Both statments in if/else loop looked
> similar to me but they are different.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
