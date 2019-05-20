Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2FD240B2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 20:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3831F1654;
	Mon, 20 May 2019 20:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3831F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558378268;
	bh=XBZeAuNLQpqDXQJaiujytKbem2i99DDCJBaTX6P2OdU=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMYjPDXM2hYP74RSEMEfH9efl6QLPYFtnHMxq5+rR6Ft4g0Z3hof0r6mZ4+hFKIj+
	 OyElLgKazwvEFz5tFwkI8DZmzooU5lj4KTey1pQxgWonJryeboEOg4e6Xdq3i4XAYU
	 MDSFstXWhRJM5OT5Pi5y6NvYHa+4sxId5G9uJzB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77193F8961D;
	Mon, 20 May 2019 20:49:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93CF8F8961D; Mon, 20 May 2019 20:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ECA3F806E7
 for <alsa-devel@alsa-project.org>; Mon, 20 May 2019 20:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECA3F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Zojqde4t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wb+fGsrgFIO4zy7sbGCFYlIGC0R6uH3Db0pCCn/9dt4=; b=Zojqde4tw+V4l+BBfsSUN3yweL
 Chr1yFIu45bzFs5tkDp64cmzL0iufOPFd3do2BO9EZmOiYzMaicaNDhkTtqnACfcuTi1ooudTQl6c
 96K2oy9qZIWzjxrYXJAFIfc0l8SkM9NaizpnZc6XhV/9SKynE1CJuN8kiFJ+E478nu8kWA3KE5fvM
 Qt47HecgWugA6Dzgwd0EXLlq3GfOWE+jo+yiGwImf0EO+bZcgBaZyehdwez0fRAB4R6i3q48kHvLv
 71X8GLruich8FP6hrNNSsKJRn0Ax440FEE1AVyUmRW2MUPL9LsbIDywEBwgjvlo2hNv7wFwT8Kq/6
 duRMfX6w==;
Received: from 179.176.119.151.dynamic.adsl.gvt.net.br ([179.176.119.151]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSnLM-0006ki-3Q; Mon, 20 May 2019 18:49:04 +0000
Date: Mon, 20 May 2019 15:48:40 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20190520154840.64f91ad2@coco.lan>
In-Reply-To: <20190520154244.GA99937@ediswmail.ad.cirrus.com>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
 <fb47879d405e624374d7d4e099988296ed2af668.1558362030.git.mchehab+samsung@kernel.org>
 <20190520154244.GA99937@ediswmail.ad.cirrus.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 patches@opensource.cirrus.com,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH 07/10] mfd: madera: point to the right
 pinctrl binding file
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

Em Mon, 20 May 2019 16:42:45 +0100
Charles Keepax <ckeepax@opensource.cirrus.com> escreveu:

> On Mon, May 20, 2019 at 11:47:36AM -0300, Mauro Carvalho Chehab wrote:
> > The reference to Documentation/pinctrl.txt doesn't exist, but
> > there is an specific binding for the madera driver.
> > 
> > So, point to it.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  include/linux/mfd/madera/pdata.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/mfd/madera/pdata.h b/include/linux/mfd/madera/pdata.h
> > index 8dc852402dbb..c7e0658eb74b 100644
> > --- a/include/linux/mfd/madera/pdata.h
> > +++ b/include/linux/mfd/madera/pdata.h
> > @@ -34,7 +34,8 @@ struct madera_codec_pdata;
> >   * @micvdd:	    Substruct of pdata for the MICVDD regulator
> >   * @irq_flags:	    Mode for primary IRQ (defaults to active low)
> >   * @gpio_base:	    Base GPIO number
> > - * @gpio_configs:   Array of GPIO configurations (See Documentation/pinctrl.txt)
> > + * @gpio_configs:   Array of GPIO configurations
> > + *		    (See Documentation/devicetree/bindings/pinctrl/cirrus,madera-pinctrl.txt)  
> 
> I believe this is trying to point at the generic pinctrl docs
> which now live here:
> 
> Documentation/driver-api/pinctl.rst
> 
> There is a patch to do this already:
> https://lkml.org/lkml/2019/1/9/853
> With the latest resend here:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2001752.html

Ah, makes sense to me. 

Please ignore this one.

Thanks,
Mauro
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
