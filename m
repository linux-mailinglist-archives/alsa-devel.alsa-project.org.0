Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5ED3374DF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 15:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55DF91852;
	Thu, 11 Mar 2021 15:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55DF91852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615471432;
	bh=BFuBCaWrkSUP/B6HOBdyra/7aqtTsYBvUYGluuTRwYY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRnhtgI6eutjRXm0tUmNYidLf1yreKlKpH5RBhoradJY1z90MG6P4v0XibW1hhs2j
	 6T5dwYJnns4xG1WuM3n+jbge9Ir8FZt8o01+AveJ4bqpHjnuFdHFR4KWA2YoGMhDf6
	 gtD3UH8qpRv/RC8zJXFP++vxZ51BwzDbFxxCVYhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DAA4F800BF;
	Thu, 11 Mar 2021 15:02:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1D2F80275; Thu, 11 Mar 2021 15:02:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331FCF8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 15:02:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331FCF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cC5IhqvV"
Received: by mail-pf1-x431.google.com with SMTP id x7so11104710pfi.7
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wu8fFbt6pPps0sW0Am+MuqVI376zrcxTbhhiS9bar6c=;
 b=cC5IhqvV/5oVLBL9TLG80rhJAB1lQXpcoIBWKJoGPyUR0RiUvMVfinjN79y0CKRKnz
 OnXELqiRYJONd+HvVSYUgV/A/ETiZRko0Fd61hMlmR7OpiocVlUHsBugAPndW1odLmT+
 Rh8/6Iconp3bLRenDXgvTbJGddvU3RRC/w2sFpJDVP41xw70FgGzfZynuD55XCQBfY/A
 8MDtUZmUyYBwSOZbXPKCtQAZHDetm16II269cIeajcrF5kSsam8eM5TwtnXmMfss/6YW
 3a8MWuRAfS33rOWXaRkHlQAt1NPLlWj3+bCEO3APp4F+ue+ohs4vzvIemLshbxM7J733
 Ptgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wu8fFbt6pPps0sW0Am+MuqVI376zrcxTbhhiS9bar6c=;
 b=tug5/BmeT6UhWkIrGo1SUq6Qfhcw/koFwAxsXPKuTFDm7iXCylK1hzVEfzncLSPiXy
 eJvczr4PJVO9Xu3r7SzwG7BZpWAXMdxSWSY9nsyBtF0jqLnbrMCzOGYRUltd2lbCSr8C
 C+hcNxrSiU0MBmdnqWEQkXyIFe3wR1k852DsyS8NQO2YBeL9SVuIZ0SEseaFZ6uJEMiG
 dXf1flpxeQVo3+NRk3cshUNsNKm4JgKlvvjuvP4yP3uUqVTMI5aywTtY8W0BK18JdTHK
 pLoT91CvowACjF5gAmunmZAfouAYdg58b58N7ct0r60ktGErnBUML5FMMdz97mhemLx/
 RLYg==
X-Gm-Message-State: AOAM531t9QC1U4obTd/kbjpwZvFXKpFL2sc7Q22lzuvSe/5hUUa27vKG
 qcUNBW4uph5L7WDfOsz8sETKLWSZoWVq2qkxexg=
X-Google-Smtp-Source: ABdhPJzOCePPExdMTrNRTPHA6tSnt9KRAKvaxfBmfXhxn1cpJvTlQymYY+qW/liI0wajnrz1tMJFTaNzJ2TYrv7OBIE=
X-Received: by 2002:a63:ce15:: with SMTP id y21mr7410996pgf.4.1615471352621;
 Thu, 11 Mar 2021 06:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20210311132741.80989-1-andriy.shevchenko@linux.intel.com>
 <s5hpn05vmhm.wl-tiwai@suse.de>
In-Reply-To: <s5hpn05vmhm.wl-tiwai@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Mar 2021 16:02:16 +0200
Message-ID: <CAHp75VcxRK=NsHXRtN8k8wrE8YSyNDqyTLb37TP4ojO_CW5ceg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/realtek: Sort alphanumerically the
 SND_PCI_QUIRK() entries.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Mar 11, 2021 at 3:40 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 11 Mar 2021 14:27:41 +0100,
> Andy Shevchenko wrote:
> >
> > Sort alphanumerically the SND_PCI_QUIRK() entries for better maintenance.
> > No functional change implied.
>
> I'd love to apply this kind of cleanups (and I do sometimes
> partially), but practically seen, this may make the stable backporting
> significantly harder because many quirk patches are backported to the
> very old LTS kernels.  So, unless any specific reason (e.g. some
> entries doubled or wrongly applied) is given, I'd avoid this full
> plastic surgery.

Can we ask people to follow the ordering before patches were applied?

-- 
With Best Regards,
Andy Shevchenko
