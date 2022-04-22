Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382450E1B0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:30:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF9817B4;
	Mon, 25 Apr 2022 15:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF9817B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893450;
	bh=ge4QvlElJtHZHsWDHGdc7pDgQomhMEpjcC2EyX6tHAU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGzLva9ZtYLQl7O6DXgKIXm8P9DoOzG2iUiCbdTV7AcEW+XeqHN85o3ymUFWy6kh/
	 8rTwjHES5jX5HCddEkeZeZTdVwhw9IUI1MF1sGbJdAOFWUbOWxCAt/QqVbUMmZY8c/
	 5XcoAVy64ECdgTE3bOZXwE9If7Rzq1t4i2RZy5J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3D0F80535;
	Mon, 25 Apr 2022 15:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18B58F800D1; Sat, 23 Apr 2022 01:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6677F800D1
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 01:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6677F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WfyERyMX"
Received: by mail-ot1-x32b.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so6520373otu.4
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KoWXKICOXrLwboX1KRSR8wabyc5tj+p6lrbCOGJNsB0=;
 b=WfyERyMX7R5AXo/rMMIl6y8nSXixykdVRLEdinY/MomqcCB5r5ZQbLs3BCON1JbJid
 SYBch1vH11Gbyyr7uHnb4uKt0rpEYLwWG6jPVzGB/6YTjnfP6B6nc9E72CRX17Qo8Nv0
 hqL9sBFF2f0anLzd4y4fWfHceVS7UFZj4OgGcGq3zFsQ1W26Ro4FtkgUsgVmFt6FTodv
 WJhhQLAQTlQE5ybgDgtXzSu4H0hkfGnY/mdPQk846Y0PZFkSuevMtu2SOCSNLfL6QGeG
 2/n/ZJOa7dCF4cmxGePvIEuDB/dkYth22mYrBof0ZAwoE1ogpw42s8W4hmZGYwun6WYu
 NaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=KoWXKICOXrLwboX1KRSR8wabyc5tj+p6lrbCOGJNsB0=;
 b=Yt5Lv9gg2aioJ9nrkLoQt2tukvLaVC61f8pDBcynO9YG8o5fNZ7UElo5IVtqPxFxis
 aF4oPmju/EyS87hG7b07PlXIltKSCVLvCDUo3IRiw3vqNNGGz9BfSTzZfGb4WTzlERyF
 JJnic2o97ow486iRSQFDiAdIUhqRLdTF5m6o5jGt1RsWrpuqsi4c7d66ILLCAM8sE/fH
 Q+y5E0uidhdn1aLLxQyDGGutJcxKHfh5be1ky12/vsRW3cIb/BzORdvxD3sYZbBeY6sX
 FPP94FiT2QfKSiRVbwHG4ZrD3wMzAYZz++M9wnGrDLvghBIp4Y99oC9c9W43VVUrKpk0
 P28Q==
X-Gm-Message-State: AOAM531xuyLdONiDc/Gu3XU+8yHYJ2b1WDd29sO0QaY1ncIPxB0MXfDO
 EW8ArrHxO3LjaDq+93R1aCk=
X-Google-Smtp-Source: ABdhPJwKkrwKpAYwt9fhjngX1DM/06254YDKfs9CDiPU2Hx7eNlH3p/K4fmqYt8gQFcOM67kG0jDEA==
X-Received: by 2002:a05:6830:14cd:b0:605:4e77:6472 with SMTP id
 t13-20020a05683014cd00b006054e776472mr2672213otq.94.1650669519778; 
 Fri, 22 Apr 2022 16:18:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a9d5f0f000000b005e6b67945a3sm1256410oti.15.2022.04.22.16.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 16:18:38 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:18:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Message-ID: <20220422231836.GA3202260@roeck-us.net>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 25 Apr 2022 15:27:44 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
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

On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 4/22/22 12:16, Arnd Bergmann wrote:
> > > On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > Which machine did you hit this on? Is this on hardware or in qemu?
> > >
> > qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
> > Also, I just noticed that the failure is not always the same.
> > z2 fails to boot from initrd, and sx1 fails to boot completely.
> 
> That's a lot of machines failing, I hope at least we got the same bugs more
> than once here.
> 
> For the I/O space, I found now that PXA was not using the standard
> virtual I/O address yet, but instead used a NULL-based offset.
> 
> I'm not entirely happy with this patch, but this is an outline of what
> I think we need to fix that: https://pastebin.com/3nVgQsEw
> This one is probably incomplete, at least it breaks sa1100 for now,
> and it adds a bogus CONFIG_PCI dependency. I'm also not sure
> in what way the last patch in the series triggers it, rather than the
> one that removed mach/io.h.
> 
> I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
> If you have a custom config for this one, make sure you get the right
> DEBUG_LL address.
> 
> > I'll do another round of bisects.
> 

So ... z2 bisect points to the same patch, but the error is different.
As mentioned, it does not recognize the initrd. Oddly enough, booting
from initrd works for the other platforms.

The sx1 boot failure seems to be unrelated to your patch series. It boots
fine if built from the tip of your branch, but fails to boot in -next.
That will require a bisect from -next.

Guenter
