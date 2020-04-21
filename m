Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A791B2951
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 16:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A3E916CD;
	Tue, 21 Apr 2020 16:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A3E916CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587478848;
	bh=XZzndPnYtYbbEF/KUZVNIJz+EcXy0p75DzfqczwlSe8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVEjA5KXeSyArl3xYHn/nrVL/c8kSiVxxG66wtAuke1StUWBb3IW9Z/qpdd9gpUB2
	 yWUQ8ZWfufws04/rfVjrGBr9iptdDd1mLejo2SIhHzoHxHIJ49YpW1P88uWDoob/Ux
	 PdTK3pMeGeM0chOu5IQV+wi3pjmZbiQWb8JcPghY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3037FF801ED;
	Tue, 21 Apr 2020 16:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FD91F801EC; Tue, 21 Apr 2020 16:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B73F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 16:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B73F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kgLmPLwx"
Received: by mail-wr1-x444.google.com with SMTP id g13so14625936wrb.8
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZzndPnYtYbbEF/KUZVNIJz+EcXy0p75DzfqczwlSe8=;
 b=kgLmPLwxUl5/Ma+EDAS7OwNd58zyhTcO0jxcdmbufGrysR7FvlZ9M7c2Vqs4uYk//I
 NtCsPb+nsu2eUmQfKxg/RNmFIlU8jpRgqkqImtzJnDsA4j1bIJaxTVEnJDJcfRdrNS+b
 QcY172YKngn+A8fR6B4Rw1TUti4r0pKIcRjzANa3rOsg/9O1hNm3hzTsu0mxBGaFAlnu
 HreuzgMaUwKocNly5bo3jhPzAU7Ax2qiBcJh3EoAi3de3PVLgISOxVGSoFvxo9v5giVM
 +9LIeVtljWhNV3LEbQ0Tb06ND/qEGg6kIH3Y0Bp8SeWeHcMs74C30d9mjAZDmxmzAjQd
 KpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZzndPnYtYbbEF/KUZVNIJz+EcXy0p75DzfqczwlSe8=;
 b=LKwUKb7aKNryT+tjKWZ+hxgxQ/kAjmxzHYmpQhrDk3jQUynYrALOGSmyRjTxCSxD5V
 iK3QDO3dQA9L9k6yfXRmrhCCTlF1w0Hk9w7CoraQkKi8UMeDUp8Mls7fULm6TZIgzNT2
 +rc5nVBzPTuUajUWVWxSIBMkkAYGtewE6cH4rjkWA7Dg3lX75oUrshuqDuJjIJH56icw
 f6enl4vlo10ZrqZfq7xPDHSrlYND/YbNB83Vnm56gk4AG5FI3PaldS2vV7SPF1XeokxJ
 2y1O8cJov2tXnJ91EAuGEUIPz8FVAwHrQqqPH6FLVa1g1bmqttMAR+ttP3cwILyQlnxp
 p4Dg==
X-Gm-Message-State: AGi0PuaWFJqJ+jzjAMliQHWUhr69b7y+fG6tm7F5JAWtxot2XY81Cxuj
 yuQFktNUZeFWdA8n3zVVS8X60Og4MprRkz2g0No=
X-Google-Smtp-Source: APiQypJ4ai2ZaRvEMbuZeelgSbTJL39HJnQ583AlT1gQuWTbnZsztUo86fQBN9mjsQkbukzDpzbexYNN1zF/4xAZ5dY=
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr23682887wrs.78.1587478736843; 
 Tue, 21 Apr 2020 07:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200304121943.28989-1-daniel.baluta@oss.nxp.com>
 <20200304121943.28989-2-daniel.baluta@oss.nxp.com>
 <CAPDyKFp6KLuuuVFcEWGxn5NkuDSkhM-MjRiiYj_zC4mFxhOBag@mail.gmail.com>
In-Reply-To: <CAPDyKFp6KLuuuVFcEWGxn5NkuDSkhM-MjRiiYj_zC4mFxhOBag@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 21 Apr 2020 17:18:45 +0300
Message-ID: <CAEnQRZDX8PZ7V+c8zfoxK-+oGp2pt8N3oTAC6=Ps1W33LGY7WA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/2] PM / domains: Introduce multi PM domains
 helpers
To: Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Len Brown <len.brown@intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <anson.huang@nxp.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Olaru <paul.olaru@nxp.com>, Kevin Hilman <khilman@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Tue, Apr 21, 2020 at 5:01 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Wed, 4 Mar 2020 at 13:20, Daniel Baluta <daniel.baluta@oss.nxp.com> wrote:
> >
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > This patch introduces helpers support for multi PM domains.
> >
> > API consists of:
> >
> > 1) dev_multi_pm_attach - powers up all PM domains associated with a given
> > device. Because we can attach one PM domain per device, we create
> > virtual devices (children of initial device) and associate PM domains
> > one per virtual device.
> >
> > 2) dev_multi_pm_detach - detaches all virtual devices from PM domains
> > attached with.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> First, apologize for the delay.
>
> In general I don't mind adding helpers that can be used to decrease
> open coding. However, in this case, I wonder how useful the helpers
> would really be.
>
> More precisely, according to the information I have, a device may not
> always need all of its PM domains to be turned on together, but
> perhaps only a subset of them. Depending on the current use case that
> is running.
>
> Of course, some cases follow your expectations, but as stated, some
> others do not.
>
> Do you have an idea how many users that would be able to switch to
> these new APIs as of today?

IMX Sound Open Firmware driver will immediately be available
to use this new API.

https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/imx/imx8.c#L221

Aside, from that there are the ACM clock modules for i.MX8QXP / i.MX8QM. Also,
looking at our internal tree there are XUVI, VPU, DPU drivers that need multi
power domain support.

Anson, Aisheng do you have a number of users on your side for
multi power domain?

thanks,
daniel.
