Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3835B1A0E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 12:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5C516E6;
	Thu,  8 Sep 2022 12:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5C516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662633218;
	bh=8Gu1aEX6GskTZZXVCr9X5uUzpv/u0uFWZ9yLnOKQuOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dp+YGCGcVOY8llK7yPcd1N2CCyZ9ayzsYcve0XS8KZxbr0F+weQqMNZnMfrt/6mWs
	 Rq+1D9jWL6Cg/Vi07vJdltfaHIBZmqS5kto9MIbcK1mJDbd1VrUmzPio+jWVfD7vnD
	 OeQ7lZ0MNUkDa0RsSCnrAl0elCzFWpNSCUGUs0qk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87815F8023B;
	Thu,  8 Sep 2022 12:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47710F80217; Thu,  8 Sep 2022 12:32:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_19,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75180F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 12:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75180F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gc3h/BdT"
Received: by mail-pj1-x1034.google.com with SMTP id o4so17312839pjp.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=gWv7N1PBLFCf6Yd0cD7ruNgiv+UFlaZ/RUU40RGSpz4=;
 b=gc3h/BdTlbpGdPa8SEscG5NHp/XLoJYoVuWpIHCg7P9TsZZD0XOTOQ8Z9fiDD7cYZS
 t/REDigQjacIoYe/ZiPEw3ApAL0hqOxRZc49HB0o3G1Kl55TOAltNRQmpEFbh5uhkl6G
 bHzTaOmQQ34CIkltYnqr7q4YlkOxvRYxMz1CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gWv7N1PBLFCf6Yd0cD7ruNgiv+UFlaZ/RUU40RGSpz4=;
 b=D1zev8wEv4hFKwW2nkVs0LpidvIXqnlJ25v417H/qZKustHefV1gmuV08TKlEh/TNu
 5RNnt6WNVt5dBrd+FkBhPQ0XPswoLm4G0RGe0vAztDrDLA4tNWlmpvel/HjZSXm4NC3Z
 yhKcjTIl9U6Vq3pVKeCtDCRiU9lyqeKD4P1REo8CYqRoIJAFvhCEwN334GSmVVpshnG8
 1bB1dgCyCdoe4xZNncdRvQfuRts+6YS/zMFOlFQucWUpF3TXzYYX8J30idkSFhp1F9v+
 xKn45akZMTK8JUM61kD/JxTBY7wTJCGYQ7FXHmbgEv9XJ/vCPlbEUOiildPtzKyK/nl/
 cgWA==
X-Gm-Message-State: ACgBeo3rNeCvvqwQ9Vif7zMj/YcDA7RUqI1RfyG0StIoaXwrbeAxDYrh
 xtjIwAgZVbaNlXzrYixbyJNzPE8pxr2SIHJEpuGuaA==
X-Google-Smtp-Source: AA6agR5GQwcpfAKN3J9y6oRS4PSulHbsK0FUGkBkCJ44CMAqPjzO0A5OUJiq6U9tmwpYcNEj4a436f62It4quF1cBpY=
X-Received: by 2002:a17:90a:c782:b0:1f7:a6cf:2f41 with SMTP id
 gn2-20020a17090ac78200b001f7a6cf2f41mr3499511pjb.128.1662633145880; Thu, 08
 Sep 2022 03:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAPm_npY3SkumWgy8EN65no2iQFj2KWG6pysUchEKHBBPZ9AHsA@mail.gmail.com>
 <87r10mcmd9.wl-tiwai@suse.de>
In-Reply-To: <87r10mcmd9.wl-tiwai@suse.de>
From: YJ Lee <yunjunlee@chromium.org>
Date: Thu, 8 Sep 2022 18:32:14 +0800
Message-ID: <CAPm_npaJdGfDBvTuL3nvbyT8Rfx3kC8Gy5dS5PPe78Vu7C2xAg@mail.gmail.com>
Subject: Re: About ALSA dummy module: support customized mixer volume leveling
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Ching Yun Chang <whalechang@google.com>,
 tiwai@suse.com, Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

On Thu, Sep 8, 2022 at 4:16 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 08 Sep 2022 07:26:02 +0200,
> YJ Lee wrote:
> >
> > Hello Takashi (and the alsa community),
> >
> > This is YJ Lee from chromium.org.
> >
> > I'm thinking about extending the ALSA dummy module to support
> > customized volume leveling. It will be very useful to test devices
> > with different volume granularity. Currently this module is using
> > hard-coded mixer volume leveling, from min=-50 to max=100.
> >
> > See L716: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/tree/sound/drivers/dummy.c?h=queue/5.19#n716
> >
> > My plan (A) is to expose 2 more additional module parameters and
> > replace a few occurrences, from L742-750.
> >
> > Another plan (B) is to leverage the current existing module
> > parameter:model, and make the dummy-module to be able to accept models
> > with customized volume leveling. New dummy models can be provided as
> > configuration files, and be used in the same way as how currently
> > existing dummy models (L146-213) are used. However, it's a bit
> > over-engineering from the original purpose.
> >
> > What do you think about these plans? Any insight you (and the alsa
> > community) can provide will be greatly appreciated.
>
> Only for volume min/max, module options may be an easier way, IMO.
>
> OTOH, if we want to adjust more stuff, another possibility is to
> extend the proc file.  It currently supports the dynamic changes of
> PCM parameters, but we can extend it or add a new proc file for
> adjusting other stuff, too.  So the question is what else we want to
> allow changing.
>
>
> thanks,
>
> Takashi

Hi Takashi,

Thanks for your quick reply! I can't express my gratitude enough. Will
stick with plan (A).

Additionally, I'll take some time to read it and learn how to use the
proc file. Compared with snd-dummy, I've plugged in a physical USB
headset and saw some read-only files (usb*) under /proc/asound/cardX.
By extending the proc file, are you suggesting we can change those
into writable so ALSA will understand and make corresponding changes,
(e.g. 'change' the dummy card into a USB sound card)? Can you tell me
more about how to extend or add a new proc file (as a separate topic)?

Again, greatly appreciated.

Best,
YJ
