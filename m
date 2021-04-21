Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63B3673EB
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 22:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A24871679;
	Wed, 21 Apr 2021 22:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A24871679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619035277;
	bh=D94J5H/be7562xvyWh6QeHATOe99EWwXNyvf3OczFgA=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eAuh4DYhSquUAXrbUZvq4hO+U3GcrTbS0O1dCFGujxpEPG5U7ByZDSRj+lYfyhpvQ
	 jYjxzupaRPz9DVcGI7Tm4PGM97sLOPxYRWaNhEiJkWytRGqc8muA87VrA6Y4ujxLGE
	 W48RT6aNAHf0GlihTI0bkT5NMSCtGuPpsnL8pAx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1AEF80256;
	Wed, 21 Apr 2021 21:59:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90BB0F80227; Wed, 21 Apr 2021 21:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4CCF800FE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 21:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4CCF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i6KEMf44"
Received: by mail-ed1-x52f.google.com with SMTP id bx20so49620093edb.12
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 12:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VsWwYvAWATnf6q6qzB+7nikS9fKnkRowTOlRlZq5R0Y=;
 b=i6KEMf44GVBaMCH3ZMUU0RG+7P9SKvm3xqL1TQa4YdybSkpeKCfM0ARtDSKxdf+r9T
 YG2RS9LkMyzr5YWbncDRYSaG8/OHPDS4FhyuEyUM+862MJqMlveG/e7LNyfPrSSPmweA
 xVDlfnWyEHHpHNBTjhkm12NV+djMS7UxaIhW1ciV2WvQrbD28HA+xg9u4IHf8ocESgT+
 VczeTGKJUDRV3m60N8Bscbz2lRs6PlOigBPLIiGY1Q1MBoQzoTCG/Fipbwcqr1OR/vYz
 aIQK7hwSGT62fmzcRkSvyNr5EPGDIfJP41bItFG2NCe/hCHbycwq3B+6QMNfdggEeHtA
 0tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VsWwYvAWATnf6q6qzB+7nikS9fKnkRowTOlRlZq5R0Y=;
 b=ZZ6mOz1Bpp+BaRb6PmKB0o08v0kG0lsywcV+EgNixVTHyjjqqWs5aYeAx96au0eAgg
 HcRPnEDWT4fmuTMiyPinenepD2mv4kq8DwA7noSEjqGyt7vu1KEJ9+rpk2+OoYBJPxhl
 65dOZmJg2hpKZoXslpp/oXhKqswo0s5UFeEEQ2VPpC8BS1MOCsd7AIADPWbnE8/Gq+uu
 vauQpHFkgV7hxJ7qRdZmodmj4pCogY5EBiULe4Lw2irF0MFUNdEkA++wg06aC+WBSVKn
 a5Fu5hZ60i3oe0pnStVaKP7R3aZNLmyj13ZmWwS1bt8/PnWf7jtfn/K9OuIZRkTqoIAv
 swcw==
X-Gm-Message-State: AOAM533pg0rbyec1tXvblWC2NJkEJs26ekzo3fOiI1jtuuzB7Td+HlUe
 HFyRrTgjR6TZmeuOT37kT706Zd8kjVYDgZ2K6mxbStEp2BTFfw==
X-Google-Smtp-Source: ABdhPJwcfgXL+HO/PREla2CU0sMtFgxPXsCFkhqdZTknBd7ODo67zaaIbdr1zeK27Dc3iiROAnqt0Iru9FK7ocwE/c4=
X-Received: by 2002:a05:6402:1d28:: with SMTP id
 dh8mr26848892edb.296.1619035176652; 
 Wed, 21 Apr 2021 12:59:36 -0700 (PDT)
MIME-Version: 1.0
From: Steven Skeard <stevenskeard@gmail.com>
Date: Wed, 21 Apr 2021 15:59:00 -0400
Message-ID: <CAHVejFw7n1g3Ok4PZ8efb5jAdY1htL_pn+oZb2O-p19kFpMgTQ@mail.gmail.com>
Subject: [bug_report] ALSA: snd_hda_intel probe failed with error -16
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

I tried to get some help with this before but I don't think I
articulated the problem very well and it seemed to fall between the
cracks, so here I am to try again
(https://mailman.alsa-project.org/pipermail/alsa-devel/2021-February/181262.html).

With the default ALSA configuration in /etc/modprobe.d/alsa-base.conf,
I experience a consistent race condition where if snd-usb-audio loads
before snd-hda-intel, then the snd-hda-intel driver will fail to load
with the -16 error as seen in the dmsg output at the end of this alsa
info dump (http://alsa-project.org/db/?f=a23ccbb818fec6eaf08b032504eac5d5d8a30589).
When this error occurs, I get a single dummy output and no working
audio. In this state the only way to get working audio is to reboot my
computer and hope things load in the correct order.

After much digging I found a couple links on the arch forums where
people experienced similar problems
(https://bbs.archlinux.org/viewtopic.php?id=264091,
https://bbs.archlinux.org/viewtopic.php?id=260373). After reading both
of those and looking at my dmsg outputs, I tested the following
modifications to my modprobe configuration:
    1. Remove the default line for the usb driver: "options
snd-usb-audio index=-2"
    2. Add a line to specify that the intel driver should be loaded
first: "options snd-hda-intel index=0"
    3. Add a line to specify that the realtek codec driver should be
loaded second: "options snd-hda-codec-realtek index=1"
    4. Add a line to specify that the usb driver should be loaded
third: "options snd-usb-audio index=2"
And this works, and not only works but works every reboot! I have
uploaded an additional alsa info with the work around applied
(http://alsa-project.org/db/?f=f2d90b82434ba89b834a67eaefe10726d538e829)

So while at the end of the day I have a working audio configuration, I
can't help but feel like this is a bug. But the question I have is
whether this is a bug with ALSA, or with the kernel driver? And how do
I properly report this so it can be fixed?

Thanks,
Steven Skeard
