Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E51935FB45E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 16:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0585D3D8E;
	Tue, 11 Oct 2022 16:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0585D3D8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665497656;
	bh=5jXqdsXUovE+qF81a6gy3SwgqQU3yY9aoQqP11tz3aI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KG3E/jujP4mb+CCB0FgAp61GlZ4qeA8peKrm+bVAJq2ZTateFXlsKBjNYqY2M9Dwl
	 ejnIVrtnvpGkZfXDCXABNCaY9Lt3Qy03wSo5IeOrgkMJHXZk3iNTnneKd+K9LxWCcH
	 3VASqclEEE/2TISyAIXy6rG+Av0b6oa7PST8Xgw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D870F80130;
	Tue, 11 Oct 2022 16:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF02DF801D5; Tue, 11 Oct 2022 16:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,SUSPICIOUS_RECIPS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E24F80130
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E24F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ce+BVV5v"
Received: by mail-pf1-x431.google.com with SMTP id f140so13650196pfa.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 07:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
 b=Ce+BVV5v8U7whmYd/FcwKuyV+liXHdnCihvE4vxDmi/zFRXHgG5BsKzJlkvJm3ymzp
 i0kk+obd9ehg5kvdXpvifSYQKkIBJbAwLGSIa8MzHAOItPx5O2ghaGpv98wheUqfKMtx
 xYK29jqCSGAVqjF4MPQoXzVWPbY3qWyTm0lvTcEBlWPddeF6YcST3WGeI8+5CF6qMkzB
 /lDnL0m98oNEh6bOyWy8Twswwetn33Cy9kGtv+34nK50zqhZaf/wZPS7BxRAs1neYTBy
 /bZWo8ysVbEXrzMM/+HfoBHs8qu8Q0eGt0b+IXToEUouhHiAP9GLUrTwNKB7EENxNPMI
 wO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
 b=gTXQNI4rKjWKtxDE1OGhoa/IEbJEz+LX75Lb0zFtpom6oseULqoShTLIPu7Rd+Va8F
 WYsoo6LtS4YK0KIWqXmjZYCK7TmOPMYnVkWCaRoBAvvKpVP38r41MJLzEh3+ZIrt2rYJ
 If+YJVg1ksydkYNW3NrS6okVvqvf1IXTZeAPzWxojlDm7HOq2NIe9QIvQNn548hzvgZ2
 YaS4IPm0k+JGGyntgG0wGRGdzyBuivb11WbmUAdjAuR3faJCUDgurfT31RAIFYj9Gjtu
 A3Js7/NKpc8+QegtUC74xtUNROw6Dcu3ux/PWR2Qh2Jv3V3z+hiMvjoKDywlOMsiXAEZ
 kc0Q==
X-Gm-Message-State: ACrzQf0hG/iYtKsvya30O3j0qChgU2gT7Q0iUjuuv6YsdnvDuow+R7TW
 gFf+Mn7AMCu+BNfRNSgn5Ew=
X-Google-Smtp-Source: AMsMyM6A7bmN99+8aFFd/V9x8yL+08obUJvhZG8B8wKWgbvIl/Bh1jOgBftu0u99farGA2SFP/OdqQ==
X-Received: by 2002:a63:8643:0:b0:462:9b02:a0c1 with SMTP id
 x64-20020a638643000000b004629b02a0c1mr8758435pgd.536.1665497593024; 
 Tue, 11 Oct 2022 07:13:13 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
 by smtp.gmail.com with ESMTPSA id
 q17-20020aa79831000000b00563ce1905f4sm1492741pfl.5.2022.10.11.07.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 07:13:12 -0700 (PDT)
Date: Tue, 11 Oct 2022 22:13:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V57gI75ik4ki3A@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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

On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > -#include <linux/gpio.h>
> > > >  #include <linux/gpio/driver.h>
> > > > +#include <linux/gpio.h>
> > > > +#include <linux/hte.h>
> > >
> > > Ok with the hte re-order.
> > >
> > > But moving the gpio subsystem header after the gpio/driver is not
> > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > to me the way it was.
> > 
> > I see, I guess this is vim sort vs shell sort. Strange, they should
> > follow the locale settings...
> 
> I have checked, the shell and vim sort gave the same result as in this patch.
> 

The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
and that still returns the same result.  That matches what I would
expect to see given the content of the text.

And for me vim also gives the original order.

Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

Cheers,
Kent.



