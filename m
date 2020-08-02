Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AAA235638
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 12:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC25B16D1;
	Sun,  2 Aug 2020 12:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC25B16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596362984;
	bh=GXdF2JiNeCZRZI56PCQ28xGFTsjB0A8hopytuBnauW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XGMRb7XDkrskFAChfnJDrPyaBFoKXkAtVLlNRe14oXmQzXa8SYX0BRkMaRQRUxeOY
	 NPSMFVYGnKspsRU//8iytK9h2gWfBxDO8stHXKH9v1N9x65ciHC3gctKvW3bP1my7e
	 PeMwUsqNbcXKf/aV2MkxdAQGEaB8SM+Z80ImjWcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0BBF8015A;
	Sun,  2 Aug 2020 12:08:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA29F800B7; Sun,  2 Aug 2020 12:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31150F800B7
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 12:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31150F800B7
Received: by mail-io1-f68.google.com with SMTP id v6so20516398iow.11
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GXdF2JiNeCZRZI56PCQ28xGFTsjB0A8hopytuBnauW8=;
 b=rW5opfTJObE8upa0Uhee3x05G/Wqo6TMqVFK1EBoZ2PtdQauzSbtlhNySbKRx9zYu4
 VG1S0HrLJjzIaZi2KXky+7Wq6q4hbE229w/WjoJQ6z33NQc3/sBLgRktc6brtjVHKfL3
 nvcY1SHoDVhNY3Aby6VPLsGkd6oAJjMgrlACb1EIb6hIwLvHNcjDsSt+2qoQKIiekRmt
 onuz1bUghAaWCSyzroMVaWPX0lM7ND4G2ZnoC2VlekHolxaTqsa1ozHS872INn7k1VxY
 Jqwu11dKxxR9sCIOKHPwm9rg9LOOcNhyvhOsrw6sZ5utOw7iMw7w+hjKubFciS9igzYP
 Ffyw==
X-Gm-Message-State: AOAM531oOtWnTiME+Qc3XYnAFM9ar58SxXRxknkk3NxbhMWZHes/DKRD
 8OGeNAFd8SeYp5r25YhhjgyG594NoKvvmSEN7Ic=
X-Google-Smtp-Source: ABdhPJwIjN16vVsKAsRU9bxWVPgSazXVUOSCL+41ZFfFNDeekANFgxEJ3EX+YF7Q06BgDKAVTNIj5rxokYMUafaiOSo=
X-Received: by 2002:a6b:ea0d:: with SMTP id m13mr11859226ioc.196.1596362870357; 
 Sun, 02 Aug 2020 03:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596360400-32425-1-git-send-email-chenhc@lemote.com>
 <s5hy2mx74zc.wl-tiwai@suse.de>
In-Reply-To: <s5hy2mx74zc.wl-tiwai@suse.de>
From: Huacai Chen <chenhc@lemote.com>
Date: Sun, 2 Aug 2020 18:07:39 +0800
Message-ID: <CAAhV-H5E_zEto1K+v3DuFT+_tJ2xb8zu=Hjch2uViOc7yn3zfw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add alc269/alc662 pin-tables for
 Loongson-3 laptops
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

Hi, Takashi,

On Sun, Aug 2, 2020 at 5:48 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 02 Aug 2020 11:26:40 +0200,
> Huacai Chen wrote:
> >
> > There are several Loongson-3 based laptops produced by CZC or Lemote,
> > they use alc269/alc662 codecs and need specific pin-tables, this patch
> > add their pin-tables.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
>
> Thanks, applied now with a minor correction of coding style.
> At the next time, please try to run scripts/checkpatch.pl once.
OK, thank you for your notice.

>
>
> Takashi
