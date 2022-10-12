Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8005FC6D7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Oct 2022 15:55:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139034D91;
	Wed, 12 Oct 2022 15:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139034D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665582953;
	bh=8JybBO/16pHNjjikNr0vgTSkWJmzNR7XVZ8kBWMUEbo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jj2fq7XYrJQS94aojShE5BuG8KGJhE1i550fjUvwDVgTs1khlCapVl/OvSapoFyez
	 IKBhqLFeFSi3zX0NxPNkLDdWYHOojm0XB0JDXYoD5R8lu2TvpWOts7Gv8C5riXll8L
	 CUjeRIt0XdFt/ZHC/sCIiVy76XTd/2siMnaH+Mvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 781AEF802DB;
	Wed, 12 Oct 2022 15:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DB6F80246; Wed, 12 Oct 2022 15:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA37F800F4
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 15:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA37F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UozGTu6Y"
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so2038078pjq.3
 for <alsa-devel@alsa-project.org>; Wed, 12 Oct 2022 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
 b=UozGTu6YyIYkQQoEJ9mpP/ZP9EXBHkczxk9/ST0nwoYD5CXIifS1ksxnJ1z/XlD8Iv
 DnXdQDc3QD5BBRt/elc/g3MpiMLgBMvz47ICmyWRQUwskodG72pwSD0FvOfnFwxR4gNT
 0Nv0c1ZEd9a//beEgotrvzkxpjlIn11dOn3z2tb/KyektIxRp3AMw9k8NLnKlAlJMfAZ
 ZW00APC6mm2Rgc0I9F6MtW+FIkz4pX/PUfBY7jV2tV/BJmcb7sxvPImZbSg5MEvkpS1A
 VQqSmx00wjuq8wBY7o0koQO6OL1C+JRHOCj4nWqmVRt4CML82YQgP9dT0rzT4hrO952e
 5MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4W9PYnqE39FVIWPtx23Tk+GKt7RrA3d27Hf1sKJ7FqQ=;
 b=qgN3nvPO5CD8Ri56XwLMhvuybx3289XGqM0sTyBmZB9ZT/Ltqms7Ull+cu953mnkaR
 hJli824xSrzSPhEf5CE/Fmp+4Z6yDp+xi/sRUMARVw2PYRc+yCr/swxurmmqAWFMe/b9
 mR5st5YXYxlTSPERnYkP9UnUPcY+5AYDADNFwZd/I+83E2a+iXXFAk88INWaL/EJFjrN
 ZBOBUTiBtcycMsBRqtxoMTPBMNU05hPYlSJnmpfw6/dmXdL7MoQmVE1rbP2oItdIhuXM
 CfcT1xBk4NI6+oX1ZOXNbORbkzyUk11av93pB1c4xwXmPNzacAxzSSBu3t4D/cMzMe/B
 LlXQ==
X-Gm-Message-State: ACrzQf2u1v1i/Uk07JqUUAb0IEHWGRTQArRI5G7eUa+M7yv+zeLYaDez
 Awz3RSuyqjFWInP1+G2H5pY=
X-Google-Smtp-Source: AMsMyM4GsOvqLbKi8bnipwZei9bul2eCxZ/xzZEAA7xagdE0qfFC/6Wvyu2i9hoIPRYsb/0vz6gCvA==
X-Received: by 2002:a17:90a:f2c3:b0:20b:b75f:2f9e with SMTP id
 gt3-20020a17090af2c300b0020bb75f2f9emr5408380pjb.43.1665582890145; 
 Wed, 12 Oct 2022 06:54:50 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
 by smtp.gmail.com with ESMTPSA id
 s20-20020aa78bd4000000b00562f6df42f1sm8959924pfd.152.2022.10.12.06.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 06:54:49 -0700 (PDT)
Date: Wed, 12 Oct 2022 21:54:39 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0bHH06cbngWk4mH@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol> <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0bBXSHyxpdTGxoU@smile.fi.intel.com>
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, patches@opensource.cirrus.com,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

On Wed, Oct 12, 2022 at 04:30:05PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 08:01:27AM +0800, Kent Gibson wrote:
> > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > -#include <linux/gpio.h>
> > >  #include <linux/gpio/driver.h>
> > > +#include <linux/gpio.h>
> 
> > But moving the gpio subsystem header after the gpio/driver is not
> > alphabetical ('.' precedes '/') and it read better and made more sense
> > to me the way it was.
> 
> Okay, I will move it back.
> 
> ...
> 
> > > +#include <linux/seq_file.h>
> > 
> > I wasn't aware that we use anything from seq_file.
> > What am I missing?
> 
> 
> Eventually I can answer to your question: the commit 0ae3109a8391
> ("gpiolib: cdev: add fdinfo output for line request file descriptors")
> is what you are missing.
> 
> That said, we need this patch.
> 

Ah, yes - totally forgot that one is in flight.
That makes sense then.

With the gpio headers retaining their original order:

Rewiewed-by: Kent Gibson <warthog618@gmail.com>

> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
