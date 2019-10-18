Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6876DCF7E
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 21:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 576B61614;
	Fri, 18 Oct 2019 21:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 576B61614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571427699;
	bh=omMEFf7sXj+92rTD4TDJFZVR/r3KmiuXcVrblZvseS0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hq/a1v7RfoAyheF6TA5x4kW1/+3g66T8o/pDK4E1UsuU/L/no4EVihLCMVbdFDz/U
	 zPXjWbC74UsjjuGMu1J8vJPd6p6bTtoY5Mx82xmsYEvzHCZKONQdW0e9syVUZN6Eic
	 CRq2YkGDUlEydQsVdeVoAi4Tu0q3Dtv34Bxvl3GA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36DBCF8036C;
	Fri, 18 Oct 2019 21:39:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43BB8F80362; Fri, 18 Oct 2019 21:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEC0DF800D0
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 21:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC0DF800D0
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mr9Jw-1hieeo3F2M-00oBid for <alsa-devel@alsa-project.org>; Fri, 18 Oct
 2019 21:39:48 +0200
Received: by mail-qt1-f182.google.com with SMTP id n17so10776893qtr.4
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 12:39:48 -0700 (PDT)
X-Gm-Message-State: APjAAAV7EeX766+9o59wZlYoPGoddqY+gHmVbPEjYayIJ2NRQ/tswSxM
 Sjb3Zz49II9zzIGW4Ag0pzOwSa29TMTI0x2o744=
X-Google-Smtp-Source: APXvYqymx9pRQIUe2GYLUGRMu9h+M26SuGVUoD8rv9IlkdyulST9oDUMU0vWJ1+HJSdIkbSMY8qPMr5o0NKJV3kBq/8=
X-Received: by 2002:ac8:6956:: with SMTP id n22mr11586436qtr.7.1571427587664; 
 Fri, 18 Oct 2019 12:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-29-arnd@arndb.de>
 <20191018184815.GP35946@dtor-ws>
 <CAK8P3a27==9TeS-RWEvrpnxh+6McqRF-xeb8WPj9pHOn+0zbOQ@mail.gmail.com>
In-Reply-To: <CAK8P3a27==9TeS-RWEvrpnxh+6McqRF-xeb8WPj9pHOn+0zbOQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Oct 2019 21:39:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0AP8q9Hk1DB+E=xFGV5RqXnkjkcZRobgU1NRDFMH00AA@mail.gmail.com>
Message-ID: <CAK8P3a0AP8q9Hk1DB+E=xFGV5RqXnkjkcZRobgU1NRDFMH00AA@mail.gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Provags-ID: V03:K1:y4JF0JUnVBWcCKF0LKonRR/hIUE6gtQJfbCKFnVnyWu1C1m9B1F
 VuF0i1drTurCFi0uTPNXv4MHVdGs5Pm2mzKWEOCoPgshg2otE3/wKkOV1kG2Tme1Ew8qPsO
 GZk2TWuVILJD4eFaIx1y4zSC9brHRn8O38zihz4mr/vd+0NzgsNxauWkTMHCndy8+ZUXBpI
 x6+54Q6VU0ZSARIA/wqvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jTlio4asvP0=:DYcMc6NIun/kwtFxNx+NIP
 29vWWhkUk//va1gYxsX4a8bZ5ewTXSmChhkCPLDlw8VD2diKDKXlBbWga0lVP3fkq9yN2zdsO
 m/3IKs1bzqIafL4CLVeKbjlj0Z+obtvA+jNUFNnxfygmsZ5oJtJ7eqRz07IyxyNSQ4dgOK3+i
 EIic7g1dqUq/2E/07QhSXxCBuz12Gqdm6J8QO5yeovrukIj17QirMy60Bh7YkjkWPJhRfQfOf
 LqXiwb2zoTSFEMlPOICA9ZrWQaIdusgDwwdM6VKZjXdHrqSFjL3rxbBqhuzOPSh8G2FFgyoPJ
 sUlxemGJHRTo5J6k2lvJRF1MjfMaXXcRRHV6gvcMQCYiKiBO4njRuO+/2Hw2rUyMZ3jxnBomG
 kxlKDJerVSOoRUUdyg6OIhgfiXXtkfP2yiEwT8ySLnj85ItZLqQj03SB7oq7KJn3qbWcxIwCw
 2jFGbDfI9gJUiKaUcCykktxcwxbqW0abh/B23BL1OQVhM6ulAagu2jHJHyXiqHU4tad9Rdks6
 +bjORb7FAQKKnD4/xCNRC7931MtqA4AZGoRZBpj2UfVsXrlkqq2ns7iMhUwqlHAwyovyCJzgB
 9Ch7m+SMqIPE/FXu5Au8r8xw0E8I3kksYuQB1S0JvW9EgBjHEyeXQtHSTG2cuF6rq9V3jwvkO
 LR9t9MRlvqBjSllt5lNKEt1WOtDMVD1I0sC4+BUGZz/yV7FhnsNHBaMGG8WtgJMavg+5b9Uxw
 SrMSogTotFdwB3mW2AuTFjIjk7/SGt6CLKyWGCRGOtxt84bvbIAJs9sULrhdD8/VJYw6F31qt
 BdX5WpcGesYkYCfbbMIwQYQLND1P+qa8hsB12HnE+bWh8VfwrpfOZgPKtKBzaYHW/zqWPIIXy
 UqOoQMKQYdQG92Erf4Qg==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [alsa-devel] Fwd: [PATCH 29/46] Input: touchscreen: use wrapper for
	pxa2xx ac97 registers
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

On Fri, Oct 18, 2019 at 8:48 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Oct 18, 2019 at 05:41:44PM +0200, Arnd Bergmann wrote:
> > To avoid a dependency on the pxa platform header files with
> > hardcoded registers, change the driver to call a wrapper
> > in the pxa2xx-ac97-lib that encapsulates all the other
> > ac97 stuff.
>
> Not supper happy about adding module dependencies. Can we include
> mach/regs-ac97.h from include/sound/pxa2xx-lib.h and use static inlines?
> Someone needs to include mach/regs-ac97.h in the end...
>
> Or there is something later in the series that needs it?

One of the goals of the series is to completely remove all mach/*.h headers
and place them somewhere else, ideally inaccessible to device drivers.

In case of mach/regs-ac97.h, the later patch "ASoC: pxa: ac97: use normal
MMIO accessors" passes the physical register base address as a platform
device resource that gets ioremapped in the ac97 driver, rather than
hardcoding the virtual address in a global header.

I agree that the exported function is still ugly, but I hope it's enough of
an improvement over the previous state that we can do it anyway.

If you have any better ideas though, I can give that a try, too.
One possibility would be a higher-level interface exported on top
of 'struct snd_ac97', but I could not figure out how to do this.

     Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
