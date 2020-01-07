Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A81322D4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 10:47:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D691818;
	Tue,  7 Jan 2020 10:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D691818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578390444;
	bh=bvf8aOD6xk1hgxHgp1EYzRPrbs2yyRi3gvPwMx07Lws=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sH6rWt6GQn3f9JLjr0YKO0Xz8K8gDhNalKw5f6QMgx+8B+KDOT39YI/kuA2Ku6IA9
	 N7KKXcK7hDux2kBAjOlOTjBQEi2WfY72/C1ECOVJKSC9JFYJU+S1z638CgLzc+0KNE
	 9+MsjifdHB3XPpaGITwujEo5Iigwud5ctgsoX2dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 284E5F801EB;
	Tue,  7 Jan 2020 10:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3712F8014A; Tue,  7 Jan 2020 10:45:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC410F8010D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 10:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC410F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="L7Yekdgj"
Received: by mail-lf1-x143.google.com with SMTP id 15so38427229lfr.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3vugB6Qu+hg8N2SRIaebFbxjQ0rXg7WNTL//JNDGnk=;
 b=L7YekdgjF3qbrxhKWPnQGcodWPSyCVzxAm1Zp2kbJL+CTc2UiYzlmnpuntqa1ei6Pe
 Qq2EchUzXxcGdUnHVWtgpSN8yuAv7alGgUzWOnVGYEtnK5ae9zWA+G+RJm2Knshz4GcH
 vQZmr4ngNwiHPcHWomuop4Kn0rNd+2XiyP4L0PMjNeQO5fkCUZIEJ4eObIl7AgFO09t8
 fpKb5PlQaBWquu2sElIJqcU12SP08cKt6ewbzpky6TtoOzyyKRaTTzXd1MLQHtJ5ee0I
 CJmhTb/mPMy5aHzcf7/0HngijnODPmVaRUFMB0tPX0JoY2Ir0EDQ8sa5WU+0geKvMGlW
 vk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3vugB6Qu+hg8N2SRIaebFbxjQ0rXg7WNTL//JNDGnk=;
 b=DhUnsS8lUWl2xDxStPY/rknMORXxt9P2NR9X/19Rebx+9UWtPCRgc33FUqUZdG3O/S
 vbjL4YVsflaQ9Znjg4QWZiGAoJwqhjH5twfDWxt9b3rIF6HdW1+MiD/yVWj6PMUON4Yb
 42wmJDcSmnOqwM8OWOF73cPePtzNpSOcb6KJfXn4oX3BwK4f5dlB4B76WSnkUG1VWJBW
 rAXJu4WNHRqLMUPFYeqwSMnL/QF2W+FSPUfrWttf3IaJkW3Z5bBFQL2oCrxOFWot9i4z
 MKDXbULvxI0w552Ab5GNxkxNTBg8Jjh660iK4M5w6eWgP9cZ3u8vXSBVr/m5zegeXOQc
 F9kA==
X-Gm-Message-State: APjAAAUB6qWNnw9sv6nOVLKx4ttmY2TaAXrkykxzgT2mqMAx89FoltVY
 9Bd6oQPH6T7f4GREjiVSXh1U3elDIWDEST6EX+YWjA==
X-Google-Smtp-Source: APXvYqySRirN6OVtQ4D1qwmutDdmHlcunK5AA3Rw93pqwxd0gFUoAfC+0BNom26keyxoOQ7H+ZpYS1n3fqMftps70cU=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr58157919lfi.93.1578390334610; 
 Tue, 07 Jan 2020 01:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20191218163701.171914-1-arnd@arndb.de>
In-Reply-To: <20191218163701.171914-1-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 10:45:23 +0100
Message-ID: <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [alsa-devel] [PATCH] pinctrl: lochnagar: select GPIOLIB
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

On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:

> In a rare randconfig build I came across one configuration that does
> not enable CONFIG_GPIOLIB, which is needed by lochnagar:
>
> ERROR: "devm_gpiochip_add_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_generic_free" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_generic_request" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
> ERROR: "gpiochip_get_data" [drivers/pinctrl/cirrus/pinctrl-lochnagar.ko] undefined!
>
> Add another 'select' like all other pinctrl drivers have.
>
> Fixes: 0548448b719a ("pinctrl: lochnagar: Add support for the Cirrus Logic Lochnagar")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
> subsystem, or if there are still good reasons for leaving it disabled
> on any machine that uses CONFIG_PINCTRL.

Hm that is a tricky question, they almost always come in pair but are
technically speaking separate subsystems.

I have a (very) long-term plan to merge them at some point before
I retire :D

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
