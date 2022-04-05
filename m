Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A25B4F2395
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 08:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42608170D;
	Tue,  5 Apr 2022 08:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42608170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649141248;
	bh=Mz8TYakEKokRFjhGTnET43kauJu3ZZZ275loC9Vd61Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1EM19CxhZmRSXQ5bpTyYdb29xbnDvAyoEmw/17yZ63unxZ8CJKBx7HpjlIUMIl4P
	 mN6pM3kHSCGoHdyNkqIykY9gAbH/cubJpbcnHKeVZ8EN2/C5VsVACoqsO5vIM2/fzK
	 rFs1Dwcm07/i1mBSlXGRsDboGhHdvtrdz5nYSCMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2453F8016A;
	Tue,  5 Apr 2022 08:46:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E526F8016B; Tue,  5 Apr 2022 08:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D06CBF800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 08:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06CBF800D2
Received: by mail-qt1-f173.google.com with SMTP id b18so9669271qtk.13
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 23:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UuWjfy1DmKGBwxecHn9QW28Mp8RGeP8Fe6idp3HhRGs=;
 b=dOk4PcB/OI6wvQpEE6Bchmz5tSsertxK5crF1CHxTnAsvc+38JDfHTL2mbH2xHwkfi
 ypEIL4tKytTgVc0pCAziTYQpedRb3xpRX5UQxRkoKGZTFG/9fpeuZySBK5cU2YzGaw0g
 b3Uncu+Vn5SWzWYuujvDv2T/Eq99jvROjZ4OaKkPBNL8QJBMHly0uC8hEuPMmh/UOOU6
 6ebkWiTnLSuDn681HAkedmz6sDxXdP0om4/pcr5VyTstkmQRAyxECmbRq5k27BCMhLEQ
 mJLQKZWc6OWFbegYu93xvwTPNkSy8esAsMfMTiFaQAGc9ufUDbeDsAGS1G21MLeDHry4
 NQSg==
X-Gm-Message-State: AOAM530JJ0qBp7RUmr71UtYA+0PAI264iFVg+nTyEDQ+tWjLyJGihnd9
 JiUHC09fpCZX9+ZN4yN3NYFq3xFrMpyLFQ==
X-Google-Smtp-Source: ABdhPJwVER8tZPNdNxa1bXqqph7B9/+08Lmcj4D8H+7bp1I4CCqQk3mqxriFfZil+RCaLczc/MdPXA==
X-Received: by 2002:a05:622a:38b:b0:2e2:34d2:2a51 with SMTP id
 j11-20020a05622a038b00b002e234d22a51mr1649287qtx.250.1649141179241; 
 Mon, 04 Apr 2022 23:46:19 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05622a01c700b002e1b3555c2fsm9966486qtw.26.2022.04.04.23.46.18
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id l14so9303137ybe.4
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr1490905yba.393.1649141178137; 
 Mon, 04 Apr 2022 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
 <874k38u20c.fsf@tynnyri.adurom.net>
In-Reply-To: <874k38u20c.fsf@tynnyri.adurom.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Apr 2022 08:46:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
Message-ID: <CAMuHMdV_-3TOHYehUsHeqwHjQtzN1Ot886K7vwPr4P-4u8eehw@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.18-rc1
To: Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 USB list <linux-usb@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um <linux-um@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

Hi Kalle,

On Mon, Apr 4, 2022 at 8:39 PM Kalle Valo <kvalo@kernel.org> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >> /kisskb/src/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c:
> >> error: case label does not reduce to an integer constant: => 3798:2,
> >> 3809:2
> >
> > arm64-gcc5.4/arm64-allmodconfig
> > powerpc-gcc5/powerpc-allmodconfig
> > powerpc-gcc5/ppc64_book3e_allmodconfig
>
> After v5.17 there were two commits to brcmfmac/sdio.c:
>
> $ git log --oneline v5.17.. drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> ed26edf7bfd9 brcmfmac: Add BCM43454/6 support
> 6d766d8cb505 brcmfmac: pcie: Declare missing firmware files in pcie.c
>
> I can't see how either of them could cause this warning. Could something
> else cause this or am I missing something?

Doh, I should not have reduced the CC list in the xfs subthread...

The builds above are all gcc-5 builds, so they are affected by the same
issue as XFS: unsigned constants that don't fit in int are lacking a
"U" suffix.

I assume Arnd's patch for
drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
fixes this?
https://lore.kernel.org/all/CAK8P3a0wRiS03imdXk2WbGONkSSczEGdE-ue5ubF6UyyDE9dQg@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
